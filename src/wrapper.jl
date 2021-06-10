include("LibSCIP.jl")
using .LibSCIP

const SCIP_ = LibSCIP.SCIP
const TRUE = LibSCIP.TRUE
const FALSE = LibSCIP.FALSE

# SCIP_CALL: macro to check return codes, inspired by @assert
macro SCIP_CALL(ex)
    return :(@assert $(esc(ex)) == SCIP_OKAY)
end

const SCIP_STATISTICS_FUNCS = [
    :SCIPprintStatusStatistics,
    :SCIPprintTimingStatistics,
    :SCIPprintOrigProblemStatistics,
    :SCIPprintTransProblemStatistics,
    :SCIPprintPresolverStatistics,
    :SCIPprintConstraintStatistics,
    :SCIPprintConstraintTimingStatistics,
    :SCIPprintPropagatorStatistics,
    :SCIPprintConflictStatistics,
    :SCIPprintSeparatorStatistics,
    :SCIPprintPricerStatistics,
    :SCIPprintBranchruleStatistics,
    :SCIPprintHeuristicStatistics,
    :SCIPprintCompressionStatistics,
    :SCIPprintLPStatistics,
    :SCIPprintNLPStatistics,
    :SCIPprintRelaxatorStatistics,
    :SCIPprintTreeStatistics,
    :SCIPprintRootStatistics,
    :SCIPprintSolutionStatistics,
    :SCIPprintConcsolverStatistics,
    :SCIPprintBendersStatistics,
    :SCIPprintStatistics,
    :SCIPprintReoptStatistics,
    :SCIPprintBranchingStatistics
]
