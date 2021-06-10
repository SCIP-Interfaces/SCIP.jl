# Different versions of variadic function defined in pub_expr.h
#
#   SCIP_RETCODE SCIPexprCreate(BMS_BLKMEM* blkmem, SCIP_EXPR** expr,
#                               SCIP_EXPROP op, ...);
#
# Prototype without extra arguments:
#
#   function SCIPexprCreate(blkmem, expr, op, ...)
#       ccall((:SCIPexprCreate, libscip), SCIP_RETCODE,
#             (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, SCIP_EXPROP, ...),
#             blkmem, expr, op, ...)
#   end
#
#
# TODO: Fix warnings below by creating thin, non-variadic C wrappers for the
#       following calls.

# SCIP_EXPR_VARIDX
function SCIPexprCreate(blkmem, expr, op, varpos::Cint)
    ccall((:SCIPexprCreate, libscip), SCIP_RETCODE,
          (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, SCIP_EXPROP, Cint...),
          blkmem, expr, op, varpos)
end

# SCIP_EXPR_CONST
function SCIPexprCreate(blkmem, expr, op, value::Cdouble)
    ccall((:SCIPexprCreate, libscip), SCIP_RETCODE,
          (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, SCIP_EXPROP, Cdouble...),
          blkmem, expr, op, value)
end

# SCIP_EXPR_SQRT, SCIP_EXPR_EXP, SCIP_EXPR_LOG (unary op)
function SCIPexprCreate(blkmem, expr, op, child::Ptr{SCIP_EXPR})
    ccall((:SCIPexprCreate, libscip), SCIP_RETCODE,
          (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, SCIP_EXPROP, Ptr{SCIP_EXPR}...),
          blkmem, expr, op, child)
end

# SCIP_EXPR_MINUS, SCIP_EXPR_DIV (binary op)
function SCIPexprCreate(blkmem, expr, op, left::Ptr{SCIP_EXPR}, right::Ptr{SCIP_EXPR})
    ccall((:SCIPexprCreate, libscip), SCIP_RETCODE,
          (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, SCIP_EXPROP, Ptr{SCIP_EXPR}...),
          blkmem, expr, op, left, right)
end

# SCIP_EXPR_SUM, SCIP_EXPR_PRODUCT (n-ary op)
function SCIPexprCreate(blkmem, expr, op, nchildren::Cint, children::Vector{Ptr{SCIP_EXPR}})
    # WARNING: In the actual C function, the last two arguments given here are
    # part of the variadic arguments. But since Julia only supports variadic
    # arguments of the same type, we specify the first one (nchildren::Cint)
    # directly, and pretend that only the last one is variadic.
    @assert nchildren == length(children)
    GC.@preserve children begin
        ccall((:SCIPexprCreate, libscip), SCIP_RETCODE,
              (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, SCIP_EXPROP, Cint, Ptr{Ptr{SCIP_EXPR}}...),
              blkmem, expr, op, nchildren, pointer(children))
    end
end

# SCIP_EXPR_REALPOWER (mixed binary op)
function SCIPexprCreate(blkmem, expr, op, base::Ptr{SCIP_EXPR}, exponent::Cdouble)
    # WARNING: In the actual C function, the last two arguments given here are
    # part of the variadic arguments. But since Julia only supports variadic
    # arguments of the same type, we specify the first one (base::Ptr{SCIP_EXPR})
    # directly, and pretend that only the last one is variadic.
    ccall((:SCIPexprCreate, libscip), SCIP_RETCODE,
          (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, SCIP_EXPROP, Ptr{SCIP_EXPR}, Cdouble...),
          blkmem, expr, op, base, exponent)
end

# SCIP_EXPR_INTPOWER (mixed binary op)
function SCIPexprCreate(blkmem, expr, op, base::Ptr{SCIP_EXPR}, exponent::Cint)
    # WARNING: In the actual C function, the last two arguments given here are
    # part of the variadic arguments. But since Julia only supports variadic
    # arguments of the same type, we specify the first one (base::Ptr{SCIP_EXPR})
    # directly, and pretend that only the last one is variadic.
    ccall((:SCIPexprCreate, libscip), SCIP_RETCODE,
          (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, SCIP_EXPROP, Ptr{SCIP_EXPR}, Cint...),
          blkmem, expr, op, base, exponent)
end
