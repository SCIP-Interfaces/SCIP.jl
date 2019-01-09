## variables (general)

function MOI.add_variable(o::Optimizer)
    allow_modification(o)
    vr = add_variable(o.mscip)
    var::Ptr{SCIP_VAR} = o.mscip.vars[vr.val][] # i == end
    register!(o, var, vr)
    return MOI.VariableIndex(vr.val)
end

MOI.add_variables(o::Optimizer, n) = [MOI.add_variable(o) for i=1:n]
MOI.get(o::Optimizer, ::MOI.NumberOfVariables) = length(o.mscip.vars)
MOI.get(o::Optimizer, ::MOI.ListOfVariableIndices) = VI.(1:length(o.mscip.vars))
MOI.is_valid(o::Optimizer, vi::VI) = 1 <= vi.value <= length(o.mscip.vars)

MOI.get(o::Optimizer, ::MOI.VariableName, vi::VI) = SCIPvarGetName(var(o, vi))
function MOI.set(o::Optimizer, ::MOI.VariableName, vi::VI, name::String)
    @SC SCIPchgVarName(scip(o), var(o, vi), name)
    return nothing
end


## variable types (binary, integer)

MOI.supports_constraint(o::Optimizer, ::Type{SVF}, ::Type{<:VAR_TYPES}) = true

scip_vartype(::Type{MOI.ZeroOne}) = SCIP_VARTYPE_BINARY
scip_vartype(::Type{MOI.Integer}) = SCIP_VARTYPE_INTEGER

function MOI.add_constraint(o::Optimizer, func::SVF, set::S) where {S <: VAR_TYPES}
    allow_modification(o)
    vi = func.variable
    v = var(o, vi)
    infeasible = Ref{Ptr{SCIP_Bool}}
    @SC SCIPchgVarType(scip(o), v, scip_vartype(S), infeasible[])
    if S <: MOI.ZeroOne
        # Need to adjust bounds for SCIP, which fails with an error otherwise.
        # Check for conflicts with existing bounds first:
        lb, ub = SCIPvarGetLbOriginal(v), SCIPvarGetUbOriginal(v)
        if lb >= 0.0 && ub <= 1.0
            # nothing to be done
        elseif lb == -SCIPinfinity(scip(o)) && ub == SCIPinfinity(scip(o))
            @debug "Implicitly setting bounds [0,1] for binary variable at $(vi.value)!"
            @SC SCIPchgVarLb(scip(o), v, 0.0)
            @SC SCIPchgVarUb(scip(o), v, 1.0)
        else
            error("Existing bounds [$lb,$ub] conflict for binary variable at $(vi.value)!")
        end
    end
    # use var index for cons index of this type
    i = func.variable.value
    return register!(o, CI{SVF, S}(i))
end


## variable bounds

MOI.supports_constraint(o::Optimizer, ::Type{SVF}, ::Type{<:BOUNDS}) = true

function MOI.add_constraint(o::Optimizer, func::SVF, set::S) where S <: BOUNDS
    allow_modification(o)
    s = scip(o)
    vi = func.variable
    v = var(o, vi)
    inf = SCIPinfinity(s)

    newlb, newub = bounds(set)
    newlb = newlb == nothing ? -inf : newlb
    newub = newub == nothing ?  inf : newub

    # Check for existing bounds first.
    oldlb, oldub = SCIPvarGetLbOriginal(v), SCIPvarGetUbOriginal(v)
    if (oldlb != -inf || oldub != inf)
        if oldlb == newlb && oldub == newub
            @debug "Variable at $(vi.value) already has these bounds, skipping new constraint!"
        elseif oldlb == 0.0 && oldub == 1.0 && SCIPvarGetType(v) == SCIP_VARTYPE_BINARY
            if newlb >= 0.0 && newlb <= newub && newub <= 1.0
                @debug "Overwriting existing bounds [0.0,1.0] with [$newlb,$newub] for binary variable at $(vi.value)!"
            else
                error("Invalid bounds [$newlb,$newub] for binary variable at $(vi.value)!")
            end
        else
            error("Already have bounds [$oldlb,$oldub] for variable at $(vi.value)!")
        end
    end

    @SC SCIPchgVarLb(scip(o), v, newlb)
    @SC SCIPchgVarUb(scip(o), v, newub)
    # use var index for cons index of this type
    i = func.variable.value
    return register!(o, CI{SVF, S}(i))
end

function MOI.set(o::SCIP.Optimizer, ::MOI.ConstraintSet, ci::CI{SVF,S}, set::S) where {S <: BOUNDS}
    allow_modification(o)
    v = var(o, VI(ci.value)) # cons index is actually var index
    lb, ub = bounds(set)
    @SC SCIPchgVarLb(scip(o), v, lb == nothing ? -SCIPinfinity(scip(o)) : lb)
    @SC SCIPchgVarUb(scip(o), v, ub == nothing ?  SCIPinfinity(scip(o)) : ub)
    return nothing
end

function MOI.is_valid(o::Optimizer, ci::CI{SVF,<:BOUNDS})
    return 1 <= ci.value <= length(o.mscip.vars)
end

function MOI.get(o::Optimizer, ::MOI.ConstraintFunction, ci::CI{SVF, S}) where S <: BOUNDS
    return SVF(ci)
end

function MOI.get(o::Optimizer, ::MOI.ConstraintSet, ci::CI{SVF, S}) where S <: BOUNDS
    v = var(o, VI(ci.value))
    lb, ub = SCIPvarGetLbOriginal(v), SCIPvarGetUbOriginal(v)
    return from_bounds(S, lb, ub)
end