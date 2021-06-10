using Clang.Generators
using SCIP_jll

cd(@__DIR__)

const HEADER_BASE = joinpath(SCIP_jll.artifact_dir, "include")
const SCIP_H = joinpath(HEADER_BASE, "scip", "scip.h")
const SCIP_DEF_PLUGINS_H = joinpath(HEADER_BASE, "scip", "scipdefplugins.h")
const MEMORY_H = joinpath(HEADER_BASE, "blockmemshell", "memory.h")
const TYPE_LIP_H = joinpath(HEADER_BASE, "lpi", "type_lpi.h")
const TYPE_EXPR = joinpath(HEADER_BASE, "nlpi", "type_expr.h")
const TYPE_NLPI = joinpath(HEADER_BASE, "nlpi", "type_nlpi.h")
const NLPI_PUB_EXPR_H = joinpath(HEADER_BASE, "nlpi", "pub_expr.h")

headers = [SCIP_H, SCIP_DEF_PLUGINS_H, MEMORY_H, TYPE_LIP_H, TYPE_EXPR, TYPE_NLPI, NLPI_PUB_EXPR_H]

options = load_options(joinpath(@__DIR__, "generator.toml"))

args = get_default_args()
push!(args, "-I$HEADER_BASE")

ctx = create_context(headers, args, options)

build!(ctx)
