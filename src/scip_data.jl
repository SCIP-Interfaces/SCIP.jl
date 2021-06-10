"Type-safe wrapper for `Int64`, references a variable."
struct VarRef
    val::Int64
end

"Type-safe wrapper for `Int64`, references a constraint."
struct ConsRef
    val::Int64
end

#to be moved to MOI_wrapper
"""
SCIPData holds pointers to SCIP data.
It does not perform memory management and should not be created directly.
"""
mutable struct SCIPData
    scip::Ref{Ptr{SCIP_}}
    vars::Dict{VarRef, Ref{Ptr{SCIP_VAR}}}
    conss::Dict{ConsRef, Ref{Ptr{SCIP_CONS}}}
    var_count::Int64
    cons_count::Int64

    # Map from user-defined Julia types (keys are <: AbstractConstraintHandler
    # or <: AbstractConstraint, respectively) to the corresponding SCIP objects.
    # The reverse mapping is handled by SCIP itself.
    # This also serves to prevent premature GC.
    conshdlrs::Dict{Any, Ptr{SCIP_CONSHDLR}}
    conshdlrconss::Dict{Any, Ptr{SCIP_CONS}}

    # Map from user-defined types (keys are <: AbstractSeparator) to the
    # corresponding SCIP objects.
    sepas::Dict{Any, Ptr{SCIP_SEPA}}
end

# Protect SCIPData from GC for ccall with Ptr{SCIP_} argument.
Base.unsafe_convert(::Type{Ptr{SCIP_}}, scipd::SCIPData) = scipd.scip[]

"Release references and free memory."
function free_scip(scipd::SCIPData)
    # Avoid double-free (SCIP will set the pointers to NULL).
    if scipd.scip[] != C_NULL
        for c in values(scipd.conss)
            @SCIP_CALL SCIPreleaseCons(scipd, c)
        end
        for v in values(scipd.vars)
            @SCIP_CALL SCIPreleaseVar(scipd, v)
        end
        # only scipd.scip is GC-protected during ccall!
        GC.@preserve scipd begin
            @SCIP_CALL SCIPfree(scipd.scip)
        end
    end
    @assert scipd.scip[] == C_NULL
end

"Set a parameter's current value."
function get_parameter(scipd::SCIPData, name::AbstractString)
    param = SCIPgetParam(scipd, name)
    if param == C_NULL
        error("Unrecognized parameter: $name")
    end
    paramtype = SCIPparamGetType(param)
    if paramtype === SCIP_PARAMTYPE_BOOL
        value = Ref{SCIP_Bool}()
        @SCIP_CALL SCIPgetBoolParam(scipd, name, value)
        if value[] == TRUE
            return true
        elseif value[] == FALSE
            return false
        else
            error("encountered invalid value for a boolean: $(value[])")
        end
    elseif paramtype === SCIP_PARAMTYPE_INT
        value = Ref{Cint}()
        @SCIP_CALL SCIPgetIntParam(scipd, name, value)
        return value[]
    elseif paramtype === SCIP_PARAMTYPE_LONGINT
        value = Ref{Clonglong}()
        @SCIP_CALL SCIPgetLongintParam(scipd, name, value)
        return value[]
    elseif paramtype === SCIP_PARAMTYPE_REAL
        value = Ref{Cdouble}()
        @SCIP_CALL SCIPgetRealParam(scipd, name, value)
        return value[]
    elseif paramtype === SCIP_PARAMTYPE_CHAR
        value = Ref{Cchar}()
        @SCIP_CALL SCIPgetCharParam(scipd, name, value)
        return Char(value[])
    elseif paramtype === SCIP_PARAMTYPE_STRING
        value = Ref{Ptr{Cchar}}()
        @SCIP_CALL SCIPgetStringParam(scipd, name, value)
        return unsafe_string(value[])
    else
        error("Unexpected parameter type: $paramtype")
    end
end

"Set a parameter."
function set_parameter(scipd::SCIPData, name::AbstractString, value)
    param = SCIPgetParam(scipd, name)
    if param == C_NULL
        error("Unrecognized parameter: $name")
    end
    paramtype = SCIPparamGetType(param)
    if paramtype === SCIP_PARAMTYPE_BOOL
        @SCIP_CALL SCIPsetBoolParam(scipd, name, value)
    elseif paramtype === SCIP_PARAMTYPE_INT
        @SCIP_CALL SCIPsetIntParam(scipd, name, value)
    elseif paramtype === SCIP_PARAMTYPE_LONGINT
        @SCIP_CALL SCIPsetLongintParam(scipd, name, value)
    elseif paramtype === SCIP_PARAMTYPE_REAL
        @SCIP_CALL SCIPsetRealParam(scipd, name, value)
    elseif paramtype === SCIP_PARAMTYPE_CHAR
        @SCIP_CALL SCIPsetCharParam(scipd, name, value)
    elseif paramtype === SCIP_PARAMTYPE_STRING
        @SCIP_CALL SCIPsetStringParam(scipd, name, value)
    else
        error("Unexpected parameter type: $paramtype")
    end
    return nothing
end

"Return pointer to SCIP variable."
function var(scipd::SCIPData, vr::VarRef)::Ptr{SCIP_VAR}
    return scipd.vars[vr][]
end

"Return pointer to SCIP constraint."
function cons(scipd::SCIPData, cr::ConsRef)::Ptr{SCIP_CONS}
    return scipd.conss[cr][]
end

"Store reference to variable, return VarRef"
function store_var!(scipd::SCIPData, var__::Ref{Ptr{SCIP_VAR}})
    scipd.var_count += 1
    vr = VarRef(scipd.var_count)
    scipd.vars[vr] = var__
    return vr
end

"Store reference to constraint, return ConsRef"
function store_cons!(scipd::SCIPData, cons__::Ref{Ptr{SCIP_CONS}})
    scipd.cons_count += 1
    cr = ConsRef(scipd.cons_count)
    scipd.conss[cr] = cons__
    return cr
end

"Add variable to problem (continuous, no bounds), return var ref."
function add_variable(scipd::SCIPData)
    var__ = Ref{Ptr{SCIP_VAR}}(C_NULL)
    @SCIP_CALL SCIPcreateVarBasic(scipd, var__, "", -SCIPinfinity(scipd), SCIPinfinity(scipd),
                           0.0, SCIP_VARTYPE_CONTINUOUS)
    @SCIP_CALL SCIPaddVar(scipd, var__[])
    return store_var!(scipd, var__)
end

"Delete variable from problem."
function delete(scipd::SCIPData, vr::VarRef)
    # delete variable from SCIP problem
    deleted = Ref{SCIP_Bool}()
    @SCIP_CALL SCIPdelVar(scipd, var(scipd, vr), deleted)
    deleted[] == TRUE || error("Variable at $(vr.val) could not be deleted!")

    # release memory and remove reference
    @SCIP_CALL SCIPreleaseVar(scipd, scipd.vars[vr])
    delete!(scipd.vars, vr)
    return nothing
end

"Delete constraint from problem."
function delete(scipd::SCIPData, cr::ConsRef)
    @SCIP_CALL SCIPdelCons(scipd, cons(scipd, cr))

    # release memory and remove reference
    @SCIP_CALL SCIPreleaseCons(scipd, scipd.conss[cr])
    delete!(scipd.conss, cr)
    return nothing
end

"""
Add (ranged) linear constraint to problem, return cons ref.

# Arguments
- `varrefs::AbstractArray{VarRef}`: variable references for affine terms.
- `coefs::AbstractArray{Float64}`: coefficients for affine terms.
- `lhs::Float64`: left-hand side for ranged constraint
- `rhs::Float64`: right-hand side for ranged constraint

Use `(-)SCIPinfinity(scip)` for one of the bounds if not applicable.
"""
function add_linear_constraint(scipd::SCIPData, varrefs, coefs, lhs, rhs)
    @assert length(varrefs) == length(coefs)
    vars = [var(scipd, vr) for vr in varrefs]
    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    @SCIP_CALL SCIPcreateConsBasicLinear(
        scipd, cons__, "", length(vars), vars, coefs, lhs, rhs)
    @SCIP_CALL SCIPaddCons(scipd, cons__[])
    return store_cons!(scipd, cons__)
end

"""
Add (ranged) quadratic constraint to problem, return cons ref.

# Arguments
- `linrefs::AbstractArray{VarRef}`: variable references for affine terms.
- `lincoefs::AbstractArray{Float64}`: coefficients for affine terms.
- `quadrefs1::AbstractArray{VarRef}`: first variable references for quadratic terms.
- `quadrefs2::AbstractArray{VarRef}`: second variable references for quadratic terms.
- `quadcoefs::AbstractArray{Float64}`: coefficients for quadratic terms.
- `lhs::Float64`: left-hand side for ranged constraint
- `rhs::Float64`: right-hand side for ranged constraint

Use `(-)SCIPinfinity(scip)` for one of the bounds if not applicable.
"""
function add_quadratic_constraint(scipd::SCIPData, linrefs, lincoefs,
                                  quadrefs1, quadrefs2, quadcoefs, lhs, rhs)
    @assert length(linrefs) == length(lincoefs)
    @assert length(quadrefs1) == length(quadrefs2)
    @assert length(quadrefs1) == length(quadcoefs)

    linvars = [var(scipd, vr) for vr in linrefs]
    quadvars1 = [var(scipd, vr) for vr in quadrefs1]
    quadvars2 = [var(scipd, vr) for vr in quadrefs2]

    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    @SCIP_CALL SCIPcreateConsBasicQuadratic(
        scipd, cons__, "", length(linvars), linvars, lincoefs,
        length(quadvars1), quadvars1, quadvars2, quadcoefs, lhs, rhs)
    @SCIP_CALL SCIPaddCons(scipd, cons__[])
    return store_cons!(scipd, cons__)
end

"""
Add second-order-cone constraint to problem, return cons ref.

Does not support the full generality of SCIP's constraint (offsets and
coefficients). The first entry in `varrefs` is used for the special variable on
the right-hand side.
"""
function add_second_order_cone_constraint(scipd::SCIPData, varrefs)
    vars = [var(scipd, vr) for vr in varrefs]
    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    @SCIP_CALL SCIPcreateConsBasicSOC(scipd, cons__, "", length(vars) - 1,
                               vars[2:end], C_NULL, C_NULL, 0.0, vars[1], 1.0, 0.0)
    @SCIP_CALL SCIPaddCons(scipd, cons__[])
    return store_cons!(scipd, cons__)
end

"""
Add special-ordered-set of type 1 to problem, return cons ref.

# Arguments
- `varrefs::AbstractArray{VarRef}`: variable references
- `weights::AbstractArray{Float64}`: numeric weights
"""
function add_special_ordered_set_type1(scipd::SCIPData, varrefs, weights)
    @assert length(varrefs) == length(weights)
    vars = [var(scipd, vr) for vr in varrefs]
    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    @SCIP_CALL SCIPcreateConsBasicSOS1(scipd, cons__, "", length(vars), vars, weights)
    @SCIP_CALL SCIPaddCons(scipd, cons__[])
    return store_cons!(scipd, cons__)
end

"""
Add special-ordered-set of type 2 to problem, return cons ref.

# Arguments
- `varrefs::AbstractArray{VarRef}`: variable references
- `weights::AbstractArray{Float64}`: numeric weights
"""
function add_special_ordered_set_type2(scipd::SCIPData, varrefs, weights)
    @assert length(varrefs) == length(weights)
    vars = [var(scipd, vr) for vr in varrefs]
    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    @SCIP_CALL SCIPcreateConsBasicSOS2(scipd, cons__, "", length(vars), vars, weights)
    @SCIP_CALL SCIPaddCons(scipd, cons__[])
    return store_cons!(scipd, cons__)
end

"""
Add abspower constraint to problem, return cons ref.

    lhs ≤ sign(x + a) * abs(x + a)^n + c*z ≤ rhs

# Arguments
- `x::VarRef`: reference for power variable
- `a::Float64`: offset for power variable
- `n::Float64`: exponent for power variable, n >= 1
- `z::VarRef`: reference for linear variable
- `c::Float64`: coefficient for linear variable
- `lhs::Float64`: left-hand side for ranged constraint
- `rhs::Float64`: right-hand side for ranged constraint

Use `(-)SCIPinfinity(scip)` for one of the bounds if not applicable.
"""
function add_abspower_constraint(scipd::SCIPData, x, a, n, z, c, lhs, rhs)
    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    @SCIP_CALL SCIPcreateConsBasicAbspower(
        scipd, cons__, "", var(scipd, x), var(scipd, z), n, a, c, lhs, rhs)
    @SCIP_CALL SCIPaddCons(scipd, cons__[])
    return store_cons!(scipd, cons__)
end

"""
Add indicator constraint to problem, return cons ref.

    y = 1 ==> a^T x ≤ rhs

y has to be a binary variable, or SCIP will error.

# Arguments
- `y::VarRef`: reference for binary indicator variable
- `x::Vector{VarRef}`: reference vector for variables
- `a::Float64`: coefficients for x variable
- `rhs::Float64`: right-hand side for linear constraint
"""
function add_indicator_constraint(scipd::SCIPData, y, x, a, rhs)
    SCIPvarIsBinary(var(scipd, y)) > 0 || error("indicator variable must be binary.")
    cons__ = Ref{Ptr{SCIP_CONS}}(C_NULL)
    xref = [var(scipd, x[i]) for i in eachindex(x)]
    @SCIP_CALL SCIPcreateConsBasicIndicator(
        scipd, cons__, "", var(scipd, y), length(x), xref, a, rhs
    )
    @SCIP_CALL SCIPaddCons(scipd, cons__[])
    return store_cons!(scipd, cons__)
end

# Transform SCIP C function name as follows:
# 1. Remove leading "SCIP" part (drop the first four characters).
# 2. Convert camel case to snake case.
# For example, `SCIPprintStatusStatistics` becomes `print_status_statistics`.
const STATISTICS_FUNCS = map(x -> Symbol(camel_case_to_snake_case(string(x)[5 : end])), SCIP_STATISTICS_FUNCS)

for (scip_statistics_func, statistics_func) in zip(SCIP_STATISTICS_FUNCS, STATISTICS_FUNCS)
    @eval begin
        """
            $($statistics_func)(scipd::SCIPData)

        Print statistics (calls `$($scip_statistics_func)`) to standard output.
        """
        function $statistics_func end

        function $statistics_func(scipd::SCIPData)
            ret = $scip_statistics_func(scipd, C_NULL)
            ret !== nothing && @assert ret == SCIP_OKAY
            return nothing
        end
    end
end
