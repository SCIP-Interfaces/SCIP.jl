module LibSCIP

using ..SCIP: libscip

const uint8_t = UInt8
const LLONG_MAX = typemax(Clonglong)
const LLONG_MIN = typemin(Clonglong)
const DBL_MAX = typemax(Cfloat)
const PRIx64 = "llx"
const SIZE_MAX = typemax(Csize_t)
const UINT64_C = UInt64
const UINT32_C = UInt32


@enum SCIP_Retcode::Int32 begin
    SCIP_OKAY = 1
    SCIP_ERROR = 0
    SCIP_NOMEMORY = -1
    SCIP_READERROR = -2
    SCIP_WRITEERROR = -3
    SCIP_NOFILE = -4
    SCIP_FILECREATEERROR = -5
    SCIP_LPERROR = -6
    SCIP_NOPROBLEM = -7
    SCIP_INVALIDCALL = -8
    SCIP_INVALIDDATA = -9
    SCIP_INVALIDRESULT = -10
    SCIP_PLUGINNOTFOUND = -11
    SCIP_PARAMETERUNKNOWN = -12
    SCIP_PARAMETERWRONGTYPE = -13
    SCIP_PARAMETERWRONGVAL = -14
    SCIP_KEYALREADYEXISTING = -15
    SCIP_MAXDEPTHLEVEL = -16
    SCIP_BRANCHERROR = -17
    SCIP_NOTIMPLEMENTED = -18
end

const SCIP_RETCODE = SCIP_Retcode

@enum SCIP_VerbLevel::UInt32 begin
    SCIP_VERBLEVEL_NONE = 0
    SCIP_VERBLEVEL_DIALOG = 1
    SCIP_VERBLEVEL_MINIMAL = 2
    SCIP_VERBLEVEL_NORMAL = 3
    SCIP_VERBLEVEL_HIGH = 4
    SCIP_VERBLEVEL_FULL = 5
end

const SCIP_VERBLEVEL = SCIP_VerbLevel

const SCIP_Messagehdlr = Cvoid

const SCIP_MESSAGEHDLR = SCIP_Messagehdlr

const SCIP_MessagehdlrData = Cvoid

const SCIP_MESSAGEHDLRDATA = SCIP_MessagehdlrData

function SCIPmessagehdlrCreate(messagehdlr, bufferedoutput, filename, quiet, messagewarning, messagedialog, messageinfo, messagehdlrfree, messagehdlrdata)
    ccall((:SCIPmessagehdlrCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_MESSAGEHDLR}}, Cuint, Ptr{Cchar}, Cuint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_MESSAGEHDLRDATA}), messagehdlr, bufferedoutput, filename, quiet, messagewarning, messagedialog, messageinfo, messagehdlrfree, messagehdlrdata)
end

function SCIPmessagehdlrCapture(messagehdlr)
    ccall((:SCIPmessagehdlrCapture, libscip), Cvoid, (Ptr{SCIP_MESSAGEHDLR},), messagehdlr)
end

function SCIPmessagehdlrRelease(messagehdlr)
    ccall((:SCIPmessagehdlrRelease, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_MESSAGEHDLR}},), messagehdlr)
end

function SCIPmessagehdlrSetData(messagehdlr, messagehdlrdata)
    ccall((:SCIPmessagehdlrSetData, libscip), SCIP_RETCODE, (Ptr{SCIP_MESSAGEHDLR}, Ptr{SCIP_MESSAGEHDLRDATA}), messagehdlr, messagehdlrdata)
end

function SCIPmessagehdlrSetLogfile(messagehdlr, filename)
    ccall((:SCIPmessagehdlrSetLogfile, libscip), Cvoid, (Ptr{SCIP_MESSAGEHDLR}, Ptr{Cchar}), messagehdlr, filename)
end

function SCIPmessagehdlrSetQuiet(messagehdlr, quiet)
    ccall((:SCIPmessagehdlrSetQuiet, libscip), Cvoid, (Ptr{SCIP_MESSAGEHDLR}, Cuint), messagehdlr, quiet)
end

function SCIPmessagePrintErrorHeader(sourcefile, sourceline)
    ccall((:SCIPmessagePrintErrorHeader, libscip), Cvoid, (Ptr{Cchar}, Cint), sourcefile, sourceline)
end

function SCIPmessageSetErrorPrinting(errorPrinting, data)
    ccall((:SCIPmessageSetErrorPrinting, libscip), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}), errorPrinting, data)
end

function SCIPmessageSetErrorPrintingDefault()
    ccall((:SCIPmessageSetErrorPrintingDefault, libscip), Cvoid, ())
end

function SCIPmessagehdlrGetData(messagehdlr)
    ccall((:SCIPmessagehdlrGetData, libscip), Ptr{SCIP_MESSAGEHDLRDATA}, (Ptr{SCIP_MESSAGEHDLR},), messagehdlr)
end

function SCIPmessagehdlrGetLogfile(messagehdlr)
    ccall((:SCIPmessagehdlrGetLogfile, libscip), Ptr{Libc.FILE}, (Ptr{SCIP_MESSAGEHDLR},), messagehdlr)
end

function SCIPmessagehdlrIsQuiet(messagehdlr)
    ccall((:SCIPmessagehdlrIsQuiet, libscip), Cuint, (Ptr{SCIP_MESSAGEHDLR},), messagehdlr)
end

@enum SCIP_Result::UInt32 begin
    SCIP_DIDNOTRUN = 1
    SCIP_DELAYED = 2
    SCIP_DIDNOTFIND = 3
    SCIP_FEASIBLE = 4
    SCIP_INFEASIBLE = 5
    SCIP_UNBOUNDED = 6
    SCIP_CUTOFF = 7
    SCIP_SEPARATED = 8
    SCIP_NEWROUND = 9
    SCIP_REDUCEDDOM = 10
    SCIP_CONSADDED = 11
    SCIP_CONSCHANGED = 12
    SCIP_BRANCHED = 13
    SCIP_SOLVELP = 14
    SCIP_FOUNDSOL = 15
    SCIP_SUSPENDED = 16
    SCIP_SUCCESS = 17
    SCIP_DELAYNODE = 18
end

const SCIP_RESULT = SCIP_Result

@enum SCIP_ClockType::UInt32 begin
    SCIP_CLOCKTYPE_DEFAULT = 0
    SCIP_CLOCKTYPE_CPU = 1
    SCIP_CLOCKTYPE_WALL = 2
end

const SCIP_CLOCKTYPE = SCIP_ClockType

const SCIP_Clock = Cvoid

const SCIP_CLOCK = SCIP_Clock

const SCIP_CPUClock = Cvoid

const SCIP_CPUCLOCK = SCIP_CPUClock

const SCIP_WallClock = Cvoid

const SCIP_WALLCLOCK = SCIP_WallClock

@enum SCIP_Confidencelevel::UInt32 begin
    SCIP_CONFIDENCELEVEL_MIN = 0
    SCIP_CONFIDENCELEVEL_LOW = 1
    SCIP_CONFIDENCELEVEL_MEDIUM = 2
    SCIP_CONFIDENCELEVEL_HIGH = 3
    SCIP_CONFIDENCELEVEL_MAX = 4
end

const SCIP_CONFIDENCELEVEL = SCIP_Confidencelevel

@enum SCIP_Hashmaptype::UInt32 begin
    SCIP_HASHMAPTYPE_UNKNOWN = 0
    SCIP_HASHMAPTYPE_POINTER = 1
    SCIP_HASHMAPTYPE_REAL = 2
    SCIP_HASHMAPTYPE_INT = 3
end

const SCIP_HASHMAPTYPE = SCIP_Hashmaptype

const SCIP_SparseSol = Cvoid

const SCIP_SPARSESOL = SCIP_SparseSol

const SCIP_Queue = Cvoid

const SCIP_QUEUE = SCIP_Queue

const SCIP_PQueue = Cvoid

const SCIP_PQUEUE = SCIP_PQueue

const SCIP_HashTable = Cvoid

const SCIP_HASHTABLE = SCIP_HashTable

const SCIP_MultiHash = Cvoid

const SCIP_MULTIHASH = SCIP_MultiHash

const SCIP_MultiHashList = Cvoid

const SCIP_MULTIHASHLIST = SCIP_MultiHashList

const SCIP_HashMapEntry = Cvoid

const SCIP_HASHMAPENTRY = SCIP_HashMapEntry

const SCIP_HashMap = Cvoid

const SCIP_HASHMAP = SCIP_HashMap

const SCIP_HashSet = Cvoid

const SCIP_HASHSET = SCIP_HashSet

const SCIP_RealArray = Cvoid

const SCIP_REALARRAY = SCIP_RealArray

const SCIP_IntArray = Cvoid

const SCIP_INTARRAY = SCIP_IntArray

const SCIP_BoolArray = Cvoid

const SCIP_BOOLARRAY = SCIP_BoolArray

const SCIP_PtrArray = Cvoid

const SCIP_PTRARRAY = SCIP_PtrArray

const SCIP_RandNumGen = Cvoid

const SCIP_RANDNUMGEN = SCIP_RandNumGen

const SCIP_ResourceActivity = Cvoid

const SCIP_RESOURCEACTIVITY = SCIP_ResourceActivity

const SCIP_Profile = Cvoid

const SCIP_PROFILE = SCIP_Profile

const SCIP_Digraph = Cvoid

const SCIP_DIGRAPH = SCIP_Digraph

const SCIP_Bt = Cvoid

const SCIP_BT = SCIP_Bt

const SCIP_BtNode = Cvoid

const SCIP_BTNODE = SCIP_BtNode

const SCIP_Regression = Cvoid

const SCIP_REGRESSION = SCIP_Regression

const SCIP_DisjointSet = Cvoid

const SCIP_DISJOINTSET = SCIP_DisjointSet

const Scip = Cvoid

const SCIP = Scip

const SCIP_PRESOLTIMING = Cuint

const SCIP_PROPTIMING = Cuint

const SCIP_HEURTIMING = Cuint

@enum SCIP_ParamType::UInt32 begin
    SCIP_PARAMTYPE_BOOL = 0
    SCIP_PARAMTYPE_INT = 1
    SCIP_PARAMTYPE_LONGINT = 2
    SCIP_PARAMTYPE_REAL = 3
    SCIP_PARAMTYPE_CHAR = 4
    SCIP_PARAMTYPE_STRING = 5
end

const SCIP_PARAMTYPE = SCIP_ParamType

@enum SCIP_ParamSetting::UInt32 begin
    SCIP_PARAMSETTING_DEFAULT = 0
    SCIP_PARAMSETTING_AGGRESSIVE = 1
    SCIP_PARAMSETTING_FAST = 2
    SCIP_PARAMSETTING_OFF = 3
end

const SCIP_PARAMSETTING = SCIP_ParamSetting

@enum SCIP_ParamEmphasis::UInt32 begin
    SCIP_PARAMEMPHASIS_DEFAULT = 0
    SCIP_PARAMEMPHASIS_CPSOLVER = 1
    SCIP_PARAMEMPHASIS_EASYCIP = 2
    SCIP_PARAMEMPHASIS_FEASIBILITY = 3
    SCIP_PARAMEMPHASIS_HARDLP = 4
    SCIP_PARAMEMPHASIS_OPTIMALITY = 5
    SCIP_PARAMEMPHASIS_COUNTER = 6
    SCIP_PARAMEMPHASIS_PHASEFEAS = 7
    SCIP_PARAMEMPHASIS_PHASEIMPROVE = 8
    SCIP_PARAMEMPHASIS_PHASEPROOF = 9
    SCIP_PARAMEMPHASIS_NUMERICS = 10
end

const SCIP_PARAMEMPHASIS = SCIP_ParamEmphasis

const SCIP_Param = Cvoid

const SCIP_PARAM = SCIP_Param

const SCIP_ParamData = Cvoid

const SCIP_PARAMDATA = SCIP_ParamData

const SCIP_ParamSet = Cvoid

const SCIP_PARAMSET = SCIP_ParamSet

const SCIP_EVENTTYPE = UInt64

const SCIP_Eventhdlr = Cvoid

const SCIP_EVENTHDLR = SCIP_Eventhdlr

const SCIP_EventhdlrData = Cvoid

const SCIP_EVENTHDLRDATA = SCIP_EventhdlrData

const SCIP_Event = Cvoid

const SCIP_EVENT = SCIP_Event

const SCIP_EventVarAdded = Cvoid

const SCIP_EVENTVARADDED = SCIP_EventVarAdded

const SCIP_EventVarDeleted = Cvoid

const SCIP_EVENTVARDELETED = SCIP_EventVarDeleted

const SCIP_EventVarFixed = Cvoid

const SCIP_EVENTVARFIXED = SCIP_EventVarFixed

const SCIP_EventVarUnlocked = Cvoid

const SCIP_EVENTVARUNLOCKED = SCIP_EventVarUnlocked

const SCIP_EventObjChg = Cvoid

const SCIP_EVENTOBJCHG = SCIP_EventObjChg

const SCIP_EventBdChg = Cvoid

const SCIP_EVENTBDCHG = SCIP_EventBdChg

const SCIP_EventHole = Cvoid

const SCIP_EVENTHOLE = SCIP_EventHole

const SCIP_EventImplAdd = Cvoid

const SCIP_EVENTIMPLADD = SCIP_EventImplAdd

const SCIP_EventTypeChg = Cvoid

const SCIP_EVENTTYPECHG = SCIP_EventTypeChg

const SCIP_EventRowAddedSepa = Cvoid

const SCIP_EVENTROWADDEDSEPA = SCIP_EventRowAddedSepa

const SCIP_EventRowDeletedSepa = Cvoid

const SCIP_EVENTROWDELETEDSEPA = SCIP_EventRowDeletedSepa

const SCIP_EventRowAddedLP = Cvoid

const SCIP_EVENTROWADDEDLP = SCIP_EventRowAddedLP

const SCIP_EventRowDeletedLP = Cvoid

const SCIP_EVENTROWDELETEDLP = SCIP_EventRowDeletedLP

const SCIP_EventRowCoefChanged = Cvoid

const SCIP_EVENTROWCOEFCHANGED = SCIP_EventRowCoefChanged

const SCIP_EventRowConstChanged = Cvoid

const SCIP_EVENTROWCONSTCHANGED = SCIP_EventRowConstChanged

const SCIP_EventRowSideChanged = Cvoid

const SCIP_EVENTROWSIDECHANGED = SCIP_EventRowSideChanged

const SCIP_EventData = Cvoid

const SCIP_EVENTDATA = SCIP_EventData

const SCIP_EventFilter = Cvoid

const SCIP_EVENTFILTER = SCIP_EventFilter

const SCIP_EventQueue = Cvoid

const SCIP_EVENTQUEUE = SCIP_EventQueue

@enum SCIP_LPSolStat::UInt32 begin
    SCIP_LPSOLSTAT_NOTSOLVED = 0
    SCIP_LPSOLSTAT_OPTIMAL = 1
    SCIP_LPSOLSTAT_INFEASIBLE = 2
    SCIP_LPSOLSTAT_UNBOUNDEDRAY = 3
    SCIP_LPSOLSTAT_OBJLIMIT = 4
    SCIP_LPSOLSTAT_ITERLIMIT = 5
    SCIP_LPSOLSTAT_TIMELIMIT = 6
    SCIP_LPSOLSTAT_ERROR = 7
end

const SCIP_LPSOLSTAT = SCIP_LPSolStat

@enum SCIP_BoundType::UInt32 begin
    SCIP_BOUNDTYPE_LOWER = 0
    SCIP_BOUNDTYPE_UPPER = 1
end

const SCIP_BOUNDTYPE = SCIP_BoundType

@enum SCIP_SideType::UInt32 begin
    SCIP_SIDETYPE_LEFT = 0
    SCIP_SIDETYPE_RIGHT = 1
end

const SCIP_SIDETYPE = SCIP_SideType

@enum SCIP_RowOriginType::UInt32 begin
    SCIP_ROWORIGINTYPE_UNSPEC = 0
    SCIP_ROWORIGINTYPE_CONSHDLR = 1
    SCIP_ROWORIGINTYPE_CONS = 2
    SCIP_ROWORIGINTYPE_SEPA = 3
    SCIP_ROWORIGINTYPE_REOPT = 4
end

const SCIP_ROWORIGINTYPE = SCIP_RowOriginType

@enum SCIP_LPAlgo::UInt32 begin
    SCIP_LPALGO_PRIMALSIMPLEX = 0
    SCIP_LPALGO_DUALSIMPLEX = 1
    SCIP_LPALGO_BARRIER = 2
    SCIP_LPALGO_BARRIERCROSSOVER = 3
end

const SCIP_LPALGO = SCIP_LPAlgo

const SCIP_ColSolVals = Cvoid

const SCIP_COLSOLVALS = SCIP_ColSolVals

const SCIP_RowSolVals = Cvoid

const SCIP_ROWSOLVALS = SCIP_RowSolVals

const SCIP_LpSolVals = Cvoid

const SCIP_LPSOLVALS = SCIP_LpSolVals

const SCIP_Col = Cvoid

const SCIP_COL = SCIP_Col

const SCIP_Row = Cvoid

const SCIP_ROW = SCIP_Row

const SCIP_Lp = Cvoid

const SCIP_LP = SCIP_Lp

const SCIP_NlRow = Cvoid

const SCIP_NLROW = SCIP_NlRow

const SCIP_Nlp = Cvoid

const SCIP_NLP = SCIP_Nlp

@enum SCIP_Varstatus::UInt32 begin
    SCIP_VARSTATUS_ORIGINAL = 0
    SCIP_VARSTATUS_LOOSE = 1
    SCIP_VARSTATUS_COLUMN = 2
    SCIP_VARSTATUS_FIXED = 3
    SCIP_VARSTATUS_AGGREGATED = 4
    SCIP_VARSTATUS_MULTAGGR = 5
    SCIP_VARSTATUS_NEGATED = 6
end

const SCIP_VARSTATUS = SCIP_Varstatus

@enum SCIP_Vartype::UInt32 begin
    SCIP_VARTYPE_BINARY = 0
    SCIP_VARTYPE_INTEGER = 1
    SCIP_VARTYPE_IMPLINT = 2
    SCIP_VARTYPE_CONTINUOUS = 3
end

const SCIP_VARTYPE = SCIP_Vartype

@enum SCIP_DomchgType::UInt32 begin
    SCIP_DOMCHGTYPE_DYNAMIC = 0
    SCIP_DOMCHGTYPE_BOTH = 1
    SCIP_DOMCHGTYPE_BOUND = 2
end

const SCIP_DOMCHGTYPE = SCIP_DomchgType

@enum SCIP_BoundchgType::UInt32 begin
    SCIP_BOUNDCHGTYPE_BRANCHING = 0
    SCIP_BOUNDCHGTYPE_CONSINFER = 1
    SCIP_BOUNDCHGTYPE_PROPINFER = 2
end

const SCIP_BOUNDCHGTYPE = SCIP_BoundchgType

@enum SCIP_LockType::UInt32 begin
    SCIP_LOCKTYPE_MODEL = 0
    SCIP_LOCKTYPE_CONFLICT = 1
end

const SCIP_LOCKTYPE = SCIP_LockType

const SCIP_DomChgBound = Cvoid

const SCIP_DOMCHGBOUND = SCIP_DomChgBound

const SCIP_DomChgBoth = Cvoid

const SCIP_DOMCHGBOTH = SCIP_DomChgBoth

const SCIP_DomChgDyn = Cvoid

const SCIP_DOMCHGDYN = SCIP_DomChgDyn

const SCIP_DomChg = Cvoid

const SCIP_DOMCHG = SCIP_DomChg

const SCIP_BoundChg = Cvoid

const SCIP_BOUNDCHG = SCIP_BoundChg

const SCIP_BdChgIdx = Cvoid

const SCIP_BDCHGIDX = SCIP_BdChgIdx

const SCIP_BdChgInfo = Cvoid

const SCIP_BDCHGINFO = SCIP_BdChgInfo

const SCIP_BranchingData = Cvoid

const SCIP_BRANCHINGDATA = SCIP_BranchingData

const SCIP_InferenceData = Cvoid

const SCIP_INFERENCEDATA = SCIP_InferenceData

const SCIP_HoleChg = Cvoid

const SCIP_HOLECHG = SCIP_HoleChg

const SCIP_Hole = Cvoid

const SCIP_HOLE = SCIP_Hole

const SCIP_Holelist = Cvoid

const SCIP_HOLELIST = SCIP_Holelist

const SCIP_Dom = Cvoid

const SCIP_DOM = SCIP_Dom

const SCIP_Original = Cvoid

const SCIP_ORIGINAL = SCIP_Original

const SCIP_Aggregate = Cvoid

const SCIP_AGGREGATE = SCIP_Aggregate

const SCIP_Multaggr = Cvoid

const SCIP_MULTAGGR = SCIP_Multaggr

const SCIP_Negate = Cvoid

const SCIP_NEGATE = SCIP_Negate

const SCIP_Var = Cvoid

const SCIP_VAR = SCIP_Var

const SCIP_VarData = Cvoid

const SCIP_VARDATA = SCIP_VarData

@enum SCIP_Objsense::Int32 begin
    SCIP_OBJSENSE_MAXIMIZE = -1
    SCIP_OBJSENSE_MINIMIZE = 1
end

const SCIP_OBJSENSE = SCIP_Objsense

const SCIP_Prob = Cvoid

const SCIP_PROB = SCIP_Prob

const SCIP_ProbData = Cvoid

const SCIP_PROBDATA = SCIP_ProbData

@enum SCIP_NodeType::UInt32 begin
    SCIP_NODETYPE_FOCUSNODE = 0
    SCIP_NODETYPE_PROBINGNODE = 1
    SCIP_NODETYPE_SIBLING = 2
    SCIP_NODETYPE_CHILD = 3
    SCIP_NODETYPE_LEAF = 4
    SCIP_NODETYPE_DEADEND = 5
    SCIP_NODETYPE_JUNCTION = 6
    SCIP_NODETYPE_PSEUDOFORK = 7
    SCIP_NODETYPE_FORK = 8
    SCIP_NODETYPE_SUBROOT = 9
    SCIP_NODETYPE_REFOCUSNODE = 10
end

const SCIP_NODETYPE = SCIP_NodeType

const SCIP_Probingnode = Cvoid

const SCIP_PROBINGNODE = SCIP_Probingnode

const SCIP_Sibling = Cvoid

const SCIP_SIBLING = SCIP_Sibling

const SCIP_Child = Cvoid

const SCIP_CHILD = SCIP_Child

const SCIP_Leaf = Cvoid

const SCIP_LEAF = SCIP_Leaf

const SCIP_Junction = Cvoid

const SCIP_JUNCTION = SCIP_Junction

const SCIP_Pseudofork = Cvoid

const SCIP_PSEUDOFORK = SCIP_Pseudofork

const SCIP_Fork = Cvoid

const SCIP_FORK = SCIP_Fork

const SCIP_Subroot = Cvoid

const SCIP_SUBROOT = SCIP_Subroot

const SCIP_Node = Cvoid

const SCIP_NODE = SCIP_Node

const SCIP_PendingBdchg = Cvoid

const SCIP_PENDINGBDCHG = SCIP_PendingBdchg

const SCIP_Tree = Cvoid

const SCIP_TREE = SCIP_Tree

const SCIP_Bandit = Cvoid

const SCIP_BANDIT = SCIP_Bandit

const SCIP_BanditVTable = Cvoid

const SCIP_BANDITVTABLE = SCIP_BanditVTable

const SCIP_BanditData = Cvoid

const SCIP_BANDITDATA = SCIP_BanditData

const SCIP_BranchCand = Cvoid

const SCIP_BRANCHCAND = SCIP_BranchCand

const SCIP_Branchrule = Cvoid

const SCIP_BRANCHRULE = SCIP_Branchrule

const SCIP_BranchruleData = Cvoid

const SCIP_BRANCHRULEDATA = SCIP_BranchruleData

const SCIP_Treemodel = Cvoid

const SCIP_TREEMODEL = SCIP_Treemodel

const SCIP_Conflicthdlr = Cvoid

const SCIP_CONFLICTHDLR = SCIP_Conflicthdlr

const SCIP_ConflicthdlrData = Cvoid

const SCIP_CONFLICTHDLRDATA = SCIP_ConflicthdlrData

const SCIP_ConflictSet = Cvoid

const SCIP_CONFLICTSET = SCIP_ConflictSet

const SCIP_ProofSet = Cvoid

const SCIP_PROOFSET = SCIP_ProofSet

const SCIP_LPBdChgs = Cvoid

const SCIP_LPBDCHGS = SCIP_LPBdChgs

const SCIP_Conflict = Cvoid

const SCIP_CONFLICT = SCIP_Conflict

@enum SCIP_ConflictType::UInt32 begin
    SCIP_CONFTYPE_UNKNOWN = 0
    SCIP_CONFTYPE_PROPAGATION = 1
    SCIP_CONFTYPE_INFEASLP = 2
    SCIP_CONFTYPE_BNDEXCEEDING = 3
    SCIP_CONFTYPE_ALTINFPROOF = 4
    SCIP_CONFTYPE_ALTBNDPROOF = 5
end

const SCIP_CONFTYPE = SCIP_ConflictType

@enum SCIP_ConflictPresolStrat::UInt32 begin
    SCIP_CONFPRES_DISABLED = 0
    SCIP_CONFPRES_ONLYLOCAL = 1
    SCIP_CONFPRES_ONLYGLOBAL = 2
    SCIP_CONFPRES_BOTH = 3
end

const SCIP_CONFPRES = SCIP_ConflictPresolStrat

@enum SCIP_SolOrigin::UInt32 begin
    SCIP_SOLORIGIN_ORIGINAL = 0
    SCIP_SOLORIGIN_ZERO = 1
    SCIP_SOLORIGIN_LPSOL = 2
    SCIP_SOLORIGIN_NLPSOL = 3
    SCIP_SOLORIGIN_RELAXSOL = 4
    SCIP_SOLORIGIN_PSEUDOSOL = 5
    SCIP_SOLORIGIN_PARTIAL = 6
    SCIP_SOLORIGIN_UNKNOWN = 7
end

const SCIP_SOLORIGIN = SCIP_SolOrigin

const SCIP_Sol = Cvoid

const SCIP_SOL = SCIP_Sol

const SCIP_Viol = Cvoid

const SCIP_VIOL = SCIP_Viol

@enum SCIP_SolType::UInt32 begin
    SCIP_SOLTYPE_UNKNOWN = 0
    SCIP_SOLTYPE_HEUR = 1
    SCIP_SOLTYPE_RELAX = 2
    SCIP_SOLTYPE_LPRELAX = 3
    SCIP_SOLTYPE_STRONGBRANCH = 4
    SCIP_SOLTYPE_PSEUDO = 5
end

const SCIP_SOLTYPE = SCIP_SolType

const SCIP_DIVETYPE = Cuint

@enum SCIP_DiveContext::UInt32 begin
    SCIP_DIVECONTEXT_TOTAL = 0
    SCIP_DIVECONTEXT_SINGLE = 1
    SCIP_DIVECONTEXT_ADAPTIVE = 2
end

const SCIP_DIVECONTEXT = SCIP_DiveContext

const SCIP_Heur = Cvoid

const SCIP_HEUR = SCIP_Heur

const SCIP_HeurData = Cvoid

const SCIP_HEURDATA = SCIP_HeurData

const SCIP_Diveset = Cvoid

const SCIP_DIVESET = SCIP_Diveset

const SCIP_VGraph = Cvoid

const SCIP_VGRAPH = SCIP_VGraph

const SCIP_Conshdlr = Cvoid

const SCIP_CONSHDLR = SCIP_Conshdlr

const SCIP_Cons = Cvoid

const SCIP_CONS = SCIP_Cons

const SCIP_ConshdlrData = Cvoid

const SCIP_CONSHDLRDATA = SCIP_ConshdlrData

const SCIP_ConsData = Cvoid

const SCIP_CONSDATA = SCIP_ConsData

const SCIP_ConsSetChg = Cvoid

const SCIP_CONSSETCHG = SCIP_ConsSetChg

const SCIP_LinConsStats = Cvoid

const SCIP_LINCONSSTATS = SCIP_LinConsStats

@enum SCIP_LinConstype::UInt32 begin
    SCIP_LINCONSTYPE_EMPTY = 0
    SCIP_LINCONSTYPE_FREE = 1
    SCIP_LINCONSTYPE_SINGLETON = 2
    SCIP_LINCONSTYPE_AGGREGATION = 3
    SCIP_LINCONSTYPE_PRECEDENCE = 4
    SCIP_LINCONSTYPE_VARBOUND = 5
    SCIP_LINCONSTYPE_SETPARTITION = 6
    SCIP_LINCONSTYPE_SETPACKING = 7
    SCIP_LINCONSTYPE_SETCOVERING = 8
    SCIP_LINCONSTYPE_CARDINALITY = 9
    SCIP_LINCONSTYPE_INVKNAPSACK = 10
    SCIP_LINCONSTYPE_EQKNAPSACK = 11
    SCIP_LINCONSTYPE_BINPACKING = 12
    SCIP_LINCONSTYPE_KNAPSACK = 13
    SCIP_LINCONSTYPE_INTKNAPSACK = 14
    SCIP_LINCONSTYPE_MIXEDBINARY = 15
    SCIP_LINCONSTYPE_GENERAL = 16
end

const SCIP_LINCONSTYPE = SCIP_LinConstype

const SCIP_Dialog = Cvoid

const SCIP_DIALOG = SCIP_Dialog

const SCIP_DialogData = Cvoid

const SCIP_DIALOGDATA = SCIP_DialogData

const SCIP_Dialoghdlr = Cvoid

const SCIP_DIALOGHDLR = SCIP_Dialoghdlr

const SCIP_Linelist = Cvoid

const SCIP_LINELIST = SCIP_Linelist

@enum SCIP_DispStatus::UInt32 begin
    SCIP_DISPSTATUS_OFF = 0
    SCIP_DISPSTATUS_AUTO = 1
    SCIP_DISPSTATUS_ON = 2
end

const SCIP_DISPSTATUS = SCIP_DispStatus

@enum SCIP_DispMode::UInt32 begin
    SCIP_DISPMODE_DEFAULT = 1
    SCIP_DISPMODE_CONCURRENT = 2
    SCIP_DISPMODE_ALL = 3
end

const SCIP_DISPMODE = SCIP_DispMode

const SCIP_Disp = Cvoid

const SCIP_DISP = SCIP_Disp

const SCIP_DispData = Cvoid

const SCIP_DISPDATA = SCIP_DispData

const SCIP_Compr = Cvoid

const SCIP_COMPR = SCIP_Compr

const SCIP_ComprData = Cvoid

const SCIP_COMPRDATA = SCIP_ComprData

@enum SCIP_BranchDir::UInt32 begin
    SCIP_BRANCHDIR_DOWNWARDS = 0
    SCIP_BRANCHDIR_UPWARDS = 1
    SCIP_BRANCHDIR_FIXED = 2
    SCIP_BRANCHDIR_AUTO = 3
end

const SCIP_BRANCHDIR = SCIP_BranchDir

const SCIP_History = Cvoid

const SCIP_HISTORY = SCIP_History

const SCIP_ValueHistory = Cvoid

const SCIP_VALUEHISTORY = SCIP_ValueHistory

const SCIP_NodePQ = Cvoid

const SCIP_NODEPQ = SCIP_NodePQ

const SCIP_Nodesel = Cvoid

const SCIP_NODESEL = SCIP_Nodesel

const SCIP_NodeselData = Cvoid

const SCIP_NODESELDATA = SCIP_NodeselData

const SCIP_Presol = Cvoid

const SCIP_PRESOL = SCIP_Presol

const SCIP_PresolData = Cvoid

const SCIP_PRESOLDATA = SCIP_PresolData

const SCIP_Pricer = Cvoid

const SCIP_PRICER = SCIP_Pricer

const SCIP_PricerData = Cvoid

const SCIP_PRICERDATA = SCIP_PricerData

const SCIP_Reader = Cvoid

const SCIP_READER = SCIP_Reader

const SCIP_ReaderData = Cvoid

const SCIP_READERDATA = SCIP_ReaderData

const SCIP_Relax = Cvoid

const SCIP_RELAX = SCIP_Relax

const SCIP_Relaxation = Cvoid

const SCIP_RELAXATION = SCIP_Relaxation

const SCIP_RelaxData = Cvoid

const SCIP_RELAXDATA = SCIP_RelaxData

const SCIP_Reopt = Cvoid

const SCIP_REOPT = SCIP_Reopt

const SCIP_SolTree = Cvoid

const SCIP_SOLTREE = SCIP_SolTree

const SCIP_SolNode = Cvoid

const SCIP_SOLNODE = SCIP_SolNode

const SCIP_ReoptTree = Cvoid

const SCIP_REOPTTREE = SCIP_ReoptTree

const SCIP_ReoptNode = Cvoid

const SCIP_REOPTNODE = SCIP_ReoptNode

const SCIP_REPRESENTATIVE = SCIP_ReoptNode

const SCIP_ReoptConsData = Cvoid

const SCIP_REOPTCONSDATA = SCIP_ReoptConsData

@enum SCIP_ReoptType::UInt32 begin
    SCIP_REOPTTYPE_NONE = 0
    SCIP_REOPTTYPE_TRANSIT = 1
    SCIP_REOPTTYPE_INFSUBTREE = 2
    SCIP_REOPTTYPE_STRBRANCHED = 3
    SCIP_REOPTTYPE_LOGICORNODE = 4
    SCIP_REOPTTYPE_LEAF = 5
    SCIP_REOPTTYPE_PRUNED = 6
    SCIP_REOPTTYPE_FEASIBLE = 7
end

const SCIP_REOPTTYPE = SCIP_ReoptType

@enum Reopt_ConsType::UInt32 begin
    REOPT_CONSTYPE_INFSUBTREE = 0
    REOPT_CONSTYPE_DUALREDS = 1
    REOPT_CONSTYPE_CUT = 2
    REOPT_CONSTYPE_UNKNOWN = 3
end

const REOPT_CONSTYPE = Reopt_ConsType

const SCIP_Sepa = Cvoid

const SCIP_SEPA = SCIP_Sepa

const SCIP_SepaData = Cvoid

const SCIP_SEPADATA = SCIP_SepaData

const SCIP_Table = Cvoid

const SCIP_TABLE = SCIP_Table

const SCIP_TableData = Cvoid

const SCIP_TABLEDATA = SCIP_TableData

const SCIP_Prop = Cvoid

const SCIP_PROP = SCIP_Prop

const SCIP_PropData = Cvoid

const SCIP_PROPDATA = SCIP_PropData

@enum SCIP_Status::UInt32 begin
    SCIP_STATUS_UNKNOWN = 0
    SCIP_STATUS_USERINTERRUPT = 1
    SCIP_STATUS_NODELIMIT = 2
    SCIP_STATUS_TOTALNODELIMIT = 3
    SCIP_STATUS_STALLNODELIMIT = 4
    SCIP_STATUS_TIMELIMIT = 5
    SCIP_STATUS_MEMLIMIT = 6
    SCIP_STATUS_GAPLIMIT = 7
    SCIP_STATUS_SOLLIMIT = 8
    SCIP_STATUS_BESTSOLLIMIT = 9
    SCIP_STATUS_RESTARTLIMIT = 10
    SCIP_STATUS_OPTIMAL = 11
    SCIP_STATUS_INFEASIBLE = 12
    SCIP_STATUS_UNBOUNDED = 13
    SCIP_STATUS_INFORUNBD = 14
    SCIP_STATUS_TERMINATE = 15
end

const SCIP_STATUS = SCIP_Status

const SCIP_Stat = Cvoid

const SCIP_STAT = SCIP_Stat

@enum SCIP_Parallelmode::UInt32 begin
    SCIP_PARA_OPPORTUNISTIC = 0
    SCIP_PARA_DETERMINISTIC = 1
end

const SCIP_PARALLELMODE = SCIP_Parallelmode

const SCIP_SyncStore = Cvoid

const SCIP_SYNCSTORE = SCIP_SyncStore

const SCIP_SyncData = Cvoid

const SCIP_SYNCDATA = SCIP_SyncData

const SCIP_BoundStore = Cvoid

const SCIP_BOUNDSTORE = SCIP_BoundStore

const SCIP_ConcSolverType = Cvoid

const SCIP_CONCSOLVERTYPE = SCIP_ConcSolverType

const SCIP_ConcSolverTypeData = Cvoid

const SCIP_CONCSOLVERTYPEDATA = SCIP_ConcSolverTypeData

const SCIP_ConcSolver = Cvoid

const SCIP_CONCSOLVER = SCIP_ConcSolver

const SCIP_ConcSolverData = Cvoid

const SCIP_CONCSOLVERDATA = SCIP_ConcSolverData

@enum SCIP_BendersEnfoType::UInt32 begin
    SCIP_BENDERSENFOTYPE_LP = 1
    SCIP_BENDERSENFOTYPE_RELAX = 2
    SCIP_BENDERSENFOTYPE_PSEUDO = 3
    SCIP_BENDERSENFOTYPE_CHECK = 4
end

const SCIP_BENDERSENFOTYPE = SCIP_BendersEnfoType

@enum SCIP_BendersSolveLoop::UInt32 begin
    SCIP_BENDERSSOLVELOOP_CONVEX = 0
    SCIP_BENDERSSOLVELOOP_CIP = 1
    SCIP_BENDERSSOLVELOOP_USERCONVEX = 2
    SCIP_BENDERSSOLVELOOP_USERCIP = 3
end

const SCIP_BENDERSSOLVELOOP = SCIP_BendersSolveLoop

@enum SCIP_BendersSubStatus::UInt32 begin
    SCIP_BENDERSSUBSTATUS_UNKNOWN = 0
    SCIP_BENDERSSUBSTATUS_OPTIMAL = 1
    SCIP_BENDERSSUBSTATUS_AUXVIOL = 2
    SCIP_BENDERSSUBSTATUS_INFEAS = 3
end

const SCIP_BENDERSSUBSTATUS = SCIP_BendersSubStatus

@enum SCIP_BendersSubType::UInt32 begin
    SCIP_BENDERSSUBTYPE_CONVEXCONT = 0
    SCIP_BENDERSSUBTYPE_CONVEXDIS = 1
    SCIP_BENDERSSUBTYPE_NONCONVEXCONT = 2
    SCIP_BENDERSSUBTYPE_NONCONVEXDIS = 3
    SCIP_BENDERSSUBTYPE_UNKNOWN = 4
end

const SCIP_BENDERSSUBTYPE = SCIP_BendersSubType

const SCIP_Benders = Cvoid

const SCIP_BENDERS = SCIP_Benders

const SCIP_BendersData = Cvoid

const SCIP_BENDERSDATA = SCIP_BendersData

const SCIP_SubproblemSolveStat = Cvoid

const SCIP_SUBPROBLEMSOLVESTAT = SCIP_SubproblemSolveStat

const SCIP_Benderscut = Cvoid

const SCIP_BENDERSCUT = SCIP_Benderscut

const SCIP_BenderscutData = Cvoid

const SCIP_BENDERSCUTDATA = SCIP_BenderscutData

function SCIPcreateBanditEpsgreedy(scip, epsgreedy, priorities, eps, preferrecent, decayfactor, avglim, nactions, initseed)
    ccall((:SCIPcreateBanditEpsgreedy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_BANDIT}}, Ptr{Cdouble}, Cdouble, Cuint, Cdouble, Cint, Cint, Cuint), scip, epsgreedy, priorities, eps, preferrecent, decayfactor, avglim, nactions, initseed)
end

function SCIPgetWeightsEpsgreedy(epsgreedy)
    ccall((:SCIPgetWeightsEpsgreedy, libscip), Ptr{Cdouble}, (Ptr{SCIP_BANDIT},), epsgreedy)
end

function SCIPsetEpsilonEpsgreedy(epsgreedy, eps)
    ccall((:SCIPsetEpsilonEpsgreedy, libscip), Cvoid, (Ptr{SCIP_BANDIT}, Cdouble), epsgreedy, eps)
end

function SCIPcreateBanditExp3(scip, exp3, priorities, gammaparam, beta, nactions, initseed)
    ccall((:SCIPcreateBanditExp3, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_BANDIT}}, Ptr{Cdouble}, Cdouble, Cdouble, Cint, Cuint), scip, exp3, priorities, gammaparam, beta, nactions, initseed)
end

function SCIPsetGammaExp3(exp3, gammaparam)
    ccall((:SCIPsetGammaExp3, libscip), Cvoid, (Ptr{SCIP_BANDIT}, Cdouble), exp3, gammaparam)
end

function SCIPsetBetaExp3(exp3, beta)
    ccall((:SCIPsetBetaExp3, libscip), Cvoid, (Ptr{SCIP_BANDIT}, Cdouble), exp3, beta)
end

function SCIPgetProbabilityExp3(exp3, action)
    ccall((:SCIPgetProbabilityExp3, libscip), Cdouble, (Ptr{SCIP_BANDIT}, Cint), exp3, action)
end

function SCIPcreateBanditUcb(scip, ucb, priorities, alpha, nactions, initseed)
    ccall((:SCIPcreateBanditUcb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_BANDIT}}, Ptr{Cdouble}, Cdouble, Cint, Cuint), scip, ucb, priorities, alpha, nactions, initseed)
end

function SCIPgetConfidenceBoundUcb(ucb, action)
    ccall((:SCIPgetConfidenceBoundUcb, libscip), Cdouble, (Ptr{SCIP_BANDIT}, Cint), ucb, action)
end

function SCIPgetStartPermutationUcb(ucb)
    ccall((:SCIPgetStartPermutationUcb, libscip), Ptr{Cint}, (Ptr{SCIP_BANDIT},), ucb)
end

function SCIPbanditSelect(bandit, action)
    ccall((:SCIPbanditSelect, libscip), SCIP_RETCODE, (Ptr{SCIP_BANDIT}, Ptr{Cint}), bandit, action)
end

function SCIPbanditUpdate(bandit, action, score)
    ccall((:SCIPbanditUpdate, libscip), SCIP_RETCODE, (Ptr{SCIP_BANDIT}, Cint, Cdouble), bandit, action, score)
end

function SCIPbanditvtableGetName(banditvtable)
    ccall((:SCIPbanditvtableGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_BANDITVTABLE},), banditvtable)
end

function SCIPbanditGetRandnumgen(bandit)
    ccall((:SCIPbanditGetRandnumgen, libscip), Ptr{SCIP_RANDNUMGEN}, (Ptr{SCIP_BANDIT},), bandit)
end

function SCIPbanditGetNActions(bandit)
    ccall((:SCIPbanditGetNActions, libscip), Cint, (Ptr{SCIP_BANDIT},), bandit)
end

function SCIPbendersComp(elem1, elem2)
    ccall((:SCIPbendersComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPbendersCompName(elem1, elem2)
    ccall((:SCIPbendersCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPbendersGetData(benders)
    ccall((:SCIPbendersGetData, libscip), Ptr{SCIP_BENDERSDATA}, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersSetData(benders, bendersdata)
    ccall((:SCIPbendersSetData, libscip), Cvoid, (Ptr{SCIP_BENDERS}, Ptr{SCIP_BENDERSDATA}), benders, bendersdata)
end

function SCIPbendersGetName(benders)
    ccall((:SCIPbendersGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetDesc(benders)
    ccall((:SCIPbendersGetDesc, libscip), Ptr{Cchar}, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetPriority(benders)
    ccall((:SCIPbendersGetPriority, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetNSubproblems(benders)
    ccall((:SCIPbendersGetNSubproblems, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersSubproblem(benders, probnumber)
    ccall((:SCIPbendersSubproblem, libscip), Ptr{SCIP}, (Ptr{SCIP_BENDERS}, Cint), benders, probnumber)
end

function SCIPbendersGetNCalls(benders)
    ccall((:SCIPbendersGetNCalls, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetNCutsFound(benders)
    ccall((:SCIPbendersGetNCutsFound, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetNStrengthenCutsFound(benders)
    ccall((:SCIPbendersGetNStrengthenCutsFound, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetNStrengthenCalls(benders)
    ccall((:SCIPbendersGetNStrengthenCalls, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetNStrengthenFails(benders)
    ccall((:SCIPbendersGetNStrengthenFails, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetSetupTime(benders)
    ccall((:SCIPbendersGetSetupTime, libscip), Cdouble, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetTime(benders)
    ccall((:SCIPbendersGetTime, libscip), Cdouble, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersIsInitialized(benders)
    ccall((:SCIPbendersIsInitialized, libscip), Cuint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersIsActive(benders)
    ccall((:SCIPbendersIsActive, libscip), Cuint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersOnlyCheckConvexRelax(benders, subscipsoff)
    ccall((:SCIPbendersOnlyCheckConvexRelax, libscip), Cuint, (Ptr{SCIP_BENDERS}, Cuint), benders, subscipsoff)
end

function SCIPbendersCutLP(benders)
    ccall((:SCIPbendersCutLP, libscip), Cuint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersCutPseudo(benders)
    ccall((:SCIPbendersCutPseudo, libscip), Cuint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersCutRelaxation(benders)
    ccall((:SCIPbendersCutRelaxation, libscip), Cuint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersShareAuxVars(benders)
    ccall((:SCIPbendersShareAuxVars, libscip), Cuint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersSetSubproblemIsSetup(benders, probnumber, issetup)
    ccall((:SCIPbendersSetSubproblemIsSetup, libscip), Cvoid, (Ptr{SCIP_BENDERS}, Cint, Cuint), benders, probnumber, issetup)
end

function SCIPbendersSubproblemIsSetup(benders, probnumber)
    ccall((:SCIPbendersSubproblemIsSetup, libscip), Cuint, (Ptr{SCIP_BENDERS}, Cint), benders, probnumber)
end

function SCIPbendersGetAuxiliaryVar(benders, probnumber)
    ccall((:SCIPbendersGetAuxiliaryVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_BENDERS}, Cint), benders, probnumber)
end

function SCIPbendersGetAuxiliaryVars(benders)
    ccall((:SCIPbendersGetAuxiliaryVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersSetSubproblemObjval(benders, probnumber, objval)
    ccall((:SCIPbendersSetSubproblemObjval, libscip), Cvoid, (Ptr{SCIP_BENDERS}, Cint, Cdouble), benders, probnumber, objval)
end

function SCIPbendersGetSubproblemObjval(benders, probnumber)
    ccall((:SCIPbendersGetSubproblemObjval, libscip), Cdouble, (Ptr{SCIP_BENDERS}, Cint), benders, probnumber)
end

function SCIPbendersGetNStoredCuts(benders)
    ccall((:SCIPbendersGetNStoredCuts, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetStoredCutData(benders, cutidx, vars, vals, lhs, rhs, nvars)
    ccall((:SCIPbendersGetStoredCutData, libscip), SCIP_RETCODE, (Ptr{SCIP_BENDERS}, Cint, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{Cdouble}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), benders, cutidx, vars, vals, lhs, rhs, nvars)
end

function SCIPbendersGetStoredCutOrigData(benders, cutidx, vars, vals, lhs, rhs, nvars, varssize)
    ccall((:SCIPbendersGetStoredCutOrigData, libscip), SCIP_RETCODE, (Ptr{SCIP_BENDERS}, Cint, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{Cdouble}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint), benders, cutidx, vars, vals, lhs, rhs, nvars, varssize)
end

function SCIPfindBenderscut(benders, name)
    ccall((:SCIPfindBenderscut, libscip), Ptr{SCIP_BENDERSCUT}, (Ptr{SCIP_BENDERS}, Ptr{Cchar}), benders, name)
end

function SCIPbendersGetBenderscuts(benders)
    ccall((:SCIPbendersGetBenderscuts, libscip), Ptr{Ptr{SCIP_BENDERSCUT}}, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersGetNBenderscuts(benders)
    ccall((:SCIPbendersGetNBenderscuts, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersSetBenderscutPriority(benders, benderscut, priority)
    ccall((:SCIPbendersSetBenderscutPriority, libscip), SCIP_RETCODE, (Ptr{SCIP_BENDERS}, Ptr{SCIP_BENDERSCUT}, Cint), benders, benderscut, priority)
end

function SCIPbendersSolSlackVarsActive(benders, activeslack)
    ccall((:SCIPbendersSolSlackVarsActive, libscip), SCIP_RETCODE, (Ptr{SCIP_BENDERS}, Ptr{Cuint}), benders, activeslack)
end

function SCIPbendersSetSubproblemType(benders, probnumber, subprobtype)
    ccall((:SCIPbendersSetSubproblemType, libscip), Cvoid, (Ptr{SCIP_BENDERS}, Cint, SCIP_BENDERSSUBTYPE), benders, probnumber, subprobtype)
end

function SCIPbendersGetSubproblemType(benders, probnumber)
    ccall((:SCIPbendersGetSubproblemType, libscip), SCIP_BENDERSSUBTYPE, (Ptr{SCIP_BENDERS}, Cint), benders, probnumber)
end

function SCIPbendersSetSubproblemIsConvex(benders, probnumber, isconvex)
    ccall((:SCIPbendersSetSubproblemIsConvex, libscip), Cvoid, (Ptr{SCIP_BENDERS}, Cint, Cuint), benders, probnumber, isconvex)
end

function SCIPbendersSubproblemIsConvex(benders, probnumber)
    ccall((:SCIPbendersSubproblemIsConvex, libscip), Cuint, (Ptr{SCIP_BENDERS}, Cint), benders, probnumber)
end

function SCIPbendersGetNConvexSubproblems(benders)
    ccall((:SCIPbendersGetNConvexSubproblems, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersSetSubproblemIsNonlinear(benders, probnumber, isnonlinear)
    ccall((:SCIPbendersSetSubproblemIsNonlinear, libscip), Cvoid, (Ptr{SCIP_BENDERS}, Cint, Cuint), benders, probnumber, isnonlinear)
end

function SCIPbendersSubproblemIsNonlinear(benders, probnumber)
    ccall((:SCIPbendersSubproblemIsNonlinear, libscip), Cuint, (Ptr{SCIP_BENDERS}, Cint), benders, probnumber)
end

function SCIPbendersGetNNonlinearSubproblems(benders)
    ccall((:SCIPbendersGetNNonlinearSubproblems, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersSetMasterIsNonlinear(benders, isnonlinear)
    ccall((:SCIPbendersSetMasterIsNonlinear, libscip), Cvoid, (Ptr{SCIP_BENDERS}, Cuint), benders, isnonlinear)
end

function SCIPbendersMasterIsNonlinear(benders)
    ccall((:SCIPbendersMasterIsNonlinear, libscip), Cuint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersInStrengthenRound(benders)
    ccall((:SCIPbendersInStrengthenRound, libscip), Cuint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersSolveSubproblemLP(scip, benders, probnumber, solvestatus, objective)
    ccall((:SCIPbendersSolveSubproblemLP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Cint, Ptr{SCIP_STATUS}, Ptr{Cdouble}), scip, benders, probnumber, solvestatus, objective)
end

function SCIPbendersSolveSubproblemCIP(scip, benders, probnumber, solvestatus, solvecip)
    ccall((:SCIPbendersSolveSubproblemCIP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Cint, Ptr{SCIP_STATUS}, Cuint), scip, benders, probnumber, solvestatus, solvecip)
end

function SCIPbendersGetNTransferredCuts(benders)
    ccall((:SCIPbendersGetNTransferredCuts, libscip), Cint, (Ptr{SCIP_BENDERS},), benders)
end

function SCIPbendersUpdateSubproblemLowerbound(benders, probnumber, lowerbound)
    ccall((:SCIPbendersUpdateSubproblemLowerbound, libscip), Cvoid, (Ptr{SCIP_BENDERS}, Cint, Cdouble), benders, probnumber, lowerbound)
end

function SCIPbendersGetSubproblemLowerbound(benders, probnumber)
    ccall((:SCIPbendersGetSubproblemLowerbound, libscip), Cdouble, (Ptr{SCIP_BENDERS}, Cint), benders, probnumber)
end

function SCIPbendersSetSubproblemIsIndependent(benders, probnumber, isindep)
    ccall((:SCIPbendersSetSubproblemIsIndependent, libscip), Cvoid, (Ptr{SCIP_BENDERS}, Cint, Cuint), benders, probnumber, isindep)
end

function SCIPbendersSubproblemIsIndependent(benders, probnumber)
    ccall((:SCIPbendersSubproblemIsIndependent, libscip), Cuint, (Ptr{SCIP_BENDERS}, Cint), benders, probnumber)
end

function SCIPbendersSubproblemIsEnabled(benders, probnumber)
    ccall((:SCIPbendersSubproblemIsEnabled, libscip), Cuint, (Ptr{SCIP_BENDERS}, Cint), benders, probnumber)
end

function SCIPbenderscutComp(elem1, elem2)
    ccall((:SCIPbenderscutComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPbenderscutCompName(elem1, elem2)
    ccall((:SCIPbenderscutCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPbenderscutGetData(benderscut)
    ccall((:SCIPbenderscutGetData, libscip), Ptr{SCIP_BENDERSCUTDATA}, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutSetData(benderscut, benderscutdata)
    ccall((:SCIPbenderscutSetData, libscip), Cvoid, (Ptr{SCIP_BENDERSCUT}, Ptr{SCIP_BENDERSCUTDATA}), benderscut, benderscutdata)
end

function SCIPbenderscutGetName(benderscut)
    ccall((:SCIPbenderscutGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutGetDesc(benderscut)
    ccall((:SCIPbenderscutGetDesc, libscip), Ptr{Cchar}, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutGetPriority(benderscut)
    ccall((:SCIPbenderscutGetPriority, libscip), Cint, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutGetNCalls(benderscut)
    ccall((:SCIPbenderscutGetNCalls, libscip), Clonglong, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutGetNFound(benderscut)
    ccall((:SCIPbenderscutGetNFound, libscip), Clonglong, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutIsInitialized(benderscut)
    ccall((:SCIPbenderscutIsInitialized, libscip), Cuint, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutGetSetupTime(benderscut)
    ccall((:SCIPbenderscutGetSetupTime, libscip), Cdouble, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutGetTime(benderscut)
    ccall((:SCIPbenderscutGetTime, libscip), Cdouble, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutIsLPCut(benderscut)
    ccall((:SCIPbenderscutIsLPCut, libscip), Cuint, (Ptr{SCIP_BENDERSCUT},), benderscut)
end

function SCIPbenderscutSetEnabled(benderscut, enabled)
    ccall((:SCIPbenderscutSetEnabled, libscip), Cvoid, (Ptr{SCIP_BENDERSCUT}, Cuint), benderscut, enabled)
end

function SCIPbranchruleComp(elem1, elem2)
    ccall((:SCIPbranchruleComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPbranchruleCompName(elem1, elem2)
    ccall((:SCIPbranchruleCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPbranchruleGetData(branchrule)
    ccall((:SCIPbranchruleGetData, libscip), Ptr{SCIP_BRANCHRULEDATA}, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleSetData(branchrule, branchruledata)
    ccall((:SCIPbranchruleSetData, libscip), Cvoid, (Ptr{SCIP_BRANCHRULE}, Ptr{SCIP_BRANCHRULEDATA}), branchrule, branchruledata)
end

function SCIPbranchruleGetName(branchrule)
    ccall((:SCIPbranchruleGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetDesc(branchrule)
    ccall((:SCIPbranchruleGetDesc, libscip), Ptr{Cchar}, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetPriority(branchrule)
    ccall((:SCIPbranchruleGetPriority, libscip), Cint, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetMaxdepth(branchrule)
    ccall((:SCIPbranchruleGetMaxdepth, libscip), Cint, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetMaxbounddist(branchrule)
    ccall((:SCIPbranchruleGetMaxbounddist, libscip), Cdouble, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetSetupTime(branchrule)
    ccall((:SCIPbranchruleGetSetupTime, libscip), Cdouble, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetTime(branchrule)
    ccall((:SCIPbranchruleGetTime, libscip), Cdouble, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetNLPCalls(branchrule)
    ccall((:SCIPbranchruleGetNLPCalls, libscip), Clonglong, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetNExternCalls(branchrule)
    ccall((:SCIPbranchruleGetNExternCalls, libscip), Clonglong, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetNPseudoCalls(branchrule)
    ccall((:SCIPbranchruleGetNPseudoCalls, libscip), Clonglong, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetNCutoffs(branchrule)
    ccall((:SCIPbranchruleGetNCutoffs, libscip), Clonglong, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetNCutsFound(branchrule)
    ccall((:SCIPbranchruleGetNCutsFound, libscip), Clonglong, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetNConssFound(branchrule)
    ccall((:SCIPbranchruleGetNConssFound, libscip), Clonglong, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetNDomredsFound(branchrule)
    ccall((:SCIPbranchruleGetNDomredsFound, libscip), Clonglong, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleGetNChildren(branchrule)
    ccall((:SCIPbranchruleGetNChildren, libscip), Clonglong, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPbranchruleIsInitialized(branchrule)
    ccall((:SCIPbranchruleIsInitialized, libscip), Cuint, (Ptr{SCIP_BRANCHRULE},), branchrule)
end

function SCIPconflicthdlrComp(elem1, elem2)
    ccall((:SCIPconflicthdlrComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPconflicthdlrCompName(elem1, elem2)
    ccall((:SCIPconflicthdlrCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPconflicthdlrGetData(conflicthdlr)
    ccall((:SCIPconflicthdlrGetData, libscip), Ptr{SCIP_CONFLICTHDLRDATA}, (Ptr{SCIP_CONFLICTHDLR},), conflicthdlr)
end

function SCIPconflicthdlrSetData(conflicthdlr, conflicthdlrdata)
    ccall((:SCIPconflicthdlrSetData, libscip), Cvoid, (Ptr{SCIP_CONFLICTHDLR}, Ptr{SCIP_CONFLICTHDLRDATA}), conflicthdlr, conflicthdlrdata)
end

function SCIPconflicthdlrGetName(conflicthdlr)
    ccall((:SCIPconflicthdlrGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_CONFLICTHDLR},), conflicthdlr)
end

function SCIPconflicthdlrGetDesc(conflicthdlr)
    ccall((:SCIPconflicthdlrGetDesc, libscip), Ptr{Cchar}, (Ptr{SCIP_CONFLICTHDLR},), conflicthdlr)
end

function SCIPconflicthdlrGetPriority(conflicthdlr)
    ccall((:SCIPconflicthdlrGetPriority, libscip), Cint, (Ptr{SCIP_CONFLICTHDLR},), conflicthdlr)
end

function SCIPconflicthdlrIsInitialized(conflicthdlr)
    ccall((:SCIPconflicthdlrIsInitialized, libscip), Cuint, (Ptr{SCIP_CONFLICTHDLR},), conflicthdlr)
end

function SCIPconflicthdlrGetSetupTime(conflicthdlr)
    ccall((:SCIPconflicthdlrGetSetupTime, libscip), Cdouble, (Ptr{SCIP_CONFLICTHDLR},), conflicthdlr)
end

function SCIPconflicthdlrGetTime(conflicthdlr)
    ccall((:SCIPconflicthdlrGetTime, libscip), Cdouble, (Ptr{SCIP_CONFLICTHDLR},), conflicthdlr)
end

function SCIPconshdlrCompSepa(elem1, elem2)
    ccall((:SCIPconshdlrCompSepa, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPconshdlrCompEnfo(elem1, elem2)
    ccall((:SCIPconshdlrCompEnfo, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPconshdlrCompCheck(elem1, elem2)
    ccall((:SCIPconshdlrCompCheck, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPconshdlrGetName(conshdlr)
    ccall((:SCIPconshdlrGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetDesc(conshdlr)
    ccall((:SCIPconshdlrGetDesc, libscip), Ptr{Cchar}, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetData(conshdlr)
    ccall((:SCIPconshdlrGetData, libscip), Ptr{SCIP_CONSHDLRDATA}, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrSetData(conshdlr, conshdlrdata)
    ccall((:SCIPconshdlrSetData, libscip), Cvoid, (Ptr{SCIP_CONSHDLR}, Ptr{SCIP_CONSHDLRDATA}), conshdlr, conshdlrdata)
end

function SCIPconshdlrSetSepa(conshdlr, conssepalp, conssepasol, sepafreq, sepapriority, delaysepa)
    ccall((:SCIPconshdlrSetSepa, libscip), Cvoid, (Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Cuint), conshdlr, conssepalp, conssepasol, sepafreq, sepapriority, delaysepa)
end

function SCIPconshdlrSetProp(conshdlr, consprop, propfreq, delayprop, timingmask)
    ccall((:SCIPconshdlrSetProp, libscip), Cvoid, (Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}, Cint, Cuint, SCIP_PROPTIMING), conshdlr, consprop, propfreq, delayprop, timingmask)
end

function SCIPconshdlrSetEnforelax(conshdlr, consenforelax)
    ccall((:SCIPconshdlrSetEnforelax, libscip), Cvoid, (Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), conshdlr, consenforelax)
end

function SCIPconshdlrGetConss(conshdlr)
    ccall((:SCIPconshdlrGetConss, libscip), Ptr{Ptr{SCIP_CONS}}, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetEnfoConss(conshdlr)
    ccall((:SCIPconshdlrGetEnfoConss, libscip), Ptr{Ptr{SCIP_CONS}}, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetCheckConss(conshdlr)
    ccall((:SCIPconshdlrGetCheckConss, libscip), Ptr{Ptr{SCIP_CONS}}, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetUpdateConss(conshdlr)
    ccall((:SCIPconshdlrGetUpdateConss, libscip), Ptr{Ptr{SCIP_CONS}}, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNConss(conshdlr)
    ccall((:SCIPconshdlrGetNConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNEnfoConss(conshdlr)
    ccall((:SCIPconshdlrGetNEnfoConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNCheckConss(conshdlr)
    ccall((:SCIPconshdlrGetNCheckConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNActiveConss(conshdlr)
    ccall((:SCIPconshdlrGetNActiveConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNEnabledConss(conshdlr)
    ccall((:SCIPconshdlrGetNEnabledConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNUpdateConss(conshdlr)
    ccall((:SCIPconshdlrGetNUpdateConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetSetupTime(conshdlr)
    ccall((:SCIPconshdlrGetSetupTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetPresolTime(conshdlr)
    ccall((:SCIPconshdlrGetPresolTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetSepaTime(conshdlr)
    ccall((:SCIPconshdlrGetSepaTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetEnfoLPTime(conshdlr)
    ccall((:SCIPconshdlrGetEnfoLPTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetEnfoPSTime(conshdlr)
    ccall((:SCIPconshdlrGetEnfoPSTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetEnfoRelaxTime(conshdlr)
    ccall((:SCIPconshdlrGetEnfoRelaxTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetPropTime(conshdlr)
    ccall((:SCIPconshdlrGetPropTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetStrongBranchPropTime(conshdlr)
    ccall((:SCIPconshdlrGetStrongBranchPropTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetCheckTime(conshdlr)
    ccall((:SCIPconshdlrGetCheckTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetRespropTime(conshdlr)
    ccall((:SCIPconshdlrGetRespropTime, libscip), Cdouble, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNSepaCalls(conshdlr)
    ccall((:SCIPconshdlrGetNSepaCalls, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNEnfoLPCalls(conshdlr)
    ccall((:SCIPconshdlrGetNEnfoLPCalls, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNEnfoPSCalls(conshdlr)
    ccall((:SCIPconshdlrGetNEnfoPSCalls, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNEnfoRelaxCalls(conshdlr)
    ccall((:SCIPconshdlrGetNEnfoRelaxCalls, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNPropCalls(conshdlr)
    ccall((:SCIPconshdlrGetNPropCalls, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNCheckCalls(conshdlr)
    ccall((:SCIPconshdlrGetNCheckCalls, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNRespropCalls(conshdlr)
    ccall((:SCIPconshdlrGetNRespropCalls, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNCutoffs(conshdlr)
    ccall((:SCIPconshdlrGetNCutoffs, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNCutsFound(conshdlr)
    ccall((:SCIPconshdlrGetNCutsFound, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNCutsApplied(conshdlr)
    ccall((:SCIPconshdlrGetNCutsApplied, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNConssFound(conshdlr)
    ccall((:SCIPconshdlrGetNConssFound, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNDomredsFound(conshdlr)
    ccall((:SCIPconshdlrGetNDomredsFound, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNChildren(conshdlr)
    ccall((:SCIPconshdlrGetNChildren, libscip), Clonglong, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetMaxNActiveConss(conshdlr)
    ccall((:SCIPconshdlrGetMaxNActiveConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetStartNActiveConss(conshdlr)
    ccall((:SCIPconshdlrGetStartNActiveConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNFixedVars(conshdlr)
    ccall((:SCIPconshdlrGetNFixedVars, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNAggrVars(conshdlr)
    ccall((:SCIPconshdlrGetNAggrVars, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNChgVarTypes(conshdlr)
    ccall((:SCIPconshdlrGetNChgVarTypes, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNChgBds(conshdlr)
    ccall((:SCIPconshdlrGetNChgBds, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNAddHoles(conshdlr)
    ccall((:SCIPconshdlrGetNAddHoles, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNDelConss(conshdlr)
    ccall((:SCIPconshdlrGetNDelConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNAddConss(conshdlr)
    ccall((:SCIPconshdlrGetNAddConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNUpgdConss(conshdlr)
    ccall((:SCIPconshdlrGetNUpgdConss, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNChgCoefs(conshdlr)
    ccall((:SCIPconshdlrGetNChgCoefs, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNChgSides(conshdlr)
    ccall((:SCIPconshdlrGetNChgSides, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetNPresolCalls(conshdlr)
    ccall((:SCIPconshdlrGetNPresolCalls, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetSepaPriority(conshdlr)
    ccall((:SCIPconshdlrGetSepaPriority, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetEnfoPriority(conshdlr)
    ccall((:SCIPconshdlrGetEnfoPriority, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetCheckPriority(conshdlr)
    ccall((:SCIPconshdlrGetCheckPriority, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetSepaFreq(conshdlr)
    ccall((:SCIPconshdlrGetSepaFreq, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetPropFreq(conshdlr)
    ccall((:SCIPconshdlrGetPropFreq, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetEagerFreq(conshdlr)
    ccall((:SCIPconshdlrGetEagerFreq, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrNeedsCons(conshdlr)
    ccall((:SCIPconshdlrNeedsCons, libscip), Cuint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrDoesPresolve(conshdlr)
    ccall((:SCIPconshdlrDoesPresolve, libscip), Cuint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrIsSeparationDelayed(conshdlr)
    ccall((:SCIPconshdlrIsSeparationDelayed, libscip), Cuint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrIsPropagationDelayed(conshdlr)
    ccall((:SCIPconshdlrIsPropagationDelayed, libscip), Cuint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrWasLPSeparationDelayed(conshdlr)
    ccall((:SCIPconshdlrWasLPSeparationDelayed, libscip), Cuint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrWasSolSeparationDelayed(conshdlr)
    ccall((:SCIPconshdlrWasSolSeparationDelayed, libscip), Cuint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrWasPropagationDelayed(conshdlr)
    ccall((:SCIPconshdlrWasPropagationDelayed, libscip), Cuint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrIsInitialized(conshdlr)
    ccall((:SCIPconshdlrIsInitialized, libscip), Cuint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrIsClonable(conshdlr)
    ccall((:SCIPconshdlrIsClonable, libscip), Cuint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrGetPropTiming(conshdlr)
    ccall((:SCIPconshdlrGetPropTiming, libscip), SCIP_PROPTIMING, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconssetchgGetAddedConsData(conssetchg, conss, nconss)
    ccall((:SCIPconssetchgGetAddedConsData, libscip), Cvoid, (Ptr{SCIP_CONSSETCHG}, Ptr{Ptr{Ptr{SCIP_CONS}}}, Ptr{Cint}), conssetchg, conss, nconss)
end

function SCIPconshdlrSetPropTiming(conshdlr, proptiming)
    ccall((:SCIPconshdlrSetPropTiming, libscip), Cvoid, (Ptr{SCIP_CONSHDLR}, SCIP_PROPTIMING), conshdlr, proptiming)
end

function SCIPconshdlrGetPresolTiming(conshdlr)
    ccall((:SCIPconshdlrGetPresolTiming, libscip), SCIP_PRESOLTIMING, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPconshdlrSetPresolTiming(conshdlr, presoltiming)
    ccall((:SCIPconshdlrSetPresolTiming, libscip), Cvoid, (Ptr{SCIP_CONSHDLR}, SCIP_PRESOLTIMING), conshdlr, presoltiming)
end

function SCIPconsGetName(cons)
    ccall((:SCIPconsGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsGetPos(cons)
    ccall((:SCIPconsGetPos, libscip), Cint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsGetHdlr(cons)
    ccall((:SCIPconsGetHdlr, libscip), Ptr{SCIP_CONSHDLR}, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsGetData(cons)
    ccall((:SCIPconsGetData, libscip), Ptr{SCIP_CONSDATA}, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsGetNUses(cons)
    ccall((:SCIPconsGetNUses, libscip), Cint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsGetActiveDepth(cons)
    ccall((:SCIPconsGetActiveDepth, libscip), Cint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsGetValidDepth(cons)
    ccall((:SCIPconsGetValidDepth, libscip), Cint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsActive(cons)
    ccall((:SCIPconsIsActive, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsUpdatedeactivate(cons)
    ccall((:SCIPconsIsUpdatedeactivate, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsEnabled(cons)
    ccall((:SCIPconsIsEnabled, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsSeparationEnabled(cons)
    ccall((:SCIPconsIsSeparationEnabled, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsPropagationEnabled(cons)
    ccall((:SCIPconsIsPropagationEnabled, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsDeleted(cons)
    ccall((:SCIPconsIsDeleted, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsObsolete(cons)
    ccall((:SCIPconsIsObsolete, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsConflict(cons)
    ccall((:SCIPconsIsConflict, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsGetAge(cons)
    ccall((:SCIPconsGetAge, libscip), Cdouble, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsInitial(cons)
    ccall((:SCIPconsIsInitial, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsSeparated(cons)
    ccall((:SCIPconsIsSeparated, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsEnforced(cons)
    ccall((:SCIPconsIsEnforced, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsChecked(cons)
    ccall((:SCIPconsIsChecked, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsMarkedPropagate(cons)
    ccall((:SCIPconsIsMarkedPropagate, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsPropagated(cons)
    ccall((:SCIPconsIsPropagated, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsGlobal(cons)
    ccall((:SCIPconsIsGlobal, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsLocal(cons)
    ccall((:SCIPconsIsLocal, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsModifiable(cons)
    ccall((:SCIPconsIsModifiable, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsDynamic(cons)
    ccall((:SCIPconsIsDynamic, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsRemovable(cons)
    ccall((:SCIPconsIsRemovable, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsStickingAtNode(cons)
    ccall((:SCIPconsIsStickingAtNode, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsInProb(cons)
    ccall((:SCIPconsIsInProb, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsOriginal(cons)
    ccall((:SCIPconsIsOriginal, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsTransformed(cons)
    ccall((:SCIPconsIsTransformed, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsLockedPos(cons)
    ccall((:SCIPconsIsLockedPos, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsLockedNeg(cons)
    ccall((:SCIPconsIsLockedNeg, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsLocked(cons)
    ccall((:SCIPconsIsLocked, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsGetNLocksPos(cons)
    ccall((:SCIPconsGetNLocksPos, libscip), Cint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsGetNLocksNeg(cons)
    ccall((:SCIPconsGetNLocksNeg, libscip), Cint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsIsLockedTypePos(cons, locktype)
    ccall((:SCIPconsIsLockedTypePos, libscip), Cuint, (Ptr{SCIP_CONS}, SCIP_LOCKTYPE), cons, locktype)
end

function SCIPconsIsLockedTypeNeg(cons, locktype)
    ccall((:SCIPconsIsLockedTypeNeg, libscip), Cuint, (Ptr{SCIP_CONS}, SCIP_LOCKTYPE), cons, locktype)
end

function SCIPconsIsLockedType(cons, locktype)
    ccall((:SCIPconsIsLockedType, libscip), Cuint, (Ptr{SCIP_CONS}, SCIP_LOCKTYPE), cons, locktype)
end

function SCIPconsGetNLocksTypePos(cons, locktype)
    ccall((:SCIPconsGetNLocksTypePos, libscip), Cint, (Ptr{SCIP_CONS}, SCIP_LOCKTYPE), cons, locktype)
end

function SCIPconsGetNLocksTypeNeg(cons, locktype)
    ccall((:SCIPconsGetNLocksTypeNeg, libscip), Cint, (Ptr{SCIP_CONS}, SCIP_LOCKTYPE), cons, locktype)
end

function SCIPconsIsAdded(cons)
    ccall((:SCIPconsIsAdded, libscip), Cuint, (Ptr{SCIP_CONS},), cons)
end

function SCIPconsAddUpgradeLocks(cons, nlocks)
    ccall((:SCIPconsAddUpgradeLocks, libscip), Cvoid, (Ptr{SCIP_CONS}, Cint), cons, nlocks)
end

function SCIPconsGetNUpgradeLocks(cons)
    ccall((:SCIPconsGetNUpgradeLocks, libscip), Cint, (Ptr{SCIP_CONS},), cons)
end

function SCIPlinConsStatsCreate(scip, linconsstats)
    ccall((:SCIPlinConsStatsCreate, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_LINCONSSTATS}}), scip, linconsstats)
end

function SCIPlinConsStatsFree(scip, linconsstats)
    ccall((:SCIPlinConsStatsFree, libscip), Cvoid, (Ptr{SCIP}, Ptr{Ptr{SCIP_LINCONSSTATS}}), scip, linconsstats)
end

function SCIPlinConsStatsReset(linconsstats)
    ccall((:SCIPlinConsStatsReset, libscip), Cvoid, (Ptr{SCIP_LINCONSSTATS},), linconsstats)
end

function SCIPlinConsStatsGetTypeCount(linconsstats, linconstype)
    ccall((:SCIPlinConsStatsGetTypeCount, libscip), Cint, (Ptr{SCIP_LINCONSSTATS}, SCIP_LINCONSTYPE), linconsstats, linconstype)
end

function SCIPlinConsStatsGetSum(linconsstats)
    ccall((:SCIPlinConsStatsGetSum, libscip), Cint, (Ptr{SCIP_LINCONSSTATS},), linconsstats)
end

function SCIPlinConsStatsIncTypeCount(linconsstats, linconstype, increment)
    ccall((:SCIPlinConsStatsIncTypeCount, libscip), Cvoid, (Ptr{SCIP_LINCONSSTATS}, SCIP_LINCONSTYPE, Cint), linconsstats, linconstype, increment)
end

function SCIPprintLinConsStats(scip, file, linconsstats)
    ccall((:SCIPprintLinConsStats, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}, Ptr{SCIP_LINCONSSTATS}), scip, file, linconsstats)
end

const SCIP_Cutpool = Cvoid

const SCIP_CUTPOOL = SCIP_Cutpool

const SCIP_Cut = Cvoid

const SCIP_CUT = SCIP_Cut

function SCIPcutGetRow(cut)
    ccall((:SCIPcutGetRow, libscip), Ptr{SCIP_ROW}, (Ptr{SCIP_CUT},), cut)
end

function SCIPcutGetAge(cut)
    ccall((:SCIPcutGetAge, libscip), Cint, (Ptr{SCIP_CUT},), cut)
end

function SCIPcutGetLPActivityQuot(cut)
    ccall((:SCIPcutGetLPActivityQuot, libscip), Cdouble, (Ptr{SCIP_CUT},), cut)
end

function SCIPcutpoolGetCuts(cutpool)
    ccall((:SCIPcutpoolGetCuts, libscip), Ptr{Ptr{SCIP_CUT}}, (Ptr{SCIP_CUTPOOL},), cutpool)
end

function SCIPcutpoolGetNCuts(cutpool)
    ccall((:SCIPcutpoolGetNCuts, libscip), Cint, (Ptr{SCIP_CUTPOOL},), cutpool)
end

function SCIPcutpoolGetMaxNCuts(cutpool)
    ccall((:SCIPcutpoolGetMaxNCuts, libscip), Cint, (Ptr{SCIP_CUTPOOL},), cutpool)
end

function SCIPcutpoolGetTime(cutpool)
    ccall((:SCIPcutpoolGetTime, libscip), Cdouble, (Ptr{SCIP_CUTPOOL},), cutpool)
end

function SCIPcutpoolGetNCalls(cutpool)
    ccall((:SCIPcutpoolGetNCalls, libscip), Clonglong, (Ptr{SCIP_CUTPOOL},), cutpool)
end

function SCIPcutpoolGetNCutsFound(cutpool)
    ccall((:SCIPcutpoolGetNCutsFound, libscip), Clonglong, (Ptr{SCIP_CUTPOOL},), cutpool)
end

const SCIP_Decomp = Cvoid

const SCIP_DECOMP = SCIP_Decomp

const SCIP_DecompStore = Cvoid

const SCIP_DECOMPSTORE = SCIP_DecompStore

const BMS_BlkMem = Cvoid

const BMS_BLKMEM = BMS_BlkMem

function SCIPdecompCreate(decomp, blkmem, nblocks, original, benderslabels)
    ccall((:SCIPdecompCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_DECOMP}}, Ptr{BMS_BLKMEM}, Cint, Cuint, Cuint), decomp, blkmem, nblocks, original, benderslabels)
end

function SCIPdecompFree(decomp, blkmem)
    ccall((:SCIPdecompFree, libscip), Cvoid, (Ptr{Ptr{SCIP_DECOMP}}, Ptr{BMS_BLKMEM}), decomp, blkmem)
end

function SCIPdecompIsOriginal(decomp)
    ccall((:SCIPdecompIsOriginal, libscip), Cuint, (Ptr{SCIP_DECOMP},), decomp)
end

function SCIPdecompSetUseBendersLabels(decomp, benderslabels)
    ccall((:SCIPdecompSetUseBendersLabels, libscip), Cvoid, (Ptr{SCIP_DECOMP}, Cuint), decomp, benderslabels)
end

function SCIPdecompUseBendersLabels(decomp)
    ccall((:SCIPdecompUseBendersLabels, libscip), Cuint, (Ptr{SCIP_DECOMP},), decomp)
end

function SCIPdecompGetNBlocks(decomp)
    ccall((:SCIPdecompGetNBlocks, libscip), Cint, (Ptr{SCIP_DECOMP},), decomp)
end

function SCIPdecompGetAreaScore(decomp)
    ccall((:SCIPdecompGetAreaScore, libscip), Cdouble, (Ptr{SCIP_DECOMP},), decomp)
end

function SCIPdecompGetModularity(decomp)
    ccall((:SCIPdecompGetModularity, libscip), Cdouble, (Ptr{SCIP_DECOMP},), decomp)
end

function SCIPdecompGetNBlockGraphEdges(decomp)
    ccall((:SCIPdecompGetNBlockGraphEdges, libscip), Cint, (Ptr{SCIP_DECOMP},), decomp)
end

function SCIPdecompGetNBlockGraphComponents(decomp)
    ccall((:SCIPdecompGetNBlockGraphComponents, libscip), Cint, (Ptr{SCIP_DECOMP},), decomp)
end

function SCIPdecompGetNBlockGraphArticulations(decomp)
    ccall((:SCIPdecompGetNBlockGraphArticulations, libscip), Cint, (Ptr{SCIP_DECOMP},), decomp)
end

function SCIPdecompGetBlockGraphMaxDegree(decomp)
    ccall((:SCIPdecompGetBlockGraphMaxDegree, libscip), Cint, (Ptr{SCIP_DECOMP},), decomp)
end

function SCIPdecompGetBlockGraphMinDegree(decomp)
    ccall((:SCIPdecompGetBlockGraphMinDegree, libscip), Cint, (Ptr{SCIP_DECOMP},), decomp)
end

function SCIPdecompSetVarsLabels(decomp, vars, labels, nvars)
    ccall((:SCIPdecompSetVarsLabels, libscip), SCIP_RETCODE, (Ptr{SCIP_DECOMP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Cint), decomp, vars, labels, nvars)
end

function SCIPdecompGetVarsLabels(decomp, vars, labels, nvars)
    ccall((:SCIPdecompGetVarsLabels, libscip), Cvoid, (Ptr{SCIP_DECOMP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Cint), decomp, vars, labels, nvars)
end

function SCIPdecompSetConsLabels(decomp, conss, labels, nconss)
    ccall((:SCIPdecompSetConsLabels, libscip), SCIP_RETCODE, (Ptr{SCIP_DECOMP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cint}, Cint), decomp, conss, labels, nconss)
end

function SCIPdecompGetConsLabels(decomp, conss, labels, nconss)
    ccall((:SCIPdecompGetConsLabels, libscip), Cvoid, (Ptr{SCIP_DECOMP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cint}, Cint), decomp, conss, labels, nconss)
end

function SCIPdecompClear(decomp, clearvarlabels, clearconslabels)
    ccall((:SCIPdecompClear, libscip), SCIP_RETCODE, (Ptr{SCIP_DECOMP}, Cuint, Cuint), decomp, clearvarlabels, clearconslabels)
end

function SCIPdecompPrintStats(decomp, strbuf)
    ccall((:SCIPdecompPrintStats, libscip), Ptr{Cchar}, (Ptr{SCIP_DECOMP}, Ptr{Cchar}), decomp, strbuf)
end

function SCIPdialoghdlrGetRoot(dialoghdlr)
    ccall((:SCIPdialoghdlrGetRoot, libscip), Ptr{SCIP_DIALOG}, (Ptr{SCIP_DIALOGHDLR},), dialoghdlr)
end

function SCIPdialoghdlrClearBuffer(dialoghdlr)
    ccall((:SCIPdialoghdlrClearBuffer, libscip), Cvoid, (Ptr{SCIP_DIALOGHDLR},), dialoghdlr)
end

function SCIPdialoghdlrIsBufferEmpty(dialoghdlr)
    ccall((:SCIPdialoghdlrIsBufferEmpty, libscip), Cuint, (Ptr{SCIP_DIALOGHDLR},), dialoghdlr)
end

function SCIPdialoghdlrGetLine(dialoghdlr, dialog, prompt, inputline, endoffile)
    ccall((:SCIPdialoghdlrGetLine, libscip), SCIP_RETCODE, (Ptr{SCIP_DIALOGHDLR}, Ptr{SCIP_DIALOG}, Ptr{Cchar}, Ptr{Ptr{Cchar}}, Ptr{Cuint}), dialoghdlr, dialog, prompt, inputline, endoffile)
end

function SCIPdialoghdlrGetWord(dialoghdlr, dialog, prompt, inputword, endoffile)
    ccall((:SCIPdialoghdlrGetWord, libscip), SCIP_RETCODE, (Ptr{SCIP_DIALOGHDLR}, Ptr{SCIP_DIALOG}, Ptr{Cchar}, Ptr{Ptr{Cchar}}, Ptr{Cuint}), dialoghdlr, dialog, prompt, inputword, endoffile)
end

function SCIPdialoghdlrAddInputLine(dialoghdlr, inputline)
    ccall((:SCIPdialoghdlrAddInputLine, libscip), SCIP_RETCODE, (Ptr{SCIP_DIALOGHDLR}, Ptr{Cchar}), dialoghdlr, inputline)
end

function SCIPdialoghdlrAddHistory(dialoghdlr, dialog, command, escapecommand)
    ccall((:SCIPdialoghdlrAddHistory, libscip), SCIP_RETCODE, (Ptr{SCIP_DIALOGHDLR}, Ptr{SCIP_DIALOG}, Ptr{Cchar}, Cuint), dialoghdlr, dialog, command, escapecommand)
end

function SCIPdialogHasEntry(dialog, entryname)
    ccall((:SCIPdialogHasEntry, libscip), Cuint, (Ptr{SCIP_DIALOG}, Ptr{Cchar}), dialog, entryname)
end

function SCIPdialogFindEntry(dialog, entryname, subdialog)
    ccall((:SCIPdialogFindEntry, libscip), Cint, (Ptr{SCIP_DIALOG}, Ptr{Cchar}, Ptr{Ptr{SCIP_DIALOG}}), dialog, entryname, subdialog)
end

function SCIPdialogDisplayMenu(dialog, scip)
    ccall((:SCIPdialogDisplayMenu, libscip), SCIP_RETCODE, (Ptr{SCIP_DIALOG}, Ptr{SCIP}), dialog, scip)
end

function SCIPdialogDisplayMenuEntry(dialog, scip)
    ccall((:SCIPdialogDisplayMenuEntry, libscip), SCIP_RETCODE, (Ptr{SCIP_DIALOG}, Ptr{SCIP}), dialog, scip)
end

function SCIPdialogDisplayCompletions(dialog, scip, entryname)
    ccall((:SCIPdialogDisplayCompletions, libscip), SCIP_RETCODE, (Ptr{SCIP_DIALOG}, Ptr{SCIP}, Ptr{Cchar}), dialog, scip, entryname)
end

function SCIPdialogGetPath(dialog, sepchar, path)
    ccall((:SCIPdialogGetPath, libscip), Cvoid, (Ptr{SCIP_DIALOG}, Cchar, Ptr{Cchar}), dialog, sepchar, path)
end

function SCIPdialogGetName(dialog)
    ccall((:SCIPdialogGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_DIALOG},), dialog)
end

function SCIPdialogGetDesc(dialog)
    ccall((:SCIPdialogGetDesc, libscip), Ptr{Cchar}, (Ptr{SCIP_DIALOG},), dialog)
end

function SCIPdialogIsSubmenu(dialog)
    ccall((:SCIPdialogIsSubmenu, libscip), Cuint, (Ptr{SCIP_DIALOG},), dialog)
end

function SCIPdialogGetParent(dialog)
    ccall((:SCIPdialogGetParent, libscip), Ptr{SCIP_DIALOG}, (Ptr{SCIP_DIALOG},), dialog)
end

function SCIPdialogGetSubdialogs(dialog)
    ccall((:SCIPdialogGetSubdialogs, libscip), Ptr{Ptr{SCIP_DIALOG}}, (Ptr{SCIP_DIALOG},), dialog)
end

function SCIPdialogGetNSubdialogs(dialog)
    ccall((:SCIPdialogGetNSubdialogs, libscip), Cint, (Ptr{SCIP_DIALOG},), dialog)
end

function SCIPdialogGetData(dialog)
    ccall((:SCIPdialogGetData, libscip), Ptr{SCIP_DIALOGDATA}, (Ptr{SCIP_DIALOG},), dialog)
end

function SCIPdialogSetData(dialog, dialogdata)
    ccall((:SCIPdialogSetData, libscip), Cvoid, (Ptr{SCIP_DIALOG}, Ptr{SCIP_DIALOGDATA}), dialog, dialogdata)
end

function SCIPdialogWriteHistory(filename)
    ccall((:SCIPdialogWriteHistory, libscip), SCIP_RETCODE, (Ptr{Cchar},), filename)
end

function SCIPdispGetData(disp)
    ccall((:SCIPdispGetData, libscip), Ptr{SCIP_DISPDATA}, (Ptr{SCIP_DISP},), disp)
end

function SCIPdispSetData(disp, dispdata)
    ccall((:SCIPdispSetData, libscip), Cvoid, (Ptr{SCIP_DISP}, Ptr{SCIP_DISPDATA}), disp, dispdata)
end

function SCIPdispGetName(disp)
    ccall((:SCIPdispGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_DISP},), disp)
end

function SCIPdispGetDesc(disp)
    ccall((:SCIPdispGetDesc, libscip), Ptr{Cchar}, (Ptr{SCIP_DISP},), disp)
end

function SCIPdispGetHeader(disp)
    ccall((:SCIPdispGetHeader, libscip), Ptr{Cchar}, (Ptr{SCIP_DISP},), disp)
end

function SCIPdispGetWidth(disp)
    ccall((:SCIPdispGetWidth, libscip), Cint, (Ptr{SCIP_DISP},), disp)
end

function SCIPdispGetPriority(disp)
    ccall((:SCIPdispGetPriority, libscip), Cint, (Ptr{SCIP_DISP},), disp)
end

function SCIPdispGetPosition(disp)
    ccall((:SCIPdispGetPosition, libscip), Cint, (Ptr{SCIP_DISP},), disp)
end

function SCIPdispGetStatus(disp)
    ccall((:SCIPdispGetStatus, libscip), SCIP_DISPSTATUS, (Ptr{SCIP_DISP},), disp)
end

function SCIPdispIsInitialized(disp)
    ccall((:SCIPdispIsInitialized, libscip), Cuint, (Ptr{SCIP_DISP},), disp)
end

function SCIPdispLongint(messagehdlr, file, val, width)
    ccall((:SCIPdispLongint, libscip), Cvoid, (Ptr{SCIP_MESSAGEHDLR}, Ptr{Libc.FILE}, Clonglong, Cint), messagehdlr, file, val, width)
end

function SCIPdispInt(messagehdlr, file, val, width)
    ccall((:SCIPdispInt, libscip), Cvoid, (Ptr{SCIP_MESSAGEHDLR}, Ptr{Libc.FILE}, Cint, Cint), messagehdlr, file, val, width)
end

function SCIPdispTime(messagehdlr, file, val, width)
    ccall((:SCIPdispTime, libscip), Cvoid, (Ptr{SCIP_MESSAGEHDLR}, Ptr{Libc.FILE}, Cdouble, Cint), messagehdlr, file, val, width)
end

function SCIPeventhdlrGetName(eventhdlr)
    ccall((:SCIPeventhdlrGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_EVENTHDLR},), eventhdlr)
end

function SCIPeventhdlrGetData(eventhdlr)
    ccall((:SCIPeventhdlrGetData, libscip), Ptr{SCIP_EVENTHDLRDATA}, (Ptr{SCIP_EVENTHDLR},), eventhdlr)
end

function SCIPeventhdlrSetData(eventhdlr, eventhdlrdata)
    ccall((:SCIPeventhdlrSetData, libscip), Cvoid, (Ptr{SCIP_EVENTHDLR}, Ptr{SCIP_EVENTHDLRDATA}), eventhdlr, eventhdlrdata)
end

function SCIPeventhdlrIsInitialized(eventhdlr)
    ccall((:SCIPeventhdlrIsInitialized, libscip), Cuint, (Ptr{SCIP_EVENTHDLR},), eventhdlr)
end

function SCIPeventhdlrGetSetupTime(eventhdlr)
    ccall((:SCIPeventhdlrGetSetupTime, libscip), Cdouble, (Ptr{SCIP_EVENTHDLR},), eventhdlr)
end

function SCIPeventhdlrGetTime(eventhdlr)
    ccall((:SCIPeventhdlrGetTime, libscip), Cdouble, (Ptr{SCIP_EVENTHDLR},), eventhdlr)
end

function SCIPeventGetType(event)
    ccall((:SCIPeventGetType, libscip), SCIP_EVENTTYPE, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetVar(event)
    ccall((:SCIPeventGetVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetOldobj(event)
    ccall((:SCIPeventGetOldobj, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetNewobj(event)
    ccall((:SCIPeventGetNewobj, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetOldbound(event)
    ccall((:SCIPeventGetOldbound, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetNewbound(event)
    ccall((:SCIPeventGetNewbound, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetOldtype(event)
    ccall((:SCIPeventGetOldtype, libscip), SCIP_VARTYPE, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetNewtype(event)
    ccall((:SCIPeventGetNewtype, libscip), SCIP_VARTYPE, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetNode(event)
    ccall((:SCIPeventGetNode, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetSol(event)
    ccall((:SCIPeventGetSol, libscip), Ptr{SCIP_SOL}, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetHoleLeft(event)
    ccall((:SCIPeventGetHoleLeft, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetHoleRight(event)
    ccall((:SCIPeventGetHoleRight, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetRow(event)
    ccall((:SCIPeventGetRow, libscip), Ptr{SCIP_ROW}, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetRowCol(event)
    ccall((:SCIPeventGetRowCol, libscip), Ptr{SCIP_COL}, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetRowOldCoefVal(event)
    ccall((:SCIPeventGetRowOldCoefVal, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetRowNewCoefVal(event)
    ccall((:SCIPeventGetRowNewCoefVal, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetRowOldConstVal(event)
    ccall((:SCIPeventGetRowOldConstVal, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetRowNewConstVal(event)
    ccall((:SCIPeventGetRowNewConstVal, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetRowSide(event)
    ccall((:SCIPeventGetRowSide, libscip), SCIP_SIDETYPE, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetRowOldSideVal(event)
    ccall((:SCIPeventGetRowOldSideVal, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

function SCIPeventGetRowNewSideVal(event)
    ccall((:SCIPeventGetRowNewSideVal, libscip), Cdouble, (Ptr{SCIP_EVENT},), event)
end

const SCIP_File = Cvoid

const SCIP_FILE = SCIP_File

function SCIPfopen(path, mode)
    ccall((:SCIPfopen, libscip), Ptr{SCIP_FILE}, (Ptr{Cchar}, Ptr{Cchar}), path, mode)
end

function SCIPfdopen(fildes, mode)
    ccall((:SCIPfdopen, libscip), Ptr{SCIP_FILE}, (Cint, Ptr{Cchar}), fildes, mode)
end

function SCIPfread(ptr, size, nmemb, stream)
    ccall((:SCIPfread, libscip), Csize_t, (Ptr{Cvoid}, Csize_t, Csize_t, Ptr{SCIP_FILE}), ptr, size, nmemb, stream)
end

function SCIPfwrite(ptr, size, nmemb, stream)
    ccall((:SCIPfwrite, libscip), Csize_t, (Ptr{Cvoid}, Csize_t, Csize_t, Ptr{SCIP_FILE}), ptr, size, nmemb, stream)
end

function SCIPfputc(c, stream)
    ccall((:SCIPfputc, libscip), Cint, (Cint, Ptr{SCIP_FILE}), c, stream)
end

function SCIPfputs(s, stream)
    ccall((:SCIPfputs, libscip), Cint, (Ptr{Cchar}, Ptr{SCIP_FILE}), s, stream)
end

function SCIPfgetc(stream)
    ccall((:SCIPfgetc, libscip), Cint, (Ptr{SCIP_FILE},), stream)
end

function SCIPfgets(s, size, stream)
    ccall((:SCIPfgets, libscip), Ptr{Cchar}, (Ptr{Cchar}, Cint, Ptr{SCIP_FILE}), s, size, stream)
end

function SCIPfflush(stream)
    ccall((:SCIPfflush, libscip), Cint, (Ptr{SCIP_FILE},), stream)
end

function SCIPfseek(stream, offset, whence)
    ccall((:SCIPfseek, libscip), Cint, (Ptr{SCIP_FILE}, Clong, Cint), stream, offset, whence)
end

function SCIPrewind(stream)
    ccall((:SCIPrewind, libscip), Cvoid, (Ptr{SCIP_FILE},), stream)
end

function SCIPftell(stream)
    ccall((:SCIPftell, libscip), Clong, (Ptr{SCIP_FILE},), stream)
end

function SCIPfeof(stream)
    ccall((:SCIPfeof, libscip), Cint, (Ptr{SCIP_FILE},), stream)
end

function SCIPfclose(fp)
    ccall((:SCIPfclose, libscip), Cint, (Ptr{SCIP_FILE},), fp)
end

function SCIPheurComp(elem1, elem2)
    ccall((:SCIPheurComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPheurCompName(elem1, elem2)
    ccall((:SCIPheurCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPheurGetData(heur)
    ccall((:SCIPheurGetData, libscip), Ptr{SCIP_HEURDATA}, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurSetData(heur, heurdata)
    ccall((:SCIPheurSetData, libscip), Cvoid, (Ptr{SCIP_HEUR}, Ptr{SCIP_HEURDATA}), heur, heurdata)
end

function SCIPheurGetName(heur)
    ccall((:SCIPheurGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetDesc(heur)
    ccall((:SCIPheurGetDesc, libscip), Ptr{Cchar}, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetDispchar(heur)
    ccall((:SCIPheurGetDispchar, libscip), Cchar, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetTimingmask(heur)
    ccall((:SCIPheurGetTimingmask, libscip), SCIP_HEURTIMING, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurSetTimingmask(heur, timingmask)
    ccall((:SCIPheurSetTimingmask, libscip), Cvoid, (Ptr{SCIP_HEUR}, SCIP_HEURTIMING), heur, timingmask)
end

function SCIPheurUsesSubscip(heur)
    ccall((:SCIPheurUsesSubscip, libscip), Cuint, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetPriority(heur)
    ccall((:SCIPheurGetPriority, libscip), Cint, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetFreq(heur)
    ccall((:SCIPheurGetFreq, libscip), Cint, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurSetFreq(heur, freq)
    ccall((:SCIPheurSetFreq, libscip), Cvoid, (Ptr{SCIP_HEUR}, Cint), heur, freq)
end

function SCIPheurGetFreqofs(heur)
    ccall((:SCIPheurGetFreqofs, libscip), Cint, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetMaxdepth(heur)
    ccall((:SCIPheurGetMaxdepth, libscip), Cint, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetNCalls(heur)
    ccall((:SCIPheurGetNCalls, libscip), Clonglong, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetNSolsFound(heur)
    ccall((:SCIPheurGetNSolsFound, libscip), Clonglong, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetNBestSolsFound(heur)
    ccall((:SCIPheurGetNBestSolsFound, libscip), Clonglong, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurIsInitialized(heur)
    ccall((:SCIPheurIsInitialized, libscip), Cuint, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetSetupTime(heur)
    ccall((:SCIPheurGetSetupTime, libscip), Cdouble, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetTime(heur)
    ccall((:SCIPheurGetTime, libscip), Cdouble, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetDivesets(heur)
    ccall((:SCIPheurGetDivesets, libscip), Ptr{Ptr{SCIP_DIVESET}}, (Ptr{SCIP_HEUR},), heur)
end

function SCIPheurGetNDivesets(heur)
    ccall((:SCIPheurGetNDivesets, libscip), Cint, (Ptr{SCIP_HEUR},), heur)
end

function SCIPdivesetGetHeur(diveset)
    ccall((:SCIPdivesetGetHeur, libscip), Ptr{SCIP_HEUR}, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetWorkSolution(diveset)
    ccall((:SCIPdivesetGetWorkSolution, libscip), Ptr{SCIP_SOL}, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetSetWorkSolution(diveset, sol)
    ccall((:SCIPdivesetSetWorkSolution, libscip), Cvoid, (Ptr{SCIP_DIVESET}, Ptr{SCIP_SOL}), diveset, sol)
end

function SCIPdivesetGetName(diveset)
    ccall((:SCIPdivesetGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetMinRelDepth(diveset)
    ccall((:SCIPdivesetGetMinRelDepth, libscip), Cdouble, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetMaxRelDepth(diveset)
    ccall((:SCIPdivesetGetMaxRelDepth, libscip), Cdouble, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetSolSuccess(diveset, divecontext)
    ccall((:SCIPdivesetGetSolSuccess, libscip), Clonglong, (Ptr{SCIP_DIVESET}, SCIP_DIVECONTEXT), diveset, divecontext)
end

function SCIPdivesetGetNCalls(diveset, divecontext)
    ccall((:SCIPdivesetGetNCalls, libscip), Cint, (Ptr{SCIP_DIVESET}, SCIP_DIVECONTEXT), diveset, divecontext)
end

function SCIPdivesetGetNSolutionCalls(diveset, divecontext)
    ccall((:SCIPdivesetGetNSolutionCalls, libscip), Cint, (Ptr{SCIP_DIVESET}, SCIP_DIVECONTEXT), diveset, divecontext)
end

function SCIPdivesetGetMinDepth(diveset, divecontext)
    ccall((:SCIPdivesetGetMinDepth, libscip), Cint, (Ptr{SCIP_DIVESET}, SCIP_DIVECONTEXT), diveset, divecontext)
end

function SCIPdivesetGetMaxDepth(diveset, divecontext)
    ccall((:SCIPdivesetGetMaxDepth, libscip), Cint, (Ptr{SCIP_DIVESET}, SCIP_DIVECONTEXT), diveset, divecontext)
end

function SCIPdivesetGetAvgDepth(diveset, divecontext)
    ccall((:SCIPdivesetGetAvgDepth, libscip), Cdouble, (Ptr{SCIP_DIVESET}, SCIP_DIVECONTEXT), diveset, divecontext)
end

function SCIPdivesetGetMinSolutionDepth(diveset, divecontext)
    ccall((:SCIPdivesetGetMinSolutionDepth, libscip), Cint, (Ptr{SCIP_DIVESET}, SCIP_DIVECONTEXT), diveset, divecontext)
end

function SCIPdivesetGetMaxSolutionDepth(diveset, divecontext)
    ccall((:SCIPdivesetGetMaxSolutionDepth, libscip), Cint, (Ptr{SCIP_DIVESET}, SCIP_DIVECONTEXT), diveset, divecontext)
end

function SCIPdivesetGetAvgSolutionDepth(diveset, divecontext)
    ccall((:SCIPdivesetGetAvgSolutionDepth, libscip), Cdouble, (Ptr{SCIP_DIVESET}, SCIP_DIVECONTEXT), diveset, divecontext)
end

function SCIPdivesetGetNLPIterations(diveset, divecontext)
    ccall((:SCIPdivesetGetNLPIterations, libscip), Clonglong, (Ptr{SCIP_DIVESET}, SCIP_DIVECONTEXT), diveset, divecontext)
end

function SCIPdivesetGetNProbingNodes(diveset, divecontext)
    ccall((:SCIPdivesetGetNProbingNodes, libscip), Clonglong, (Ptr{SCIP_DIVESET}, SCIP_DIVECONTEXT), diveset, divecontext)
end

function SCIPdivesetGetNBacktracks(diveset, divecontext)
    ccall((:SCIPdivesetGetNBacktracks, libscip), Clonglong, (Ptr{SCIP_DIVESET}, SCIP_DIVECONTEXT), diveset, divecontext)
end

function SCIPdivesetGetNConflicts(diveset, divecontext)
    ccall((:SCIPdivesetGetNConflicts, libscip), Clonglong, (Ptr{SCIP_DIVESET}, SCIP_DIVECONTEXT), diveset, divecontext)
end

function SCIPdivesetGetNSols(diveset, divecontext)
    ccall((:SCIPdivesetGetNSols, libscip), Clonglong, (Ptr{SCIP_DIVESET}, SCIP_DIVECONTEXT), diveset, divecontext)
end

function SCIPdivesetGetMaxLPIterQuot(diveset)
    ccall((:SCIPdivesetGetMaxLPIterQuot, libscip), Cdouble, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetMaxLPIterOffset(diveset)
    ccall((:SCIPdivesetGetMaxLPIterOffset, libscip), Cint, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetUbQuotNoSol(diveset)
    ccall((:SCIPdivesetGetUbQuotNoSol, libscip), Cdouble, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetAvgQuotNoSol(diveset)
    ccall((:SCIPdivesetGetAvgQuotNoSol, libscip), Cdouble, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetUbQuot(diveset)
    ccall((:SCIPdivesetGetUbQuot, libscip), Cdouble, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetAvgQuot(diveset)
    ccall((:SCIPdivesetGetAvgQuot, libscip), Cdouble, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetUseBacktrack(diveset)
    ccall((:SCIPdivesetUseBacktrack, libscip), Cuint, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetLPSolveFreq(diveset)
    ccall((:SCIPdivesetGetLPSolveFreq, libscip), Cint, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetGetLPResolveDomChgQuot(diveset)
    ccall((:SCIPdivesetGetLPResolveDomChgQuot, libscip), Cdouble, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetUseOnlyLPBranchcands(diveset)
    ccall((:SCIPdivesetUseOnlyLPBranchcands, libscip), Cuint, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetSupportsType(diveset, divetype)
    ccall((:SCIPdivesetSupportsType, libscip), Cuint, (Ptr{SCIP_DIVESET}, SCIP_DIVETYPE), diveset, divetype)
end

function SCIPdivesetGetRandnumgen(diveset)
    ccall((:SCIPdivesetGetRandnumgen, libscip), Ptr{SCIP_RANDNUMGEN}, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPdivesetIsPublic(diveset)
    ccall((:SCIPdivesetIsPublic, libscip), Cuint, (Ptr{SCIP_DIVESET},), diveset)
end

function SCIPvariablegraphBreadthFirst(scip, vargraph, startvars, nstartvars, distances, maxdistance, maxvars, maxbinintvars)
    ccall((:SCIPvariablegraphBreadthFirst, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VGRAPH}, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Cint}, Cint, Cint, Cint), scip, vargraph, startvars, nstartvars, distances, maxdistance, maxvars, maxbinintvars)
end

function SCIPvariableGraphCreate(scip, vargraph, relaxdenseconss, relaxdensity, nrelaxedconstraints)
    ccall((:SCIPvariableGraphCreate, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VGRAPH}}, Cuint, Cdouble, Ptr{Cint}), scip, vargraph, relaxdenseconss, relaxdensity, nrelaxedconstraints)
end

function SCIPvariableGraphFree(scip, vargraph)
    ccall((:SCIPvariableGraphFree, libscip), Cvoid, (Ptr{SCIP}, Ptr{Ptr{SCIP_VGRAPH}}), scip, vargraph)
end

function SCIPcomprComp(elem1, elem2)
    ccall((:SCIPcomprComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPcomprCompName(elem1, elem2)
    ccall((:SCIPcomprCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPcomprGetData(compr)
    ccall((:SCIPcomprGetData, libscip), Ptr{SCIP_COMPRDATA}, (Ptr{SCIP_COMPR},), compr)
end

function SCIPcomprSetData(compr, comprdata)
    ccall((:SCIPcomprSetData, libscip), Cvoid, (Ptr{SCIP_COMPR}, Ptr{SCIP_COMPRDATA}), compr, comprdata)
end

function SCIPcomprGetName(heur)
    ccall((:SCIPcomprGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_COMPR},), heur)
end

function SCIPcomprGetDesc(compr)
    ccall((:SCIPcomprGetDesc, libscip), Ptr{Cchar}, (Ptr{SCIP_COMPR},), compr)
end

function SCIPcomprGetPriority(compr)
    ccall((:SCIPcomprGetPriority, libscip), Cint, (Ptr{SCIP_COMPR},), compr)
end

function SCIPcomprGetMinNodes(compr)
    ccall((:SCIPcomprGetMinNodes, libscip), Cint, (Ptr{SCIP_COMPR},), compr)
end

function SCIPcomprGetNCalls(compr)
    ccall((:SCIPcomprGetNCalls, libscip), Clonglong, (Ptr{SCIP_COMPR},), compr)
end

function SCIPcomprGetNFound(compr)
    ccall((:SCIPcomprGetNFound, libscip), Clonglong, (Ptr{SCIP_COMPR},), compr)
end

function SCIPcomprIsInitialized(compr)
    ccall((:SCIPcomprIsInitialized, libscip), Cuint, (Ptr{SCIP_COMPR},), compr)
end

function SCIPcomprGetSetupTime(compr)
    ccall((:SCIPcomprGetSetupTime, libscip), Cdouble, (Ptr{SCIP_COMPR},), compr)
end

function SCIPcomprGetTime(compr)
    ccall((:SCIPcomprGetTime, libscip), Cdouble, (Ptr{SCIP_COMPR},), compr)
end

function SCIPhistoryGetVSIDS(history, dir)
    ccall((:SCIPhistoryGetVSIDS, libscip), Cdouble, (Ptr{SCIP_HISTORY}, SCIP_BRANCHDIR), history, dir)
end

function SCIPhistoryGetCutoffSum(history, dir)
    ccall((:SCIPhistoryGetCutoffSum, libscip), Cdouble, (Ptr{SCIP_HISTORY}, SCIP_BRANCHDIR), history, dir)
end

function SCIPvaluehistoryGetNValues(valuehistory)
    ccall((:SCIPvaluehistoryGetNValues, libscip), Cint, (Ptr{SCIP_VALUEHISTORY},), valuehistory)
end

function SCIPvaluehistoryGetHistories(valuehistory)
    ccall((:SCIPvaluehistoryGetHistories, libscip), Ptr{Ptr{SCIP_HISTORY}}, (Ptr{SCIP_VALUEHISTORY},), valuehistory)
end

function SCIPvaluehistoryGetValues(valuehistory)
    ccall((:SCIPvaluehistoryGetValues, libscip), Ptr{Cdouble}, (Ptr{SCIP_VALUEHISTORY},), valuehistory)
end

const SCIP_VBounds = Cvoid

const SCIP_VBOUNDS = SCIP_VBounds

const SCIP_Implics = Cvoid

const SCIP_IMPLICS = SCIP_Implics

const SCIP_Clique = Cvoid

const SCIP_CLIQUE = SCIP_Clique

const SCIP_CliqueTable = Cvoid

const SCIP_CLIQUETABLE = SCIP_CliqueTable

const SCIP_CliqueList = Cvoid

const SCIP_CLIQUELIST = SCIP_CliqueList

function SCIPcliqueSearchVar(clique, var, value)
    ccall((:SCIPcliqueSearchVar, libscip), Cint, (Ptr{SCIP_CLIQUE}, Ptr{SCIP_VAR}, Cuint), clique, var, value)
end

function SCIPcliqueHasVar(clique, var, value)
    ccall((:SCIPcliqueHasVar, libscip), Cuint, (Ptr{SCIP_CLIQUE}, Ptr{SCIP_VAR}, Cuint), clique, var, value)
end

function SCIPcliqueGetNVars(clique)
    ccall((:SCIPcliqueGetNVars, libscip), Cint, (Ptr{SCIP_CLIQUE},), clique)
end

function SCIPcliqueGetVars(clique)
    ccall((:SCIPcliqueGetVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_CLIQUE},), clique)
end

function SCIPcliqueGetValues(clique)
    ccall((:SCIPcliqueGetValues, libscip), Ptr{Cuint}, (Ptr{SCIP_CLIQUE},), clique)
end

function SCIPcliqueGetId(clique)
    ccall((:SCIPcliqueGetId, libscip), Cuint, (Ptr{SCIP_CLIQUE},), clique)
end

function SCIPcliqueGetIndex(clique)
    ccall((:SCIPcliqueGetIndex, libscip), Cint, (Ptr{SCIP_CLIQUE},), clique)
end

function SCIPcliqueIsCleanedUp(clique)
    ccall((:SCIPcliqueIsCleanedUp, libscip), Cuint, (Ptr{SCIP_CLIQUE},), clique)
end

function SCIPcliqueIsEquation(clique)
    ccall((:SCIPcliqueIsEquation, libscip), Cuint, (Ptr{SCIP_CLIQUE},), clique)
end

function SCIPcolSort(col)
    ccall((:SCIPcolSort, libscip), Cvoid, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetObj(col)
    ccall((:SCIPcolGetObj, libscip), Cdouble, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetLb(col)
    ccall((:SCIPcolGetLb, libscip), Cdouble, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetUb(col)
    ccall((:SCIPcolGetUb, libscip), Cdouble, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetBestBound(col)
    ccall((:SCIPcolGetBestBound, libscip), Cdouble, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetPrimsol(col)
    ccall((:SCIPcolGetPrimsol, libscip), Cdouble, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetMinPrimsol(col)
    ccall((:SCIPcolGetMinPrimsol, libscip), Cdouble, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetMaxPrimsol(col)
    ccall((:SCIPcolGetMaxPrimsol, libscip), Cdouble, (Ptr{SCIP_COL},), col)
end

@enum SCIP_BaseStat::UInt32 begin
    SCIP_BASESTAT_LOWER = 0
    SCIP_BASESTAT_BASIC = 1
    SCIP_BASESTAT_UPPER = 2
    SCIP_BASESTAT_ZERO = 3
end

const SCIP_BASESTAT = SCIP_BaseStat

function SCIPcolGetBasisStatus(col)
    ccall((:SCIPcolGetBasisStatus, libscip), SCIP_BASESTAT, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetVar(col)
    ccall((:SCIPcolGetVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetIndex(col)
    ccall((:SCIPcolGetIndex, libscip), Cint, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetVarProbindex(col)
    ccall((:SCIPcolGetVarProbindex, libscip), Cint, (Ptr{SCIP_COL},), col)
end

function SCIPcolIsIntegral(col)
    ccall((:SCIPcolIsIntegral, libscip), Cuint, (Ptr{SCIP_COL},), col)
end

function SCIPcolIsRemovable(col)
    ccall((:SCIPcolIsRemovable, libscip), Cuint, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetLPPos(col)
    ccall((:SCIPcolGetLPPos, libscip), Cint, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetLPDepth(col)
    ccall((:SCIPcolGetLPDepth, libscip), Cint, (Ptr{SCIP_COL},), col)
end

function SCIPcolIsInLP(col)
    ccall((:SCIPcolIsInLP, libscip), Cuint, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetNNonz(col)
    ccall((:SCIPcolGetNNonz, libscip), Cint, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetNLPNonz(col)
    ccall((:SCIPcolGetNLPNonz, libscip), Cint, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetRows(col)
    ccall((:SCIPcolGetRows, libscip), Ptr{Ptr{SCIP_ROW}}, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetVals(col)
    ccall((:SCIPcolGetVals, libscip), Ptr{Cdouble}, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetStrongbranchNode(col)
    ccall((:SCIPcolGetStrongbranchNode, libscip), Clonglong, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetNStrongbranchs(col)
    ccall((:SCIPcolGetNStrongbranchs, libscip), Cint, (Ptr{SCIP_COL},), col)
end

function SCIPcolGetAge(col)
    ccall((:SCIPcolGetAge, libscip), Cint, (Ptr{SCIP_COL},), col)
end

function SCIPboundtypeOpposite(boundtype)
    ccall((:SCIPboundtypeOpposite, libscip), SCIP_BOUNDTYPE, (SCIP_BOUNDTYPE,), boundtype)
end

function SCIProwComp(elem1, elem2)
    ccall((:SCIProwComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIProwLock(row)
    ccall((:SCIProwLock, libscip), Cvoid, (Ptr{SCIP_ROW},), row)
end

function SCIProwUnlock(row)
    ccall((:SCIProwUnlock, libscip), Cvoid, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetScalarProduct(row1, row2)
    ccall((:SCIProwGetScalarProduct, libscip), Cdouble, (Ptr{SCIP_ROW}, Ptr{SCIP_ROW}), row1, row2)
end

function SCIProwGetParallelism(row1, row2, orthofunc)
    ccall((:SCIProwGetParallelism, libscip), Cdouble, (Ptr{SCIP_ROW}, Ptr{SCIP_ROW}, Cchar), row1, row2, orthofunc)
end

function SCIProwGetOrthogonality(row1, row2, orthofunc)
    ccall((:SCIProwGetOrthogonality, libscip), Cdouble, (Ptr{SCIP_ROW}, Ptr{SCIP_ROW}, Cchar), row1, row2, orthofunc)
end

function SCIProwSort(row)
    ccall((:SCIProwSort, libscip), Cvoid, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetNNonz(row)
    ccall((:SCIProwGetNNonz, libscip), Cint, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetNLPNonz(row)
    ccall((:SCIProwGetNLPNonz, libscip), Cint, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetCols(row)
    ccall((:SCIProwGetCols, libscip), Ptr{Ptr{SCIP_COL}}, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetVals(row)
    ccall((:SCIProwGetVals, libscip), Ptr{Cdouble}, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetConstant(row)
    ccall((:SCIProwGetConstant, libscip), Cdouble, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetNorm(row)
    ccall((:SCIProwGetNorm, libscip), Cdouble, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetSumNorm(row)
    ccall((:SCIProwGetSumNorm, libscip), Cdouble, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetLhs(row)
    ccall((:SCIProwGetLhs, libscip), Cdouble, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetRhs(row)
    ccall((:SCIProwGetRhs, libscip), Cdouble, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetDualsol(row)
    ccall((:SCIProwGetDualsol, libscip), Cdouble, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetDualfarkas(row)
    ccall((:SCIProwGetDualfarkas, libscip), Cdouble, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetBasisStatus(row)
    ccall((:SCIProwGetBasisStatus, libscip), SCIP_BASESTAT, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetName(row)
    ccall((:SCIProwGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetIndex(row)
    ccall((:SCIProwGetIndex, libscip), Cint, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetAge(row)
    ccall((:SCIProwGetAge, libscip), Cint, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetRank(row)
    ccall((:SCIProwGetRank, libscip), Cint, (Ptr{SCIP_ROW},), row)
end

function SCIProwIsIntegral(row)
    ccall((:SCIProwIsIntegral, libscip), Cuint, (Ptr{SCIP_ROW},), row)
end

function SCIProwIsLocal(row)
    ccall((:SCIProwIsLocal, libscip), Cuint, (Ptr{SCIP_ROW},), row)
end

function SCIProwIsModifiable(row)
    ccall((:SCIProwIsModifiable, libscip), Cuint, (Ptr{SCIP_ROW},), row)
end

function SCIProwIsRemovable(row)
    ccall((:SCIProwIsRemovable, libscip), Cuint, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetOrigintype(row)
    ccall((:SCIProwGetOrigintype, libscip), SCIP_ROWORIGINTYPE, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetOriginConshdlr(row)
    ccall((:SCIProwGetOriginConshdlr, libscip), Ptr{SCIP_CONSHDLR}, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetOriginCons(row)
    ccall((:SCIProwGetOriginCons, libscip), Ptr{SCIP_CONS}, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetOriginSepa(row)
    ccall((:SCIProwGetOriginSepa, libscip), Ptr{SCIP_SEPA}, (Ptr{SCIP_ROW},), row)
end

function SCIProwIsInGlobalCutpool(row)
    ccall((:SCIProwIsInGlobalCutpool, libscip), Cuint, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetLPPos(row)
    ccall((:SCIProwGetLPPos, libscip), Cint, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetLPDepth(row)
    ccall((:SCIProwGetLPDepth, libscip), Cint, (Ptr{SCIP_ROW},), row)
end

function SCIProwIsInLP(row)
    ccall((:SCIProwIsInLP, libscip), Cuint, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetActiveLPCount(row)
    ccall((:SCIProwGetActiveLPCount, libscip), Clonglong, (Ptr{SCIP_ROW},), row)
end

function SCIProwGetNLPsAfterCreation(row)
    ccall((:SCIProwGetNLPsAfterCreation, libscip), Clonglong, (Ptr{SCIP_ROW},), row)
end

function SCIProwChgRank(row, rank)
    ccall((:SCIProwChgRank, libscip), Cvoid, (Ptr{SCIP_ROW}, Cint), row, rank)
end

@enum SCIP_Stage::UInt32 begin
    SCIP_STAGE_INIT = 0
    SCIP_STAGE_PROBLEM = 1
    SCIP_STAGE_TRANSFORMING = 2
    SCIP_STAGE_TRANSFORMED = 3
    SCIP_STAGE_INITPRESOLVE = 4
    SCIP_STAGE_PRESOLVING = 5
    SCIP_STAGE_EXITPRESOLVE = 6
    SCIP_STAGE_PRESOLVED = 7
    SCIP_STAGE_INITSOLVE = 8
    SCIP_STAGE_SOLVING = 9
    SCIP_STAGE_SOLVED = 10
    SCIP_STAGE_EXITSOLVE = 11
    SCIP_STAGE_FREETRANS = 12
    SCIP_STAGE_FREE = 13
end

const SCIP_STAGE = SCIP_Stage

@enum SCIP_Setting::UInt32 begin
    SCIP_UNDEFINED = 0
    SCIP_DISABLED = 1
    SCIP_AUTO = 2
    SCIP_ENABLED = 3
end

const SCIP_SETTING = SCIP_Setting

const SCIP_Set = Cvoid

const SCIP_SET = SCIP_Set

const SCIP_ExprTree = Cvoid

const SCIP_EXPRTREE = SCIP_ExprTree

function SCIPexprtreeGetVars(tree)
    ccall((:SCIPexprtreeGetVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_EXPRTREE},), tree)
end

function SCIPexprtreeSetVars(tree, nvars, vars)
    ccall((:SCIPexprtreeSetVars, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Cint, Ptr{Ptr{SCIP_VAR}}), tree, nvars, vars)
end

function SCIPexprtreeAddVars(tree, nvars, vars)
    ccall((:SCIPexprtreeAddVars, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Cint, Ptr{Ptr{SCIP_VAR}}), tree, nvars, vars)
end

function SCIPexprtreePrintWithNames(tree, messagehdlr, file)
    ccall((:SCIPexprtreePrintWithNames, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Ptr{SCIP_MESSAGEHDLR}, Ptr{Libc.FILE}), tree, messagehdlr, file)
end

function SCIPexprtreeFindVar(tree, var)
    ccall((:SCIPexprtreeFindVar, libscip), Cint, (Ptr{SCIP_EXPRTREE}, Ptr{SCIP_VAR}), tree, var)
end

function SCIPnlrowGetConstant(nlrow)
    ccall((:SCIPnlrowGetConstant, libscip), Cdouble, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetNLinearVars(nlrow)
    ccall((:SCIPnlrowGetNLinearVars, libscip), Cint, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetLinearVars(nlrow)
    ccall((:SCIPnlrowGetLinearVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetLinearCoefs(nlrow)
    ccall((:SCIPnlrowGetLinearCoefs, libscip), Ptr{Cdouble}, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetNQuadVars(nlrow)
    ccall((:SCIPnlrowGetNQuadVars, libscip), Cint, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetQuadVars(nlrow)
    ccall((:SCIPnlrowGetQuadVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowSearchQuadVar(nlrow, var)
    ccall((:SCIPnlrowSearchQuadVar, libscip), Cint, (Ptr{SCIP_NLROW}, Ptr{SCIP_VAR}), nlrow, var)
end

function SCIPnlrowGetNQuadElems(nlrow)
    ccall((:SCIPnlrowGetNQuadElems, libscip), Cint, (Ptr{SCIP_NLROW},), nlrow)
end

struct SCIP_QuadElement
    idx1::Cint
    idx2::Cint
    coef::Cdouble
end

const SCIP_QUADELEM = SCIP_QuadElement

function SCIPnlrowGetQuadElems(nlrow)
    ccall((:SCIPnlrowGetQuadElems, libscip), Ptr{SCIP_QUADELEM}, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetQuadData(nlrow, nquadvars, quadvars, nquadelems, quadelems)
    ccall((:SCIPnlrowGetQuadData, libscip), Cvoid, (Ptr{SCIP_NLROW}, Ptr{Cint}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Cint}, Ptr{Ptr{SCIP_QUADELEM}}), nlrow, nquadvars, quadvars, nquadelems, quadelems)
end

function SCIPnlrowGetExprtree(nlrow)
    ccall((:SCIPnlrowGetExprtree, libscip), Ptr{SCIP_EXPRTREE}, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetLhs(nlrow)
    ccall((:SCIPnlrowGetLhs, libscip), Cdouble, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetRhs(nlrow)
    ccall((:SCIPnlrowGetRhs, libscip), Cdouble, (Ptr{SCIP_NLROW},), nlrow)
end

@enum SCIP_ExprCurv::UInt32 begin
    SCIP_EXPRCURV_UNKNOWN = 0
    SCIP_EXPRCURV_CONVEX = 1
    SCIP_EXPRCURV_CONCAVE = 2
    SCIP_EXPRCURV_LINEAR = 3
end

const SCIP_EXPRCURV = SCIP_ExprCurv

function SCIPnlrowGetCurvature(nlrow)
    ccall((:SCIPnlrowGetCurvature, libscip), SCIP_EXPRCURV, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowSetCurvature(nlrow, curvature)
    ccall((:SCIPnlrowSetCurvature, libscip), Cvoid, (Ptr{SCIP_NLROW}, SCIP_EXPRCURV), nlrow, curvature)
end

function SCIPnlrowGetName(nlrow)
    ccall((:SCIPnlrowGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetNLPPos(nlrow)
    ccall((:SCIPnlrowGetNLPPos, libscip), Cint, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowIsInNLP(nlrow)
    ccall((:SCIPnlrowIsInNLP, libscip), Cuint, (Ptr{SCIP_NLROW},), nlrow)
end

function SCIPnlrowGetDualsol(nlrow)
    ccall((:SCIPnlrowGetDualsol, libscip), Cdouble, (Ptr{SCIP_NLROW},), nlrow)
end

const SCIP_Matrix = Cvoid

const SCIP_MATRIX = SCIP_Matrix

function SCIPmatrixGetColValPtr(matrix, col)
    ccall((:SCIPmatrixGetColValPtr, libscip), Ptr{Cdouble}, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixGetColIdxPtr(matrix, col)
    ccall((:SCIPmatrixGetColIdxPtr, libscip), Ptr{Cint}, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixGetColNNonzs(matrix, col)
    ccall((:SCIPmatrixGetColNNonzs, libscip), Cint, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixGetNColumns(matrix)
    ccall((:SCIPmatrixGetNColumns, libscip), Cint, (Ptr{SCIP_MATRIX},), matrix)
end

function SCIPmatrixGetColUb(matrix, col)
    ccall((:SCIPmatrixGetColUb, libscip), Cdouble, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixGetColLb(matrix, col)
    ccall((:SCIPmatrixGetColLb, libscip), Cdouble, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixGetColNUplocks(matrix, col)
    ccall((:SCIPmatrixGetColNUplocks, libscip), Cint, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixGetColNDownlocks(matrix, col)
    ccall((:SCIPmatrixGetColNDownlocks, libscip), Cint, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixGetVar(matrix, col)
    ccall((:SCIPmatrixGetVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixGetColName(matrix, col)
    ccall((:SCIPmatrixGetColName, libscip), Ptr{Cchar}, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixGetRowValPtr(matrix, row)
    ccall((:SCIPmatrixGetRowValPtr, libscip), Ptr{Cdouble}, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetRowIdxPtr(matrix, row)
    ccall((:SCIPmatrixGetRowIdxPtr, libscip), Ptr{Cint}, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetRowNNonzs(matrix, row)
    ccall((:SCIPmatrixGetRowNNonzs, libscip), Cint, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetRowName(matrix, row)
    ccall((:SCIPmatrixGetRowName, libscip), Ptr{Cchar}, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetNRows(matrix)
    ccall((:SCIPmatrixGetNRows, libscip), Cint, (Ptr{SCIP_MATRIX},), matrix)
end

function SCIPmatrixGetRowLhs(matrix, row)
    ccall((:SCIPmatrixGetRowLhs, libscip), Cdouble, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetRowRhs(matrix, row)
    ccall((:SCIPmatrixGetRowRhs, libscip), Cdouble, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixIsRowRhsInfinity(matrix, row)
    ccall((:SCIPmatrixIsRowRhsInfinity, libscip), Cuint, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetNNonzs(matrix)
    ccall((:SCIPmatrixGetNNonzs, libscip), Cint, (Ptr{SCIP_MATRIX},), matrix)
end

function SCIPmatrixGetRowMinActivity(matrix, row)
    ccall((:SCIPmatrixGetRowMinActivity, libscip), Cdouble, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetRowMaxActivity(matrix, row)
    ccall((:SCIPmatrixGetRowMaxActivity, libscip), Cdouble, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetRowNMinActNegInf(matrix, row)
    ccall((:SCIPmatrixGetRowNMinActNegInf, libscip), Cint, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetRowNMinActPosInf(matrix, row)
    ccall((:SCIPmatrixGetRowNMinActPosInf, libscip), Cint, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetRowNMaxActNegInf(matrix, row)
    ccall((:SCIPmatrixGetRowNMaxActNegInf, libscip), Cint, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetRowNMaxActPosInf(matrix, row)
    ccall((:SCIPmatrixGetRowNMaxActPosInf, libscip), Cint, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixGetCons(matrix, row)
    ccall((:SCIPmatrixGetCons, libscip), Ptr{SCIP_CONS}, (Ptr{SCIP_MATRIX}, Cint), matrix, row)
end

function SCIPmatrixUplockConflict(matrix, col)
    ccall((:SCIPmatrixUplockConflict, libscip), Cuint, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixDownlockConflict(matrix, col)
    ccall((:SCIPmatrixDownlockConflict, libscip), Cuint, (Ptr{SCIP_MATRIX}, Cint), matrix, col)
end

function SCIPmatrixCreate(scip, matrixptr, onlyifcomplete, initialized, complete, infeasible, naddconss, ndelconss, nchgcoefs, nchgbds, nfixedvars)
    ccall((:SCIPmatrixCreate, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_MATRIX}}, Cuint, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, matrixptr, onlyifcomplete, initialized, complete, infeasible, naddconss, ndelconss, nchgcoefs, nchgbds, nfixedvars)
end

function SCIPmatrixFree(scip, matrix)
    ccall((:SCIPmatrixFree, libscip), Cvoid, (Ptr{SCIP}, Ptr{Ptr{SCIP_MATRIX}}), scip, matrix)
end

function SCIPmatrixPrintRow(scip, matrix, row)
    ccall((:SCIPmatrixPrintRow, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_MATRIX}, Cint), scip, matrix, row)
end

function SCIPmatrixGetParallelRows(scip, matrix, scale, pclass)
    ccall((:SCIPmatrixGetParallelRows, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_MATRIX}, Ptr{Cdouble}, Ptr{Cint}), scip, matrix, scale, pclass)
end

function SCIPmatrixRemoveColumnBounds(scip, matrix, col)
    ccall((:SCIPmatrixRemoveColumnBounds, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_MATRIX}, Cint), scip, matrix, col)
end

function SCIPmatrixGetParallelCols(scip, matrix, scale, pclass, varineq)
    ccall((:SCIPmatrixGetParallelCols, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_MATRIX}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}), scip, matrix, scale, pclass, varineq)
end

function SCIPselectInd(indarray, indcomp, dataptr, k, len)
    ccall((:SCIPselectInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), indarray, indcomp, dataptr, k, len)
end

function SCIPselectWeightedInd(indarray, indcomp, dataptr, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), indarray, indcomp, dataptr, weights, capacity, len, medianpos)
end

function SCIPselectPtr(ptrarray, ptrcomp, k, len)
    ccall((:SCIPselectPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint, Cint), ptrarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtr(ptrarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrPtr(ptrarray1, ptrarray2, ptrcomp, k, len)
    ccall((:SCIPselectPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, ptrcomp, k, len)
end

function SCIPselectWeightedPtrPtr(ptrarray1, ptrarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrReal(ptrarray, realarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrReal(ptrarray, realarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrInt(ptrarray, intarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrInt(ptrarray, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrBool(ptrarray, boolarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Cint), ptrarray, boolarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrBool(ptrarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, k, len)
    ccall((:SCIPselectPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray, intarray1, intarray2, ptrcomp, k, len)
end

function SCIPselectWeightedPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrRealInt(ptrarray, realarray, intarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrRealInt(ptrarray, realarray, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrRealRealInt(ptrarray, realarray1, realarray2, intarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrRealRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray1, realarray2, intarray, ptrcomp, k, len)
end

function SCIPselectPtrRealRealBoolBool(ptrarray, realarray1, realarray2, boolarray1, boolarray2, ptrcomp, k, len)
    ccall((:SCIPselectPtrRealRealBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray1, realarray2, boolarray1, boolarray2, ptrcomp, k, len)
end

function SCIPselectPtrRealRealIntBool(ptrarray, realarray1, realarray2, intarray, boolarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrRealRealIntBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray1, realarray2, intarray, boolarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrRealRealInt(ptrarray, realarray1, realarray2, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrRealRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray1, realarray2, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectWeightedPtrRealRealBoolBool(ptrarray, realarray1, realarray2, boolarray1, boolarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrRealRealBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray1, realarray2, boolarray1, boolarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectWeightedPtrRealRealIntBool(ptrarray, realarray1, realarray2, intarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrRealRealIntBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray1, realarray2, intarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray, boolarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrRealReal(ptrarray, realarray1, realarray2, ptrcomp, k, len)
    ccall((:SCIPselectPtrRealReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray1, realarray2, ptrcomp, k, len)
end

function SCIPselectWeightedPtrRealReal(ptrarray, realarray1, realarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrRealReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray1, realarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, realarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, k, len)
    ccall((:SCIPselectPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, k, len)
end

function SCIPselectWeightedPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, k, len)
    ccall((:SCIPselectPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray, intarray1, intarray2, ptrcomp, k, len)
end

function SCIPselectWeightedPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, k, len)
    ccall((:SCIPselectPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, k, len)
    ccall((:SCIPselectPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, k, len)
end

function SCIPselectWeightedPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectReal(realarray, k, len)
    ccall((:SCIPselectReal, libscip), Cvoid, (Ptr{Cdouble}, Cint, Cint), realarray, k, len)
end

function SCIPselectWeightedReal(realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedReal, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, weights, capacity, len, medianpos)
end

function SCIPselectRealPtr(realarray, ptrarray, k, len)
    ccall((:SCIPselectRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray, ptrarray, k, len)
end

function SCIPselectWeightedRealPtr(realarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectRealInt(realarray, intarray, k, len)
    ccall((:SCIPselectRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Cint, Cint), realarray, intarray, k, len)
end

function SCIPselectWeightedRealInt(realarray, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, intarray, weights, capacity, len, medianpos)
end

function SCIPselectRealIntInt(realarray, intarray1, intarray2, k, len)
    ccall((:SCIPselectRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), realarray, intarray1, intarray2, k, len)
end

function SCIPselectWeightedRealIntInt(realarray, intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectRealBoolPtr(realarray, boolarray, ptrarray, k, len)
    ccall((:SCIPselectRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray, boolarray, ptrarray, k, len)
end

function SCIPselectWeightedRealBoolPtr(realarray, boolarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, boolarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectRealIntLong(realarray, intarray, longarray, k, len)
    ccall((:SCIPselectRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Cint, Cint), realarray, intarray, longarray, k, len)
end

function SCIPselectWeightedRealIntLong(realarray, intarray, longarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, intarray, longarray, weights, capacity, len, medianpos)
end

function SCIPselectRealIntPtr(realarray, intarray, ptrarray, k, len)
    ccall((:SCIPselectRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray, intarray, ptrarray, k, len)
end

function SCIPselectWeightedRealIntPtr(realarray, intarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, intarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectRealRealPtr(realarray1, realarray2, ptrarray, k, len)
    ccall((:SCIPselectRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray1, realarray2, ptrarray, k, len)
end

function SCIPselectWeightedRealRealPtr(realarray1, realarray2, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, k, len)
    ccall((:SCIPselectRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Cint), realarray, ptrarray1, ptrarray2, intarray, k, len)
end

function SCIPselectWeightedRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray, weights, capacity, len, medianpos)
end

function SCIPselectRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, k, len)
    ccall((:SCIPselectRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), realarray, ptrarray1, ptrarray2, intarray1, intarray2, k, len)
end

function SCIPselectWeightedRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectRealLongRealInt(realarray1, longarray, realarray3, intarray, k, len)
    ccall((:SCIPselectRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Cint, Cint), realarray1, longarray, realarray3, intarray, k, len)
end

function SCIPselectWeightedRealLongRealInt(realarray1, longarray, realarray3, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, longarray, realarray3, intarray, weights, capacity, len, medianpos)
end

function SCIPselectRealRealIntInt(realarray1, realarray2, intarray1, intarray2, k, len)
    ccall((:SCIPselectRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), realarray1, realarray2, intarray1, intarray2, k, len)
end

function SCIPselectWeightedRealRealIntInt(realarray1, realarray2, intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectRealRealRealInt(realarray1, realarray2, realarray3, intarray, k, len)
    ccall((:SCIPselectRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint, Cint), realarray1, realarray2, realarray3, intarray, k, len)
end

function SCIPselectWeightedRealRealRealInt(realarray1, realarray2, realarray3, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, intarray, weights, capacity, len, medianpos)
end

function SCIPselectRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, k, len)
    ccall((:SCIPselectRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray1, realarray2, realarray3, ptrarray, k, len)
end

function SCIPselectWeightedRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, k, len)
    ccall((:SCIPselectRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray1, realarray2, realarray3, boolarray, ptrarray, k, len)
end

function SCIPselectWeightedRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, k, len)
    ccall((:SCIPselectRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, k, len)
end

function SCIPselectWeightedRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectInt(intarray, k, len)
    ccall((:SCIPselectInt, libscip), Cvoid, (Ptr{Cint}, Cint, Cint), intarray, k, len)
end

function SCIPselectWeightedInt(intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray, weights, capacity, len, medianpos)
end

function SCIPselectIntInt(intarray1, intarray2, k, len)
    ccall((:SCIPselectIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Cint, Cint), intarray1, intarray2, k, len)
end

function SCIPselectWeightedIntInt(intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectIntPtr(intarray, ptrarray, k, len)
    ccall((:SCIPselectIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint), intarray, ptrarray, k, len)
end

function SCIPselectWeightedIntPtr(intarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectIntReal(intarray, realarray, k, len)
    ccall((:SCIPselectIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cint, Cint), intarray, realarray, k, len)
end

function SCIPselectWeightedIntReal(intarray, realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray, realarray, weights, capacity, len, medianpos)
end

function SCIPselectIntIntInt(intarray1, intarray2, intarray3, k, len)
    ccall((:SCIPselectIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), intarray1, intarray2, intarray3, k, len)
end

function SCIPselectWeightedIntIntInt(intarray1, intarray2, intarray3, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, weights, capacity, len, medianpos)
end

function SCIPselectIntIntLong(intarray1, intarray2, longarray, k, len)
    ccall((:SCIPselectIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Cint, Cint), intarray1, intarray2, longarray, k, len)
end

function SCIPselectWeightedIntIntLong(intarray1, intarray2, longarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, longarray, weights, capacity, len, medianpos)
end

function SCIPselectIntRealLong(intarray, realarray, longarray, k, len)
    ccall((:SCIPselectIntRealLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Ptr{Clonglong}, Cint, Cint), intarray, realarray, longarray, k, len)
end

function SCIPselectWeightedIntRealLong(intarray, realarray, longarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntRealLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray, realarray, longarray, weights, capacity, len, medianpos)
end

function SCIPselectIntIntPtr(intarray1, intarray2, ptrarray, k, len)
    ccall((:SCIPselectIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint), intarray1, intarray2, ptrarray, k, len)
end

function SCIPselectWeightedIntIntPtr(intarray1, intarray2, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectIntIntReal(intarray1, intarray2, realarray, k, len)
    ccall((:SCIPselectIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint), intarray1, intarray2, realarray, k, len)
end

function SCIPselectWeightedIntIntReal(intarray1, intarray2, realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, realarray, weights, capacity, len, medianpos)
end

function SCIPselectIntPtrReal(intarray, ptrarray, realarray, k, len)
    ccall((:SCIPselectIntPtrReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cint, Cint), intarray, ptrarray, realarray, k, len)
end

function SCIPselectWeightedIntPtrReal(intarray, ptrarray, realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntPtrReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray, ptrarray, realarray, weights, capacity, len, medianpos)
end

function SCIPselectIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, k, len)
    ccall((:SCIPselectIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint), intarray1, intarray2, intarray3, ptrarray, k, len)
end

function SCIPselectWeightedIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectIntIntIntReal(intarray1, intarray2, intarray3, realarray, k, len)
    ccall((:SCIPselectIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint), intarray1, intarray2, intarray3, realarray, k, len)
end

function SCIPselectWeightedIntIntIntReal(intarray1, intarray2, intarray3, realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, realarray, weights, capacity, len, medianpos)
end

function SCIPselectIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, k, len)
    ccall((:SCIPselectIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint), intarray1, ptrarray, intarray2, realarray, k, len)
end

function SCIPselectWeightedIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, ptrarray, intarray2, realarray, weights, capacity, len, medianpos)
end

function SCIPselectLong(longarray, k, len)
    ccall((:SCIPselectLong, libscip), Cvoid, (Ptr{Clonglong}, Cint, Cint), longarray, k, len)
end

function SCIPselectWeightedLong(longarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedLong, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, weights, capacity, len, medianpos)
end

function SCIPselectLongPtr(longarray, ptrarray, k, len)
    ccall((:SCIPselectLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Cint, Cint), longarray, ptrarray, k, len)
end

function SCIPselectWeightedLongPtr(longarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectLongPtrInt(longarray, ptrarray, intarray, k, len)
    ccall((:SCIPselectLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Cint), longarray, ptrarray, intarray, k, len)
end

function SCIPselectWeightedLongPtrInt(longarray, ptrarray, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, intarray, weights, capacity, len, medianpos)
end

function SCIPselectLongPtrRealBool(longarray, ptrarray, realarray, boolarray, k, len)
    ccall((:SCIPselectLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Cint, Cint), longarray, ptrarray, realarray, boolarray, k, len)
end

function SCIPselectWeightedLongPtrRealBool(longarray, ptrarray, realarray, boolarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, realarray, boolarray, weights, capacity, len, medianpos)
end

function SCIPselectLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, k, len)
    ccall((:SCIPselectLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Cint, Cint), longarray, ptrarray, realarray, realarray2, boolarray, k, len)
end

function SCIPselectWeightedLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, boolarray, weights, capacity, len, medianpos)
end

function SCIPselectLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, k, len)
    ccall((:SCIPselectLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Cint, Cint), longarray, ptrarray, realarray, realarray2, intarray, boolarray, k, len)
end

function SCIPselectWeightedLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, intarray, boolarray, weights, capacity, len, medianpos)
end

function SCIPselectLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, k, len)
    ccall((:SCIPselectLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Cint), longarray, ptrarray1, ptrarray2, intarray, k, len)
end

function SCIPselectWeightedLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray, weights, capacity, len, medianpos)
end

function SCIPselectLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, k, len)
    ccall((:SCIPselectLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), longarray, ptrarray1, ptrarray2, intarray1, intarray2, k, len)
end

function SCIPselectWeightedLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, k, len)
    ccall((:SCIPselectLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cint}, Cint, Cint), longarray, ptrarray1, ptrarray2, boolarray, intarray, k, len)
end

function SCIPselectWeightedLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, boolarray, intarray, weights, capacity, len, medianpos)
end

function SCIPselectPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, k, len)
    ccall((:SCIPselectPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Cint), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, k, len)
end

function SCIPselectWeightedPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, k, len)
    ccall((:SCIPselectIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Cint, Cint), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, k, len)
end

function SCIPselectWeightedIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, weights, capacity, len, medianpos)
end

function SCIPselectDownInd(indarray, indcomp, dataptr, k, len)
    ccall((:SCIPselectDownInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), indarray, indcomp, dataptr, k, len)
end

function SCIPselectWeightedDownInd(indarray, indcomp, dataptr, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), indarray, indcomp, dataptr, weights, capacity, len, medianpos)
end

function SCIPselectDownPtr(ptrarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint, Cint), ptrarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtr(ptrarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrPtr(ptrarray1, ptrarray2, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrPtr(ptrarray1, ptrarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrReal(ptrarray, realarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrReal(ptrarray, realarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrInt(ptrarray, intarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrInt(ptrarray, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrBool(ptrarray, boolarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Cint), ptrarray, boolarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrBool(ptrarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray, intarray1, intarray2, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrRealInt(ptrarray, realarray, intarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrRealInt(ptrarray, realarray, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray, boolarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, realarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray, realarray, intarray1, intarray2, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, realarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Cint), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownReal(realarray, k, len)
    ccall((:SCIPselectDownReal, libscip), Cvoid, (Ptr{Cdouble}, Cint, Cint), realarray, k, len)
end

function SCIPselectWeightedDownReal(realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownReal, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealPtr(realarray, ptrarray, k, len)
    ccall((:SCIPselectDownRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray, ptrarray, k, len)
end

function SCIPselectWeightedDownRealPtr(realarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealInt(realarray, intarray, k, len)
    ccall((:SCIPselectDownRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Cint, Cint), realarray, intarray, k, len)
end

function SCIPselectDownRealIntInt(realarray, intarray1, intarray2, k, len)
    ccall((:SCIPselectDownRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), realarray, intarray1, intarray2, k, len)
end

function SCIPselectWeightedDownRealInt(realarray, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, intarray, weights, capacity, len, medianpos)
end

function SCIPselectWeightedDownRealIntInt(realarray, intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectDownRealBoolPtr(realarray, boolarray, ptrarray, k, len)
    ccall((:SCIPselectDownRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray, boolarray, ptrarray, k, len)
end

function SCIPselectWeightedDownRealBoolPtr(realarray, boolarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, boolarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealIntLong(realarray, intarray, longarray, k, len)
    ccall((:SCIPselectDownRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Cint, Cint), realarray, intarray, longarray, k, len)
end

function SCIPselectWeightedDownRealIntLong(realarray, intarray, longarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, intarray, longarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealIntPtr(realarray, intarray, ptrarray, k, len)
    ccall((:SCIPselectDownRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray, intarray, ptrarray, k, len)
end

function SCIPselectWeightedDownRealIntPtr(realarray, intarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, intarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealRealInt(realarray1, realarray2, intarray, k, len)
    ccall((:SCIPselectDownRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint, Cint), realarray1, realarray2, intarray, k, len)
end

function SCIPselectWeightedDownRealRealInt(realarray1, realarray2, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, intarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealRealPtr(realarray1, realarray2, ptrarray, k, len)
    ccall((:SCIPselectDownRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray1, realarray2, ptrarray, k, len)
end

function SCIPselectWeightedDownRealRealPtr(realarray1, realarray2, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealRealPtrPtr(realarray1, realarray2, ptrarray1, ptrarray2, k, len)
    ccall((:SCIPselectDownRealRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray1, realarray2, ptrarray1, ptrarray2, k, len)
end

function SCIPselectWeightedDownRealRealPtrPtr(realarray1, realarray2, ptrarray1, ptrarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, ptrarray1, ptrarray2, weights, capacity, len, medianpos)
end

function SCIPselectDownRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, k, len)
    ccall((:SCIPselectDownRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Cint), realarray, ptrarray1, ptrarray2, intarray, k, len)
end

function SCIPselectWeightedDownRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, k, len)
    ccall((:SCIPselectDownRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), realarray, ptrarray1, ptrarray2, intarray1, intarray2, k, len)
end

function SCIPselectWeightedDownRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectDownRealLongRealInt(realarray1, longarray, realarray3, intarray, k, len)
    ccall((:SCIPselectDownRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Cint, Cint), realarray1, longarray, realarray3, intarray, k, len)
end

function SCIPselectWeightedDownRealLongRealInt(realarray1, longarray, realarray3, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, longarray, realarray3, intarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealRealIntInt(realarray1, realarray2, intarray1, intarray2, k, len)
    ccall((:SCIPselectDownRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), realarray1, realarray2, intarray1, intarray2, k, len)
end

function SCIPselectWeightedDownRealRealIntInt(realarray1, realarray2, intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectDownRealRealRealInt(realarray1, realarray2, realarray3, intarray, k, len)
    ccall((:SCIPselectDownRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint, Cint), realarray1, realarray2, realarray3, intarray, k, len)
end

function SCIPselectWeightedDownRealRealRealInt(realarray1, realarray2, realarray3, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, intarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, k, len)
    ccall((:SCIPselectDownRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray1, realarray2, realarray3, ptrarray, k, len)
end

function SCIPselectWeightedDownRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealPtrPtr(realarray, ptrarray1, ptrarray2, k, len)
    ccall((:SCIPselectDownRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray, ptrarray1, ptrarray2, k, len)
end

function SCIPselectWeightedDownRealPtrPtr(realarray, ptrarray1, ptrarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, weights, capacity, len, medianpos)
end

function SCIPselectDownRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, k, len)
    ccall((:SCIPselectDownRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray1, realarray2, realarray3, boolarray, ptrarray, k, len)
end

function SCIPselectWeightedDownRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, k, len)
    ccall((:SCIPselectDownRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cint, Cint), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, k, len)
end

function SCIPselectWeightedDownRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownInt(intarray, k, len)
    ccall((:SCIPselectDownInt, libscip), Cvoid, (Ptr{Cint}, Cint, Cint), intarray, k, len)
end

function SCIPselectWeightedDownInt(intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray, weights, capacity, len, medianpos)
end

function SCIPselectDownIntInt(intarray1, intarray2, k, len)
    ccall((:SCIPselectDownIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Cint, Cint), intarray1, intarray2, k, len)
end

function SCIPselectWeightedDownIntInt(intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectDownIntPtr(intarray, ptrarray, k, len)
    ccall((:SCIPselectDownIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint), intarray, ptrarray, k, len)
end

function SCIPselectWeightedDownIntPtr(intarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownIntReal(intarray, realarray, k, len)
    ccall((:SCIPselectDownIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cint, Cint), intarray, realarray, k, len)
end

function SCIPselectWeightedDownIntReal(intarray, realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray, realarray, weights, capacity, len, medianpos)
end

function SCIPselectDownIntIntInt(intarray1, intarray2, intarray3, k, len)
    ccall((:SCIPselectDownIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), intarray1, intarray2, intarray3, k, len)
end

function SCIPselectWeightedDownIntIntInt(intarray1, intarray2, intarray3, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, weights, capacity, len, medianpos)
end

function SCIPselectDownIntIntLong(intarray1, intarray2, longarray, k, len)
    ccall((:SCIPselectDownIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Cint, Cint), intarray1, intarray2, longarray, k, len)
end

function SCIPselectWeightedDownIntIntLong(intarray1, intarray2, longarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, longarray, weights, capacity, len, medianpos)
end

function SCIPselectDownIntIntPtr(intarray1, intarray2, ptrarray, k, len)
    ccall((:SCIPselectDownIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint), intarray1, intarray2, ptrarray, k, len)
end

function SCIPselectWeightedDownIntIntPtr(intarray1, intarray2, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownIntIntReal(intarray1, intarray2, realarray, k, len)
    ccall((:SCIPselectDownIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint), intarray1, intarray2, realarray, k, len)
end

function SCIPselectWeightedDownIntIntReal(intarray1, intarray2, realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, realarray, weights, capacity, len, medianpos)
end

function SCIPselectDownIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, k, len)
    ccall((:SCIPselectDownIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint), intarray1, intarray2, intarray3, ptrarray, k, len)
end

function SCIPselectWeightedDownIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownIntIntIntReal(intarray1, intarray2, intarray3, realarray, k, len)
    ccall((:SCIPselectDownIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint), intarray1, intarray2, intarray3, realarray, k, len)
end

function SCIPselectWeightedDownIntIntIntReal(intarray1, intarray2, intarray3, realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, realarray, weights, capacity, len, medianpos)
end

function SCIPselectDownIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, k, len)
    ccall((:SCIPselectDownIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint), intarray1, ptrarray, intarray2, realarray, k, len)
end

function SCIPselectWeightedDownIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, ptrarray, intarray2, realarray, weights, capacity, len, medianpos)
end

function SCIPselectDownLong(longarray, k, len)
    ccall((:SCIPselectDownLong, libscip), Cvoid, (Ptr{Clonglong}, Cint, Cint), longarray, k, len)
end

function SCIPselectWeightedDownLong(longarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownLong, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, weights, capacity, len, medianpos)
end

function SCIPselectDownLongPtr(longarray, ptrarray, k, len)
    ccall((:SCIPselectDownLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Cint, Cint), longarray, ptrarray, k, len)
end

function SCIPselectWeightedDownLongPtr(longarray, ptrarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, weights, capacity, len, medianpos)
end

function SCIPselectDownLongPtrInt(longarray, ptrarray, intarray, k, len)
    ccall((:SCIPselectDownLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Cint), longarray, ptrarray, intarray, k, len)
end

function SCIPselectWeightedDownLongPtrInt(longarray, ptrarray, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, intarray, weights, capacity, len, medianpos)
end

function SCIPselectDownLongPtrRealBool(longarray, ptrarray, realarray, boolarray, k, len)
    ccall((:SCIPselectDownLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Cint, Cint), longarray, ptrarray, realarray, boolarray, k, len)
end

function SCIPselectWeightedDownLongPtrRealBool(longarray, ptrarray, realarray, boolarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, realarray, boolarray, weights, capacity, len, medianpos)
end

function SCIPselectDownLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, k, len)
    ccall((:SCIPselectDownLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Cint, Cint), longarray, ptrarray, realarray, realarray2, boolarray, k, len)
end

function SCIPselectWeightedDownLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, boolarray, weights, capacity, len, medianpos)
end

function SCIPselectDownLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, k, len)
    ccall((:SCIPselectDownLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Cint, Cint), longarray, ptrarray, realarray, realarray2, intarray, boolarray, k, len)
end

function SCIPselectWeightedDownLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, intarray, boolarray, weights, capacity, len, medianpos)
end

function SCIPselectDownLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, k, len)
    ccall((:SCIPselectDownLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Cint), longarray, ptrarray1, ptrarray2, intarray, k, len)
end

function SCIPselectWeightedDownLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray, weights, capacity, len, medianpos)
end

function SCIPselectDownLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, k, len)
    ccall((:SCIPselectDownLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint, Cint), longarray, ptrarray1, ptrarray2, intarray1, intarray2, k, len)
end

function SCIPselectWeightedDownLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray1, intarray2, weights, capacity, len, medianpos)
end

function SCIPselectDownLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, k, len)
    ccall((:SCIPselectDownLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cint}, Cint, Cint), longarray, ptrarray1, ptrarray2, boolarray, intarray, k, len)
end

function SCIPselectWeightedDownLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, boolarray, intarray, weights, capacity, len, medianpos)
end

function SCIPselectDownPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, k, len)
    ccall((:SCIPselectDownPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Cint), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, k, len)
end

function SCIPselectWeightedDownPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, weights, capacity, len, medianpos)
end

function SCIPselectDownIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, k, len)
    ccall((:SCIPselectDownIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Cint, Cint), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, k, len)
end

function SCIPselectWeightedDownIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, weights, capacity, len, medianpos)
    ccall((:SCIPselectWeightedDownIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, weights, capacity, len, medianpos)
end

function SCIPsortCompInt(elem1, elem2)
    ccall((:SCIPsortCompInt, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPsort(perm, indcomp, dataptr, len)
    ccall((:SCIPsort, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint), perm, indcomp, dataptr, len)
end

function SCIPsortInd(indarray, indcomp, dataptr, len)
    ccall((:SCIPsortInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint), indarray, indcomp, dataptr, len)
end

function SCIPsortPtr(ptrarray, ptrcomp, len)
    ccall((:SCIPsortPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint), ptrarray, ptrcomp, len)
end

function SCIPsortPtrPtr(ptrarray1, ptrarray2, ptrcomp, len)
    ccall((:SCIPsortPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, ptrcomp, len)
end

function SCIPsortPtrReal(ptrarray, realarray, ptrcomp, len)
    ccall((:SCIPsortPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint), ptrarray, realarray, ptrcomp, len)
end

function SCIPsortPtrInt(ptrarray, intarray, ptrcomp, len)
    ccall((:SCIPsortPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray, intarray, ptrcomp, len)
end

function SCIPsortPtrBool(ptrarray, boolarray, ptrcomp, len)
    ccall((:SCIPsortPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cvoid}, Cint), ptrarray, boolarray, ptrcomp, len)
end

function SCIPsortPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, len)
    ccall((:SCIPsortPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray, intarray1, intarray2, ptrcomp, len)
end

function SCIPsortPtrRealInt(ptrarray, realarray, intarray, ptrcomp, len)
    ccall((:SCIPsortPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray, realarray, intarray, ptrcomp, len)
end

function SCIPsortPtrRealRealInt(ptrarray, realarray1, realarray2, intarray, ptrcomp, len)
    ccall((:SCIPsortPtrRealRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray, realarray1, realarray2, intarray, ptrcomp, len)
end

function SCIPsortPtrRealRealBoolBool(ptrarray, realarray1, realarray2, boolarray1, boolarray2, ptrcomp, len)
    ccall((:SCIPsortPtrRealRealBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cvoid}, Cint), ptrarray, realarray1, realarray2, boolarray1, boolarray2, ptrcomp, len)
end

function SCIPsortPtrRealRealIntBool(ptrarray, realarray1, realarray2, intarray, boolarray, ptrcomp, len)
    ccall((:SCIPsortPtrRealRealIntBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cvoid}, Cint), ptrarray, realarray1, realarray2, intarray, boolarray, ptrcomp, len)
end

function SCIPsortPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, len)
    ccall((:SCIPsortPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Cint), ptrarray, realarray, boolarray, ptrcomp, len)
end

function SCIPsortPtrRealReal(ptrarray, realarray1, realarray2, ptrcomp, len)
    ccall((:SCIPsortPtrRealReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cvoid}, Cint), ptrarray, realarray1, realarray2, ptrcomp, len)
end

function SCIPsortPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, len)
    ccall((:SCIPsortPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, intarray, ptrcomp, len)
end

function SCIPsortPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, len)
    ccall((:SCIPsortPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, realarray, ptrcomp, len)
end

function SCIPsortPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, len)
    ccall((:SCIPsortPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, len)
end

function SCIPsortPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, len)
    ccall((:SCIPsortPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray, realarray, intarray1, intarray2, ptrcomp, len)
end

function SCIPsortPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, len)
    ccall((:SCIPsortPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, len)
end

function SCIPsortPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, len)
    ccall((:SCIPsortPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, len)
end

function SCIPsortPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, len)
    ccall((:SCIPsortPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, len)
end

function SCIPsortPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, len)
    ccall((:SCIPsortPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, len)
end

function SCIPsortReal(realarray, len)
    ccall((:SCIPsortReal, libscip), Cvoid, (Ptr{Cdouble}, Cint), realarray, len)
end

function SCIPsortRealPtr(realarray, ptrarray, len)
    ccall((:SCIPsortRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint), realarray, ptrarray, len)
end

function SCIPsortRealInt(realarray, intarray, len)
    ccall((:SCIPsortRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Cint), realarray, intarray, len)
end

function SCIPsortRealIntInt(realarray, intarray1, intarray2, len)
    ccall((:SCIPsortRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint), realarray, intarray1, intarray2, len)
end

function SCIPsortRealBoolPtr(realarray, boolarray, ptrarray, len)
    ccall((:SCIPsortRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cint), realarray, boolarray, ptrarray, len)
end

function SCIPsortRealIntLong(realarray, intarray, longarray, len)
    ccall((:SCIPsortRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Cint), realarray, intarray, longarray, len)
end

function SCIPsortRealIntPtr(realarray, intarray, ptrarray, len)
    ccall((:SCIPsortRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint), realarray, intarray, ptrarray, len)
end

function SCIPsortRealRealPtr(realarray1, realarray2, ptrarray, len)
    ccall((:SCIPsortRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint), realarray1, realarray2, ptrarray, len)
end

function SCIPsortRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, len)
    ccall((:SCIPsortRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint), realarray, ptrarray1, ptrarray2, intarray, len)
end

function SCIPsortRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, len)
    ccall((:SCIPsortRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint), realarray, ptrarray1, ptrarray2, intarray1, intarray2, len)
end

function SCIPsortRealLongRealInt(realarray1, longarray, realarray3, intarray, len)
    ccall((:SCIPsortRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Cint), realarray1, longarray, realarray3, intarray, len)
end

function SCIPsortRealRealIntInt(realarray1, realarray2, intarray1, intarray2, len)
    ccall((:SCIPsortRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint), realarray1, realarray2, intarray1, intarray2, len)
end

function SCIPsortRealRealRealInt(realarray1, realarray2, realarray3, intarray, len)
    ccall((:SCIPsortRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint), realarray1, realarray2, realarray3, intarray, len)
end

function SCIPsortRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, len)
    ccall((:SCIPsortRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint), realarray1, realarray2, realarray3, ptrarray, len)
end

function SCIPsortRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, len)
    ccall((:SCIPsortRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cint), realarray1, realarray2, realarray3, boolarray, ptrarray, len)
end

function SCIPsortRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, len)
    ccall((:SCIPsortRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cint), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, len)
end

function SCIPsortInt(intarray, len)
    ccall((:SCIPsortInt, libscip), Cvoid, (Ptr{Cint}, Cint), intarray, len)
end

function SCIPsortIntInt(intarray1, intarray2, len)
    ccall((:SCIPsortIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Cint), intarray1, intarray2, len)
end

function SCIPsortIntPtr(intarray, ptrarray, len)
    ccall((:SCIPsortIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint), intarray, ptrarray, len)
end

function SCIPsortIntReal(intarray, realarray, len)
    ccall((:SCIPsortIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cint), intarray, realarray, len)
end

function SCIPsortIntIntInt(intarray1, intarray2, intarray3, len)
    ccall((:SCIPsortIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint), intarray1, intarray2, intarray3, len)
end

function SCIPsortIntIntLong(intarray1, intarray2, longarray, len)
    ccall((:SCIPsortIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Cint), intarray1, intarray2, longarray, len)
end

function SCIPsortIntRealLong(intarray, realarray, longarray, len)
    ccall((:SCIPsortIntRealLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Ptr{Clonglong}, Cint), intarray, realarray, longarray, len)
end

function SCIPsortIntIntPtr(intarray1, intarray2, ptrarray, len)
    ccall((:SCIPsortIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint), intarray1, intarray2, ptrarray, len)
end

function SCIPsortIntIntReal(intarray1, intarray2, realarray, len)
    ccall((:SCIPsortIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint), intarray1, intarray2, realarray, len)
end

function SCIPsortIntPtrReal(intarray, ptrarray, realarray, len)
    ccall((:SCIPsortIntPtrReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cint), intarray, ptrarray, realarray, len)
end

function SCIPsortIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, len)
    ccall((:SCIPsortIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint), intarray1, intarray2, intarray3, ptrarray, len)
end

function SCIPsortIntIntIntReal(intarray1, intarray2, intarray3, realarray, len)
    ccall((:SCIPsortIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint), intarray1, intarray2, intarray3, realarray, len)
end

function SCIPsortIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, len)
    ccall((:SCIPsortIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cint), intarray1, ptrarray, intarray2, realarray, len)
end

function SCIPsortLong(longarray, len)
    ccall((:SCIPsortLong, libscip), Cvoid, (Ptr{Clonglong}, Cint), longarray, len)
end

function SCIPsortLongPtr(longarray, ptrarray, len)
    ccall((:SCIPsortLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Cint), longarray, ptrarray, len)
end

function SCIPsortLongPtrInt(longarray, ptrarray, intarray, len)
    ccall((:SCIPsortLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint), longarray, ptrarray, intarray, len)
end

function SCIPsortLongPtrRealBool(longarray, ptrarray, realarray, boolarray, len)
    ccall((:SCIPsortLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Cint), longarray, ptrarray, realarray, boolarray, len)
end

function SCIPsortLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, len)
    ccall((:SCIPsortLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Cint), longarray, ptrarray, realarray, realarray2, boolarray, len)
end

function SCIPsortLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, len)
    ccall((:SCIPsortLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Cint), longarray, ptrarray, realarray, realarray2, intarray, boolarray, len)
end

function SCIPsortLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, len)
    ccall((:SCIPsortLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint), longarray, ptrarray1, ptrarray2, intarray, len)
end

function SCIPsortLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, len)
    ccall((:SCIPsortLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint), longarray, ptrarray1, ptrarray2, intarray1, intarray2, len)
end

function SCIPsortLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, len)
    ccall((:SCIPsortLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cint}, Cint), longarray, ptrarray1, ptrarray2, boolarray, intarray, len)
end

function SCIPsortPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, len)
    ccall((:SCIPsortPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cvoid}, Cint), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, len)
end

function SCIPsortIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, len)
    ccall((:SCIPsortIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Cint), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, len)
end

function SCIPsortDown(perm, indcomp, dataptr, len)
    ccall((:SCIPsortDown, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint), perm, indcomp, dataptr, len)
end

function SCIPsortDownInd(indarray, indcomp, dataptr, len)
    ccall((:SCIPsortDownInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint), indarray, indcomp, dataptr, len)
end

function SCIPsortDownPtr(ptrarray, ptrcomp, len)
    ccall((:SCIPsortDownPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint), ptrarray, ptrcomp, len)
end

function SCIPsortDownPtrPtr(ptrarray1, ptrarray2, ptrcomp, len)
    ccall((:SCIPsortDownPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, ptrcomp, len)
end

function SCIPsortDownPtrReal(ptrarray, realarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint), ptrarray, realarray, ptrcomp, len)
end

function SCIPsortDownPtrInt(ptrarray, intarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray, intarray, ptrcomp, len)
end

function SCIPsortDownPtrBool(ptrarray, boolarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cvoid}, Cint), ptrarray, boolarray, ptrcomp, len)
end

function SCIPsortDownPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, len)
    ccall((:SCIPsortDownPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray, intarray1, intarray2, ptrcomp, len)
end

function SCIPsortDownPtrRealInt(ptrarray, realarray, intarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray, realarray, intarray, ptrcomp, len)
end

function SCIPsortDownPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Cint), ptrarray, realarray, boolarray, ptrcomp, len)
end

function SCIPsortDownPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, intarray, ptrcomp, len)
end

function SCIPsortDownPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, realarray, ptrcomp, len)
end

function SCIPsortDownPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, len)
    ccall((:SCIPsortDownPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, len)
end

function SCIPsortDownPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, len)
    ccall((:SCIPsortDownPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray, realarray, intarray1, intarray2, ptrcomp, len)
end

function SCIPsortDownPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, len)
end

function SCIPsortDownPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, len)
end

function SCIPsortDownPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, len)
    ccall((:SCIPsortDownPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, len)
end

function SCIPsortDownPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, len)
    ccall((:SCIPsortDownPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, len)
end

function SCIPsortDownReal(realarray, len)
    ccall((:SCIPsortDownReal, libscip), Cvoid, (Ptr{Cdouble}, Cint), realarray, len)
end

function SCIPsortDownRealPtr(realarray, ptrarray, len)
    ccall((:SCIPsortDownRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint), realarray, ptrarray, len)
end

function SCIPsortDownRealInt(realarray, intarray, len)
    ccall((:SCIPsortDownRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Cint), realarray, intarray, len)
end

function SCIPsortDownRealIntInt(realarray, intarray1, intarray2, len)
    ccall((:SCIPsortDownRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint), realarray, intarray1, intarray2, len)
end

function SCIPsortDownRealBoolPtr(realarray, boolarray, ptrarray, len)
    ccall((:SCIPsortDownRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cint), realarray, boolarray, ptrarray, len)
end

function SCIPsortDownRealIntLong(realarray, intarray, longarray, len)
    ccall((:SCIPsortDownRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Cint), realarray, intarray, longarray, len)
end

function SCIPsortDownRealIntPtr(realarray, intarray, ptrarray, len)
    ccall((:SCIPsortDownRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint), realarray, intarray, ptrarray, len)
end

function SCIPsortDownRealRealInt(realarray1, realarray2, intarray, len)
    ccall((:SCIPsortDownRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint), realarray1, realarray2, intarray, len)
end

function SCIPsortDownRealRealPtr(realarray1, realarray2, ptrarray, len)
    ccall((:SCIPsortDownRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint), realarray1, realarray2, ptrarray, len)
end

function SCIPsortDownRealRealPtrPtr(realarray1, realarray2, ptrarray1, ptrarray2, len)
    ccall((:SCIPsortDownRealRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Cint), realarray1, realarray2, ptrarray1, ptrarray2, len)
end

function SCIPsortDownRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, len)
    ccall((:SCIPsortDownRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint), realarray, ptrarray1, ptrarray2, intarray, len)
end

function SCIPsortDownRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, len)
    ccall((:SCIPsortDownRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint), realarray, ptrarray1, ptrarray2, intarray1, intarray2, len)
end

function SCIPsortDownRealLongRealInt(realarray1, longarray, realarray3, intarray, len)
    ccall((:SCIPsortDownRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Cint), realarray1, longarray, realarray3, intarray, len)
end

function SCIPsortDownRealRealIntInt(realarray1, realarray2, intarray1, intarray2, len)
    ccall((:SCIPsortDownRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint), realarray1, realarray2, intarray1, intarray2, len)
end

function SCIPsortDownRealRealRealInt(realarray1, realarray2, realarray3, intarray, len)
    ccall((:SCIPsortDownRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint), realarray1, realarray2, realarray3, intarray, len)
end

function SCIPsortDownRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, len)
    ccall((:SCIPsortDownRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint), realarray1, realarray2, realarray3, ptrarray, len)
end

function SCIPsortDownRealPtrPtr(realarray, ptrarray1, ptrarray2, len)
    ccall((:SCIPsortDownRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Cint), realarray, ptrarray1, ptrarray2, len)
end

function SCIPsortDownRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, len)
    ccall((:SCIPsortDownRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cint), realarray1, realarray2, realarray3, boolarray, ptrarray, len)
end

function SCIPsortDownRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, len)
    ccall((:SCIPsortDownRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cint), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, len)
end

function SCIPsortDownInt(intarray, len)
    ccall((:SCIPsortDownInt, libscip), Cvoid, (Ptr{Cint}, Cint), intarray, len)
end

function SCIPsortDownIntInt(intarray1, intarray2, len)
    ccall((:SCIPsortDownIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Cint), intarray1, intarray2, len)
end

function SCIPsortDownIntPtr(intarray, ptrarray, len)
    ccall((:SCIPsortDownIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint), intarray, ptrarray, len)
end

function SCIPsortDownIntReal(intarray, realarray, len)
    ccall((:SCIPsortDownIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cint), intarray, realarray, len)
end

function SCIPsortDownIntIntInt(intarray1, intarray2, intarray3, len)
    ccall((:SCIPsortDownIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint), intarray1, intarray2, intarray3, len)
end

function SCIPsortDownIntIntLong(intarray1, intarray2, longarray, len)
    ccall((:SCIPsortDownIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Cint), intarray1, intarray2, longarray, len)
end

function SCIPsortDownIntIntPtr(intarray1, intarray2, ptrarray, len)
    ccall((:SCIPsortDownIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint), intarray1, intarray2, ptrarray, len)
end

function SCIPsortDownIntIntReal(intarray1, intarray2, realarray, len)
    ccall((:SCIPsortDownIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint), intarray1, intarray2, realarray, len)
end

function SCIPsortDownIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, len)
    ccall((:SCIPsortDownIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint), intarray1, intarray2, intarray3, ptrarray, len)
end

function SCIPsortDownIntIntIntReal(intarray1, intarray2, intarray3, realarray, len)
    ccall((:SCIPsortDownIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint), intarray1, intarray2, intarray3, realarray, len)
end

function SCIPsortDownIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, len)
    ccall((:SCIPsortDownIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cint), intarray1, ptrarray, intarray2, realarray, len)
end

function SCIPsortDownLong(longarray, len)
    ccall((:SCIPsortDownLong, libscip), Cvoid, (Ptr{Clonglong}, Cint), longarray, len)
end

function SCIPsortDownLongPtr(longarray, ptrarray, len)
    ccall((:SCIPsortDownLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Cint), longarray, ptrarray, len)
end

function SCIPsortDownLongPtrInt(longarray, ptrarray, intarray, len)
    ccall((:SCIPsortDownLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint), longarray, ptrarray, intarray, len)
end

function SCIPsortDownLongPtrRealBool(longarray, ptrarray, realarray, boolarray, len)
    ccall((:SCIPsortDownLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Cint), longarray, ptrarray, realarray, boolarray, len)
end

function SCIPsortDownLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, len)
    ccall((:SCIPsortDownLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Cint), longarray, ptrarray, realarray, realarray2, boolarray, len)
end

function SCIPsortDownLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, len)
    ccall((:SCIPsortDownLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Cint), longarray, ptrarray, realarray, realarray2, intarray, boolarray, len)
end

function SCIPsortDownLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, len)
    ccall((:SCIPsortDownLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint), longarray, ptrarray1, ptrarray2, intarray, len)
end

function SCIPsortDownLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, len)
    ccall((:SCIPsortDownLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint), longarray, ptrarray1, ptrarray2, intarray1, intarray2, len)
end

function SCIPsortDownLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, len)
    ccall((:SCIPsortDownLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cint}, Cint), longarray, ptrarray1, ptrarray2, boolarray, intarray, len)
end

function SCIPsortDownPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, len)
    ccall((:SCIPsortDownPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cvoid}, Cint), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, len)
end

function SCIPsortDownIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, len)
    ccall((:SCIPsortDownIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Cint), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, len)
end

function SCIPsortedvecInsertInd(indarray, indcomp, dataptr, keyval, len, pos)
    ccall((:SCIPsortedvecInsertInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), indarray, indcomp, dataptr, keyval, len, pos)
end

function SCIPsortedvecInsertPtr(ptrarray, ptrcomp, keyval, len, pos)
    ccall((:SCIPsortedvecInsertPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), ptrarray, ptrcomp, keyval, len, pos)
end

function SCIPsortedvecInsertPtrPtr(ptrarray1, ptrarray2, ptrcomp, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, ptrcomp, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertPtrReal(ptrarray, realarray, ptrcomp, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray, ptrcomp, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertPtrInt(ptrarray, intarray, ptrcomp, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray, intarray, ptrcomp, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertPtrBool(ptrarray, boolarray, ptrcomp, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cvoid}, Cuint, Ptr{Cint}, Ptr{Cint}), ptrarray, boolarray, ptrcomp, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertPtrRealInt(ptrarray, realarray, intarray, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray, intarray, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertPtrRealRealInt(ptrarray, realarray1, realarray2, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertPtrRealRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray1, realarray2, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertPtrRealRealBoolBool(ptrarray, realarray1, realarray2, boolarray1, boolarray2, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertPtrRealRealBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cdouble, Cuint, Cuint, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray1, realarray2, boolarray1, boolarray2, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertPtrRealRealIntBool(ptrarray, realarray1, realarray2, intarray, boolarray, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertPtrRealRealIntBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cdouble, Cint, Cuint, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray1, realarray2, intarray, boolarray, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cuint, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray, boolarray, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, intarray, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, realarray, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cint, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cuint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Clonglong, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Clonglong, Cint, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertRealIntInt(realarray, intarray1, intarray2, keyval, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cdouble, Cint, Cint, Ptr{Cint}, Ptr{Cint}), realarray, intarray1, intarray2, keyval, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertRealBoolPtr(realarray, boolarray, ptrarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cdouble, Cuint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray, boolarray, ptrarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertRealPtr(realarray, ptrarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cdouble, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray, ptrarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertReal(realarray, keyval, len, pos)
    ccall((:SCIPsortedvecInsertReal, libscip), Cvoid, (Ptr{Cdouble}, Cdouble, Ptr{Cint}, Ptr{Cint}), realarray, keyval, len, pos)
end

function SCIPsortedvecInsertRealInt(realarray, intarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), realarray, intarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertRealIntLong(realarray, intarray, longarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Cdouble, Cint, Clonglong, Ptr{Cint}, Ptr{Cint}), realarray, intarray, longarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertRealIntPtr(realarray, intarray, ptrarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cdouble, Cint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray, intarray, ptrarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertRealRealPtr(realarray1, realarray2, ptrarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cdouble, Cdouble, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, ptrarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, keyval, field1val, field2val, intval, len, pos)
    ccall((:SCIPsortedvecInsertRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cdouble, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray, keyval, field1val, field2val, intval, len, pos)
end

function SCIPsortedvecInsertRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, keyval, field1val, field2val, intval1, intval2, len, pos)
    ccall((:SCIPsortedvecInsertRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cdouble, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray1, intarray2, keyval, field1val, field2val, intval1, intval2, len, pos)
end

function SCIPsortedvecInsertRealLongRealInt(realarray1, longarray, realarray3, intarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Cdouble, Clonglong, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), realarray1, longarray, realarray3, intarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertRealRealIntInt(realarray1, realarray2, intarray1, intarray2, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cdouble, Cdouble, Cint, Cint, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, intarray1, intarray2, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertRealRealRealInt(realarray1, realarray2, realarray3, intarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cdouble, Cdouble, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, realarray3, intarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cdouble, Cdouble, Cdouble, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, realarray3, ptrarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cdouble, Cdouble, Cdouble, Cuint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray, ptrarray, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
    ccall((:SCIPsortedvecInsertRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cdouble, Cdouble, Cdouble, Cuint, Cuint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
end

function SCIPsortedvecInsertInt(intarray, keyval, len, pos)
    ccall((:SCIPsortedvecInsertInt, libscip), Cvoid, (Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Cint}), intarray, keyval, len, pos)
end

function SCIPsortedvecInsertIntInt(intarray1, intarray2, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertIntPtr(intarray, ptrarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), intarray, ptrarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertIntReal(intarray, realarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cint, Cdouble, Ptr{Cint}, Ptr{Cint}), intarray, realarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertIntIntInt(intarray1, intarray2, intarray3, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, intarray3, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertIntIntLong(intarray1, intarray2, longarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Cint, Cint, Clonglong, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, longarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertIntRealLong(intarray, realarray, longarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertIntRealLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Ptr{Clonglong}, Cint, Cdouble, Clonglong, Ptr{Cint}, Ptr{Cint}), intarray, realarray, longarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertIntIntPtr(intarray1, intarray2, ptrarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, ptrarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertIntIntReal(intarray1, intarray2, realarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint, Cdouble, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, realarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertIntPtrReal(intarray, ptrarray, realarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertIntPtrReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cint, Ptr{Cvoid}, Cdouble, Ptr{Cint}, Ptr{Cint}), intarray, ptrarray, realarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint, Cint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, intarray3, ptrarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertIntIntIntReal(intarray1, intarray2, intarray3, realarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint, Cint, Cdouble, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, intarray3, realarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cvoid}, Cint, Cdouble, Ptr{Cint}, Ptr{Cint}), intarray1, ptrarray, intarray2, realarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertLong(longarray, keyval, len, pos)
    ccall((:SCIPsortedvecInsertLong, libscip), Cvoid, (Ptr{Clonglong}, Clonglong, Ptr{Cint}, Ptr{Cint}), longarray, keyval, len, pos)
end

function SCIPsortedvecInsertLongPtr(longarray, ptrarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Clonglong, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertLongPtrInt(longarray, ptrarray, intarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Clonglong, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, intarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertLongPtrRealBool(longarray, ptrarray, realarray, boolarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Clonglong, Ptr{Cvoid}, Cdouble, Cuint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, realarray, boolarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Clonglong, Ptr{Cvoid}, Cdouble, Cdouble, Cuint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, boolarray, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
    ccall((:SCIPsortedvecInsertLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Clonglong, Ptr{Cvoid}, Cdouble, Cdouble, Cint, Cuint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, intarray, boolarray, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
end

function SCIPsortedvecInsertLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Clonglong, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Clonglong, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray1, intarray2, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cint}, Clonglong, Ptr{Cvoid}, Ptr{Cvoid}, Cuint, Cint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray1, ptrarray2, boolarray, intarray, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Cuint, Cuint, Ptr{Cint}, Ptr{Cint}), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
    ccall((:SCIPsortedvecInsertIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Cint, Ptr{Cvoid}, Cint, Cint, Cuint, Cuint, Ptr{Cint}, Ptr{Cint}), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
end

function SCIPsortedvecInsertDownInd(indarray, indcomp, dataptr, keyval, len, pos)
    ccall((:SCIPsortedvecInsertDownInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), indarray, indcomp, dataptr, keyval, len, pos)
end

function SCIPsortedvecInsertDownPtr(ptrarray, ptrcomp, keyval, len, pos)
    ccall((:SCIPsortedvecInsertDownPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), ptrarray, ptrcomp, keyval, len, pos)
end

function SCIPsortedvecInsertDownPtrPtr(ptrarray1, ptrarray2, ptrcomp, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, ptrcomp, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownPtrReal(ptrarray, realarray, ptrcomp, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray, ptrcomp, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownPtrInt(ptrarray, intarray, ptrcomp, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray, intarray, ptrcomp, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownPtrBool(ptrarray, boolarray, ptrcomp, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cvoid}, Cuint, Ptr{Cint}, Ptr{Cint}), ptrarray, boolarray, ptrcomp, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownPtrRealInt(ptrarray, realarray, intarray, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray, intarray, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cuint, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray, boolarray, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, intarray, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, realarray, ptrcomp, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cint, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray, realarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cuint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Clonglong, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Clonglong, Cint, Cint, Ptr{Cint}, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertDownReal(realarray, keyval, len, pos)
    ccall((:SCIPsortedvecInsertDownReal, libscip), Cvoid, (Ptr{Cdouble}, Cdouble, Ptr{Cint}, Ptr{Cint}), realarray, keyval, len, pos)
end

function SCIPsortedvecInsertDownRealBoolPtr(realarray, boolarray, ptrarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cdouble, Cuint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray, boolarray, ptrarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownRealPtr(realarray, ptrarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cdouble, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray, ptrarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownRealPtrPtr(realarray, ptrarray1, ptrarray2, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Cdouble, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray, ptrarray1, ptrarray2, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownRealInt(realarray, intarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), realarray, intarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownRealIntInt(realarray, intarray1, intarray2, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cdouble, Cint, Cint, Ptr{Cint}, Ptr{Cint}), realarray, intarray1, intarray2, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownRealRealInt(realarray, realarray2, intarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cdouble, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), realarray, realarray2, intarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownRealIntLong(realarray, intarray, longarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Cdouble, Cint, Clonglong, Ptr{Cint}, Ptr{Cint}), realarray, intarray, longarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownRealIntPtr(realarray, intarray, ptrarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cdouble, Cint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray, intarray, ptrarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownRealRealPtr(realarray1, realarray2, ptrarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cdouble, Cdouble, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, ptrarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownRealRealPtrPtr(realarray1, realarray2, ptrarray1, ptrarray2, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Cdouble, Cdouble, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, ptrarray1, ptrarray2, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, keyval, field1val, field2val, intval, len, pos)
    ccall((:SCIPsortedvecInsertDownRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cdouble, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray, keyval, field1val, field2val, intval, len, pos)
end

function SCIPsortedvecInsertDownRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, keyval, field1val, field2val, intval1, intval2, len, pos)
    ccall((:SCIPsortedvecInsertDownRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cdouble, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray1, intarray2, keyval, field1val, field2val, intval1, intval2, len, pos)
end

function SCIPsortedvecInsertDownRealLongRealInt(realarray1, longarray, realarray3, intarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Cdouble, Clonglong, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), realarray1, longarray, realarray3, intarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownRealRealIntInt(realarray1, realarray2, intarray1, intarray2, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cdouble, Cdouble, Cint, Cint, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, intarray1, intarray2, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownRealRealRealInt(realarray1, realarray2, realarray3, intarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cdouble, Cdouble, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, realarray3, intarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cdouble, Cdouble, Cdouble, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, realarray3, ptrarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cdouble, Cdouble, Cdouble, Cuint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray, ptrarray, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertDownRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
    ccall((:SCIPsortedvecInsertDownRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cdouble, Cdouble, Cdouble, Cuint, Cuint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
end

function SCIPsortedvecInsertDownInt(intarray, keyval, len, pos)
    ccall((:SCIPsortedvecInsertDownInt, libscip), Cvoid, (Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Cint}), intarray, keyval, len, pos)
end

function SCIPsortedvecInsertDownIntInt(intarray1, intarray2, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownIntReal(intarray, realarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cint, Cdouble, Ptr{Cint}, Ptr{Cint}), intarray, realarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownIntIntInt(intarray1, intarray2, intarray3, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, intarray3, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownIntIntLong(intarray1, intarray2, longarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Cint, Cint, Clonglong, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, longarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownIntIntPtr(intarray1, intarray2, ptrarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, ptrarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownIntIntReal(intarray1, intarray2, realarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint, Cdouble, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, realarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownIntPtr(intarray, ptrarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), intarray, ptrarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Cint, Cint, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, intarray3, ptrarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownIntIntIntReal(intarray1, intarray2, intarray3, realarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cint, Cint, Cdouble, Ptr{Cint}, Ptr{Cint}), intarray1, intarray2, intarray3, realarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cvoid}, Cint, Cdouble, Ptr{Cint}, Ptr{Cint}), intarray1, ptrarray, intarray2, realarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownLong(longarray, keyval, len, pos)
    ccall((:SCIPsortedvecInsertDownLong, libscip), Cvoid, (Ptr{Clonglong}, Clonglong, Ptr{Cint}, Ptr{Cint}), longarray, keyval, len, pos)
end

function SCIPsortedvecInsertDownLongPtr(longarray, ptrarray, keyval, field1val, len, pos)
    ccall((:SCIPsortedvecInsertDownLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Clonglong, Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, keyval, field1val, len, pos)
end

function SCIPsortedvecInsertDownLongPtrInt(longarray, ptrarray, intarray, keyval, field1val, field2val, len, pos)
    ccall((:SCIPsortedvecInsertDownLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Clonglong, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, intarray, keyval, field1val, field2val, len, pos)
end

function SCIPsortedvecInsertDownLongPtrRealBool(longarray, ptrarray, realarray, boolarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Clonglong, Ptr{Cvoid}, Cdouble, Cuint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, realarray, boolarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertDownLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Clonglong, Ptr{Cvoid}, Cdouble, Cdouble, Cuint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, boolarray, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertDownLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
    ccall((:SCIPsortedvecInsertDownLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Clonglong, Ptr{Cvoid}, Cdouble, Cdouble, Cint, Cuint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, intarray, boolarray, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
end

function SCIPsortedvecInsertDownLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, keyval, field1val, field2val, field3val, len, pos)
    ccall((:SCIPsortedvecInsertDownLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Clonglong, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray, keyval, field1val, field2val, field3val, len, pos)
end

function SCIPsortedvecInsertDownLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertDownLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Clonglong, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray1, intarray2, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertDownLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertDownLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cint}, Clonglong, Ptr{Cvoid}, Ptr{Cvoid}, Cuint, Cint, Ptr{Cint}, Ptr{Cint}), longarray, ptrarray1, ptrarray2, boolarray, intarray, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertDownPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
    ccall((:SCIPsortedvecInsertDownPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Cuint, Cuint, Ptr{Cint}, Ptr{Cint}), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, keyval, field1val, field2val, field3val, field4val, len, pos)
end

function SCIPsortedvecInsertDownIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
    ccall((:SCIPsortedvecInsertDownIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Cint, Ptr{Cvoid}, Cint, Cint, Cuint, Cuint, Ptr{Cint}, Ptr{Cint}), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, keyval, field1val, field2val, field3val, field4val, field5val, len, pos)
end

function SCIPsortedvecDelPosInd(indarray, indcomp, dataptr, pos, len)
    ccall((:SCIPsortedvecDelPosInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}), indarray, indcomp, dataptr, pos, len)
end

function SCIPsortedvecDelPosPtr(ptrarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrPtr(ptrarray1, ptrarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrReal(ptrarray, realarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrInt(ptrarray, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrBool(ptrarray, boolarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, boolarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, intarray1, intarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrRealInt(ptrarray, realarray, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrRealRealInt(ptrarray, realarray1, realarray2, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrRealRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray1, realarray2, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrRealRealBoolBool(ptrarray, realarray1, realarray2, boolarray1, boolarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrRealRealBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray1, realarray2, boolarray1, boolarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrRealRealIntBool(ptrarray, realarray1, realarray2, intarray, boolarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrRealRealIntBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray1, realarray2, intarray, boolarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray, boolarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray, intarray1, intarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosRealBoolPtr(realarray, boolarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray, boolarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosRealPtr(realarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosReal(realarray, pos, len)
    ccall((:SCIPsortedvecDelPosReal, libscip), Cvoid, (Ptr{Cdouble}, Cint, Ptr{Cint}), realarray, pos, len)
end

function SCIPsortedvecDelPosRealInt(realarray, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Cint, Ptr{Cint}), realarray, intarray, pos, len)
end

function SCIPsortedvecDelPosRealIntInt(realarray, intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), realarray, intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosRealIntLong(realarray, intarray, longarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Cint, Ptr{Cint}), realarray, intarray, longarray, pos, len)
end

function SCIPsortedvecDelPosRealIntPtr(realarray, intarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray, intarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosRealRealPtr(realarray1, realarray2, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray1, realarray2, ptrarray, pos, len)
end

function SCIPsortedvecDelPosRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray, pos, len)
end

function SCIPsortedvecDelPosRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosRealLongRealInt(realarray1, longarray, realarray3, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Cint, Ptr{Cint}), realarray1, longarray, realarray3, intarray, pos, len)
end

function SCIPsortedvecDelPosRealRealIntInt(realarray1, realarray2, intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), realarray1, realarray2, intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosRealRealRealInt(realarray1, realarray2, realarray3, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, intarray, pos, len)
end

function SCIPsortedvecDelPosRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, ptrarray, pos, len)
end

function SCIPsortedvecDelPosRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, pos, len)
end

function SCIPsortedvecDelPosInt(intarray, pos, len)
    ccall((:SCIPsortedvecDelPosInt, libscip), Cvoid, (Ptr{Cint}, Cint, Ptr{Cint}), intarray, pos, len)
end

function SCIPsortedvecDelPosIntInt(intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosIntReal(intarray, realarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}), intarray, realarray, pos, len)
end

function SCIPsortedvecDelPosIntIntInt(intarray1, intarray2, intarray3, pos, len)
    ccall((:SCIPsortedvecDelPosIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, pos, len)
end

function SCIPsortedvecDelPosIntIntLong(intarray1, intarray2, longarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Cint, Ptr{Cint}), intarray1, intarray2, longarray, pos, len)
end

function SCIPsortedvecDelPosIntRealLong(intarray, realarray, longarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntRealLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Ptr{Clonglong}, Cint, Ptr{Cint}), intarray, realarray, longarray, pos, len)
end

function SCIPsortedvecDelPosIntIntPtr(intarray1, intarray2, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), intarray1, intarray2, ptrarray, pos, len)
end

function SCIPsortedvecDelPosIntIntReal(intarray1, intarray2, realarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}), intarray1, intarray2, realarray, pos, len)
end

function SCIPsortedvecDelPosIntPtr(intarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), intarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosIntPtrReal(intarray, ptrarray, realarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntPtrReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Cint, Ptr{Cint}), intarray, ptrarray, realarray, pos, len)
end

function SCIPsortedvecDelPosIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, ptrarray, pos, len)
end

function SCIPsortedvecDelPosIntIntIntReal(intarray1, intarray2, intarray3, realarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, realarray, pos, len)
end

function SCIPsortedvecDelPosIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, pos, len)
    ccall((:SCIPsortedvecDelPosIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}), intarray1, ptrarray, intarray2, realarray, pos, len)
end

function SCIPsortedvecDelPosLong(longarray, pos, len)
    ccall((:SCIPsortedvecDelPosLong, libscip), Cvoid, (Ptr{Clonglong}, Cint, Ptr{Cint}), longarray, pos, len)
end

function SCIPsortedvecDelPosLongPtr(longarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), longarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosLongPtrInt(longarray, ptrarray, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Ptr{Cint}), longarray, ptrarray, intarray, pos, len)
end

function SCIPsortedvecDelPosLongPtrRealBool(longarray, ptrarray, realarray, boolarray, pos, len)
    ccall((:SCIPsortedvecDelPosLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Cint, Ptr{Cint}), longarray, ptrarray, realarray, boolarray, pos, len)
end

function SCIPsortedvecDelPosLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, pos, len)
    ccall((:SCIPsortedvecDelPosLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Cint, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, boolarray, pos, len)
end

function SCIPsortedvecDelPosLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, pos, len)
    ccall((:SCIPsortedvecDelPosLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Cint, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, intarray, boolarray, pos, len)
end

function SCIPsortedvecDelPosLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray, pos, len)
end

function SCIPsortedvecDelPosLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cint}, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, boolarray, intarray, pos, len)
end

function SCIPsortedvecDelPosPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, pos, len)
    ccall((:SCIPsortedvecDelPosIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Cint, Ptr{Cint}), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, pos, len)
end

function SCIPsortedvecDelPosDownInd(indarray, indcomp, dataptr, pos, len)
    ccall((:SCIPsortedvecDelPosDownInd, libscip), Cvoid, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}), indarray, indcomp, dataptr, pos, len)
end

function SCIPsortedvecDelPosDownPtr(ptrarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrPtr(ptrarray1, ptrarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrPtr, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrReal(ptrarray, realarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrInt(ptrarray, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrBool(ptrarray, boolarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, boolarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrIntInt(ptrarray, intarray1, intarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, intarray1, intarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrRealInt(ptrarray, realarray, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrRealBool(ptrarray, realarray, boolarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray, boolarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrPtrInt(ptrarray1, ptrarray2, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrPtrInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrPtrReal(ptrarray1, ptrarray2, realarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrPtrReal, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrPtrIntInt(ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrPtrIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, intarray1, intarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrRealIntInt(ptrarray, realarray, intarray1, intarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrRealIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, realarray, intarray1, intarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrPtrRealInt(ptrarray1, ptrarray2, realarray, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrPtrRealInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrPtrRealBool(ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrPtrRealBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, realarray, boolarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrPtrLongInt(ptrarray1, ptrarray2, longarray, intarray, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrPtrLongInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownPtrPtrLongIntInt(ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrPtrLongIntInt, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Clonglong}, Ptr{Cint}, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray1, ptrarray2, longarray, intarray1, intarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownReal(realarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownReal, libscip), Cvoid, (Ptr{Cdouble}, Cint, Ptr{Cint}), realarray, pos, len)
end

function SCIPsortedvecDelPosDownRealBoolPtr(realarray, boolarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray, boolarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownRealPtr(realarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownRealInt(realarray, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Cint, Ptr{Cint}), realarray, intarray, pos, len)
end

function SCIPsortedvecDelPosDownRealIntInt(realarray, intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), realarray, intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosDownRealIntLong(realarray, intarray, longarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealIntLong, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Clonglong}, Cint, Ptr{Cint}), realarray, intarray, longarray, pos, len)
end

function SCIPsortedvecDelPosDownRealIntPtr(realarray, intarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealIntPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray, intarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownRealRealInt(realarray1, realarray2, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint, Ptr{Cint}), realarray1, realarray2, intarray, pos, len)
end

function SCIPsortedvecDelPosDownRealRealPtr(realarray1, realarray2, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray1, realarray2, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownRealRealPtrPtr(realarray1, realarray2, ptrarray1, ptrarray2, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray1, realarray2, ptrarray1, ptrarray2, pos, len)
end

function SCIPsortedvecDelPosDownRealPtrPtr(realarray, ptrarray1, ptrarray2, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealPtrPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, pos, len)
end

function SCIPsortedvecDelPosDownRealPtrPtrInt(realarray, ptrarray1, ptrarray2, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealPtrPtrInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray, pos, len)
end

function SCIPsortedvecDelPosDownRealPtrPtrIntInt(realarray, ptrarray1, ptrarray2, intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealPtrPtrIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), realarray, ptrarray1, ptrarray2, intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosDownRealLongRealInt(realarray1, longarray, realarray3, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealLongRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Clonglong}, Ptr{Cdouble}, Ptr{Cint}, Cint, Ptr{Cint}), realarray1, longarray, realarray3, intarray, pos, len)
end

function SCIPsortedvecDelPosDownRealRealIntInt(realarray1, realarray2, intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealRealIntInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), realarray1, realarray2, intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosDownRealRealRealInt(realarray1, realarray2, realarray3, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealRealRealInt, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, intarray, pos, len)
end

function SCIPsortedvecDelPosDownRealRealRealPtr(realarray1, realarray2, realarray3, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealRealRealPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownRealRealRealBoolPtr(realarray1, realarray2, realarray3, boolarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealRealRealBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownRealRealRealBoolBoolPtr(realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownRealRealRealBoolBoolPtr, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), realarray1, realarray2, realarray3, boolarray1, boolarray2, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownInt(intarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownInt, libscip), Cvoid, (Ptr{Cint}, Cint, Ptr{Cint}), intarray, pos, len)
end

function SCIPsortedvecDelPosDownIntInt(intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosDownIntReal(intarray, realarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}), intarray, realarray, pos, len)
end

function SCIPsortedvecDelPosDownIntIntInt(intarray1, intarray2, intarray3, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntIntInt, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, pos, len)
end

function SCIPsortedvecDelPosDownIntIntLong(intarray1, intarray2, longarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntIntLong, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Clonglong}, Cint, Ptr{Cint}), intarray1, intarray2, longarray, pos, len)
end

function SCIPsortedvecDelPosDownIntIntPtr(intarray1, intarray2, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), intarray1, intarray2, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownIntIntReal(intarray1, intarray2, realarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}), intarray1, intarray2, realarray, pos, len)
end

function SCIPsortedvecDelPosDownIntPtr(intarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), intarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownIntIntIntPtr(intarray1, intarray2, intarray3, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntIntIntPtr, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownIntIntIntReal(intarray1, intarray2, intarray3, realarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntIntIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}), intarray1, intarray2, intarray3, realarray, pos, len)
end

function SCIPsortedvecDelPosDownIntPtrIntReal(intarray1, ptrarray, intarray2, realarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntPtrIntReal, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cdouble}, Cint, Ptr{Cint}), intarray1, ptrarray, intarray2, realarray, pos, len)
end

function SCIPsortedvecDelPosDownLong(longarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownLong, libscip), Cvoid, (Ptr{Clonglong}, Cint, Ptr{Cint}), longarray, pos, len)
end

function SCIPsortedvecDelPosDownLongPtr(longarray, ptrarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownLongPtr, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Cint}), longarray, ptrarray, pos, len)
end

function SCIPsortedvecDelPosDownLongPtrInt(longarray, ptrarray, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownLongPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Ptr{Cint}), longarray, ptrarray, intarray, pos, len)
end

function SCIPsortedvecDelPosDownLongPtrRealBool(longarray, ptrarray, realarray, boolarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownLongPtrRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cuint}, Cint, Ptr{Cint}), longarray, ptrarray, realarray, boolarray, pos, len)
end

function SCIPsortedvecDelPosDownLongPtrRealRealBool(longarray, ptrarray, realarray, realarray2, boolarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownLongPtrRealRealBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Cint, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, boolarray, pos, len)
end

function SCIPsortedvecDelPosDownLongPtrRealRealIntBool(longarray, ptrarray, realarray, realarray2, intarray, boolarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownLongPtrRealRealIntBool, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Cint, Ptr{Cint}), longarray, ptrarray, realarray, realarray2, intarray, boolarray, pos, len)
end

function SCIPsortedvecDelPosDownLongPtrPtrInt(longarray, ptrarray1, ptrarray2, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownLongPtrPtrInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray, pos, len)
end

function SCIPsortedvecDelPosDownLongPtrPtrIntInt(longarray, ptrarray1, ptrarray2, intarray1, intarray2, pos, len)
    ccall((:SCIPsortedvecDelPosDownLongPtrPtrIntInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, intarray1, intarray2, pos, len)
end

function SCIPsortedvecDelPosDownLongPtrPtrBoolInt(longarray, ptrarray1, ptrarray2, boolarray, intarray, pos, len)
    ccall((:SCIPsortedvecDelPosDownLongPtrPtrBoolInt, libscip), Cvoid, (Ptr{Clonglong}, Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}, Ptr{Cuint}, Ptr{Cint}, Cint, Ptr{Cint}), longarray, ptrarray1, ptrarray2, boolarray, intarray, pos, len)
end

function SCIPsortedvecDelPosDownPtrIntIntBoolBool(ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, pos, len)
    ccall((:SCIPsortedvecDelPosDownPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, intarray1, intarray2, boolarray1, boolarray2, ptrcomp, pos, len)
end

function SCIPsortedvecDelPosDownIntPtrIntIntBoolBool(intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, pos, len)
    ccall((:SCIPsortedvecDelPosDownIntPtrIntIntBoolBool, libscip), Cvoid, (Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Cint, Ptr{Cint}), intarray1, ptrarray, intarray2, intarray3, boolarray1, boolarray2, pos, len)
end

function SCIPsortedvecFindInd(indarray, indcomp, dataptr, val, len, pos)
    ccall((:SCIPsortedvecFindInd, libscip), Cuint, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}), indarray, indcomp, dataptr, val, len, pos)
end

function SCIPsortedvecFindPtr(ptrarray, ptrcomp, val, len, pos)
    ccall((:SCIPsortedvecFindPtr, libscip), Cuint, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, ptrcomp, val, len, pos)
end

function SCIPsortedvecFindReal(realarray, val, len, pos)
    ccall((:SCIPsortedvecFindReal, libscip), Cuint, (Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, val, len, pos)
end

function SCIPsortedvecFindInt(intarray, val, len, pos)
    ccall((:SCIPsortedvecFindInt, libscip), Cuint, (Ptr{Cint}, Cint, Cint, Ptr{Cint}), intarray, val, len, pos)
end

function SCIPsortedvecFindLong(longarray, val, len, pos)
    ccall((:SCIPsortedvecFindLong, libscip), Cuint, (Ptr{Clonglong}, Clonglong, Cint, Ptr{Cint}), longarray, val, len, pos)
end

function SCIPsortedvecFindDownInd(indarray, indcomp, dataptr, val, len, pos)
    ccall((:SCIPsortedvecFindDownInd, libscip), Cuint, (Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Ptr{Cint}), indarray, indcomp, dataptr, val, len, pos)
end

function SCIPsortedvecFindDownPtr(ptrarray, ptrcomp, val, len, pos)
    ccall((:SCIPsortedvecFindDownPtr, libscip), Cuint, (Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cint}), ptrarray, ptrcomp, val, len, pos)
end

function SCIPsortedvecFindDownReal(realarray, val, len, pos)
    ccall((:SCIPsortedvecFindDownReal, libscip), Cuint, (Ptr{Cdouble}, Cdouble, Cint, Ptr{Cint}), realarray, val, len, pos)
end

function SCIPsortedvecFindDownInt(intarray, val, len, pos)
    ccall((:SCIPsortedvecFindDownInt, libscip), Cuint, (Ptr{Cint}, Cint, Cint, Ptr{Cint}), intarray, val, len, pos)
end

function SCIPsortedvecFindDownLong(longarray, val, len, pos)
    ccall((:SCIPsortedvecFindDownLong, libscip), Cuint, (Ptr{Clonglong}, Clonglong, Cint, Ptr{Cint}), longarray, val, len, pos)
end

function SCIPconsGetRhs(scip, cons, success)
    ccall((:SCIPconsGetRhs, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Cuint}), scip, cons, success)
end

function SCIPconsGetLhs(scip, cons, success)
    ccall((:SCIPconsGetLhs, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Cuint}), scip, cons, success)
end

function SCIPgetConsVals(scip, cons, vals, varssize, success)
    ccall((:SCIPgetConsVals, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Cdouble}, Cint, Ptr{Cuint}), scip, cons, vals, varssize, success)
end

function SCIPconsGetDualfarkas(scip, cons, dualfarkas, success)
    ccall((:SCIPconsGetDualfarkas, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Cdouble}, Ptr{Cuint}), scip, cons, dualfarkas, success)
end

function SCIPconsGetDualsol(scip, cons, dualsol, success)
    ccall((:SCIPconsGetDualsol, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Cdouble}, Ptr{Cuint}), scip, cons, dualsol, success)
end

function SCIPconsGetRow(scip, cons)
    ccall((:SCIPconsGetRow, libscip), Ptr{SCIP_ROW}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPconsAddCoef(scip, cons, var, val)
    ccall((:SCIPconsAddCoef, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, val)
end

function SCIPstudentTGetCriticalValue(clevel, df)
    ccall((:SCIPstudentTGetCriticalValue, libscip), Cdouble, (SCIP_CONFIDENCELEVEL, Cint), clevel, df)
end

function SCIPcomputeTwoSampleTTestValue(meanx, meany, variancex, variancey, countx, county)
    ccall((:SCIPcomputeTwoSampleTTestValue, libscip), Cdouble, (Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), meanx, meany, variancex, variancey, countx, county)
end

function SCIPerf(x)
    ccall((:SCIPerf, libscip), Cdouble, (Cdouble,), x)
end

function SCIPnormalGetCriticalValue(clevel)
    ccall((:SCIPnormalGetCriticalValue, libscip), Cdouble, (SCIP_CONFIDENCELEVEL,), clevel)
end

function SCIPnormalCDF(mean, variance, value)
    ccall((:SCIPnormalCDF, libscip), Cdouble, (Cdouble, Cdouble, Cdouble), mean, variance, value)
end

function SCIPregressionGetNObservations(regression)
    ccall((:SCIPregressionGetNObservations, libscip), Cint, (Ptr{SCIP_REGRESSION},), regression)
end

function SCIPregressionGetSlope(regression)
    ccall((:SCIPregressionGetSlope, libscip), Cdouble, (Ptr{SCIP_REGRESSION},), regression)
end

function SCIPregressionGetIntercept(regression)
    ccall((:SCIPregressionGetIntercept, libscip), Cdouble, (Ptr{SCIP_REGRESSION},), regression)
end

function SCIPregressionRemoveObservation(regression, x, y)
    ccall((:SCIPregressionRemoveObservation, libscip), Cvoid, (Ptr{SCIP_REGRESSION}, Cdouble, Cdouble), regression, x, y)
end

function SCIPregressionAddObservation(regression, x, y)
    ccall((:SCIPregressionAddObservation, libscip), Cvoid, (Ptr{SCIP_REGRESSION}, Cdouble, Cdouble), regression, x, y)
end

function SCIPregressionReset(regression)
    ccall((:SCIPregressionReset, libscip), Cvoid, (Ptr{SCIP_REGRESSION},), regression)
end

function SCIPregressionCreate(regression)
    ccall((:SCIPregressionCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_REGRESSION}},), regression)
end

function SCIPregressionFree(regression)
    ccall((:SCIPregressionFree, libscip), Cvoid, (Ptr{Ptr{SCIP_REGRESSION}},), regression)
end

function SCIPgmlWriteNode(file, id, label, nodetype, fillcolor, bordercolor)
    ccall((:SCIPgmlWriteNode, libscip), Cvoid, (Ptr{Libc.FILE}, Cuint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}), file, id, label, nodetype, fillcolor, bordercolor)
end

function SCIPgmlWriteNodeWeight(file, id, label, nodetype, fillcolor, bordercolor, weight)
    ccall((:SCIPgmlWriteNodeWeight, libscip), Cvoid, (Ptr{Libc.FILE}, Cuint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Cdouble), file, id, label, nodetype, fillcolor, bordercolor, weight)
end

function SCIPgmlWriteEdge(file, source, target, label, color)
    ccall((:SCIPgmlWriteEdge, libscip), Cvoid, (Ptr{Libc.FILE}, Cuint, Cuint, Ptr{Cchar}, Ptr{Cchar}), file, source, target, label, color)
end

function SCIPgmlWriteArc(file, source, target, label, color)
    ccall((:SCIPgmlWriteArc, libscip), Cvoid, (Ptr{Libc.FILE}, Cuint, Cuint, Ptr{Cchar}, Ptr{Cchar}), file, source, target, label, color)
end

function SCIPgmlWriteOpening(file, directed)
    ccall((:SCIPgmlWriteOpening, libscip), Cvoid, (Ptr{Libc.FILE}, Cuint), file, directed)
end

function SCIPgmlWriteClosing(file)
    ccall((:SCIPgmlWriteClosing, libscip), Cvoid, (Ptr{Libc.FILE},), file)
end

function SCIPsparseSolCreate(sparsesol, vars, nvars, cleared)
    ccall((:SCIPsparseSolCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_SPARSESOL}}, Ptr{Ptr{SCIP_VAR}}, Cint, Cuint), sparsesol, vars, nvars, cleared)
end

function SCIPsparseSolFree(sparsesol)
    ccall((:SCIPsparseSolFree, libscip), Cvoid, (Ptr{Ptr{SCIP_SPARSESOL}},), sparsesol)
end

function SCIPsparseSolGetVars(sparsesol)
    ccall((:SCIPsparseSolGetVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_SPARSESOL},), sparsesol)
end

function SCIPsparseSolGetNVars(sparsesol)
    ccall((:SCIPsparseSolGetNVars, libscip), Cint, (Ptr{SCIP_SPARSESOL},), sparsesol)
end

function SCIPsparseSolGetLbs(sparsesol)
    ccall((:SCIPsparseSolGetLbs, libscip), Ptr{Clonglong}, (Ptr{SCIP_SPARSESOL},), sparsesol)
end

function SCIPsparseSolGetUbs(sparsesol)
    ccall((:SCIPsparseSolGetUbs, libscip), Ptr{Clonglong}, (Ptr{SCIP_SPARSESOL},), sparsesol)
end

function SCIPsparseSolGetFirstSol(sparsesol, sol, nvars)
    ccall((:SCIPsparseSolGetFirstSol, libscip), Cvoid, (Ptr{SCIP_SPARSESOL}, Ptr{Clonglong}, Cint), sparsesol, sol, nvars)
end

function SCIPsparseSolGetNextSol(sparsesol, sol, nvars)
    ccall((:SCIPsparseSolGetNextSol, libscip), Cuint, (Ptr{SCIP_SPARSESOL}, Ptr{Clonglong}, Cint), sparsesol, sol, nvars)
end

function SCIPqueueCreate(queue, initsize, sizefac)
    ccall((:SCIPqueueCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_QUEUE}}, Cint, Cdouble), queue, initsize, sizefac)
end

function SCIPqueueFree(queue)
    ccall((:SCIPqueueFree, libscip), Cvoid, (Ptr{Ptr{SCIP_QUEUE}},), queue)
end

function SCIPqueueClear(queue)
    ccall((:SCIPqueueClear, libscip), Cvoid, (Ptr{SCIP_QUEUE},), queue)
end

function SCIPqueueInsert(queue, elem)
    ccall((:SCIPqueueInsert, libscip), SCIP_RETCODE, (Ptr{SCIP_QUEUE}, Ptr{Cvoid}), queue, elem)
end

function SCIPqueueInsertUInt(queue, elem)
    ccall((:SCIPqueueInsertUInt, libscip), SCIP_RETCODE, (Ptr{SCIP_QUEUE}, Cuint), queue, elem)
end

function SCIPqueueRemove(queue)
    ccall((:SCIPqueueRemove, libscip), Ptr{Cvoid}, (Ptr{SCIP_QUEUE},), queue)
end

function SCIPqueueRemoveUInt(queue)
    ccall((:SCIPqueueRemoveUInt, libscip), Cuint, (Ptr{SCIP_QUEUE},), queue)
end

function SCIPqueueFirst(queue)
    ccall((:SCIPqueueFirst, libscip), Ptr{Cvoid}, (Ptr{SCIP_QUEUE},), queue)
end

function SCIPqueueFirstUInt(queue)
    ccall((:SCIPqueueFirstUInt, libscip), Cuint, (Ptr{SCIP_QUEUE},), queue)
end

function SCIPqueueIsEmpty(queue)
    ccall((:SCIPqueueIsEmpty, libscip), Cuint, (Ptr{SCIP_QUEUE},), queue)
end

function SCIPqueueNElems(queue)
    ccall((:SCIPqueueNElems, libscip), Cint, (Ptr{SCIP_QUEUE},), queue)
end

function SCIPpqueueCreate(pqueue, initsize, sizefac, ptrcomp, elemchgpos)
    ccall((:SCIPpqueueCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_PQUEUE}}, Cint, Cdouble, Ptr{Cvoid}, Ptr{Cvoid}), pqueue, initsize, sizefac, ptrcomp, elemchgpos)
end

function SCIPpqueueFree(pqueue)
    ccall((:SCIPpqueueFree, libscip), Cvoid, (Ptr{Ptr{SCIP_PQUEUE}},), pqueue)
end

function SCIPpqueueClear(pqueue)
    ccall((:SCIPpqueueClear, libscip), Cvoid, (Ptr{SCIP_PQUEUE},), pqueue)
end

function SCIPpqueueInsert(pqueue, elem)
    ccall((:SCIPpqueueInsert, libscip), SCIP_RETCODE, (Ptr{SCIP_PQUEUE}, Ptr{Cvoid}), pqueue, elem)
end

function SCIPpqueueDelPos(pqueue, pos)
    ccall((:SCIPpqueueDelPos, libscip), Cvoid, (Ptr{SCIP_PQUEUE}, Cint), pqueue, pos)
end

function SCIPpqueueRemove(pqueue)
    ccall((:SCIPpqueueRemove, libscip), Ptr{Cvoid}, (Ptr{SCIP_PQUEUE},), pqueue)
end

function SCIPpqueueFirst(pqueue)
    ccall((:SCIPpqueueFirst, libscip), Ptr{Cvoid}, (Ptr{SCIP_PQUEUE},), pqueue)
end

function SCIPpqueueNElems(pqueue)
    ccall((:SCIPpqueueNElems, libscip), Cint, (Ptr{SCIP_PQUEUE},), pqueue)
end

function SCIPpqueueElems(pqueue)
    ccall((:SCIPpqueueElems, libscip), Ptr{Ptr{Cvoid}}, (Ptr{SCIP_PQUEUE},), pqueue)
end

function SCIPpqueueFind(pqueue, elem)
    ccall((:SCIPpqueueFind, libscip), Cint, (Ptr{SCIP_PQUEUE}, Ptr{Cvoid}), pqueue, elem)
end

function SCIPrealHashCode(x)
    ccall((:SCIPrealHashCode, libscip), UInt32, (Cdouble,), x)
end

function SCIPhashtableCreate(hashtable, blkmem, tablesize, hashgetkey, hashkeyeq, hashkeyval, userptr)
    ccall((:SCIPhashtableCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_HASHTABLE}}, Ptr{BMS_BLKMEM}, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), hashtable, blkmem, tablesize, hashgetkey, hashkeyeq, hashkeyval, userptr)
end

function SCIPhashtableFree(hashtable)
    ccall((:SCIPhashtableFree, libscip), Cvoid, (Ptr{Ptr{SCIP_HASHTABLE}},), hashtable)
end

function SCIPhashtableClear(hashtable)
    ccall((:SCIPhashtableClear, libscip), Cvoid, (Ptr{SCIP_HASHTABLE},), hashtable)
end

function SCIPhashtableInsert(hashtable, element)
    ccall((:SCIPhashtableInsert, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHTABLE}, Ptr{Cvoid}), hashtable, element)
end

function SCIPhashtableSafeInsert(hashtable, element)
    ccall((:SCIPhashtableSafeInsert, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHTABLE}, Ptr{Cvoid}), hashtable, element)
end

function SCIPhashtableRetrieve(hashtable, key)
    ccall((:SCIPhashtableRetrieve, libscip), Ptr{Cvoid}, (Ptr{SCIP_HASHTABLE}, Ptr{Cvoid}), hashtable, key)
end

function SCIPhashtableExists(hashtable, element)
    ccall((:SCIPhashtableExists, libscip), Cuint, (Ptr{SCIP_HASHTABLE}, Ptr{Cvoid}), hashtable, element)
end

function SCIPhashtableRemove(hashtable, element)
    ccall((:SCIPhashtableRemove, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHTABLE}, Ptr{Cvoid}), hashtable, element)
end

function SCIPhashtableRemoveAll(hashtable)
    ccall((:SCIPhashtableRemoveAll, libscip), Cvoid, (Ptr{SCIP_HASHTABLE},), hashtable)
end

function SCIPhashtableGetNElements(hashtable)
    ccall((:SCIPhashtableGetNElements, libscip), Clonglong, (Ptr{SCIP_HASHTABLE},), hashtable)
end

function SCIPhashtableGetNEntries(hashtable)
    ccall((:SCIPhashtableGetNEntries, libscip), Cint, (Ptr{SCIP_HASHTABLE},), hashtable)
end

function SCIPhashtableGetEntry(hashtable, entryidx)
    ccall((:SCIPhashtableGetEntry, libscip), Ptr{Cvoid}, (Ptr{SCIP_HASHTABLE}, Cint), hashtable, entryidx)
end

function SCIPhashtableGetLoad(hashtable)
    ccall((:SCIPhashtableGetLoad, libscip), Cdouble, (Ptr{SCIP_HASHTABLE},), hashtable)
end

function SCIPhashtablePrintStatistics(hashtable, messagehdlr)
    ccall((:SCIPhashtablePrintStatistics, libscip), Cvoid, (Ptr{SCIP_HASHTABLE}, Ptr{SCIP_MESSAGEHDLR}), hashtable, messagehdlr)
end

function SCIPcalcMultihashSize(minsize)
    ccall((:SCIPcalcMultihashSize, libscip), Cint, (Cint,), minsize)
end

function SCIPmultihashCreate(multihash, blkmem, tablesize, hashgetkey, hashkeyeq, hashkeyval, userptr)
    ccall((:SCIPmultihashCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_MULTIHASH}}, Ptr{BMS_BLKMEM}, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), multihash, blkmem, tablesize, hashgetkey, hashkeyeq, hashkeyval, userptr)
end

function SCIPmultihashFree(multihash)
    ccall((:SCIPmultihashFree, libscip), Cvoid, (Ptr{Ptr{SCIP_MULTIHASH}},), multihash)
end

function SCIPmultihashInsert(multihash, element)
    ccall((:SCIPmultihashInsert, libscip), SCIP_RETCODE, (Ptr{SCIP_MULTIHASH}, Ptr{Cvoid}), multihash, element)
end

function SCIPmultihashSafeInsert(multihash, element)
    ccall((:SCIPmultihashSafeInsert, libscip), SCIP_RETCODE, (Ptr{SCIP_MULTIHASH}, Ptr{Cvoid}), multihash, element)
end

function SCIPmultihashRetrieve(multihash, key)
    ccall((:SCIPmultihashRetrieve, libscip), Ptr{Cvoid}, (Ptr{SCIP_MULTIHASH}, Ptr{Cvoid}), multihash, key)
end

function SCIPmultihashRetrieveNext(multihash, multihashlist, key)
    ccall((:SCIPmultihashRetrieveNext, libscip), Ptr{Cvoid}, (Ptr{SCIP_MULTIHASH}, Ptr{Ptr{SCIP_MULTIHASHLIST}}, Ptr{Cvoid}), multihash, multihashlist, key)
end

function SCIPmultihashExists(multihash, element)
    ccall((:SCIPmultihashExists, libscip), Cuint, (Ptr{SCIP_MULTIHASH}, Ptr{Cvoid}), multihash, element)
end

function SCIPmultihashRemove(multihash, element)
    ccall((:SCIPmultihashRemove, libscip), SCIP_RETCODE, (Ptr{SCIP_MULTIHASH}, Ptr{Cvoid}), multihash, element)
end

function SCIPmultihashRemoveAll(multihash)
    ccall((:SCIPmultihashRemoveAll, libscip), Cvoid, (Ptr{SCIP_MULTIHASH},), multihash)
end

function SCIPmultihashGetNElements(multihash)
    ccall((:SCIPmultihashGetNElements, libscip), Clonglong, (Ptr{SCIP_MULTIHASH},), multihash)
end

function SCIPmultihashGetLoad(multihash)
    ccall((:SCIPmultihashGetLoad, libscip), Cdouble, (Ptr{SCIP_MULTIHASH},), multihash)
end

function SCIPmultihashPrintStatistics(multihash, messagehdlr)
    ccall((:SCIPmultihashPrintStatistics, libscip), Cvoid, (Ptr{SCIP_MULTIHASH}, Ptr{SCIP_MESSAGEHDLR}), multihash, messagehdlr)
end

function SCIPhashKeyEqString(userptr, key1, key2)
    ccall((:SCIPhashKeyEqString, libscip), Cuint, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), userptr, key1, key2)
end

function SCIPhashKeyValString(userptr, key)
    ccall((:SCIPhashKeyValString, libscip), UInt64, (Ptr{Cvoid}, Ptr{Cvoid}), userptr, key)
end

function SCIPhashGetKeyStandard(userptr, elem)
    ccall((:SCIPhashGetKeyStandard, libscip), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}), userptr, elem)
end

function SCIPhashKeyEqPtr(userptr, key1, key2)
    ccall((:SCIPhashKeyEqPtr, libscip), Cuint, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), userptr, key1, key2)
end

function SCIPhashKeyValPtr(userptr, key)
    ccall((:SCIPhashKeyValPtr, libscip), UInt64, (Ptr{Cvoid}, Ptr{Cvoid}), userptr, key)
end

function SCIPhashmapCreate(hashmap, blkmem, mapsize)
    ccall((:SCIPhashmapCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_HASHMAP}}, Ptr{BMS_BLKMEM}, Cint), hashmap, blkmem, mapsize)
end

function SCIPhashmapFree(hashmap)
    ccall((:SCIPhashmapFree, libscip), Cvoid, (Ptr{Ptr{SCIP_HASHMAP}},), hashmap)
end

function SCIPhashmapInsert(hashmap, origin, image)
    ccall((:SCIPhashmapInsert, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}, Ptr{Cvoid}), hashmap, origin, image)
end

function SCIPhashmapInsertInt(hashmap, origin, image)
    ccall((:SCIPhashmapInsertInt, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}, Cint), hashmap, origin, image)
end

function SCIPhashmapInsertReal(hashmap, origin, image)
    ccall((:SCIPhashmapInsertReal, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}, Cdouble), hashmap, origin, image)
end

function SCIPhashmapGetImage(hashmap, origin)
    ccall((:SCIPhashmapGetImage, libscip), Ptr{Cvoid}, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}), hashmap, origin)
end

function SCIPhashmapGetImageInt(hashmap, origin)
    ccall((:SCIPhashmapGetImageInt, libscip), Cint, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}), hashmap, origin)
end

function SCIPhashmapGetImageReal(hashmap, origin)
    ccall((:SCIPhashmapGetImageReal, libscip), Cdouble, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}), hashmap, origin)
end

function SCIPhashmapSetImage(hashmap, origin, image)
    ccall((:SCIPhashmapSetImage, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}, Ptr{Cvoid}), hashmap, origin, image)
end

function SCIPhashmapSetImageInt(hashmap, origin, image)
    ccall((:SCIPhashmapSetImageInt, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}, Cint), hashmap, origin, image)
end

function SCIPhashmapSetImageReal(hashmap, origin, image)
    ccall((:SCIPhashmapSetImageReal, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}, Cdouble), hashmap, origin, image)
end

function SCIPhashmapExists(hashmap, origin)
    ccall((:SCIPhashmapExists, libscip), Cuint, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}), hashmap, origin)
end

function SCIPhashmapRemove(hashmap, origin)
    ccall((:SCIPhashmapRemove, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHMAP}, Ptr{Cvoid}), hashmap, origin)
end

function SCIPhashmapPrintStatistics(hashmap, messagehdlr)
    ccall((:SCIPhashmapPrintStatistics, libscip), Cvoid, (Ptr{SCIP_HASHMAP}, Ptr{SCIP_MESSAGEHDLR}), hashmap, messagehdlr)
end

function SCIPhashmapIsEmpty(hashmap)
    ccall((:SCIPhashmapIsEmpty, libscip), Cuint, (Ptr{SCIP_HASHMAP},), hashmap)
end

function SCIPhashmapGetNElements(hashmap)
    ccall((:SCIPhashmapGetNElements, libscip), Cint, (Ptr{SCIP_HASHMAP},), hashmap)
end

function SCIPhashmapGetNEntries(hashmap)
    ccall((:SCIPhashmapGetNEntries, libscip), Cint, (Ptr{SCIP_HASHMAP},), hashmap)
end

function SCIPhashmapGetEntry(hashmap, entryidx)
    ccall((:SCIPhashmapGetEntry, libscip), Ptr{SCIP_HASHMAPENTRY}, (Ptr{SCIP_HASHMAP}, Cint), hashmap, entryidx)
end

function SCIPhashmapEntryGetOrigin(entry)
    ccall((:SCIPhashmapEntryGetOrigin, libscip), Ptr{Cvoid}, (Ptr{SCIP_HASHMAPENTRY},), entry)
end

function SCIPhashmapEntryGetImage(entry)
    ccall((:SCIPhashmapEntryGetImage, libscip), Ptr{Cvoid}, (Ptr{SCIP_HASHMAPENTRY},), entry)
end

function SCIPhashmapEntryGetImageInt(entry)
    ccall((:SCIPhashmapEntryGetImageInt, libscip), Cint, (Ptr{SCIP_HASHMAPENTRY},), entry)
end

function SCIPhashmapEntryGetImageReal(entry)
    ccall((:SCIPhashmapEntryGetImageReal, libscip), Cdouble, (Ptr{SCIP_HASHMAPENTRY},), entry)
end

function SCIPhashmapEntrySetImage(entry, image)
    ccall((:SCIPhashmapEntrySetImage, libscip), Cvoid, (Ptr{SCIP_HASHMAPENTRY}, Ptr{Cvoid}), entry, image)
end

function SCIPhashmapEntrySetImageInt(entry, image)
    ccall((:SCIPhashmapEntrySetImageInt, libscip), Cvoid, (Ptr{SCIP_HASHMAPENTRY}, Cint), entry, image)
end

function SCIPhashmapEntrySetImageReal(entry, image)
    ccall((:SCIPhashmapEntrySetImageReal, libscip), Cvoid, (Ptr{SCIP_HASHMAPENTRY}, Cdouble), entry, image)
end

function SCIPhashmapRemoveAll(hashmap)
    ccall((:SCIPhashmapRemoveAll, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHMAP},), hashmap)
end

function SCIPhashsetCreate(hashset, blkmem, size)
    ccall((:SCIPhashsetCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_HASHSET}}, Ptr{BMS_BLKMEM}, Cint), hashset, blkmem, size)
end

function SCIPhashsetFree(hashset, blkmem)
    ccall((:SCIPhashsetFree, libscip), Cvoid, (Ptr{Ptr{SCIP_HASHSET}}, Ptr{BMS_BLKMEM}), hashset, blkmem)
end

function SCIPhashsetInsert(hashset, blkmem, element)
    ccall((:SCIPhashsetInsert, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHSET}, Ptr{BMS_BLKMEM}, Ptr{Cvoid}), hashset, blkmem, element)
end

function SCIPhashsetExists(hashset, element)
    ccall((:SCIPhashsetExists, libscip), Cuint, (Ptr{SCIP_HASHSET}, Ptr{Cvoid}), hashset, element)
end

function SCIPhashsetRemove(hashset, element)
    ccall((:SCIPhashsetRemove, libscip), SCIP_RETCODE, (Ptr{SCIP_HASHSET}, Ptr{Cvoid}), hashset, element)
end

function SCIPhashsetPrintStatistics(hashset, messagehdlr)
    ccall((:SCIPhashsetPrintStatistics, libscip), Cvoid, (Ptr{SCIP_HASHSET}, Ptr{SCIP_MESSAGEHDLR}), hashset, messagehdlr)
end

function SCIPhashsetIsEmpty(hashset)
    ccall((:SCIPhashsetIsEmpty, libscip), Cuint, (Ptr{SCIP_HASHSET},), hashset)
end

function SCIPhashsetGetNElements(hashset)
    ccall((:SCIPhashsetGetNElements, libscip), Cint, (Ptr{SCIP_HASHSET},), hashset)
end

function SCIPhashsetGetNSlots(hashset)
    ccall((:SCIPhashsetGetNSlots, libscip), Cint, (Ptr{SCIP_HASHSET},), hashset)
end

function SCIPhashsetGetSlots(hashset)
    ccall((:SCIPhashsetGetSlots, libscip), Ptr{Ptr{Cvoid}}, (Ptr{SCIP_HASHSET},), hashset)
end

function SCIPhashsetRemoveAll(hashset)
    ccall((:SCIPhashsetRemoveAll, libscip), Cvoid, (Ptr{SCIP_HASHSET},), hashset)
end

function SCIPactivityCreate(activity, var, duration, demand)
    ccall((:SCIPactivityCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_RESOURCEACTIVITY}}, Ptr{SCIP_VAR}, Cint, Cint), activity, var, duration, demand)
end

function SCIPactivityFree(activity)
    ccall((:SCIPactivityFree, libscip), Cvoid, (Ptr{Ptr{SCIP_RESOURCEACTIVITY}},), activity)
end

function SCIPactivityGetVar(activity)
    ccall((:SCIPactivityGetVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_RESOURCEACTIVITY},), activity)
end

function SCIPactivityGetDuration(activity)
    ccall((:SCIPactivityGetDuration, libscip), Cint, (Ptr{SCIP_RESOURCEACTIVITY},), activity)
end

function SCIPactivityGetDemand(activity)
    ccall((:SCIPactivityGetDemand, libscip), Cint, (Ptr{SCIP_RESOURCEACTIVITY},), activity)
end

function SCIPactivityGetEnergy(activity)
    ccall((:SCIPactivityGetEnergy, libscip), Cint, (Ptr{SCIP_RESOURCEACTIVITY},), activity)
end

function SCIPprofileCreate(profile, capacity)
    ccall((:SCIPprofileCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_PROFILE}}, Cint), profile, capacity)
end

function SCIPprofileFree(profile)
    ccall((:SCIPprofileFree, libscip), Cvoid, (Ptr{Ptr{SCIP_PROFILE}},), profile)
end

function SCIPprofilePrint(profile, messagehdlr, file)
    ccall((:SCIPprofilePrint, libscip), Cvoid, (Ptr{SCIP_PROFILE}, Ptr{SCIP_MESSAGEHDLR}, Ptr{Libc.FILE}), profile, messagehdlr, file)
end

function SCIPprofileGetCapacity(profile)
    ccall((:SCIPprofileGetCapacity, libscip), Cint, (Ptr{SCIP_PROFILE},), profile)
end

function SCIPprofileGetNTimepoints(profile)
    ccall((:SCIPprofileGetNTimepoints, libscip), Cint, (Ptr{SCIP_PROFILE},), profile)
end

function SCIPprofileGetTimepoints(profile)
    ccall((:SCIPprofileGetTimepoints, libscip), Ptr{Cint}, (Ptr{SCIP_PROFILE},), profile)
end

function SCIPprofileGetLoads(profile)
    ccall((:SCIPprofileGetLoads, libscip), Ptr{Cint}, (Ptr{SCIP_PROFILE},), profile)
end

function SCIPprofileGetTime(profile, pos)
    ccall((:SCIPprofileGetTime, libscip), Cint, (Ptr{SCIP_PROFILE}, Cint), profile, pos)
end

function SCIPprofileGetLoad(profile, pos)
    ccall((:SCIPprofileGetLoad, libscip), Cint, (Ptr{SCIP_PROFILE}, Cint), profile, pos)
end

function SCIPprofileFindLeft(profile, timepoint, pos)
    ccall((:SCIPprofileFindLeft, libscip), Cuint, (Ptr{SCIP_PROFILE}, Cint, Ptr{Cint}), profile, timepoint, pos)
end

function SCIPprofileInsertCore(profile, left, right, height, pos, infeasible)
    ccall((:SCIPprofileInsertCore, libscip), SCIP_RETCODE, (Ptr{SCIP_PROFILE}, Cint, Cint, Cint, Ptr{Cint}, Ptr{Cuint}), profile, left, right, height, pos, infeasible)
end

function SCIPprofileDeleteCore(profile, left, right, height)
    ccall((:SCIPprofileDeleteCore, libscip), SCIP_RETCODE, (Ptr{SCIP_PROFILE}, Cint, Cint, Cint), profile, left, right, height)
end

function SCIPprofileGetEarliestFeasibleStart(profile, est, lst, duration, height, infeasible)
    ccall((:SCIPprofileGetEarliestFeasibleStart, libscip), Cint, (Ptr{SCIP_PROFILE}, Cint, Cint, Cint, Cint, Ptr{Cuint}), profile, est, lst, duration, height, infeasible)
end

function SCIPprofileGetLatestFeasibleStart(profile, lb, ub, duration, height, infeasible)
    ccall((:SCIPprofileGetLatestFeasibleStart, libscip), Cint, (Ptr{SCIP_PROFILE}, Cint, Cint, Cint, Cint, Ptr{Cuint}), profile, lb, ub, duration, height, infeasible)
end

function SCIPdigraphResize(digraph, nnodes)
    ccall((:SCIPdigraphResize, libscip), SCIP_RETCODE, (Ptr{SCIP_DIGRAPH}, Cint), digraph, nnodes)
end

function SCIPdigraphSetSizes(digraph, sizes)
    ccall((:SCIPdigraphSetSizes, libscip), SCIP_RETCODE, (Ptr{SCIP_DIGRAPH}, Ptr{Cint}), digraph, sizes)
end

function SCIPdigraphFree(digraph)
    ccall((:SCIPdigraphFree, libscip), Cvoid, (Ptr{Ptr{SCIP_DIGRAPH}},), digraph)
end

function SCIPdigraphAddArc(digraph, startnode, endnode, data)
    ccall((:SCIPdigraphAddArc, libscip), SCIP_RETCODE, (Ptr{SCIP_DIGRAPH}, Cint, Cint, Ptr{Cvoid}), digraph, startnode, endnode, data)
end

function SCIPdigraphAddArcSafe(digraph, startnode, endnode, data)
    ccall((:SCIPdigraphAddArcSafe, libscip), SCIP_RETCODE, (Ptr{SCIP_DIGRAPH}, Cint, Cint, Ptr{Cvoid}), digraph, startnode, endnode, data)
end

function SCIPdigraphSetNSuccessors(digraph, node, nsuccessors)
    ccall((:SCIPdigraphSetNSuccessors, libscip), SCIP_RETCODE, (Ptr{SCIP_DIGRAPH}, Cint, Cint), digraph, node, nsuccessors)
end

function SCIPdigraphGetNNodes(digraph)
    ccall((:SCIPdigraphGetNNodes, libscip), Cint, (Ptr{SCIP_DIGRAPH},), digraph)
end

function SCIPdigraphGetNodeData(digraph, node)
    ccall((:SCIPdigraphGetNodeData, libscip), Ptr{Cvoid}, (Ptr{SCIP_DIGRAPH}, Cint), digraph, node)
end

function SCIPdigraphSetNodeData(digraph, dataptr, node)
    ccall((:SCIPdigraphSetNodeData, libscip), Cvoid, (Ptr{SCIP_DIGRAPH}, Ptr{Cvoid}, Cint), digraph, dataptr, node)
end

function SCIPdigraphGetNArcs(digraph)
    ccall((:SCIPdigraphGetNArcs, libscip), Cint, (Ptr{SCIP_DIGRAPH},), digraph)
end

function SCIPdigraphGetNSuccessors(digraph, node)
    ccall((:SCIPdigraphGetNSuccessors, libscip), Cint, (Ptr{SCIP_DIGRAPH}, Cint), digraph, node)
end

function SCIPdigraphGetSuccessors(digraph, node)
    ccall((:SCIPdigraphGetSuccessors, libscip), Ptr{Cint}, (Ptr{SCIP_DIGRAPH}, Cint), digraph, node)
end

function SCIPdigraphGetSuccessorsData(digraph, node)
    ccall((:SCIPdigraphGetSuccessorsData, libscip), Ptr{Ptr{Cvoid}}, (Ptr{SCIP_DIGRAPH}, Cint), digraph, node)
end

function SCIPdigraphGetArticulationPoints(digraph, articulations, narticulations)
    ccall((:SCIPdigraphGetArticulationPoints, libscip), SCIP_RETCODE, (Ptr{SCIP_DIGRAPH}, Ptr{Ptr{Cint}}, Ptr{Cint}), digraph, articulations, narticulations)
end

function SCIPdigraphComputeUndirectedComponents(digraph, minsize, components, ncomponents)
    ccall((:SCIPdigraphComputeUndirectedComponents, libscip), SCIP_RETCODE, (Ptr{SCIP_DIGRAPH}, Cint, Ptr{Cint}, Ptr{Cint}), digraph, minsize, components, ncomponents)
end

function SCIPdigraphComputeDirectedComponents(digraph, compidx, strongcomponents, strongcompstartidx, nstrongcomponents)
    ccall((:SCIPdigraphComputeDirectedComponents, libscip), SCIP_RETCODE, (Ptr{SCIP_DIGRAPH}, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), digraph, compidx, strongcomponents, strongcompstartidx, nstrongcomponents)
end

function SCIPdigraphTopoSortComponents(digraph)
    ccall((:SCIPdigraphTopoSortComponents, libscip), SCIP_RETCODE, (Ptr{SCIP_DIGRAPH},), digraph)
end

function SCIPdigraphGetNComponents(digraph)
    ccall((:SCIPdigraphGetNComponents, libscip), Cint, (Ptr{SCIP_DIGRAPH},), digraph)
end

function SCIPdigraphGetComponent(digraph, compidx, nodes, nnodes)
    ccall((:SCIPdigraphGetComponent, libscip), Cvoid, (Ptr{SCIP_DIGRAPH}, Cint, Ptr{Ptr{Cint}}, Ptr{Cint}), digraph, compidx, nodes, nnodes)
end

function SCIPdigraphFreeComponents(digraph)
    ccall((:SCIPdigraphFreeComponents, libscip), Cvoid, (Ptr{SCIP_DIGRAPH},), digraph)
end

function SCIPdigraphPrint(digraph, messagehdlr, file)
    ccall((:SCIPdigraphPrint, libscip), Cvoid, (Ptr{SCIP_DIGRAPH}, Ptr{SCIP_MESSAGEHDLR}, Ptr{Libc.FILE}), digraph, messagehdlr, file)
end

function SCIPdigraphPrintGml(digraph, file)
    ccall((:SCIPdigraphPrintGml, libscip), Cvoid, (Ptr{SCIP_DIGRAPH}, Ptr{Libc.FILE}), digraph, file)
end

function SCIPdigraphPrintComponents(digraph, messagehdlr, file)
    ccall((:SCIPdigraphPrintComponents, libscip), Cvoid, (Ptr{SCIP_DIGRAPH}, Ptr{SCIP_MESSAGEHDLR}, Ptr{Libc.FILE}), digraph, messagehdlr, file)
end

function SCIPbtnodeCreate(tree, node, dataptr)
    ccall((:SCIPbtnodeCreate, libscip), SCIP_RETCODE, (Ptr{SCIP_BT}, Ptr{Ptr{SCIP_BTNODE}}, Ptr{Cvoid}), tree, node, dataptr)
end

function SCIPbtnodeFree(tree, node)
    ccall((:SCIPbtnodeFree, libscip), Cvoid, (Ptr{SCIP_BT}, Ptr{Ptr{SCIP_BTNODE}}), tree, node)
end

function SCIPbtnodeGetData(node)
    ccall((:SCIPbtnodeGetData, libscip), Ptr{Cvoid}, (Ptr{SCIP_BTNODE},), node)
end

function SCIPbtnodeGetParent(node)
    ccall((:SCIPbtnodeGetParent, libscip), Ptr{SCIP_BTNODE}, (Ptr{SCIP_BTNODE},), node)
end

function SCIPbtnodeGetLeftchild(node)
    ccall((:SCIPbtnodeGetLeftchild, libscip), Ptr{SCIP_BTNODE}, (Ptr{SCIP_BTNODE},), node)
end

function SCIPbtnodeGetRightchild(node)
    ccall((:SCIPbtnodeGetRightchild, libscip), Ptr{SCIP_BTNODE}, (Ptr{SCIP_BTNODE},), node)
end

function SCIPbtnodeGetSibling(node)
    ccall((:SCIPbtnodeGetSibling, libscip), Ptr{SCIP_BTNODE}, (Ptr{SCIP_BTNODE},), node)
end

function SCIPbtnodeIsRoot(node)
    ccall((:SCIPbtnodeIsRoot, libscip), Cuint, (Ptr{SCIP_BTNODE},), node)
end

function SCIPbtnodeIsLeaf(node)
    ccall((:SCIPbtnodeIsLeaf, libscip), Cuint, (Ptr{SCIP_BTNODE},), node)
end

function SCIPbtnodeIsLeftchild(node)
    ccall((:SCIPbtnodeIsLeftchild, libscip), Cuint, (Ptr{SCIP_BTNODE},), node)
end

function SCIPbtnodeIsRightchild(node)
    ccall((:SCIPbtnodeIsRightchild, libscip), Cuint, (Ptr{SCIP_BTNODE},), node)
end

function SCIPbtnodeSetData(node, dataptr)
    ccall((:SCIPbtnodeSetData, libscip), Cvoid, (Ptr{SCIP_BTNODE}, Ptr{Cvoid}), node, dataptr)
end

function SCIPbtnodeSetParent(node, parent)
    ccall((:SCIPbtnodeSetParent, libscip), Cvoid, (Ptr{SCIP_BTNODE}, Ptr{SCIP_BTNODE}), node, parent)
end

function SCIPbtnodeSetLeftchild(node, left)
    ccall((:SCIPbtnodeSetLeftchild, libscip), Cvoid, (Ptr{SCIP_BTNODE}, Ptr{SCIP_BTNODE}), node, left)
end

function SCIPbtnodeSetRightchild(node, right)
    ccall((:SCIPbtnodeSetRightchild, libscip), Cvoid, (Ptr{SCIP_BTNODE}, Ptr{SCIP_BTNODE}), node, right)
end

function SCIPbtCreate(tree, blkmem)
    ccall((:SCIPbtCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_BT}}, Ptr{BMS_BLKMEM}), tree, blkmem)
end

function SCIPbtFree(tree)
    ccall((:SCIPbtFree, libscip), Cvoid, (Ptr{Ptr{SCIP_BT}},), tree)
end

function SCIPbtPrintGml(tree, file)
    ccall((:SCIPbtPrintGml, libscip), Cvoid, (Ptr{SCIP_BT}, Ptr{Libc.FILE}), tree, file)
end

function SCIPbtIsEmpty(tree)
    ccall((:SCIPbtIsEmpty, libscip), Cuint, (Ptr{SCIP_BT},), tree)
end

function SCIPbtGetRoot(tree)
    ccall((:SCIPbtGetRoot, libscip), Ptr{SCIP_BTNODE}, (Ptr{SCIP_BT},), tree)
end

function SCIPbtSetRoot(tree, root)
    ccall((:SCIPbtSetRoot, libscip), Cvoid, (Ptr{SCIP_BT}, Ptr{SCIP_BTNODE}), tree, root)
end

function SCIPdisjointsetClear(djset)
    ccall((:SCIPdisjointsetClear, libscip), Cvoid, (Ptr{SCIP_DISJOINTSET},), djset)
end

function SCIPdisjointsetFind(djset, element)
    ccall((:SCIPdisjointsetFind, libscip), Cint, (Ptr{SCIP_DISJOINTSET}, Cint), djset, element)
end

function SCIPdisjointsetUnion(djset, p, q, forcerepofp)
    ccall((:SCIPdisjointsetUnion, libscip), Cvoid, (Ptr{SCIP_DISJOINTSET}, Cint, Cint, Cuint), djset, p, q, forcerepofp)
end

function SCIPdisjointsetGetComponentCount(djset)
    ccall((:SCIPdisjointsetGetComponentCount, libscip), Cint, (Ptr{SCIP_DISJOINTSET},), djset)
end

function SCIPdisjointsetGetSize(djset)
    ccall((:SCIPdisjointsetGetSize, libscip), Cint, (Ptr{SCIP_DISJOINTSET},), djset)
end

function SCIPcalcMachineEpsilon()
    ccall((:SCIPcalcMachineEpsilon, libscip), Cdouble, ())
end

function SCIPnextafter(from, to)
    ccall((:SCIPnextafter, libscip), Cdouble, (Cdouble, Cdouble), from, to)
end

function SCIPcalcGreComDiv(val1, val2)
    ccall((:SCIPcalcGreComDiv, libscip), Clonglong, (Clonglong, Clonglong), val1, val2)
end

function SCIPcalcSmaComMul(val1, val2)
    ccall((:SCIPcalcSmaComMul, libscip), Clonglong, (Clonglong, Clonglong), val1, val2)
end

function SCIPcalcBinomCoef(n, m)
    ccall((:SCIPcalcBinomCoef, libscip), Clonglong, (Cint, Cint), n, m)
end

function SCIPrealToRational(val, mindelta, maxdelta, maxdnom, nominator, denominator)
    ccall((:SCIPrealToRational, libscip), Cuint, (Cdouble, Cdouble, Cdouble, Clonglong, Ptr{Clonglong}, Ptr{Clonglong}), val, mindelta, maxdelta, maxdnom, nominator, denominator)
end

function SCIPcalcIntegralScalar(vals, nvals, mindelta, maxdelta, maxdnom, maxscale, intscalar, success)
    ccall((:SCIPcalcIntegralScalar, libscip), SCIP_RETCODE, (Ptr{Cdouble}, Cint, Cdouble, Cdouble, Clonglong, Cdouble, Ptr{Cdouble}, Ptr{Cuint}), vals, nvals, mindelta, maxdelta, maxdnom, maxscale, intscalar, success)
end

function SCIPfindSimpleRational(lb, ub, maxdnom, nominator, denominator)
    ccall((:SCIPfindSimpleRational, libscip), Cuint, (Cdouble, Cdouble, Clonglong, Ptr{Clonglong}, Ptr{Clonglong}), lb, ub, maxdnom, nominator, denominator)
end

function SCIPselectSimpleValue(lb, ub, maxdnom)
    ccall((:SCIPselectSimpleValue, libscip), Cdouble, (Cdouble, Cdouble, Clonglong), lb, ub, maxdnom)
end

function SCIPrelDiff(val1, val2)
    ccall((:SCIPrelDiff, libscip), Cdouble, (Cdouble, Cdouble), val1, val2)
end

function SCIPcomputeGap(eps, inf, primalbound, dualbound)
    ccall((:SCIPcomputeGap, libscip), Cdouble, (Cdouble, Cdouble, Cdouble, Cdouble), eps, inf, primalbound, dualbound)
end

function SCIPgetRandomInt(minrandval, maxrandval, seedp)
    ccall((:SCIPgetRandomInt, libscip), Cint, (Cint, Cint, Ptr{Cuint}), minrandval, maxrandval, seedp)
end

function SCIPrandomGetInt(randgen, minrandval, maxrandval)
    ccall((:SCIPrandomGetInt, libscip), Cint, (Ptr{SCIP_RANDNUMGEN}, Cint, Cint), randgen, minrandval, maxrandval)
end

function SCIPrandomGetSubset(randgen, set, nelems, subset, nsubelems)
    ccall((:SCIPrandomGetSubset, libscip), SCIP_RETCODE, (Ptr{SCIP_RANDNUMGEN}, Ptr{Ptr{Cvoid}}, Cint, Ptr{Ptr{Cvoid}}, Cint), randgen, set, nelems, subset, nsubelems)
end

function SCIPrandomGetReal(randgen, minrandval, maxrandval)
    ccall((:SCIPrandomGetReal, libscip), Cdouble, (Ptr{SCIP_RANDNUMGEN}, Cdouble, Cdouble), randgen, minrandval, maxrandval)
end

function SCIPgetRandomReal(minrandval, maxrandval, seedp)
    ccall((:SCIPgetRandomReal, libscip), Cdouble, (Cdouble, Cdouble, Ptr{Cuint}), minrandval, maxrandval, seedp)
end

function SCIPgetRandomSubset(set, nelems, subset, nsubelems, randseed)
    ccall((:SCIPgetRandomSubset, libscip), SCIP_RETCODE, (Ptr{Ptr{Cvoid}}, Cint, Ptr{Ptr{Cvoid}}, Cint, Cuint), set, nelems, subset, nsubelems, randseed)
end

function SCIPswapInts(value1, value2)
    ccall((:SCIPswapInts, libscip), Cvoid, (Ptr{Cint}, Ptr{Cint}), value1, value2)
end

function SCIPswapReals(value1, value2)
    ccall((:SCIPswapReals, libscip), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}), value1, value2)
end

function SCIPswapPointers(pointer1, pointer2)
    ccall((:SCIPswapPointers, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}), pointer1, pointer2)
end

function SCIPpermuteIntArray(array, _begin, _end, randseed)
    ccall((:SCIPpermuteIntArray, libscip), Cvoid, (Ptr{Cint}, Cint, Cint, Ptr{Cuint}), array, _begin, _end, randseed)
end

function SCIPrandomPermuteIntArray(randgen, array, _begin, _end)
    ccall((:SCIPrandomPermuteIntArray, libscip), Cvoid, (Ptr{SCIP_RANDNUMGEN}, Ptr{Cint}, Cint, Cint), randgen, array, _begin, _end)
end

function SCIPrandomPermuteArray(randgen, array, _begin, _end)
    ccall((:SCIPrandomPermuteArray, libscip), Cvoid, (Ptr{SCIP_RANDNUMGEN}, Ptr{Ptr{Cvoid}}, Cint, Cint), randgen, array, _begin, _end)
end

function SCIPpermuteArray(array, _begin, _end, randseed)
    ccall((:SCIPpermuteArray, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Cint, Cint, Ptr{Cuint}), array, _begin, _end, randseed)
end

function SCIPcomputeArraysIntersection(array1, narray1, array2, narray2, intersectarray, nintersectarray)
    ccall((:SCIPcomputeArraysIntersection, libscip), SCIP_RETCODE, (Ptr{Cint}, Cint, Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Cint}), array1, narray1, array2, narray2, intersectarray, nintersectarray)
end

function SCIPcomputeArraysSetminus(array1, narray1, array2, narray2, setminusarray, nsetminusarray)
    ccall((:SCIPcomputeArraysSetminus, libscip), SCIP_RETCODE, (Ptr{Cint}, Cint, Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Cint}), array1, narray1, array2, narray2, setminusarray, nsetminusarray)
end

function SCIPmemccpy(dest, src, stop, cnt)
    ccall((:SCIPmemccpy, libscip), Cint, (Ptr{Cchar}, Ptr{Cchar}, Cchar, Cuint), dest, src, stop, cnt)
end

function SCIPprintSysError(message)
    ccall((:SCIPprintSysError, libscip), Cvoid, (Ptr{Cchar},), message)
end

function SCIPstrtok(s, delim, ptrptr)
    ccall((:SCIPstrtok, libscip), Ptr{Cchar}, (Ptr{Cchar}, Ptr{Cchar}, Ptr{Ptr{Cchar}}), s, delim, ptrptr)
end

function SCIPescapeString(t, bufsize, s)
    ccall((:SCIPescapeString, libscip), Cvoid, (Ptr{Cchar}, Cint, Ptr{Cchar}), t, bufsize, s)
end

function SCIPstrncpy(t, s, size)
    ccall((:SCIPstrncpy, libscip), Cint, (Ptr{Cchar}, Ptr{Cchar}, Cint), t, s, size)
end

function SCIPstrToIntValue(str, value, endptr)
    ccall((:SCIPstrToIntValue, libscip), Cuint, (Ptr{Cchar}, Ptr{Cint}, Ptr{Ptr{Cchar}}), str, value, endptr)
end

function SCIPstrToRealValue(str, value, endptr)
    ccall((:SCIPstrToRealValue, libscip), Cuint, (Ptr{Cchar}, Ptr{Cdouble}, Ptr{Ptr{Cchar}}), str, value, endptr)
end

function SCIPstrCopySection(str, startchar, endchar, token, size, endptr)
    ccall((:SCIPstrCopySection, libscip), Cvoid, (Ptr{Cchar}, Cchar, Cchar, Ptr{Cchar}, Cint, Ptr{Ptr{Cchar}}), str, startchar, endchar, token, size, endptr)
end

function SCIPstrAtStart(s, t, tlen)
    ccall((:SCIPstrAtStart, libscip), Cuint, (Ptr{Cchar}, Ptr{Cchar}, Csize_t), s, t, tlen)
end

function SCIPfileExists(filename)
    ccall((:SCIPfileExists, libscip), Cuint, (Ptr{Cchar},), filename)
end

function SCIPsplitFilename(filename, path, name, extension, compression)
    ccall((:SCIPsplitFilename, libscip), Cvoid, (Ptr{Cchar}, Ptr{Ptr{Cchar}}, Ptr{Ptr{Cchar}}, Ptr{Ptr{Cchar}}, Ptr{Ptr{Cchar}}), filename, path, name, extension, compression)
end

function SCIPnodeselGetName(nodesel)
    ccall((:SCIPnodeselGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_NODESEL},), nodesel)
end

function SCIPnodeselGetDesc(nodesel)
    ccall((:SCIPnodeselGetDesc, libscip), Ptr{Cchar}, (Ptr{SCIP_NODESEL},), nodesel)
end

function SCIPnodeselGetStdPriority(nodesel)
    ccall((:SCIPnodeselGetStdPriority, libscip), Cint, (Ptr{SCIP_NODESEL},), nodesel)
end

function SCIPnodeselGetMemsavePriority(nodesel)
    ccall((:SCIPnodeselGetMemsavePriority, libscip), Cint, (Ptr{SCIP_NODESEL},), nodesel)
end

function SCIPnodeselGetData(nodesel)
    ccall((:SCIPnodeselGetData, libscip), Ptr{SCIP_NODESELDATA}, (Ptr{SCIP_NODESEL},), nodesel)
end

function SCIPnodeselSetData(nodesel, nodeseldata)
    ccall((:SCIPnodeselSetData, libscip), Cvoid, (Ptr{SCIP_NODESEL}, Ptr{SCIP_NODESELDATA}), nodesel, nodeseldata)
end

function SCIPnodeselIsInitialized(nodesel)
    ccall((:SCIPnodeselIsInitialized, libscip), Cuint, (Ptr{SCIP_NODESEL},), nodesel)
end

function SCIPnodeselGetSetupTime(nodesel)
    ccall((:SCIPnodeselGetSetupTime, libscip), Cdouble, (Ptr{SCIP_NODESEL},), nodesel)
end

function SCIPnodeselGetTime(nodesel)
    ccall((:SCIPnodeselGetTime, libscip), Cdouble, (Ptr{SCIP_NODESEL},), nodesel)
end

function SCIPparamGetType(param)
    ccall((:SCIPparamGetType, libscip), SCIP_PARAMTYPE, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetName(param)
    ccall((:SCIPparamGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetDesc(param)
    ccall((:SCIPparamGetDesc, libscip), Ptr{Cchar}, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetData(param)
    ccall((:SCIPparamGetData, libscip), Ptr{SCIP_PARAMDATA}, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamIsAdvanced(param)
    ccall((:SCIPparamIsAdvanced, libscip), Cuint, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamIsFixed(param)
    ccall((:SCIPparamIsFixed, libscip), Cuint, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamSetFixed(param, fixed)
    ccall((:SCIPparamSetFixed, libscip), Cvoid, (Ptr{SCIP_PARAM}, Cuint), param, fixed)
end

function SCIPparamGetBool(param)
    ccall((:SCIPparamGetBool, libscip), Cuint, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetBoolDefault(param)
    ccall((:SCIPparamGetBoolDefault, libscip), Cuint, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetInt(param)
    ccall((:SCIPparamGetInt, libscip), Cint, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetIntMin(param)
    ccall((:SCIPparamGetIntMin, libscip), Cint, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetIntMax(param)
    ccall((:SCIPparamGetIntMax, libscip), Cint, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetIntDefault(param)
    ccall((:SCIPparamGetIntDefault, libscip), Cint, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetLongint(param)
    ccall((:SCIPparamGetLongint, libscip), Clonglong, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetLongintMin(param)
    ccall((:SCIPparamGetLongintMin, libscip), Clonglong, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetLongintMax(param)
    ccall((:SCIPparamGetLongintMax, libscip), Clonglong, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetLongintDefault(param)
    ccall((:SCIPparamGetLongintDefault, libscip), Clonglong, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetReal(param)
    ccall((:SCIPparamGetReal, libscip), Cdouble, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetRealMin(param)
    ccall((:SCIPparamGetRealMin, libscip), Cdouble, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetRealMax(param)
    ccall((:SCIPparamGetRealMax, libscip), Cdouble, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetRealDefault(param)
    ccall((:SCIPparamGetRealDefault, libscip), Cdouble, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetChar(param)
    ccall((:SCIPparamGetChar, libscip), Cchar, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetCharAllowedValues(param)
    ccall((:SCIPparamGetCharAllowedValues, libscip), Ptr{Cchar}, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetCharDefault(param)
    ccall((:SCIPparamGetCharDefault, libscip), Cchar, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetString(param)
    ccall((:SCIPparamGetString, libscip), Ptr{Cchar}, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamGetStringDefault(param)
    ccall((:SCIPparamGetStringDefault, libscip), Ptr{Cchar}, (Ptr{SCIP_PARAM},), param)
end

function SCIPparamIsDefault(param)
    ccall((:SCIPparamIsDefault, libscip), Cuint, (Ptr{SCIP_PARAM},), param)
end

function SCIPpresolComp(elem1, elem2)
    ccall((:SCIPpresolComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPpresolCompName(elem1, elem2)
    ccall((:SCIPpresolCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPpresolGetData(presol)
    ccall((:SCIPpresolGetData, libscip), Ptr{SCIP_PRESOLDATA}, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolSetData(presol, presoldata)
    ccall((:SCIPpresolSetData, libscip), Cvoid, (Ptr{SCIP_PRESOL}, Ptr{SCIP_PRESOLDATA}), presol, presoldata)
end

function SCIPpresolGetName(presol)
    ccall((:SCIPpresolGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetDesc(presol)
    ccall((:SCIPpresolGetDesc, libscip), Ptr{Cchar}, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetPriority(presol)
    ccall((:SCIPpresolGetPriority, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetMaxrounds(presol)
    ccall((:SCIPpresolGetMaxrounds, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetTiming(presol)
    ccall((:SCIPpresolGetTiming, libscip), SCIP_PRESOLTIMING, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolSetTiming(presol, timing)
    ccall((:SCIPpresolSetTiming, libscip), Cvoid, (Ptr{SCIP_PRESOL}, SCIP_PRESOLTIMING), presol, timing)
end

function SCIPpresolIsInitialized(presol)
    ccall((:SCIPpresolIsInitialized, libscip), Cuint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetSetupTime(presol)
    ccall((:SCIPpresolGetSetupTime, libscip), Cdouble, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetTime(presol)
    ccall((:SCIPpresolGetTime, libscip), Cdouble, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNFixedVars(presol)
    ccall((:SCIPpresolGetNFixedVars, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNAggrVars(presol)
    ccall((:SCIPpresolGetNAggrVars, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNChgVarTypes(presol)
    ccall((:SCIPpresolGetNChgVarTypes, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNChgBds(presol)
    ccall((:SCIPpresolGetNChgBds, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNAddHoles(presol)
    ccall((:SCIPpresolGetNAddHoles, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNDelConss(presol)
    ccall((:SCIPpresolGetNDelConss, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNAddConss(presol)
    ccall((:SCIPpresolGetNAddConss, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNUpgdConss(presol)
    ccall((:SCIPpresolGetNUpgdConss, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNChgCoefs(presol)
    ccall((:SCIPpresolGetNChgCoefs, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNChgSides(presol)
    ccall((:SCIPpresolGetNChgSides, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpresolGetNCalls(presol)
    ccall((:SCIPpresolGetNCalls, libscip), Cint, (Ptr{SCIP_PRESOL},), presol)
end

function SCIPpricerComp(elem1, elem2)
    ccall((:SCIPpricerComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPpricerCompName(elem1, elem2)
    ccall((:SCIPpricerCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPpricerGetData(pricer)
    ccall((:SCIPpricerGetData, libscip), Ptr{SCIP_PRICERDATA}, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerSetData(pricer, pricerdata)
    ccall((:SCIPpricerSetData, libscip), Cvoid, (Ptr{SCIP_PRICER}, Ptr{SCIP_PRICERDATA}), pricer, pricerdata)
end

function SCIPpricerGetName(pricer)
    ccall((:SCIPpricerGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerGetDesc(pricer)
    ccall((:SCIPpricerGetDesc, libscip), Ptr{Cchar}, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerGetPriority(pricer)
    ccall((:SCIPpricerGetPriority, libscip), Cint, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerGetNCalls(pricer)
    ccall((:SCIPpricerGetNCalls, libscip), Cint, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerGetNVarsFound(pricer)
    ccall((:SCIPpricerGetNVarsFound, libscip), Cint, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerGetSetupTime(pricer)
    ccall((:SCIPpricerGetSetupTime, libscip), Cdouble, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerGetTime(pricer)
    ccall((:SCIPpricerGetTime, libscip), Cdouble, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerIsActive(pricer)
    ccall((:SCIPpricerIsActive, libscip), Cuint, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerIsDelayed(pricer)
    ccall((:SCIPpricerIsDelayed, libscip), Cuint, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPpricerIsInitialized(pricer)
    ccall((:SCIPpricerIsInitialized, libscip), Cuint, (Ptr{SCIP_PRICER},), pricer)
end

function SCIPreaderGetData(reader)
    ccall((:SCIPreaderGetData, libscip), Ptr{SCIP_READERDATA}, (Ptr{SCIP_READER},), reader)
end

function SCIPreaderSetData(reader, readerdata)
    ccall((:SCIPreaderSetData, libscip), Cvoid, (Ptr{SCIP_READER}, Ptr{SCIP_READERDATA}), reader, readerdata)
end

function SCIPreaderGetName(reader)
    ccall((:SCIPreaderGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_READER},), reader)
end

function SCIPreaderGetDesc(reader)
    ccall((:SCIPreaderGetDesc, libscip), Ptr{Cchar}, (Ptr{SCIP_READER},), reader)
end

function SCIPreaderGetExtension(reader)
    ccall((:SCIPreaderGetExtension, libscip), Ptr{Cchar}, (Ptr{SCIP_READER},), reader)
end

function SCIPreaderCanRead(reader)
    ccall((:SCIPreaderCanRead, libscip), Cuint, (Ptr{SCIP_READER},), reader)
end

function SCIPreaderCanWrite(reader)
    ccall((:SCIPreaderCanWrite, libscip), Cuint, (Ptr{SCIP_READER},), reader)
end

function SCIPrelaxComp(elem1, elem2)
    ccall((:SCIPrelaxComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPrelaxCompName(elem1, elem2)
    ccall((:SCIPrelaxCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPrelaxGetData(relax)
    ccall((:SCIPrelaxGetData, libscip), Ptr{SCIP_RELAXDATA}, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxSetData(relax, relaxdata)
    ccall((:SCIPrelaxSetData, libscip), Cvoid, (Ptr{SCIP_RELAX}, Ptr{SCIP_RELAXDATA}), relax, relaxdata)
end

function SCIPrelaxGetName(relax)
    ccall((:SCIPrelaxGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxGetDesc(relax)
    ccall((:SCIPrelaxGetDesc, libscip), Ptr{Cchar}, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxGetPriority(relax)
    ccall((:SCIPrelaxGetPriority, libscip), Cint, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxGetFreq(relax)
    ccall((:SCIPrelaxGetFreq, libscip), Cint, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxGetSetupTime(relax)
    ccall((:SCIPrelaxGetSetupTime, libscip), Cdouble, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxGetTime(relax)
    ccall((:SCIPrelaxGetTime, libscip), Cdouble, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxGetNCalls(relax)
    ccall((:SCIPrelaxGetNCalls, libscip), Clonglong, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxGetNCutoffs(relax)
    ccall((:SCIPrelaxGetNCutoffs, libscip), Clonglong, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxGetNImprovedLowerbound(relax)
    ccall((:SCIPrelaxGetNImprovedLowerbound, libscip), Clonglong, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxGetImprovedLowerboundTime(relax)
    ccall((:SCIPrelaxGetImprovedLowerboundTime, libscip), Cdouble, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxGetNAddedConss(relax)
    ccall((:SCIPrelaxGetNAddedConss, libscip), Clonglong, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxGetNReducedDomains(relax)
    ccall((:SCIPrelaxGetNReducedDomains, libscip), Clonglong, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxGetNSeparatedCuts(relax)
    ccall((:SCIPrelaxGetNSeparatedCuts, libscip), Clonglong, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxIsInitialized(relax)
    ccall((:SCIPrelaxIsInitialized, libscip), Cuint, (Ptr{SCIP_RELAX},), relax)
end

function SCIPrelaxMarkUnsolved(relax)
    ccall((:SCIPrelaxMarkUnsolved, libscip), Cvoid, (Ptr{SCIP_RELAX},), relax)
end

function SCIPreoptnodeGetNVars(reoptnode)
    ccall((:SCIPreoptnodeGetNVars, libscip), Cint, (Ptr{SCIP_REOPTNODE},), reoptnode)
end

function SCIPreoptnodeGetNConss(reoptnode)
    ccall((:SCIPreoptnodeGetNConss, libscip), Cint, (Ptr{SCIP_REOPTNODE},), reoptnode)
end

function SCIPreoptnodeGetNDualBoundChgs(reoptnode)
    ccall((:SCIPreoptnodeGetNDualBoundChgs, libscip), Cint, (Ptr{SCIP_REOPTNODE},), reoptnode)
end

function SCIPreoptnodeGetNChildren(reoptnode)
    ccall((:SCIPreoptnodeGetNChildren, libscip), Cint, (Ptr{SCIP_REOPTNODE},), reoptnode)
end

function SCIPreoptnodeGetLowerbound(reoptnode)
    ccall((:SCIPreoptnodeGetLowerbound, libscip), Cdouble, (Ptr{SCIP_REOPTNODE},), reoptnode)
end

function SCIPreoptnodeGetType(reoptnode)
    ccall((:SCIPreoptnodeGetType, libscip), SCIP_REOPTTYPE, (Ptr{SCIP_REOPTNODE},), reoptnode)
end

function SCIPreoptnodeGetSplitCons(reoptnode, vars, vals, constype, conssize, nvars)
    ccall((:SCIPreoptnodeGetSplitCons, libscip), Cvoid, (Ptr{SCIP_REOPTNODE}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{REOPT_CONSTYPE}, Cint, Ptr{Cint}), reoptnode, vars, vals, constype, conssize, nvars)
end

function SCIPreoptnodeGetConss(reoptnode, vars, bounds, boundtypes, mem, nconss, nvars)
    ccall((:SCIPreoptnodeGetConss, libscip), Cvoid, (Ptr{SCIP_REOPTNODE}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{SCIP_BOUNDTYPE}}, Cint, Ptr{Cint}, Ptr{Cint}), reoptnode, vars, bounds, boundtypes, mem, nconss, nvars)
end

function SCIPreoptnodeSetParentID(reoptnode, parentid)
    ccall((:SCIPreoptnodeSetParentID, libscip), Cvoid, (Ptr{SCIP_REOPTNODE}, Cuint), reoptnode, parentid)
end

function SCIPreoptGetNRestartsGlobal(reopt)
    ccall((:SCIPreoptGetNRestartsGlobal, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNRestartsLocal(reopt)
    ccall((:SCIPreoptGetNRestartsLocal, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNTotalRestartsLocal(reopt)
    ccall((:SCIPreoptGetNTotalRestartsLocal, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetFirstRestarts(reopt)
    ccall((:SCIPreoptGetFirstRestarts, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetLastRestarts(reopt)
    ccall((:SCIPreoptGetLastRestarts, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNFeasNodes(reopt)
    ccall((:SCIPreoptGetNFeasNodes, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNTotalFeasNodes(reopt)
    ccall((:SCIPreoptGetNTotalFeasNodes, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNPrunedNodes(reopt)
    ccall((:SCIPreoptGetNPrunedNodes, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNTotalPrunedNodes(reopt)
    ccall((:SCIPreoptGetNTotalPrunedNodes, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNCutoffReoptnodes(reopt)
    ccall((:SCIPreoptGetNCutoffReoptnodes, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNTotalCutoffReoptnodes(reopt)
    ccall((:SCIPreoptGetNTotalCutoffReoptnodes, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNInfNodes(reopt)
    ccall((:SCIPreoptGetNInfNodes, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPreoptGetNTotalInfNodes(reopt)
    ccall((:SCIPreoptGetNTotalInfNodes, libscip), Cint, (Ptr{SCIP_REOPT},), reopt)
end

function SCIPsepaComp(elem1, elem2)
    ccall((:SCIPsepaComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPsepaCompName(elem1, elem2)
    ccall((:SCIPsepaCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPsepaGetData(sepa)
    ccall((:SCIPsepaGetData, libscip), Ptr{SCIP_SEPADATA}, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaSetData(sepa, sepadata)
    ccall((:SCIPsepaSetData, libscip), Cvoid, (Ptr{SCIP_SEPA}, Ptr{SCIP_SEPADATA}), sepa, sepadata)
end

function SCIPsepaGetName(sepa)
    ccall((:SCIPsepaGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetDesc(sepa)
    ccall((:SCIPsepaGetDesc, libscip), Ptr{Cchar}, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetPriority(sepa)
    ccall((:SCIPsepaGetPriority, libscip), Cint, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetFreq(sepa)
    ccall((:SCIPsepaGetFreq, libscip), Cint, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaSetFreq(sepa, freq)
    ccall((:SCIPsepaSetFreq, libscip), Cvoid, (Ptr{SCIP_SEPA}, Cint), sepa, freq)
end

function SCIPsepaGetMaxbounddist(sepa)
    ccall((:SCIPsepaGetMaxbounddist, libscip), Cdouble, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaUsesSubscip(sepa)
    ccall((:SCIPsepaUsesSubscip, libscip), Cuint, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetSetupTime(sepa)
    ccall((:SCIPsepaGetSetupTime, libscip), Cdouble, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetTime(sepa)
    ccall((:SCIPsepaGetTime, libscip), Cdouble, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetNCalls(sepa)
    ccall((:SCIPsepaGetNCalls, libscip), Clonglong, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetNCallsAtNode(sepa)
    ccall((:SCIPsepaGetNCallsAtNode, libscip), Cint, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetNCutoffs(sepa)
    ccall((:SCIPsepaGetNCutoffs, libscip), Clonglong, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetNCutsFound(sepa)
    ccall((:SCIPsepaGetNCutsFound, libscip), Clonglong, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetNCutsApplied(sepa)
    ccall((:SCIPsepaGetNCutsApplied, libscip), Clonglong, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetNCutsFoundAtNode(sepa)
    ccall((:SCIPsepaGetNCutsFoundAtNode, libscip), Clonglong, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetNConssFound(sepa)
    ccall((:SCIPsepaGetNConssFound, libscip), Clonglong, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaGetNDomredsFound(sepa)
    ccall((:SCIPsepaGetNDomredsFound, libscip), Clonglong, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaIsDelayed(sepa)
    ccall((:SCIPsepaIsDelayed, libscip), Cuint, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaWasLPDelayed(sepa)
    ccall((:SCIPsepaWasLPDelayed, libscip), Cuint, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaWasSolDelayed(sepa)
    ccall((:SCIPsepaWasSolDelayed, libscip), Cuint, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPsepaIsInitialized(sepa)
    ccall((:SCIPsepaIsInitialized, libscip), Cuint, (Ptr{SCIP_SEPA},), sepa)
end

function SCIPpropComp(elem1, elem2)
    ccall((:SCIPpropComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPpropCompPresol(elem1, elem2)
    ccall((:SCIPpropCompPresol, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPpropCompName(elem1, elem2)
    ccall((:SCIPpropCompName, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPpropGetData(prop)
    ccall((:SCIPpropGetData, libscip), Ptr{SCIP_PROPDATA}, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropSetData(prop, propdata)
    ccall((:SCIPpropSetData, libscip), Cvoid, (Ptr{SCIP_PROP}, Ptr{SCIP_PROPDATA}), prop, propdata)
end

function SCIPpropGetName(prop)
    ccall((:SCIPpropGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetDesc(prop)
    ccall((:SCIPpropGetDesc, libscip), Ptr{Cchar}, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetPriority(prop)
    ccall((:SCIPpropGetPriority, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetPresolPriority(prop)
    ccall((:SCIPpropGetPresolPriority, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetFreq(prop)
    ccall((:SCIPpropGetFreq, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetSetupTime(prop)
    ccall((:SCIPpropGetSetupTime, libscip), Cdouble, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropSetFreq(prop, freq)
    ccall((:SCIPpropSetFreq, libscip), Cvoid, (Ptr{SCIP_PROP}, Cint), prop, freq)
end

function SCIPpropGetTime(prop)
    ccall((:SCIPpropGetTime, libscip), Cdouble, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetStrongBranchPropTime(prop)
    ccall((:SCIPpropGetStrongBranchPropTime, libscip), Cdouble, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetRespropTime(prop)
    ccall((:SCIPpropGetRespropTime, libscip), Cdouble, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetPresolTime(prop)
    ccall((:SCIPpropGetPresolTime, libscip), Cdouble, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNCalls(prop)
    ccall((:SCIPpropGetNCalls, libscip), Clonglong, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNRespropCalls(prop)
    ccall((:SCIPpropGetNRespropCalls, libscip), Clonglong, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNCutoffs(prop)
    ccall((:SCIPpropGetNCutoffs, libscip), Clonglong, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNDomredsFound(prop)
    ccall((:SCIPpropGetNDomredsFound, libscip), Clonglong, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropIsDelayed(prop)
    ccall((:SCIPpropIsDelayed, libscip), Cuint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropWasDelayed(prop)
    ccall((:SCIPpropWasDelayed, libscip), Cuint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropIsInitialized(prop)
    ccall((:SCIPpropIsInitialized, libscip), Cuint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNFixedVars(prop)
    ccall((:SCIPpropGetNFixedVars, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNAggrVars(prop)
    ccall((:SCIPpropGetNAggrVars, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNChgVarTypes(prop)
    ccall((:SCIPpropGetNChgVarTypes, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNChgBds(prop)
    ccall((:SCIPpropGetNChgBds, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNAddHoles(prop)
    ccall((:SCIPpropGetNAddHoles, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNDelConss(prop)
    ccall((:SCIPpropGetNDelConss, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNAddConss(prop)
    ccall((:SCIPpropGetNAddConss, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNUpgdConss(prop)
    ccall((:SCIPpropGetNUpgdConss, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNChgCoefs(prop)
    ccall((:SCIPpropGetNChgCoefs, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNChgSides(prop)
    ccall((:SCIPpropGetNChgSides, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetNPresolCalls(prop)
    ccall((:SCIPpropGetNPresolCalls, libscip), Cint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetTimingmask(prop)
    ccall((:SCIPpropGetTimingmask, libscip), SCIP_PROPTIMING, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropDoesPresolve(prop)
    ccall((:SCIPpropDoesPresolve, libscip), Cuint, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropGetPresolTiming(prop)
    ccall((:SCIPpropGetPresolTiming, libscip), SCIP_PRESOLTIMING, (Ptr{SCIP_PROP},), prop)
end

function SCIPpropSetPresolTiming(prop, presoltiming)
    ccall((:SCIPpropSetPresolTiming, libscip), Cvoid, (Ptr{SCIP_PROP}, SCIP_PRESOLTIMING), prop, presoltiming)
end

function SCIPsolGetOrigin(sol)
    ccall((:SCIPsolGetOrigin, libscip), SCIP_SOLORIGIN, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolIsOriginal(sol)
    ccall((:SCIPsolIsOriginal, libscip), Cuint, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolIsPartial(sol)
    ccall((:SCIPsolIsPartial, libscip), Cuint, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetOrigObj(sol)
    ccall((:SCIPsolGetOrigObj, libscip), Cdouble, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetTime(sol)
    ccall((:SCIPsolGetTime, libscip), Cdouble, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetRunnum(sol)
    ccall((:SCIPsolGetRunnum, libscip), Cint, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetNodenum(sol)
    ccall((:SCIPsolGetNodenum, libscip), Clonglong, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetDepth(sol)
    ccall((:SCIPsolGetDepth, libscip), Cint, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetType(sol)
    ccall((:SCIPsolGetType, libscip), SCIP_SOLTYPE, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetHeur(sol)
    ccall((:SCIPsolGetHeur, libscip), Ptr{SCIP_HEUR}, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetRelax(sol)
    ccall((:SCIPsolGetRelax, libscip), Ptr{SCIP_RELAX}, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolSetHeur(sol, heur)
    ccall((:SCIPsolSetHeur, libscip), Cvoid, (Ptr{SCIP_SOL}, Ptr{SCIP_HEUR}), sol, heur)
end

function SCIPsolSetRelax(sol, relax)
    ccall((:SCIPsolSetRelax, libscip), Cvoid, (Ptr{SCIP_SOL}, Ptr{SCIP_RELAX}), sol, relax)
end

function SCIPsolSetLPRelaxation(sol)
    ccall((:SCIPsolSetLPRelaxation, libscip), Cvoid, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolSetStrongbranching(sol)
    ccall((:SCIPsolSetStrongbranching, libscip), Cvoid, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolSetPseudo(sol)
    ccall((:SCIPsolSetPseudo, libscip), Cvoid, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetIndex(sol)
    ccall((:SCIPsolGetIndex, libscip), Cint, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetAbsBoundViolation(sol)
    ccall((:SCIPsolGetAbsBoundViolation, libscip), Cdouble, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetRelBoundViolation(sol)
    ccall((:SCIPsolGetRelBoundViolation, libscip), Cdouble, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetAbsIntegralityViolation(sol)
    ccall((:SCIPsolGetAbsIntegralityViolation, libscip), Cdouble, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetAbsLPRowViolation(sol)
    ccall((:SCIPsolGetAbsLPRowViolation, libscip), Cdouble, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetRelLPRowViolation(sol)
    ccall((:SCIPsolGetRelLPRowViolation, libscip), Cdouble, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetAbsConsViolation(sol)
    ccall((:SCIPsolGetAbsConsViolation, libscip), Cdouble, (Ptr{SCIP_SOL},), sol)
end

function SCIPsolGetRelConsViolation(sol)
    ccall((:SCIPsolGetRelConsViolation, libscip), Cdouble, (Ptr{SCIP_SOL},), sol)
end

function SCIPtableGetData(table)
    ccall((:SCIPtableGetData, libscip), Ptr{SCIP_TABLEDATA}, (Ptr{SCIP_TABLE},), table)
end

function SCIPtableSetData(table, tabledata)
    ccall((:SCIPtableSetData, libscip), Cvoid, (Ptr{SCIP_TABLE}, Ptr{SCIP_TABLEDATA}), table, tabledata)
end

function SCIPtableGetName(table)
    ccall((:SCIPtableGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_TABLE},), table)
end

function SCIPtableGetDesc(table)
    ccall((:SCIPtableGetDesc, libscip), Ptr{Cchar}, (Ptr{SCIP_TABLE},), table)
end

function SCIPtableGetPosition(table)
    ccall((:SCIPtableGetPosition, libscip), Cint, (Ptr{SCIP_TABLE},), table)
end

function SCIPtableGetEarliestStage(table)
    ccall((:SCIPtableGetEarliestStage, libscip), SCIP_STAGE, (Ptr{SCIP_TABLE},), table)
end

function SCIPtableIsActive(table)
    ccall((:SCIPtableIsActive, libscip), Cuint, (Ptr{SCIP_TABLE},), table)
end

function SCIPtableIsInitialized(table)
    ccall((:SCIPtableIsInitialized, libscip), Cuint, (Ptr{SCIP_TABLE},), table)
end

function SCIPnodeCompLowerbound(elem1, elem2)
    ccall((:SCIPnodeCompLowerbound, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPnodeGetParentBranchings(node, branchvars, branchbounds, boundtypes, nbranchvars, branchvarssize)
    ccall((:SCIPnodeGetParentBranchings, libscip), Cvoid, (Ptr{SCIP_NODE}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{SCIP_BOUNDTYPE}, Ptr{Cint}, Cint), node, branchvars, branchbounds, boundtypes, nbranchvars, branchvarssize)
end

function SCIPnodeGetAncestorBranchings(node, branchvars, branchbounds, boundtypes, nbranchvars, branchvarssize)
    ccall((:SCIPnodeGetAncestorBranchings, libscip), Cvoid, (Ptr{SCIP_NODE}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{SCIP_BOUNDTYPE}, Ptr{Cint}, Cint), node, branchvars, branchbounds, boundtypes, nbranchvars, branchvarssize)
end

function SCIPnodeGetAncestorBranchingsPart(node, parent, branchvars, branchbounds, boundtypes, nbranchvars, branchvarssize)
    ccall((:SCIPnodeGetAncestorBranchingsPart, libscip), Cvoid, (Ptr{SCIP_NODE}, Ptr{SCIP_NODE}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{SCIP_BOUNDTYPE}, Ptr{Cint}, Cint), node, parent, branchvars, branchbounds, boundtypes, nbranchvars, branchvarssize)
end

function SCIPnodePrintAncestorBranchings(node, file)
    ccall((:SCIPnodePrintAncestorBranchings, libscip), SCIP_RETCODE, (Ptr{SCIP_NODE}, Ptr{Libc.FILE}), node, file)
end

function SCIPnodeGetAncestorBranchingPath(node, branchvars, branchbounds, boundtypes, nbranchvars, branchvarssize, nodeswitches, nnodes, nodeswitchsize)
    ccall((:SCIPnodeGetAncestorBranchingPath, libscip), Cvoid, (Ptr{SCIP_NODE}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{SCIP_BOUNDTYPE}, Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Cint}, Cint), node, branchvars, branchbounds, boundtypes, nbranchvars, branchvarssize, nodeswitches, nnodes, nodeswitchsize)
end

function SCIPnodesSharePath(node1, node2)
    ccall((:SCIPnodesSharePath, libscip), Cuint, (Ptr{SCIP_NODE}, Ptr{SCIP_NODE}), node1, node2)
end

function SCIPnodesGetCommonAncestor(node1, node2)
    ccall((:SCIPnodesGetCommonAncestor, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP_NODE}, Ptr{SCIP_NODE}), node1, node2)
end

function SCIPnodeGetType(node)
    ccall((:SCIPnodeGetType, libscip), SCIP_NODETYPE, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeGetNumber(node)
    ccall((:SCIPnodeGetNumber, libscip), Clonglong, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeGetDepth(node)
    ccall((:SCIPnodeGetDepth, libscip), Cint, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeGetLowerbound(node)
    ccall((:SCIPnodeGetLowerbound, libscip), Cdouble, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeGetEstimate(node)
    ccall((:SCIPnodeGetEstimate, libscip), Cdouble, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeGetReopttype(node)
    ccall((:SCIPnodeGetReopttype, libscip), SCIP_REOPTTYPE, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeGetReoptID(node)
    ccall((:SCIPnodeGetReoptID, libscip), Cuint, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeSetReopttype(node, reopttype)
    ccall((:SCIPnodeSetReopttype, libscip), Cvoid, (Ptr{SCIP_NODE}, SCIP_REOPTTYPE), node, reopttype)
end

function SCIPnodeSetReoptID(node, id)
    ccall((:SCIPnodeSetReoptID, libscip), Cvoid, (Ptr{SCIP_NODE}, Cuint), node, id)
end

function SCIPnodeGetNDomchg(node, nbranchings, nconsprop, nprop)
    ccall((:SCIPnodeGetNDomchg, libscip), Cvoid, (Ptr{SCIP_NODE}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), node, nbranchings, nconsprop, nprop)
end

function SCIPnodeGetDomchg(node)
    ccall((:SCIPnodeGetDomchg, libscip), Ptr{SCIP_DOMCHG}, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeGetParent(node)
    ccall((:SCIPnodeGetParent, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeGetAddedConss(node, addedconss, naddedconss, addedconsssize)
    ccall((:SCIPnodeGetAddedConss, libscip), Cvoid, (Ptr{SCIP_NODE}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cint}, Cint), node, addedconss, naddedconss, addedconsssize)
end

function SCIPnodeGetNAddedConss(node)
    ccall((:SCIPnodeGetNAddedConss, libscip), Cint, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeIsActive(node)
    ccall((:SCIPnodeIsActive, libscip), Cuint, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeIsPropagatedAgain(node)
    ccall((:SCIPnodeIsPropagatedAgain, libscip), Cuint, (Ptr{SCIP_NODE},), node)
end

function SCIPnodeGetConssetchg(node)
    ccall((:SCIPnodeGetConssetchg, libscip), Ptr{SCIP_CONSSETCHG}, (Ptr{SCIP_NODE},), node)
end

function SCIPvarGetNLocksDown(var)
    ccall((:SCIPvarGetNLocksDown, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNLocksUp(var)
    ccall((:SCIPvarGetNLocksUp, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNLocksUpType(var, locktype)
    ccall((:SCIPvarGetNLocksUpType, libscip), Cint, (Ptr{SCIP_VAR}, SCIP_LOCKTYPE), var, locktype)
end

function SCIPvarGetNLocksDownType(var, locktype)
    ccall((:SCIPvarGetNLocksDownType, libscip), Cint, (Ptr{SCIP_VAR}, SCIP_LOCKTYPE), var, locktype)
end

function SCIPvarMayRoundDown(var)
    ccall((:SCIPvarMayRoundDown, libscip), Cuint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarMayRoundUp(var)
    ccall((:SCIPvarMayRoundUp, libscip), Cuint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarCompareActiveAndNegated(var1, var2)
    ccall((:SCIPvarCompareActiveAndNegated, libscip), Cint, (Ptr{SCIP_VAR}, Ptr{SCIP_VAR}), var1, var2)
end

function SCIPvarCompActiveAndNegated(elem1, elem2)
    ccall((:SCIPvarCompActiveAndNegated, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPvarCompare(var1, var2)
    ccall((:SCIPvarCompare, libscip), Cint, (Ptr{SCIP_VAR}, Ptr{SCIP_VAR}), var1, var2)
end

function SCIPvarComp(elem1, elem2)
    ccall((:SCIPvarComp, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPvarCompObj(elem1, elem2)
    ccall((:SCIPvarCompObj, libscip), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), elem1, elem2)
end

function SCIPvarGetHashkey(userptr, elem)
    ccall((:SCIPvarGetHashkey, libscip), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}), userptr, elem)
end

function SCIPvarIsHashkeyEq(userptr, key1, key2)
    ccall((:SCIPvarIsHashkeyEq, libscip), Cuint, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), userptr, key1, key2)
end

function SCIPvarGetHashkeyVal(userptr, key)
    ccall((:SCIPvarGetHashkeyVal, libscip), UInt64, (Ptr{Cvoid}, Ptr{Cvoid}), userptr, key)
end

function SCIPvarsGetProbvar(vars, nvars)
    ccall((:SCIPvarsGetProbvar, libscip), Cvoid, (Ptr{Ptr{SCIP_VAR}}, Cint), vars, nvars)
end

function SCIPvarGetProbvar(var)
    ccall((:SCIPvarGetProbvar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarsGetProbvarBinary(vars, negatedarr, nvars)
    ccall((:SCIPvarsGetProbvarBinary, libscip), SCIP_RETCODE, (Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{Cuint}}, Cint), vars, negatedarr, nvars)
end

function SCIPvarGetProbvarBinary(var, negated)
    ccall((:SCIPvarGetProbvarBinary, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_VAR}}, Ptr{Cuint}), var, negated)
end

function SCIPvarGetProbvarBound(var, bound, boundtype)
    ccall((:SCIPvarGetProbvarBound, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{SCIP_BOUNDTYPE}), var, bound, boundtype)
end

function SCIPvarGetProbvarHole(var, left, right)
    ccall((:SCIPvarGetProbvarHole, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cdouble}), var, left, right)
end

function SCIPvarGetOrigvarSum(var, scalar, constant)
    ccall((:SCIPvarGetOrigvarSum, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cdouble}), var, scalar, constant)
end

function SCIPvarIsTransformedOrigvar(var)
    ccall((:SCIPvarIsTransformedOrigvar, libscip), Cuint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNBranchings(var, dir)
    ccall((:SCIPvarGetNBranchings, libscip), Clonglong, (Ptr{SCIP_VAR}, SCIP_BRANCHDIR), var, dir)
end

function SCIPvarGetNBranchingsCurrentRun(var, dir)
    ccall((:SCIPvarGetNBranchingsCurrentRun, libscip), Clonglong, (Ptr{SCIP_VAR}, SCIP_BRANCHDIR), var, dir)
end

function SCIPvarGetInferenceSum(var, dir)
    ccall((:SCIPvarGetInferenceSum, libscip), Cdouble, (Ptr{SCIP_VAR}, SCIP_BRANCHDIR), var, dir)
end

function SCIPvarGetInferenceSumCurrentRun(var, dir)
    ccall((:SCIPvarGetInferenceSumCurrentRun, libscip), Cdouble, (Ptr{SCIP_VAR}, SCIP_BRANCHDIR), var, dir)
end

function SCIPvarGetCutoffSum(var, dir)
    ccall((:SCIPvarGetCutoffSum, libscip), Cdouble, (Ptr{SCIP_VAR}, SCIP_BRANCHDIR), var, dir)
end

function SCIPvarGetCutoffSumCurrentRun(var, dir)
    ccall((:SCIPvarGetCutoffSumCurrentRun, libscip), Cdouble, (Ptr{SCIP_VAR}, SCIP_BRANCHDIR), var, dir)
end

function SCIPvarGetAvgBranchdepth(var, dir)
    ccall((:SCIPvarGetAvgBranchdepth, libscip), Cdouble, (Ptr{SCIP_VAR}, SCIP_BRANCHDIR), var, dir)
end

function SCIPvarGetAvgBranchdepthCurrentRun(var, dir)
    ccall((:SCIPvarGetAvgBranchdepthCurrentRun, libscip), Cdouble, (Ptr{SCIP_VAR}, SCIP_BRANCHDIR), var, dir)
end

function SCIPvarHasImplic(var, varfixing, implvar, impltype)
    ccall((:SCIPvarHasImplic, libscip), Cuint, (Ptr{SCIP_VAR}, Cuint, Ptr{SCIP_VAR}, SCIP_BOUNDTYPE), var, varfixing, implvar, impltype)
end

function SCIPvarHasBinaryImplic(var, varfixing, implvar, implvarfixing)
    ccall((:SCIPvarHasBinaryImplic, libscip), Cuint, (Ptr{SCIP_VAR}, Cuint, Ptr{SCIP_VAR}, Cuint), var, varfixing, implvar, implvarfixing)
end

function SCIPvarsHaveCommonClique(var1, value1, var2, value2, regardimplics)
    ccall((:SCIPvarsHaveCommonClique, libscip), Cuint, (Ptr{SCIP_VAR}, Cuint, Ptr{SCIP_VAR}, Cuint, Cuint), var1, value1, var2, value2, regardimplics)
end

function SCIPvarGetAggregatedObj(var, aggrobj)
    ccall((:SCIPvarGetAggregatedObj, libscip), SCIP_RETCODE, (Ptr{SCIP_VAR}, Ptr{Cdouble}), var, aggrobj)
end

function SCIPvarSetInitial(var, initial)
    ccall((:SCIPvarSetInitial, libscip), SCIP_RETCODE, (Ptr{SCIP_VAR}, Cuint), var, initial)
end

function SCIPvarSetRemovable(var, removable)
    ccall((:SCIPvarSetRemovable, libscip), SCIP_RETCODE, (Ptr{SCIP_VAR}, Cuint), var, removable)
end

function SCIPvarGetName(var)
    ccall((:SCIPvarGetName, libscip), Ptr{Cchar}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNUses(var)
    ccall((:SCIPvarGetNUses, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetData(var)
    ccall((:SCIPvarGetData, libscip), Ptr{SCIP_VARDATA}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarSetData(var, vardata)
    ccall((:SCIPvarSetData, libscip), Cvoid, (Ptr{SCIP_VAR}, Ptr{SCIP_VARDATA}), var, vardata)
end

function SCIPvarSetDelorigData(var, vardelorig)
    ccall((:SCIPvarSetDelorigData, libscip), Cvoid, (Ptr{SCIP_VAR}, Ptr{Cvoid}), var, vardelorig)
end

function SCIPvarSetTransData(var, vartrans)
    ccall((:SCIPvarSetTransData, libscip), Cvoid, (Ptr{SCIP_VAR}, Ptr{Cvoid}), var, vartrans)
end

function SCIPvarSetDeltransData(var, vardeltrans)
    ccall((:SCIPvarSetDeltransData, libscip), Cvoid, (Ptr{SCIP_VAR}, Ptr{Cvoid}), var, vardeltrans)
end

function SCIPvarSetCopyData(var, varcopy)
    ccall((:SCIPvarSetCopyData, libscip), Cvoid, (Ptr{SCIP_VAR}, Ptr{Cvoid}), var, varcopy)
end

function SCIPvarGetStatus(var)
    ccall((:SCIPvarGetStatus, libscip), SCIP_VARSTATUS, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsOriginal(var)
    ccall((:SCIPvarIsOriginal, libscip), Cuint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsTransformed(var)
    ccall((:SCIPvarIsTransformed, libscip), Cuint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsNegated(var)
    ccall((:SCIPvarIsNegated, libscip), Cuint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetType(var)
    ccall((:SCIPvarGetType, libscip), SCIP_VARTYPE, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsBinary(var)
    ccall((:SCIPvarIsBinary, libscip), Cuint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsIntegral(var)
    ccall((:SCIPvarIsIntegral, libscip), Cuint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsInitial(var)
    ccall((:SCIPvarIsInitial, libscip), Cuint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsRemovable(var)
    ccall((:SCIPvarIsRemovable, libscip), Cuint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsDeleted(var)
    ccall((:SCIPvarIsDeleted, libscip), Cuint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarMarkDeletable(var)
    ccall((:SCIPvarMarkDeletable, libscip), Cvoid, (Ptr{SCIP_VAR},), var)
end

function SCIPvarMarkNotDeletable(var)
    ccall((:SCIPvarMarkNotDeletable, libscip), Cvoid, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsDeletable(var)
    ccall((:SCIPvarIsDeletable, libscip), Cuint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarMarkDeleteGlobalStructures(var)
    ccall((:SCIPvarMarkDeleteGlobalStructures, libscip), Cvoid, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsActive(var)
    ccall((:SCIPvarIsActive, libscip), Cuint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetIndex(var)
    ccall((:SCIPvarGetIndex, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetProbindex(var)
    ccall((:SCIPvarGetProbindex, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetTransVar(var)
    ccall((:SCIPvarGetTransVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetCol(var)
    ccall((:SCIPvarGetCol, libscip), Ptr{SCIP_COL}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsInLP(var)
    ccall((:SCIPvarIsInLP, libscip), Cuint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetAggrVar(var)
    ccall((:SCIPvarGetAggrVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetAggrScalar(var)
    ccall((:SCIPvarGetAggrScalar, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetAggrConstant(var)
    ccall((:SCIPvarGetAggrConstant, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetMultaggrNVars(var)
    ccall((:SCIPvarGetMultaggrNVars, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetMultaggrVars(var)
    ccall((:SCIPvarGetMultaggrVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetMultaggrScalars(var)
    ccall((:SCIPvarGetMultaggrScalars, libscip), Ptr{Cdouble}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetMultaggrConstant(var)
    ccall((:SCIPvarGetMultaggrConstant, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNegatedVar(var)
    ccall((:SCIPvarGetNegatedVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNegationVar(var)
    ccall((:SCIPvarGetNegationVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNegationConstant(var)
    ccall((:SCIPvarGetNegationConstant, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetObj(var)
    ccall((:SCIPvarGetObj, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetUnchangedObj(var)
    ccall((:SCIPvarGetUnchangedObj, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetLbOriginal(var)
    ccall((:SCIPvarGetLbOriginal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetUbOriginal(var)
    ccall((:SCIPvarGetUbOriginal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetHolelistOriginal(var)
    ccall((:SCIPvarGetHolelistOriginal, libscip), Ptr{SCIP_HOLELIST}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetLbGlobal(var)
    ccall((:SCIPvarGetLbGlobal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetUbGlobal(var)
    ccall((:SCIPvarGetUbGlobal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetHolelistGlobal(var)
    ccall((:SCIPvarGetHolelistGlobal, libscip), Ptr{SCIP_HOLELIST}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBestBoundGlobal(var)
    ccall((:SCIPvarGetBestBoundGlobal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetWorstBoundGlobal(var)
    ccall((:SCIPvarGetWorstBoundGlobal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetLbLocal(var)
    ccall((:SCIPvarGetLbLocal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetUbLocal(var)
    ccall((:SCIPvarGetUbLocal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetHolelistLocal(var)
    ccall((:SCIPvarGetHolelistLocal, libscip), Ptr{SCIP_HOLELIST}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBestBoundLocal(var)
    ccall((:SCIPvarGetBestBoundLocal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetWorstBoundLocal(var)
    ccall((:SCIPvarGetWorstBoundLocal, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBestBoundType(var)
    ccall((:SCIPvarGetBestBoundType, libscip), SCIP_BOUNDTYPE, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetWorstBoundType(var)
    ccall((:SCIPvarGetWorstBoundType, libscip), SCIP_BOUNDTYPE, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetLbLazy(var)
    ccall((:SCIPvarGetLbLazy, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetUbLazy(var)
    ccall((:SCIPvarGetUbLazy, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBranchFactor(var)
    ccall((:SCIPvarGetBranchFactor, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBranchPriority(var)
    ccall((:SCIPvarGetBranchPriority, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBranchDirection(var)
    ccall((:SCIPvarGetBranchDirection, libscip), SCIP_BRANCHDIR, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNVlbs(var)
    ccall((:SCIPvarGetNVlbs, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetVlbVars(var)
    ccall((:SCIPvarGetVlbVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetVlbCoefs(var)
    ccall((:SCIPvarGetVlbCoefs, libscip), Ptr{Cdouble}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetVlbConstants(var)
    ccall((:SCIPvarGetVlbConstants, libscip), Ptr{Cdouble}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNVubs(var)
    ccall((:SCIPvarGetNVubs, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetVubVars(var)
    ccall((:SCIPvarGetVubVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetVubCoefs(var)
    ccall((:SCIPvarGetVubCoefs, libscip), Ptr{Cdouble}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetVubConstants(var)
    ccall((:SCIPvarGetVubConstants, libscip), Ptr{Cdouble}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNImpls(var, varfixing)
    ccall((:SCIPvarGetNImpls, libscip), Cint, (Ptr{SCIP_VAR}, Cuint), var, varfixing)
end

function SCIPvarGetImplVars(var, varfixing)
    ccall((:SCIPvarGetImplVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP_VAR}, Cuint), var, varfixing)
end

function SCIPvarGetImplTypes(var, varfixing)
    ccall((:SCIPvarGetImplTypes, libscip), Ptr{SCIP_BOUNDTYPE}, (Ptr{SCIP_VAR}, Cuint), var, varfixing)
end

function SCIPvarGetImplBounds(var, varfixing)
    ccall((:SCIPvarGetImplBounds, libscip), Ptr{Cdouble}, (Ptr{SCIP_VAR}, Cuint), var, varfixing)
end

function SCIPvarGetImplIds(var, varfixing)
    ccall((:SCIPvarGetImplIds, libscip), Ptr{Cint}, (Ptr{SCIP_VAR}, Cuint), var, varfixing)
end

function SCIPvarGetNCliques(var, varfixing)
    ccall((:SCIPvarGetNCliques, libscip), Cint, (Ptr{SCIP_VAR}, Cuint), var, varfixing)
end

function SCIPvarGetCliques(var, varfixing)
    ccall((:SCIPvarGetCliques, libscip), Ptr{Ptr{SCIP_CLIQUE}}, (Ptr{SCIP_VAR}, Cuint), var, varfixing)
end

function SCIPvarGetLPSol(var)
    ccall((:SCIPvarGetLPSol, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNLPSol(var)
    ccall((:SCIPvarGetNLPSol, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBdchgInfoLb(var, pos)
    ccall((:SCIPvarGetBdchgInfoLb, libscip), Ptr{SCIP_BDCHGINFO}, (Ptr{SCIP_VAR}, Cint), var, pos)
end

function SCIPvarGetNBdchgInfosLb(var)
    ccall((:SCIPvarGetNBdchgInfosLb, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBdchgInfoUb(var, pos)
    ccall((:SCIPvarGetBdchgInfoUb, libscip), Ptr{SCIP_BDCHGINFO}, (Ptr{SCIP_VAR}, Cint), var, pos)
end

function SCIPvarGetNBdchgInfosUb(var)
    ccall((:SCIPvarGetNBdchgInfosUb, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetValuehistory(var)
    ccall((:SCIPvarGetValuehistory, libscip), Ptr{SCIP_VALUEHISTORY}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarIsRelaxationOnly(var)
    ccall((:SCIPvarIsRelaxationOnly, libscip), Cuint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarMarkRelaxationOnly(var)
    ccall((:SCIPvarMarkRelaxationOnly, libscip), Cvoid, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetLPSol_rec(var)
    ccall((:SCIPvarGetLPSol_rec, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetNLPSol_rec(var)
    ccall((:SCIPvarGetNLPSol_rec, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetPseudoSol(var)
    ccall((:SCIPvarGetPseudoSol, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetSol(var, getlpval)
    ccall((:SCIPvarGetSol, libscip), Cdouble, (Ptr{SCIP_VAR}, Cuint), var, getlpval)
end

function SCIPvarGetRootSol(var)
    ccall((:SCIPvarGetRootSol, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBestRootSol(var)
    ccall((:SCIPvarGetBestRootSol, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBestRootRedcost(var)
    ccall((:SCIPvarGetBestRootRedcost, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetBestRootLPObjval(var)
    ccall((:SCIPvarGetBestRootLPObjval, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarSetBestRootSol(var, rootsol, rootredcost, rootlpobjval)
    ccall((:SCIPvarSetBestRootSol, libscip), Cvoid, (Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble), var, rootsol, rootredcost, rootlpobjval)
end

function SCIPvarGetAvgSol(var)
    ccall((:SCIPvarGetAvgSol, libscip), Cdouble, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetLbchgInfo(var, bdchgidx, after)
    ccall((:SCIPvarGetLbchgInfo, libscip), Ptr{SCIP_BDCHGINFO}, (Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, Cuint), var, bdchgidx, after)
end

function SCIPvarGetUbchgInfo(var, bdchgidx, after)
    ccall((:SCIPvarGetUbchgInfo, libscip), Ptr{SCIP_BDCHGINFO}, (Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, Cuint), var, bdchgidx, after)
end

function SCIPvarGetBdchgInfo(var, boundtype, bdchgidx, after)
    ccall((:SCIPvarGetBdchgInfo, libscip), Ptr{SCIP_BDCHGINFO}, (Ptr{SCIP_VAR}, SCIP_BOUNDTYPE, Ptr{SCIP_BDCHGIDX}, Cuint), var, boundtype, bdchgidx, after)
end

function SCIPvarGetLbAtIndex(var, bdchgidx, after)
    ccall((:SCIPvarGetLbAtIndex, libscip), Cdouble, (Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, Cuint), var, bdchgidx, after)
end

function SCIPvarGetUbAtIndex(var, bdchgidx, after)
    ccall((:SCIPvarGetUbAtIndex, libscip), Cdouble, (Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, Cuint), var, bdchgidx, after)
end

function SCIPvarGetBdAtIndex(var, boundtype, bdchgidx, after)
    ccall((:SCIPvarGetBdAtIndex, libscip), Cdouble, (Ptr{SCIP_VAR}, SCIP_BOUNDTYPE, Ptr{SCIP_BDCHGIDX}, Cuint), var, boundtype, bdchgidx, after)
end

function SCIPvarWasFixedAtIndex(var, bdchgidx, after)
    ccall((:SCIPvarWasFixedAtIndex, libscip), Cuint, (Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, Cuint), var, bdchgidx, after)
end

function SCIPvarGetLastBdchgIndex(var)
    ccall((:SCIPvarGetLastBdchgIndex, libscip), Ptr{SCIP_BDCHGIDX}, (Ptr{SCIP_VAR},), var)
end

function SCIPvarGetLastBdchgDepth(var)
    ccall((:SCIPvarGetLastBdchgDepth, libscip), Cint, (Ptr{SCIP_VAR},), var)
end

function SCIPvarWasFixedEarlier(var1, var2)
    ccall((:SCIPvarWasFixedEarlier, libscip), Cuint, (Ptr{SCIP_VAR}, Ptr{SCIP_VAR}), var1, var2)
end

function SCIPbdchgidxIsEarlier(bdchgidx1, bdchgidx2)
    ccall((:SCIPbdchgidxIsEarlier, libscip), Cuint, (Ptr{SCIP_BDCHGIDX}, Ptr{SCIP_BDCHGIDX}), bdchgidx1, bdchgidx2)
end

function SCIPbdchgidxIsEarlierNonNull(bdchgidx1, bdchgidx2)
    ccall((:SCIPbdchgidxIsEarlierNonNull, libscip), Cuint, (Ptr{SCIP_BDCHGIDX}, Ptr{SCIP_BDCHGIDX}), bdchgidx1, bdchgidx2)
end

function SCIPbdchginfoGetOldbound(bdchginfo)
    ccall((:SCIPbdchginfoGetOldbound, libscip), Cdouble, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetNewbound(bdchginfo)
    ccall((:SCIPbdchginfoGetNewbound, libscip), Cdouble, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetVar(bdchginfo)
    ccall((:SCIPbdchginfoGetVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetChgtype(bdchginfo)
    ccall((:SCIPbdchginfoGetChgtype, libscip), SCIP_BOUNDCHGTYPE, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetBoundtype(bdchginfo)
    ccall((:SCIPbdchginfoGetBoundtype, libscip), SCIP_BOUNDTYPE, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetDepth(bdchginfo)
    ccall((:SCIPbdchginfoGetDepth, libscip), Cint, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetPos(bdchginfo)
    ccall((:SCIPbdchginfoGetPos, libscip), Cint, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetIdx(bdchginfo)
    ccall((:SCIPbdchginfoGetIdx, libscip), Ptr{SCIP_BDCHGIDX}, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetInferVar(bdchginfo)
    ccall((:SCIPbdchginfoGetInferVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetInferCons(bdchginfo)
    ccall((:SCIPbdchginfoGetInferCons, libscip), Ptr{SCIP_CONS}, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetInferProp(bdchginfo)
    ccall((:SCIPbdchginfoGetInferProp, libscip), Ptr{SCIP_PROP}, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetInferInfo(bdchginfo)
    ccall((:SCIPbdchginfoGetInferInfo, libscip), Cint, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoGetInferBoundtype(bdchginfo)
    ccall((:SCIPbdchginfoGetInferBoundtype, libscip), SCIP_BOUNDTYPE, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoIsRedundant(bdchginfo)
    ccall((:SCIPbdchginfoIsRedundant, libscip), Cuint, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoHasInferenceReason(bdchginfo)
    ccall((:SCIPbdchginfoHasInferenceReason, libscip), Cuint, (Ptr{SCIP_BDCHGINFO},), bdchginfo)
end

function SCIPbdchginfoIsTighter(bdchginfo1, bdchginfo2)
    ccall((:SCIPbdchginfoIsTighter, libscip), Cuint, (Ptr{SCIP_BDCHGINFO}, Ptr{SCIP_BDCHGINFO}), bdchginfo1, bdchginfo2)
end

function SCIPboundchgGetNewbound(boundchg)
    ccall((:SCIPboundchgGetNewbound, libscip), Cdouble, (Ptr{SCIP_BOUNDCHG},), boundchg)
end

function SCIPboundchgGetVar(boundchg)
    ccall((:SCIPboundchgGetVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_BOUNDCHG},), boundchg)
end

function SCIPboundchgGetBoundchgtype(boundchg)
    ccall((:SCIPboundchgGetBoundchgtype, libscip), SCIP_BOUNDCHGTYPE, (Ptr{SCIP_BOUNDCHG},), boundchg)
end

function SCIPboundchgGetBoundtype(boundchg)
    ccall((:SCIPboundchgGetBoundtype, libscip), SCIP_BOUNDTYPE, (Ptr{SCIP_BOUNDCHG},), boundchg)
end

function SCIPboundchgIsRedundant(boundchg)
    ccall((:SCIPboundchgIsRedundant, libscip), Cuint, (Ptr{SCIP_BOUNDCHG},), boundchg)
end

function SCIPdomchgGetNBoundchgs(domchg)
    ccall((:SCIPdomchgGetNBoundchgs, libscip), Cint, (Ptr{SCIP_DOMCHG},), domchg)
end

function SCIPdomchgGetBoundchg(domchg, pos)
    ccall((:SCIPdomchgGetBoundchg, libscip), Ptr{SCIP_BOUNDCHG}, (Ptr{SCIP_DOMCHG}, Cint), domchg, pos)
end

function SCIPholelistGetLeft(holelist)
    ccall((:SCIPholelistGetLeft, libscip), Cdouble, (Ptr{SCIP_HOLELIST},), holelist)
end

function SCIPholelistGetRight(holelist)
    ccall((:SCIPholelistGetRight, libscip), Cdouble, (Ptr{SCIP_HOLELIST},), holelist)
end

function SCIPholelistGetNext(holelist)
    ccall((:SCIPholelistGetNext, libscip), Ptr{SCIP_HOLELIST}, (Ptr{SCIP_HOLELIST},), holelist)
end

function SCIPlpiGetSolverName()
    ccall((:SCIPlpiGetSolverName, libscip), Ptr{Cchar}, ())
end

function SCIPlpiGetSolverDesc()
    ccall((:SCIPlpiGetSolverDesc, libscip), Ptr{Cchar}, ())
end

const SCIP_LPi = Cvoid

const SCIP_LPI = SCIP_LPi

function SCIPlpiGetSolverPointer(lpi)
    ccall((:SCIPlpiGetSolverPointer, libscip), Ptr{Cvoid}, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiSetIntegralityInformation(lpi, ncols, intInfo)
    ccall((:SCIPlpiSetIntegralityInformation, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Ptr{Cint}), lpi, ncols, intInfo)
end

function SCIPlpiHasPrimalSolve()
    ccall((:SCIPlpiHasPrimalSolve, libscip), Cuint, ())
end

function SCIPlpiHasDualSolve()
    ccall((:SCIPlpiHasDualSolve, libscip), Cuint, ())
end

function SCIPlpiHasBarrierSolve()
    ccall((:SCIPlpiHasBarrierSolve, libscip), Cuint, ())
end

@enum SCIP_ObjSen::Int32 begin
    SCIP_OBJSEN_MAXIMIZE = -1
    SCIP_OBJSEN_MINIMIZE = 1
end

const SCIP_OBJSEN = SCIP_ObjSen

function SCIPlpiCreate(lpi, messagehdlr, name, objsen)
    ccall((:SCIPlpiCreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_LPI}}, Ptr{SCIP_MESSAGEHDLR}, Ptr{Cchar}, SCIP_OBJSEN), lpi, messagehdlr, name, objsen)
end

function SCIPlpiFree(lpi)
    ccall((:SCIPlpiFree, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_LPI}},), lpi)
end

function SCIPlpiLoadColLP(lpi, objsen, ncols, obj, lb, ub, colnames, nrows, lhs, rhs, rownames, nnonz, beg, ind, val)
    ccall((:SCIPlpiLoadColLP, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, SCIP_OBJSEN, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cchar}}, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cchar}}, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}), lpi, objsen, ncols, obj, lb, ub, colnames, nrows, lhs, rhs, rownames, nnonz, beg, ind, val)
end

function SCIPlpiAddCols(lpi, ncols, obj, lb, ub, colnames, nnonz, beg, ind, val)
    ccall((:SCIPlpiAddCols, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cchar}}, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}), lpi, ncols, obj, lb, ub, colnames, nnonz, beg, ind, val)
end

function SCIPlpiDelCols(lpi, firstcol, lastcol)
    ccall((:SCIPlpiDelCols, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Cint), lpi, firstcol, lastcol)
end

function SCIPlpiDelColset(lpi, dstat)
    ccall((:SCIPlpiDelColset, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cint}), lpi, dstat)
end

function SCIPlpiAddRows(lpi, nrows, lhs, rhs, rownames, nnonz, beg, ind, val)
    ccall((:SCIPlpiAddRows, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cchar}}, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}), lpi, nrows, lhs, rhs, rownames, nnonz, beg, ind, val)
end

function SCIPlpiDelRows(lpi, firstrow, lastrow)
    ccall((:SCIPlpiDelRows, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Cint), lpi, firstrow, lastrow)
end

function SCIPlpiDelRowset(lpi, dstat)
    ccall((:SCIPlpiDelRowset, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cint}), lpi, dstat)
end

function SCIPlpiClear(lpi)
    ccall((:SCIPlpiClear, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiChgBounds(lpi, ncols, ind, lb, ub)
    ccall((:SCIPlpiChgBounds, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}), lpi, ncols, ind, lb, ub)
end

function SCIPlpiChgSides(lpi, nrows, ind, lhs, rhs)
    ccall((:SCIPlpiChgSides, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}), lpi, nrows, ind, lhs, rhs)
end

function SCIPlpiChgCoef(lpi, row, col, newval)
    ccall((:SCIPlpiChgCoef, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Cint, Cdouble), lpi, row, col, newval)
end

function SCIPlpiChgObjsen(lpi, objsen)
    ccall((:SCIPlpiChgObjsen, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, SCIP_OBJSEN), lpi, objsen)
end

function SCIPlpiChgObj(lpi, ncols, ind, obj)
    ccall((:SCIPlpiChgObj, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Ptr{Cint}, Ptr{Cdouble}), lpi, ncols, ind, obj)
end

function SCIPlpiScaleRow(lpi, row, scaleval)
    ccall((:SCIPlpiScaleRow, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Cdouble), lpi, row, scaleval)
end

function SCIPlpiScaleCol(lpi, col, scaleval)
    ccall((:SCIPlpiScaleCol, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Cdouble), lpi, col, scaleval)
end

function SCIPlpiGetNRows(lpi, nrows)
    ccall((:SCIPlpiGetNRows, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cint}), lpi, nrows)
end

function SCIPlpiGetNCols(lpi, ncols)
    ccall((:SCIPlpiGetNCols, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cint}), lpi, ncols)
end

function SCIPlpiGetObjsen(lpi, objsen)
    ccall((:SCIPlpiGetObjsen, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{SCIP_OBJSEN}), lpi, objsen)
end

function SCIPlpiGetNNonz(lpi, nnonz)
    ccall((:SCIPlpiGetNNonz, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cint}), lpi, nnonz)
end

function SCIPlpiGetCols(lpi, firstcol, lastcol, lb, ub, nnonz, beg, ind, val)
    ccall((:SCIPlpiGetCols, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}), lpi, firstcol, lastcol, lb, ub, nnonz, beg, ind, val)
end

function SCIPlpiGetRows(lpi, firstrow, lastrow, lhs, rhs, nnonz, beg, ind, val)
    ccall((:SCIPlpiGetRows, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}), lpi, firstrow, lastrow, lhs, rhs, nnonz, beg, ind, val)
end

function SCIPlpiGetColNames(lpi, firstcol, lastcol, colnames, namestorage, namestoragesize, storageleft)
    ccall((:SCIPlpiGetColNames, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Cint, Ptr{Ptr{Cchar}}, Ptr{Cchar}, Cint, Ptr{Cint}), lpi, firstcol, lastcol, colnames, namestorage, namestoragesize, storageleft)
end

function SCIPlpiGetRowNames(lpi, firstrow, lastrow, rownames, namestorage, namestoragesize, storageleft)
    ccall((:SCIPlpiGetRowNames, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Cint, Ptr{Ptr{Cchar}}, Ptr{Cchar}, Cint, Ptr{Cint}), lpi, firstrow, lastrow, rownames, namestorage, namestoragesize, storageleft)
end

function SCIPlpiGetObj(lpi, firstcol, lastcol, vals)
    ccall((:SCIPlpiGetObj, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Cint, Ptr{Cdouble}), lpi, firstcol, lastcol, vals)
end

function SCIPlpiGetBounds(lpi, firstcol, lastcol, lbs, ubs)
    ccall((:SCIPlpiGetBounds, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}), lpi, firstcol, lastcol, lbs, ubs)
end

function SCIPlpiGetSides(lpi, firstrow, lastrow, lhss, rhss)
    ccall((:SCIPlpiGetSides, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}), lpi, firstrow, lastrow, lhss, rhss)
end

function SCIPlpiGetCoef(lpi, row, col, val)
    ccall((:SCIPlpiGetCoef, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Cint, Ptr{Cdouble}), lpi, row, col, val)
end

function SCIPlpiSolvePrimal(lpi)
    ccall((:SCIPlpiSolvePrimal, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiSolveDual(lpi)
    ccall((:SCIPlpiSolveDual, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiSolveBarrier(lpi, crossover)
    ccall((:SCIPlpiSolveBarrier, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cuint), lpi, crossover)
end

function SCIPlpiStartStrongbranch(lpi)
    ccall((:SCIPlpiStartStrongbranch, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiEndStrongbranch(lpi)
    ccall((:SCIPlpiEndStrongbranch, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiStrongbranchFrac(lpi, col, psol, itlim, down, up, downvalid, upvalid, iter)
    ccall((:SCIPlpiStrongbranchFrac, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Cdouble, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cint}), lpi, col, psol, itlim, down, up, downvalid, upvalid, iter)
end

function SCIPlpiStrongbranchesFrac(lpi, cols, ncols, psols, itlim, down, up, downvalid, upvalid, iter)
    ccall((:SCIPlpiStrongbranchesFrac, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cint}, Cint, Ptr{Cdouble}, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cint}), lpi, cols, ncols, psols, itlim, down, up, downvalid, upvalid, iter)
end

function SCIPlpiStrongbranchInt(lpi, col, psol, itlim, down, up, downvalid, upvalid, iter)
    ccall((:SCIPlpiStrongbranchInt, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Cdouble, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cint}), lpi, col, psol, itlim, down, up, downvalid, upvalid, iter)
end

function SCIPlpiStrongbranchesInt(lpi, cols, ncols, psols, itlim, down, up, downvalid, upvalid, iter)
    ccall((:SCIPlpiStrongbranchesInt, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cint}, Cint, Ptr{Cdouble}, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cint}), lpi, cols, ncols, psols, itlim, down, up, downvalid, upvalid, iter)
end

function SCIPlpiWasSolved(lpi)
    ccall((:SCIPlpiWasSolved, libscip), Cuint, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiGetSolFeasibility(lpi, primalfeasible, dualfeasible)
    ccall((:SCIPlpiGetSolFeasibility, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cuint}, Ptr{Cuint}), lpi, primalfeasible, dualfeasible)
end

function SCIPlpiExistsPrimalRay(lpi)
    ccall((:SCIPlpiExistsPrimalRay, libscip), Cuint, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiHasPrimalRay(lpi)
    ccall((:SCIPlpiHasPrimalRay, libscip), Cuint, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiIsPrimalUnbounded(lpi)
    ccall((:SCIPlpiIsPrimalUnbounded, libscip), Cuint, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiIsPrimalInfeasible(lpi)
    ccall((:SCIPlpiIsPrimalInfeasible, libscip), Cuint, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiIsPrimalFeasible(lpi)
    ccall((:SCIPlpiIsPrimalFeasible, libscip), Cuint, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiExistsDualRay(lpi)
    ccall((:SCIPlpiExistsDualRay, libscip), Cuint, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiHasDualRay(lpi)
    ccall((:SCIPlpiHasDualRay, libscip), Cuint, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiIsDualUnbounded(lpi)
    ccall((:SCIPlpiIsDualUnbounded, libscip), Cuint, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiIsDualInfeasible(lpi)
    ccall((:SCIPlpiIsDualInfeasible, libscip), Cuint, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiIsDualFeasible(lpi)
    ccall((:SCIPlpiIsDualFeasible, libscip), Cuint, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiIsOptimal(lpi)
    ccall((:SCIPlpiIsOptimal, libscip), Cuint, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiIsStable(lpi)
    ccall((:SCIPlpiIsStable, libscip), Cuint, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiIsObjlimExc(lpi)
    ccall((:SCIPlpiIsObjlimExc, libscip), Cuint, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiIsIterlimExc(lpi)
    ccall((:SCIPlpiIsIterlimExc, libscip), Cuint, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiIsTimelimExc(lpi)
    ccall((:SCIPlpiIsTimelimExc, libscip), Cuint, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiGetInternalStatus(lpi)
    ccall((:SCIPlpiGetInternalStatus, libscip), Cint, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiIgnoreInstability(lpi, success)
    ccall((:SCIPlpiIgnoreInstability, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cuint}), lpi, success)
end

function SCIPlpiGetObjval(lpi, objval)
    ccall((:SCIPlpiGetObjval, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cdouble}), lpi, objval)
end

function SCIPlpiGetSol(lpi, objval, primsol, dualsol, activity, redcost)
    ccall((:SCIPlpiGetSol, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), lpi, objval, primsol, dualsol, activity, redcost)
end

function SCIPlpiGetPrimalRay(lpi, ray)
    ccall((:SCIPlpiGetPrimalRay, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cdouble}), lpi, ray)
end

function SCIPlpiGetDualfarkas(lpi, dualfarkas)
    ccall((:SCIPlpiGetDualfarkas, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cdouble}), lpi, dualfarkas)
end

function SCIPlpiGetIterations(lpi, iterations)
    ccall((:SCIPlpiGetIterations, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cint}), lpi, iterations)
end

@enum SCIP_LPSolQuality::UInt32 begin
    SCIP_LPSOLQUALITY_ESTIMCONDITION = 0
    SCIP_LPSOLQUALITY_EXACTCONDITION = 1
end

const SCIP_LPSOLQUALITY = SCIP_LPSolQuality

function SCIPlpiGetRealSolQuality(lpi, qualityindicator, quality)
    ccall((:SCIPlpiGetRealSolQuality, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, SCIP_LPSOLQUALITY, Ptr{Cdouble}), lpi, qualityindicator, quality)
end

function SCIPlpiGetBase(lpi, cstat, rstat)
    ccall((:SCIPlpiGetBase, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cint}, Ptr{Cint}), lpi, cstat, rstat)
end

function SCIPlpiSetBase(lpi, cstat, rstat)
    ccall((:SCIPlpiSetBase, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cint}, Ptr{Cint}), lpi, cstat, rstat)
end

function SCIPlpiGetBasisInd(lpi, bind)
    ccall((:SCIPlpiGetBasisInd, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cint}), lpi, bind)
end

function SCIPlpiGetBInvRow(lpi, r, coef, inds, ninds)
    ccall((:SCIPlpiGetBInvRow, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}), lpi, r, coef, inds, ninds)
end

function SCIPlpiGetBInvCol(lpi, c, coef, inds, ninds)
    ccall((:SCIPlpiGetBInvCol, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}), lpi, c, coef, inds, ninds)
end

function SCIPlpiGetBInvARow(lpi, r, binvrow, coef, inds, ninds)
    ccall((:SCIPlpiGetBInvARow, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}), lpi, r, binvrow, coef, inds, ninds)
end

function SCIPlpiGetBInvACol(lpi, c, coef, inds, ninds)
    ccall((:SCIPlpiGetBInvACol, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Cint, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}), lpi, c, coef, inds, ninds)
end

const SCIP_LPiState = Cvoid

const SCIP_LPISTATE = SCIP_LPiState

function SCIPlpiGetState(lpi, blkmem, lpistate)
    ccall((:SCIPlpiGetState, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_LPISTATE}}), lpi, blkmem, lpistate)
end

function SCIPlpiSetState(lpi, blkmem, lpistate)
    ccall((:SCIPlpiSetState, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{BMS_BLKMEM}, Ptr{SCIP_LPISTATE}), lpi, blkmem, lpistate)
end

function SCIPlpiClearState(lpi)
    ccall((:SCIPlpiClearState, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiFreeState(lpi, blkmem, lpistate)
    ccall((:SCIPlpiFreeState, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_LPISTATE}}), lpi, blkmem, lpistate)
end

function SCIPlpiHasStateBasis(lpi, lpistate)
    ccall((:SCIPlpiHasStateBasis, libscip), Cuint, (Ptr{SCIP_LPI}, Ptr{SCIP_LPISTATE}), lpi, lpistate)
end

function SCIPlpiReadState(lpi, fname)
    ccall((:SCIPlpiReadState, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cchar}), lpi, fname)
end

function SCIPlpiWriteState(lpi, fname)
    ccall((:SCIPlpiWriteState, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cchar}), lpi, fname)
end

const SCIP_LPiNorms = Cvoid

const SCIP_LPINORMS = SCIP_LPiNorms

function SCIPlpiGetNorms(lpi, blkmem, lpinorms)
    ccall((:SCIPlpiGetNorms, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_LPINORMS}}), lpi, blkmem, lpinorms)
end

function SCIPlpiSetNorms(lpi, blkmem, lpinorms)
    ccall((:SCIPlpiSetNorms, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{BMS_BLKMEM}, Ptr{SCIP_LPINORMS}), lpi, blkmem, lpinorms)
end

function SCIPlpiFreeNorms(lpi, blkmem, lpinorms)
    ccall((:SCIPlpiFreeNorms, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_LPINORMS}}), lpi, blkmem, lpinorms)
end

@enum SCIP_LPParam::UInt32 begin
    SCIP_LPPAR_FROMSCRATCH = 0
    SCIP_LPPAR_FASTMIP = 1
    SCIP_LPPAR_SCALING = 2
    SCIP_LPPAR_PRESOLVING = 3
    SCIP_LPPAR_PRICING = 4
    SCIP_LPPAR_LPINFO = 5
    SCIP_LPPAR_FEASTOL = 6
    SCIP_LPPAR_DUALFEASTOL = 7
    SCIP_LPPAR_BARRIERCONVTOL = 8
    SCIP_LPPAR_OBJLIM = 9
    SCIP_LPPAR_LPITLIM = 10
    SCIP_LPPAR_LPTILIM = 11
    SCIP_LPPAR_MARKOWITZ = 12
    SCIP_LPPAR_ROWREPSWITCH = 13
    SCIP_LPPAR_THREADS = 14
    SCIP_LPPAR_CONDITIONLIMIT = 15
    SCIP_LPPAR_TIMING = 16
    SCIP_LPPAR_RANDOMSEED = 17
    SCIP_LPPAR_POLISHING = 18
    SCIP_LPPAR_REFACTOR = 19
end

const SCIP_LPPARAM = SCIP_LPParam

function SCIPlpiGetIntpar(lpi, type, ival)
    ccall((:SCIPlpiGetIntpar, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, SCIP_LPPARAM, Ptr{Cint}), lpi, type, ival)
end

function SCIPlpiSetIntpar(lpi, type, ival)
    ccall((:SCIPlpiSetIntpar, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, SCIP_LPPARAM, Cint), lpi, type, ival)
end

function SCIPlpiGetRealpar(lpi, type, dval)
    ccall((:SCIPlpiGetRealpar, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, SCIP_LPPARAM, Ptr{Cdouble}), lpi, type, dval)
end

function SCIPlpiSetRealpar(lpi, type, dval)
    ccall((:SCIPlpiSetRealpar, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, SCIP_LPPARAM, Cdouble), lpi, type, dval)
end

function SCIPlpiInfinity(lpi)
    ccall((:SCIPlpiInfinity, libscip), Cdouble, (Ptr{SCIP_LPI},), lpi)
end

function SCIPlpiIsInfinity(lpi, val)
    ccall((:SCIPlpiIsInfinity, libscip), Cuint, (Ptr{SCIP_LPI}, Cdouble), lpi, val)
end

function SCIPlpiReadLP(lpi, fname)
    ccall((:SCIPlpiReadLP, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cchar}), lpi, fname)
end

function SCIPlpiWriteLP(lpi, fname)
    ccall((:SCIPlpiWriteLP, libscip), SCIP_RETCODE, (Ptr{SCIP_LPI}, Ptr{Cchar}), lpi, fname)
end

struct SCIP_Interval
    inf::Cdouble
    sup::Cdouble
end

const SCIP_INTERVAL = SCIP_Interval

const SCIP_ROUNDMODE = Cint

function SCIPintervalHasRoundingControl()
    ccall((:SCIPintervalHasRoundingControl, libscip), Cuint, ())
end

function SCIPintervalSetRoundingMode(roundmode)
    ccall((:SCIPintervalSetRoundingMode, libscip), Cvoid, (SCIP_ROUNDMODE,), roundmode)
end

function SCIPintervalGetRoundingMode()
    ccall((:SCIPintervalGetRoundingMode, libscip), SCIP_ROUNDMODE, ())
end

function SCIPintervalSetRoundingModeDownwards()
    ccall((:SCIPintervalSetRoundingModeDownwards, libscip), Cvoid, ())
end

function SCIPintervalSetRoundingModeUpwards()
    ccall((:SCIPintervalSetRoundingModeUpwards, libscip), Cvoid, ())
end

function SCIPintervalSetRoundingModeToNearest()
    ccall((:SCIPintervalSetRoundingModeToNearest, libscip), Cvoid, ())
end

function SCIPintervalSetRoundingModeTowardsZero()
    ccall((:SCIPintervalSetRoundingModeTowardsZero, libscip), Cvoid, ())
end

function SCIPintervalNegateReal(x)
    ccall((:SCIPintervalNegateReal, libscip), Cdouble, (Cdouble,), x)
end

function SCIPintervalGetInf(interval)
    ccall((:SCIPintervalGetInf, libscip), Cdouble, (SCIP_INTERVAL,), interval)
end

function SCIPintervalGetSup(interval)
    ccall((:SCIPintervalGetSup, libscip), Cdouble, (SCIP_INTERVAL,), interval)
end

function SCIPintervalSet(resultant, value)
    ccall((:SCIPintervalSet, libscip), Cvoid, (Ptr{SCIP_INTERVAL}, Cdouble), resultant, value)
end

function SCIPintervalSetBounds(resultant, inf, sup)
    ccall((:SCIPintervalSetBounds, libscip), Cvoid, (Ptr{SCIP_INTERVAL}, Cdouble, Cdouble), resultant, inf, sup)
end

function SCIPintervalSetEmpty(resultant)
    ccall((:SCIPintervalSetEmpty, libscip), Cvoid, (Ptr{SCIP_INTERVAL},), resultant)
end

function SCIPintervalIsEmpty(infinity, operand)
    ccall((:SCIPintervalIsEmpty, libscip), Cuint, (Cdouble, SCIP_INTERVAL), infinity, operand)
end

function SCIPintervalSetEntire(infinity, resultant)
    ccall((:SCIPintervalSetEntire, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}), infinity, resultant)
end

function SCIPintervalIsEntire(infinity, operand)
    ccall((:SCIPintervalIsEntire, libscip), Cuint, (Cdouble, SCIP_INTERVAL), infinity, operand)
end

function SCIPintervalIsPositiveInfinity(infinity, operand)
    ccall((:SCIPintervalIsPositiveInfinity, libscip), Cuint, (Cdouble, SCIP_INTERVAL), infinity, operand)
end

function SCIPintervalIsNegativeInfinity(infinity, operand)
    ccall((:SCIPintervalIsNegativeInfinity, libscip), Cuint, (Cdouble, SCIP_INTERVAL), infinity, operand)
end

function SCIPintervalIsSubsetEQ(infinity, operand1, operand2)
    ccall((:SCIPintervalIsSubsetEQ, libscip), Cuint, (Cdouble, SCIP_INTERVAL, SCIP_INTERVAL), infinity, operand1, operand2)
end

function SCIPintervalAreDisjoint(operand1, operand2)
    ccall((:SCIPintervalAreDisjoint, libscip), Cuint, (SCIP_INTERVAL, SCIP_INTERVAL), operand1, operand2)
end

function SCIPintervalIntersect(resultant, operand1, operand2)
    ccall((:SCIPintervalIntersect, libscip), Cvoid, (Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, SCIP_INTERVAL), resultant, operand1, operand2)
end

function SCIPintervalUnify(resultant, operand1, operand2)
    ccall((:SCIPintervalUnify, libscip), Cvoid, (Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, SCIP_INTERVAL), resultant, operand1, operand2)
end

function SCIPintervalAddInf(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalAddInf, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, SCIP_INTERVAL), infinity, resultant, operand1, operand2)
end

function SCIPintervalAddSup(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalAddSup, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, SCIP_INTERVAL), infinity, resultant, operand1, operand2)
end

function SCIPintervalAdd(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalAdd, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, SCIP_INTERVAL), infinity, resultant, operand1, operand2)
end

function SCIPintervalAddScalar(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalAddScalar, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, Cdouble), infinity, resultant, operand1, operand2)
end

function SCIPintervalAddVectors(infinity, resultant, length, operand1, operand2)
    ccall((:SCIPintervalAddVectors, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, Cint, Ptr{SCIP_INTERVAL}, Ptr{SCIP_INTERVAL}), infinity, resultant, length, operand1, operand2)
end

function SCIPintervalSub(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalSub, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, SCIP_INTERVAL), infinity, resultant, operand1, operand2)
end

function SCIPintervalSubScalar(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalSubScalar, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, Cdouble), infinity, resultant, operand1, operand2)
end

function SCIPintervalMulInf(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalMulInf, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, SCIP_INTERVAL), infinity, resultant, operand1, operand2)
end

function SCIPintervalMulSup(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalMulSup, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, SCIP_INTERVAL), infinity, resultant, operand1, operand2)
end

function SCIPintervalMul(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalMul, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, SCIP_INTERVAL), infinity, resultant, operand1, operand2)
end

function SCIPintervalMulScalarInf(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalMulScalarInf, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, Cdouble), infinity, resultant, operand1, operand2)
end

function SCIPintervalMulScalarSup(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalMulScalarSup, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, Cdouble), infinity, resultant, operand1, operand2)
end

function SCIPintervalMulScalar(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalMulScalar, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, Cdouble), infinity, resultant, operand1, operand2)
end

function SCIPintervalDiv(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalDiv, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, SCIP_INTERVAL), infinity, resultant, operand1, operand2)
end

function SCIPintervalDivScalar(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalDivScalar, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, Cdouble), infinity, resultant, operand1, operand2)
end

function SCIPintervalScalprod(infinity, resultant, length, operand1, operand2)
    ccall((:SCIPintervalScalprod, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, Cint, Ptr{SCIP_INTERVAL}, Ptr{SCIP_INTERVAL}), infinity, resultant, length, operand1, operand2)
end

function SCIPintervalScalprodScalarsInf(infinity, resultant, length, operand1, operand2)
    ccall((:SCIPintervalScalprodScalarsInf, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, Cint, Ptr{SCIP_INTERVAL}, Ptr{Cdouble}), infinity, resultant, length, operand1, operand2)
end

function SCIPintervalScalprodScalarsSup(infinity, resultant, length, operand1, operand2)
    ccall((:SCIPintervalScalprodScalarsSup, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, Cint, Ptr{SCIP_INTERVAL}, Ptr{Cdouble}), infinity, resultant, length, operand1, operand2)
end

function SCIPintervalScalprodScalars(infinity, resultant, length, operand1, operand2)
    ccall((:SCIPintervalScalprodScalars, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, Cint, Ptr{SCIP_INTERVAL}, Ptr{Cdouble}), infinity, resultant, length, operand1, operand2)
end

function SCIPintervalSquare(infinity, resultant, operand)
    ccall((:SCIPintervalSquare, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL), infinity, resultant, operand)
end

function SCIPintervalSquareRoot(infinity, resultant, operand)
    ccall((:SCIPintervalSquareRoot, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL), infinity, resultant, operand)
end

function SCIPintervalPower(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalPower, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, SCIP_INTERVAL), infinity, resultant, operand1, operand2)
end

function SCIPintervalPowerScalar(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalPowerScalar, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, Cdouble), infinity, resultant, operand1, operand2)
end

function SCIPintervalPowerScalarScalar(resultant, operand1, operand2)
    ccall((:SCIPintervalPowerScalarScalar, libscip), Cvoid, (Ptr{SCIP_INTERVAL}, Cdouble, Cdouble), resultant, operand1, operand2)
end

function SCIPintervalPowerScalarIntegerInf(operand1, operand2)
    ccall((:SCIPintervalPowerScalarIntegerInf, libscip), Cdouble, (Cdouble, Cint), operand1, operand2)
end

function SCIPintervalPowerScalarIntegerSup(operand1, operand2)
    ccall((:SCIPintervalPowerScalarIntegerSup, libscip), Cdouble, (Cdouble, Cint), operand1, operand2)
end

function SCIPintervalPowerScalarInteger(resultant, operand1, operand2)
    ccall((:SCIPintervalPowerScalarInteger, libscip), Cvoid, (Ptr{SCIP_INTERVAL}, Cdouble, Cint), resultant, operand1, operand2)
end

function SCIPintervalPowerScalarInverse(infinity, resultant, basedomain, exponent, image)
    ccall((:SCIPintervalPowerScalarInverse, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, Cdouble, SCIP_INTERVAL), infinity, resultant, basedomain, exponent, image)
end

function SCIPintervalSignPowerScalar(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalSignPowerScalar, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, Cdouble), infinity, resultant, operand1, operand2)
end

function SCIPintervalReciprocal(infinity, resultant, operand)
    ccall((:SCIPintervalReciprocal, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL), infinity, resultant, operand)
end

function SCIPintervalExp(infinity, resultant, operand)
    ccall((:SCIPintervalExp, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL), infinity, resultant, operand)
end

function SCIPintervalLog(infinity, resultant, operand)
    ccall((:SCIPintervalLog, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL), infinity, resultant, operand)
end

function SCIPintervalMin(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalMin, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, SCIP_INTERVAL), infinity, resultant, operand1, operand2)
end

function SCIPintervalMax(infinity, resultant, operand1, operand2)
    ccall((:SCIPintervalMax, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, SCIP_INTERVAL), infinity, resultant, operand1, operand2)
end

function SCIPintervalAbs(infinity, resultant, operand)
    ccall((:SCIPintervalAbs, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL), infinity, resultant, operand)
end

function SCIPintervalSin(infinity, resultant, operand)
    ccall((:SCIPintervalSin, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL), infinity, resultant, operand)
end

function SCIPintervalCos(infinity, resultant, operand)
    ccall((:SCIPintervalCos, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL), infinity, resultant, operand)
end

function SCIPintervalSign(infinity, resultant, operand)
    ccall((:SCIPintervalSign, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL), infinity, resultant, operand)
end

function SCIPintervalQuadUpperBound(infinity, a, b_, x)
    ccall((:SCIPintervalQuadUpperBound, libscip), Cdouble, (Cdouble, Cdouble, SCIP_INTERVAL, SCIP_INTERVAL), infinity, a, b_, x)
end

function SCIPintervalQuad(infinity, resultant, sqrcoeff, lincoeff, xrng)
    ccall((:SCIPintervalQuad, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, Cdouble, SCIP_INTERVAL, SCIP_INTERVAL), infinity, resultant, sqrcoeff, lincoeff, xrng)
end

function SCIPintervalSolveUnivariateQuadExpressionPositive(infinity, resultant, sqrcoeff, lincoeff, rhs, xbnds)
    ccall((:SCIPintervalSolveUnivariateQuadExpressionPositive, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, SCIP_INTERVAL, SCIP_INTERVAL, SCIP_INTERVAL), infinity, resultant, sqrcoeff, lincoeff, rhs, xbnds)
end

function SCIPintervalSolveUnivariateQuadExpressionNegative(infinity, resultant, sqrcoeff, lincoeff, rhs, xbnds)
    ccall((:SCIPintervalSolveUnivariateQuadExpressionNegative, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, SCIP_INTERVAL, SCIP_INTERVAL, SCIP_INTERVAL), infinity, resultant, sqrcoeff, lincoeff, rhs, xbnds)
end

function SCIPintervalSolveUnivariateQuadExpressionPositiveAllScalar(infinity, resultant, sqrcoeff, lincoeff, rhs, xbnds)
    ccall((:SCIPintervalSolveUnivariateQuadExpressionPositiveAllScalar, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, Cdouble, Cdouble, Cdouble, SCIP_INTERVAL), infinity, resultant, sqrcoeff, lincoeff, rhs, xbnds)
end

function SCIPintervalSolveUnivariateQuadExpression(infinity, resultant, sqrcoeff, lincoeff, rhs, xbnds)
    ccall((:SCIPintervalSolveUnivariateQuadExpression, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, SCIP_INTERVAL, SCIP_INTERVAL, SCIP_INTERVAL, SCIP_INTERVAL), infinity, resultant, sqrcoeff, lincoeff, rhs, xbnds)
end

function SCIPintervalQuadBivar(infinity, resultant, ax, ay, axy, bx, by, xbnds, ybnds)
    ccall((:SCIPintervalQuadBivar, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, SCIP_INTERVAL, SCIP_INTERVAL), infinity, resultant, ax, ay, axy, bx, by, xbnds, ybnds)
end

function SCIPintervalSolveBivariateQuadExpressionAllScalar(infinity, resultant, ax, ay, axy, bx, by, rhs, xbnds, ybnds)
    ccall((:SCIPintervalSolveBivariateQuadExpressionAllScalar, libscip), Cvoid, (Cdouble, Ptr{SCIP_INTERVAL}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, SCIP_INTERVAL, SCIP_INTERVAL, SCIP_INTERVAL), infinity, resultant, ax, ay, axy, bx, by, rhs, xbnds, ybnds)
end

const SCIP_ExprInt = Cvoid

const SCIP_EXPRINT = SCIP_ExprInt

const SCIP_ExprIntData = Cvoid

const SCIP_EXPRINTDATA = SCIP_ExprIntData

const SCIP_EXPRINTCAPABILITY = Cuint

function SCIPshrinkDisjunctiveVarSet(scip, vars, bounds, boundtypes, redundants, nvars, nredvars, nglobalred, setredundant, glbinfeas, fullshortening)
    ccall((:SCIPshrinkDisjunctiveVarSet, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Cuint), scip, vars, bounds, boundtypes, redundants, nvars, nredvars, nglobalred, setredundant, glbinfeas, fullshortening)
end

struct SCIP_AggrRow
    vals::Ptr{Cdouble}
    inds::Ptr{Cint}
    rowsinds::Ptr{Cint}
    slacksign::Ptr{Cint}
    rowweights::Ptr{Cdouble}
    rhshi::Cdouble
    rhslo::Cdouble
    nnz::Cint
    nrows::Cint
    rowssize::Cint
    rank::Cint
    _local::Cuint
end

const SCIP_AGGRROW = SCIP_AggrRow

function SCIPcutsTightenCoefficients(scip, cutislocal, cutcoefs, cutrhs, cutinds, cutnnz, nchgcoefs)
    ccall((:SCIPcutsTightenCoefficients, libscip), Cuint, (Ptr{SCIP}, Cuint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, cutislocal, cutcoefs, cutrhs, cutinds, cutnnz, nchgcoefs)
end

function SCIPaggrRowCreate(scip, aggrrow)
    ccall((:SCIPaggrRowCreate, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_AGGRROW}}), scip, aggrrow)
end

function SCIPaggrRowFree(scip, aggrrow)
    ccall((:SCIPaggrRowFree, libscip), Cvoid, (Ptr{SCIP}, Ptr{Ptr{SCIP_AGGRROW}}), scip, aggrrow)
end

function SCIPaggrRowPrint(scip, aggrrow, file)
    ccall((:SCIPaggrRowPrint, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_AGGRROW}, Ptr{Libc.FILE}), scip, aggrrow, file)
end

function SCIPaggrRowCopy(scip, aggrrow, source)
    ccall((:SCIPaggrRowCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_AGGRROW}}, Ptr{SCIP_AGGRROW}), scip, aggrrow, source)
end

function SCIPaggrRowAddRow(scip, aggrrow, row, weight, sidetype)
    ccall((:SCIPaggrRowAddRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_AGGRROW}, Ptr{SCIP_ROW}, Cdouble, Cint), scip, aggrrow, row, weight, sidetype)
end

function SCIPaggrRowCancelVarWithBound(scip, aggrrow, var, pos, valid)
    ccall((:SCIPaggrRowCancelVarWithBound, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_AGGRROW}, Ptr{SCIP_VAR}, Cint, Ptr{Cuint}), scip, aggrrow, var, pos, valid)
end

function SCIPaggrRowAddObjectiveFunction(scip, aggrrow, rhs, scale)
    ccall((:SCIPaggrRowAddObjectiveFunction, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_AGGRROW}, Cdouble, Cdouble), scip, aggrrow, rhs, scale)
end

function SCIPaggrRowAddCustomCons(scip, aggrrow, inds, vals, len, rhs, weight, rank, _local)
    ccall((:SCIPaggrRowAddCustomCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_AGGRROW}, Ptr{Cint}, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cuint), scip, aggrrow, inds, vals, len, rhs, weight, rank, _local)
end

function SCIPaggrRowCalcEfficacyNorm(scip, aggrrow)
    ccall((:SCIPaggrRowCalcEfficacyNorm, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_AGGRROW}), scip, aggrrow)
end

function SCIPaggrRowClear(aggrrow)
    ccall((:SCIPaggrRowClear, libscip), Cvoid, (Ptr{SCIP_AGGRROW},), aggrrow)
end

function SCIPaggrRowSumRows(scip, aggrrow, weights, rowinds, nrowinds, sidetypebasis, allowlocal, negslack, maxaggrlen, valid)
    ccall((:SCIPaggrRowSumRows, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_AGGRROW}, Ptr{Cdouble}, Ptr{Cint}, Cint, Cuint, Cuint, Cint, Cint, Ptr{Cuint}), scip, aggrrow, weights, rowinds, nrowinds, sidetypebasis, allowlocal, negslack, maxaggrlen, valid)
end

function SCIPaggrRowRemoveZeros(scip, aggrrow, useglbbounds, valid)
    ccall((:SCIPaggrRowRemoveZeros, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_AGGRROW}, Cuint, Ptr{Cuint}), scip, aggrrow, useglbbounds, valid)
end

function SCIPaggrRowGetRowInds(aggrrow)
    ccall((:SCIPaggrRowGetRowInds, libscip), Ptr{Cint}, (Ptr{SCIP_AGGRROW},), aggrrow)
end

function SCIPaggrRowGetRowWeights(aggrrow)
    ccall((:SCIPaggrRowGetRowWeights, libscip), Ptr{Cdouble}, (Ptr{SCIP_AGGRROW},), aggrrow)
end

function SCIPaggrRowHasRowBeenAdded(aggrrow, row)
    ccall((:SCIPaggrRowHasRowBeenAdded, libscip), Cuint, (Ptr{SCIP_AGGRROW}, Ptr{SCIP_ROW}), aggrrow, row)
end

function SCIPaggrRowGetAbsWeightRange(aggrrow, minabsrowweight, maxabsrowweight)
    ccall((:SCIPaggrRowGetAbsWeightRange, libscip), Cvoid, (Ptr{SCIP_AGGRROW}, Ptr{Cdouble}, Ptr{Cdouble}), aggrrow, minabsrowweight, maxabsrowweight)
end

function SCIPaggrRowGetInds(aggrrow)
    ccall((:SCIPaggrRowGetInds, libscip), Ptr{Cint}, (Ptr{SCIP_AGGRROW},), aggrrow)
end

function SCIPaggrRowGetNNz(aggrrow)
    ccall((:SCIPaggrRowGetNNz, libscip), Cint, (Ptr{SCIP_AGGRROW},), aggrrow)
end

function SCIPaggrRowGetValue(aggrrow, i)
    ccall((:SCIPaggrRowGetValue, libscip), Cdouble, (Ptr{SCIP_AGGRROW}, Cint), aggrrow, i)
end

function SCIPaggrRowGetProbvarValue(aggrrow, probindex)
    ccall((:SCIPaggrRowGetProbvarValue, libscip), Cdouble, (Ptr{SCIP_AGGRROW}, Cint), aggrrow, probindex)
end

function SCIPaggrRowGetRank(aggrrow)
    ccall((:SCIPaggrRowGetRank, libscip), Cint, (Ptr{SCIP_AGGRROW},), aggrrow)
end

function SCIPaggrRowIsLocal(aggrrow)
    ccall((:SCIPaggrRowIsLocal, libscip), Cuint, (Ptr{SCIP_AGGRROW},), aggrrow)
end

function SCIPaggrRowGetRhs(aggrrow)
    ccall((:SCIPaggrRowGetRhs, libscip), Cdouble, (Ptr{SCIP_AGGRROW},), aggrrow)
end

function SCIPaggrRowGetNRows(aggrrow)
    ccall((:SCIPaggrRowGetNRows, libscip), Cint, (Ptr{SCIP_AGGRROW},), aggrrow)
end

function SCIPselectCuts(scip, cuts, randnumgen, goodscorefac, badscorefac, goodmaxparall, maxparall, dircutoffdistweight, efficacyweight, objparalweight, intsupportweight, ncuts, nforcedcuts, maxselectedcuts, nselectedcuts)
    ccall((:SCIPselectCuts, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Ptr{SCIP_RANDNUMGEN}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cint, Cint, Cint, Ptr{Cint}), scip, cuts, randnumgen, goodscorefac, badscorefac, goodmaxparall, maxparall, dircutoffdistweight, efficacyweight, objparalweight, intsupportweight, ncuts, nforcedcuts, maxselectedcuts, nselectedcuts)
end

function SCIPcalcMIR(scip, sol, postprocess, boundswitch, usevbds, allowlocal, fixintegralrhs, boundsfortrans, boundtypesfortrans, minfrac, maxfrac, scale, aggrrow, cutcoefs, cutrhs, cutinds, cutnnz, cutefficacy, cutrank, cutislocal, success)
    ccall((:SCIPcalcMIR, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cuint, Cdouble, Cuint, Cuint, Cuint, Ptr{Cint}, Ptr{SCIP_BOUNDTYPE}, Cdouble, Cdouble, Cdouble, Ptr{SCIP_AGGRROW}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}), scip, sol, postprocess, boundswitch, usevbds, allowlocal, fixintegralrhs, boundsfortrans, boundtypesfortrans, minfrac, maxfrac, scale, aggrrow, cutcoefs, cutrhs, cutinds, cutnnz, cutefficacy, cutrank, cutislocal, success)
end

function SCIPcutGenerationHeuristicCMIR(scip, sol, postprocess, boundswitch, usevbds, allowlocal, maxtestdelta, boundsfortrans, boundtypesfortrans, minfrac, maxfrac, aggrrow, cutcoefs, cutrhs, cutinds, cutnnz, cutefficacy, cutrank, cutislocal, success)
    ccall((:SCIPcutGenerationHeuristicCMIR, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cuint, Cdouble, Cuint, Cuint, Cint, Ptr{Cint}, Ptr{SCIP_BOUNDTYPE}, Cdouble, Cdouble, Ptr{SCIP_AGGRROW}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}), scip, sol, postprocess, boundswitch, usevbds, allowlocal, maxtestdelta, boundsfortrans, boundtypesfortrans, minfrac, maxfrac, aggrrow, cutcoefs, cutrhs, cutinds, cutnnz, cutefficacy, cutrank, cutislocal, success)
end

function SCIPcalcFlowCover(scip, sol, postprocess, boundswitch, allowlocal, aggrrow, cutcoefs, cutrhs, cutinds, cutnnz, cutefficacy, cutrank, cutislocal, success)
    ccall((:SCIPcalcFlowCover, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cuint, Cdouble, Cuint, Ptr{SCIP_AGGRROW}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}), scip, sol, postprocess, boundswitch, allowlocal, aggrrow, cutcoefs, cutrhs, cutinds, cutnnz, cutefficacy, cutrank, cutislocal, success)
end

function SCIPcalcStrongCG(scip, sol, postprocess, boundswitch, usevbds, allowlocal, minfrac, maxfrac, scale, aggrrow, cutcoefs, cutrhs, cutinds, cutnnz, cutefficacy, cutrank, cutislocal, success)
    ccall((:SCIPcalcStrongCG, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cuint, Cdouble, Cuint, Cuint, Cdouble, Cdouble, Cdouble, Ptr{SCIP_AGGRROW}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}), scip, sol, postprocess, boundswitch, usevbds, allowlocal, minfrac, maxfrac, scale, aggrrow, cutcoefs, cutrhs, cutinds, cutnnz, cutefficacy, cutrank, cutislocal, success)
end

function SCIPperformGenericDivingAlgorithm(scip, diveset, worksol, heur, result, nodeinfeasible, iterlim, divecontext)
    ccall((:SCIPperformGenericDivingAlgorithm, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DIVESET}, Ptr{SCIP_SOL}, Ptr{SCIP_HEUR}, Ptr{SCIP_RESULT}, Cuint, Clonglong, SCIP_DIVECONTEXT), scip, diveset, worksol, heur, result, nodeinfeasible, iterlim, divecontext)
end

function SCIPcopyLargeNeighborhoodSearch(sourcescip, subscip, varmap, suffix, fixedvars, fixedvals, nfixedvars, uselprows, copycuts, success, valid)
    ccall((:SCIPcopyLargeNeighborhoodSearch, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{Cchar}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Cuint, Cuint, Ptr{Cuint}, Ptr{Cuint}), sourcescip, subscip, varmap, suffix, fixedvars, fixedvals, nfixedvars, uselprows, copycuts, success, valid)
end

function SCIPaddTrustregionNeighborhoodConstraint(scip, subscip, subvars, violpenalty)
    ccall((:SCIPaddTrustregionNeighborhoodConstraint, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Cdouble), scip, subscip, subvars, violpenalty)
end

function SCIPincludeBanditvtable(scip, banditvtable, name, banditfree, banditselect, banditupdate, banditreset)
    ccall((:SCIPincludeBanditvtable, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_BANDITVTABLE}}, Ptr{Cchar}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), scip, banditvtable, name, banditfree, banditselect, banditupdate, banditreset)
end

function SCIPfindBanditvtable(scip, name)
    ccall((:SCIPfindBanditvtable, libscip), Ptr{SCIP_BANDITVTABLE}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPfreeBandit(scip, bandit)
    ccall((:SCIPfreeBandit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_BANDIT}}), scip, bandit)
end

function SCIPresetBandit(scip, bandit, priorities, seed)
    ccall((:SCIPresetBandit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BANDIT}, Ptr{Cdouble}, Cuint), scip, bandit, priorities, seed)
end

function SCIPincludeBenders(scip, name, desc, priority, cutlp, cutpseudo, cutrelax, shareauxvars, benderscopy, bendersfree, bendersinit, bendersexit, bendersinitpre, bendersexitpre, bendersinitsol, bendersexitsol, bendersgetvar, benderscreatesub, benderspresubsolve, benderssolvesubconvex, benderssolvesub, benderspostsolve, bendersfreesub, bendersdata)
    ccall((:SCIPincludeBenders, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cuint, Cuint, Cuint, Cuint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_BENDERSDATA}), scip, name, desc, priority, cutlp, cutpseudo, cutrelax, shareauxvars, benderscopy, bendersfree, bendersinit, bendersexit, bendersinitpre, bendersexitpre, bendersinitsol, bendersexitsol, bendersgetvar, benderscreatesub, benderspresubsolve, benderssolvesubconvex, benderssolvesub, benderspostsolve, bendersfreesub, bendersdata)
end

function SCIPincludeBendersBasic(scip, bendersptr, name, desc, priority, cutlp, cutpseudo, cutrelax, shareauxvars, bendersgetvar, benderscreatesub, bendersdata)
    ccall((:SCIPincludeBendersBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_BENDERS}}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cuint, Cuint, Cuint, Cuint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_BENDERSDATA}), scip, bendersptr, name, desc, priority, cutlp, cutpseudo, cutrelax, shareauxvars, bendersgetvar, benderscreatesub, bendersdata)
end

function SCIPsetBendersCopy(scip, benders, benderscopy)
    ccall((:SCIPsetBendersCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, benderscopy)
end

function SCIPsetBendersFree(scip, benders, bendersfree)
    ccall((:SCIPsetBendersFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, bendersfree)
end

function SCIPsetBendersInit(scip, benders, bendersinit)
    ccall((:SCIPsetBendersInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, bendersinit)
end

function SCIPsetBendersExit(scip, benders, bendersexit)
    ccall((:SCIPsetBendersExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, bendersexit)
end

function SCIPsetBendersInitpre(scip, benders, bendersinitpre)
    ccall((:SCIPsetBendersInitpre, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, bendersinitpre)
end

function SCIPsetBendersExitpre(scip, benders, bendersexitpre)
    ccall((:SCIPsetBendersExitpre, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, bendersexitpre)
end

function SCIPsetBendersInitsol(scip, benders, bendersinitsol)
    ccall((:SCIPsetBendersInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, bendersinitsol)
end

function SCIPsetBendersExitsol(scip, benders, bendersexitsol)
    ccall((:SCIPsetBendersExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, bendersexitsol)
end

function SCIPsetBendersPresubsolve(scip, benders, benderspresubsolve)
    ccall((:SCIPsetBendersPresubsolve, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, benderspresubsolve)
end

function SCIPsetBendersSolveAndFreesub(scip, benders, benderssolvesubconvex, benderssolvesub, bendersfreesub)
    ccall((:SCIPsetBendersSolveAndFreesub, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), scip, benders, benderssolvesubconvex, benderssolvesub, bendersfreesub)
end

function SCIPsetBendersPostsolve(scip, benders, benderspostsolve)
    ccall((:SCIPsetBendersPostsolve, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, benderspostsolve)
end

function SCIPsetBendersSubproblemComp(scip, benders, benderssubcomp)
    ccall((:SCIPsetBendersSubproblemComp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cvoid}), scip, benders, benderssubcomp)
end

function SCIPfindBenders(scip, name)
    ccall((:SCIPfindBenders, libscip), Ptr{SCIP_BENDERS}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetBenders(scip)
    ccall((:SCIPgetBenders, libscip), Ptr{Ptr{SCIP_BENDERS}}, (Ptr{SCIP},), scip)
end

function SCIPgetNBenders(scip)
    ccall((:SCIPgetNBenders, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNActiveBenders(scip)
    ccall((:SCIPgetNActiveBenders, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPactivateBenders(scip, benders, nsubproblems)
    ccall((:SCIPactivateBenders, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Cint), scip, benders, nsubproblems)
end

function SCIPdeactivateBenders(scip, benders)
    ccall((:SCIPdeactivateBenders, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}), scip, benders)
end

function SCIPsetBendersPriority(scip, benders, priority)
    ccall((:SCIPsetBendersPriority, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Cint), scip, benders, priority)
end

function SCIPsolveBendersSubproblems(scip, benders, sol, result, infeasible, auxviol, type, checkint)
    ccall((:SCIPsolveBendersSubproblems, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{SCIP_SOL}, Ptr{SCIP_RESULT}, Ptr{Cuint}, Ptr{Cuint}, SCIP_BENDERSENFOTYPE, Cuint), scip, benders, sol, result, infeasible, auxviol, type, checkint)
end

function SCIPgetBendersMasterVar(scip, benders, var, mappedvar)
    ccall((:SCIPgetBendersMasterVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}), scip, benders, var, mappedvar)
end

function SCIPgetBendersSubproblemVar(scip, benders, var, mappedvar, probnumber)
    ccall((:SCIPgetBendersSubproblemVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}, Cint), scip, benders, var, mappedvar, probnumber)
end

function SCIPgetBendersNSubproblems(scip, benders)
    ccall((:SCIPgetBendersNSubproblems, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_BENDERS}), scip, benders)
end

function SCIPaddBendersSubproblem(scip, benders, subproblem)
    ccall((:SCIPaddBendersSubproblem, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{SCIP}), scip, benders, subproblem)
end

function SCIPsetupBendersSubproblem(scip, benders, sol, probnumber, type)
    ccall((:SCIPsetupBendersSubproblem, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{SCIP_SOL}, Cint, SCIP_BENDERSENFOTYPE), scip, benders, sol, probnumber, type)
end

function SCIPsolveBendersSubproblem(scip, benders, sol, probnumber, infeasible, solvecip, objective)
    ccall((:SCIPsolveBendersSubproblem, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{SCIP_SOL}, Cint, Ptr{Cuint}, Cuint, Ptr{Cdouble}), scip, benders, sol, probnumber, infeasible, solvecip, objective)
end

function SCIPfreeBendersSubproblem(scip, benders, probnumber)
    ccall((:SCIPfreeBendersSubproblem, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Cint), scip, benders, probnumber)
end

function SCIPcheckBendersSubproblemOptimality(scip, benders, sol, probnumber, optimal)
    ccall((:SCIPcheckBendersSubproblemOptimality, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{SCIP_SOL}, Cint, Ptr{Cuint}), scip, benders, sol, probnumber, optimal)
end

function SCIPgetBendersAuxiliaryVarVal(scip, benders, sol, probnumber)
    ccall((:SCIPgetBendersAuxiliaryVarVal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{SCIP_SOL}, Cint), scip, benders, sol, probnumber)
end

function SCIPcomputeBendersSubproblemLowerbound(scip, benders, probnumber, lowerbound, infeasible)
    ccall((:SCIPcomputeBendersSubproblemLowerbound, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Cint, Ptr{Cdouble}, Ptr{Cuint}), scip, benders, probnumber, lowerbound, infeasible)
end

function SCIPmergeBendersSubproblemIntoMaster(scip, benders, varmap, consmap, probnumber)
    ccall((:SCIPmergeBendersSubproblemIntoMaster, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cint), scip, benders, varmap, consmap, probnumber)
end

function SCIPapplyBendersDecomposition(scip, decompindex)
    ccall((:SCIPapplyBendersDecomposition, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint), scip, decompindex)
end

function SCIPincludeBenderscut(scip, benders, name, desc, priority, islpcut, benderscutcopy, benderscutfree, benderscutinit, benderscutexit, benderscutinitsol, benderscutexitsol, benderscutexec, benderscutdata)
    ccall((:SCIPincludeBenderscut, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cuint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_BENDERSCUTDATA}), scip, benders, name, desc, priority, islpcut, benderscutcopy, benderscutfree, benderscutinit, benderscutexit, benderscutinitsol, benderscutexitsol, benderscutexec, benderscutdata)
end

function SCIPincludeBenderscutBasic(scip, benders, benderscutptr, name, desc, priority, islpcut, benderscutexec, benderscutdata)
    ccall((:SCIPincludeBenderscutBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Ptr{SCIP_BENDERSCUT}}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cuint, Ptr{Cvoid}, Ptr{SCIP_BENDERSCUTDATA}), scip, benders, benderscutptr, name, desc, priority, islpcut, benderscutexec, benderscutdata)
end

function SCIPsetBenderscutCopy(scip, benderscut, benderscutcopy)
    ccall((:SCIPsetBenderscutCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERSCUT}, Ptr{Cvoid}), scip, benderscut, benderscutcopy)
end

function SCIPsetBenderscutFree(scip, benderscut, benderscutfree)
    ccall((:SCIPsetBenderscutFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERSCUT}, Ptr{Cvoid}), scip, benderscut, benderscutfree)
end

function SCIPsetBenderscutInit(scip, benderscut, benderscutinit)
    ccall((:SCIPsetBenderscutInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERSCUT}, Ptr{Cvoid}), scip, benderscut, benderscutinit)
end

function SCIPsetBenderscutExit(scip, benderscut, benderscutexit)
    ccall((:SCIPsetBenderscutExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERSCUT}, Ptr{Cvoid}), scip, benderscut, benderscutexit)
end

function SCIPsetBenderscutInitsol(scip, benderscut, benderscutinitsol)
    ccall((:SCIPsetBenderscutInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERSCUT}, Ptr{Cvoid}), scip, benderscut, benderscutinitsol)
end

function SCIPsetBenderscutExitsol(scip, benderscut, benderscutexitsol)
    ccall((:SCIPsetBenderscutExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERSCUT}, Ptr{Cvoid}), scip, benderscut, benderscutexitsol)
end

function SCIPsetBenderscutPriority(scip, benderscut, priority)
    ccall((:SCIPsetBenderscutPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERSCUT}, Cint), scip, benderscut, priority)
end

function SCIPstoreBendersCut(scip, benders, vars, vals, lhs, rhs, nvars)
    ccall((:SCIPstoreBendersCut, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble, Cdouble, Cint), scip, benders, vars, vals, lhs, rhs, nvars)
end

function SCIPapplyBendersStoredCuts(scip, benders)
    ccall((:SCIPapplyBendersStoredCuts, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BENDERS}), scip, benders)
end

function SCIPincludeBranchrule(scip, name, desc, priority, maxdepth, maxbounddist, branchcopy, branchfree, branchinit, branchexit, branchinitsol, branchexitsol, branchexeclp, branchexecext, branchexecps, branchruledata)
    ccall((:SCIPincludeBranchrule, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, Cdouble, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_BRANCHRULEDATA}), scip, name, desc, priority, maxdepth, maxbounddist, branchcopy, branchfree, branchinit, branchexit, branchinitsol, branchexitsol, branchexeclp, branchexecext, branchexecps, branchruledata)
end

function SCIPincludeBranchruleBasic(scip, branchruleptr, name, desc, priority, maxdepth, maxbounddist, branchruledata)
    ccall((:SCIPincludeBranchruleBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_BRANCHRULE}}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, Cdouble, Ptr{SCIP_BRANCHRULEDATA}), scip, branchruleptr, name, desc, priority, maxdepth, maxbounddist, branchruledata)
end

function SCIPsetBranchruleCopy(scip, branchrule, branchcopy)
    ccall((:SCIPsetBranchruleCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BRANCHRULE}, Ptr{Cvoid}), scip, branchrule, branchcopy)
end

function SCIPsetBranchruleFree(scip, branchrule, branchfree)
    ccall((:SCIPsetBranchruleFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BRANCHRULE}, Ptr{Cvoid}), scip, branchrule, branchfree)
end

function SCIPsetBranchruleInit(scip, branchrule, branchinit)
    ccall((:SCIPsetBranchruleInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BRANCHRULE}, Ptr{Cvoid}), scip, branchrule, branchinit)
end

function SCIPsetBranchruleExit(scip, branchrule, branchexit)
    ccall((:SCIPsetBranchruleExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BRANCHRULE}, Ptr{Cvoid}), scip, branchrule, branchexit)
end

function SCIPsetBranchruleInitsol(scip, branchrule, branchinitsol)
    ccall((:SCIPsetBranchruleInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BRANCHRULE}, Ptr{Cvoid}), scip, branchrule, branchinitsol)
end

function SCIPsetBranchruleExitsol(scip, branchrule, branchexitsol)
    ccall((:SCIPsetBranchruleExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BRANCHRULE}, Ptr{Cvoid}), scip, branchrule, branchexitsol)
end

function SCIPsetBranchruleExecLp(scip, branchrule, branchexeclp)
    ccall((:SCIPsetBranchruleExecLp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BRANCHRULE}, Ptr{Cvoid}), scip, branchrule, branchexeclp)
end

function SCIPsetBranchruleExecExt(scip, branchrule, branchexecext)
    ccall((:SCIPsetBranchruleExecExt, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BRANCHRULE}, Ptr{Cvoid}), scip, branchrule, branchexecext)
end

function SCIPsetBranchruleExecPs(scip, branchrule, branchexecps)
    ccall((:SCIPsetBranchruleExecPs, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BRANCHRULE}, Ptr{Cvoid}), scip, branchrule, branchexecps)
end

function SCIPfindBranchrule(scip, name)
    ccall((:SCIPfindBranchrule, libscip), Ptr{SCIP_BRANCHRULE}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetBranchrules(scip)
    ccall((:SCIPgetBranchrules, libscip), Ptr{Ptr{SCIP_BRANCHRULE}}, (Ptr{SCIP},), scip)
end

function SCIPgetNBranchrules(scip)
    ccall((:SCIPgetNBranchrules, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPsetBranchrulePriority(scip, branchrule, priority)
    ccall((:SCIPsetBranchrulePriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BRANCHRULE}, Cint), scip, branchrule, priority)
end

function SCIPsetBranchruleMaxdepth(scip, branchrule, maxdepth)
    ccall((:SCIPsetBranchruleMaxdepth, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BRANCHRULE}, Cint), scip, branchrule, maxdepth)
end

function SCIPsetBranchruleMaxbounddist(scip, branchrule, maxbounddist)
    ccall((:SCIPsetBranchruleMaxbounddist, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BRANCHRULE}, Cdouble), scip, branchrule, maxbounddist)
end

function SCIPgetLPBranchCands(scip, lpcands, lpcandssol, lpcandsfrac, nlpcands, npriolpcands, nfracimplvars)
    ccall((:SCIPgetLPBranchCands, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cdouble}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, lpcands, lpcandssol, lpcandsfrac, nlpcands, npriolpcands, nfracimplvars)
end

function SCIPgetNLPBranchCands(scip)
    ccall((:SCIPgetNLPBranchCands, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNPrioLPBranchCands(scip)
    ccall((:SCIPgetNPrioLPBranchCands, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetExternBranchCands(scip, externcands, externcandssol, externcandsscore, nexterncands, nprioexterncands, nprioexternbins, nprioexternints, nprioexternimpls)
    ccall((:SCIPgetExternBranchCands, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cdouble}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, externcands, externcandssol, externcandsscore, nexterncands, nprioexterncands, nprioexternbins, nprioexternints, nprioexternimpls)
end

function SCIPgetNExternBranchCands(scip)
    ccall((:SCIPgetNExternBranchCands, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNPrioExternBranchCands(scip)
    ccall((:SCIPgetNPrioExternBranchCands, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNPrioExternBranchBins(scip)
    ccall((:SCIPgetNPrioExternBranchBins, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNPrioExternBranchInts(scip)
    ccall((:SCIPgetNPrioExternBranchInts, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNPrioExternBranchImpls(scip)
    ccall((:SCIPgetNPrioExternBranchImpls, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNPrioExternBranchConts(scip)
    ccall((:SCIPgetNPrioExternBranchConts, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPaddExternBranchCand(scip, var, score, solval)
    ccall((:SCIPaddExternBranchCand, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble), scip, var, score, solval)
end

function SCIPclearExternBranchCands(scip)
    ccall((:SCIPclearExternBranchCands, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPcontainsExternBranchCand(scip, var)
    ccall((:SCIPcontainsExternBranchCand, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetPseudoBranchCands(scip, pseudocands, npseudocands, npriopseudocands)
    ccall((:SCIPgetPseudoBranchCands, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Cint}, Ptr{Cint}), scip, pseudocands, npseudocands, npriopseudocands)
end

function SCIPgetNPseudoBranchCands(scip)
    ccall((:SCIPgetNPseudoBranchCands, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNPrioPseudoBranchCands(scip)
    ccall((:SCIPgetNPrioPseudoBranchCands, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNPrioPseudoBranchBins(scip)
    ccall((:SCIPgetNPrioPseudoBranchBins, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNPrioPseudoBranchInts(scip)
    ccall((:SCIPgetNPrioPseudoBranchInts, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNPrioPseudoBranchImpls(scip)
    ccall((:SCIPgetNPrioPseudoBranchImpls, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetBranchScore(scip, var, downgain, upgain)
    ccall((:SCIPgetBranchScore, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble), scip, var, downgain, upgain)
end

function SCIPgetBranchScoreMultiple(scip, var, nchildren, gains)
    ccall((:SCIPgetBranchScoreMultiple, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cint, Ptr{Cdouble}), scip, var, nchildren, gains)
end

function SCIPgetBranchingPoint(scip, var, suggestion)
    ccall((:SCIPgetBranchingPoint, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, suggestion)
end

function SCIPcalcNodeselPriority(scip, var, branchdir, targetvalue)
    ccall((:SCIPcalcNodeselPriority, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR, Cdouble), scip, var, branchdir, targetvalue)
end

function SCIPcalcChildEstimate(scip, var, targetvalue)
    ccall((:SCIPcalcChildEstimate, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, targetvalue)
end

function SCIPcalcChildEstimateIncrease(scip, var, varsol, targetvalue)
    ccall((:SCIPcalcChildEstimateIncrease, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble), scip, var, varsol, targetvalue)
end

function SCIPcreateChild(scip, node, nodeselprio, estimate)
    ccall((:SCIPcreateChild, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_NODE}}, Cdouble, Cdouble), scip, node, nodeselprio, estimate)
end

function SCIPbranchVar(scip, var, downchild, eqchild, upchild)
    ccall((:SCIPbranchVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_NODE}}, Ptr{Ptr{SCIP_NODE}}, Ptr{Ptr{SCIP_NODE}}), scip, var, downchild, eqchild, upchild)
end

function SCIPbranchVarHole(scip, var, left, right, downchild, upchild)
    ccall((:SCIPbranchVarHole, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Ptr{Ptr{SCIP_NODE}}, Ptr{Ptr{SCIP_NODE}}), scip, var, left, right, downchild, upchild)
end

function SCIPbranchVarVal(scip, var, val, downchild, eqchild, upchild)
    ccall((:SCIPbranchVarVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Ptr{Ptr{SCIP_NODE}}, Ptr{Ptr{SCIP_NODE}}, Ptr{Ptr{SCIP_NODE}}), scip, var, val, downchild, eqchild, upchild)
end

function SCIPbranchVarValNary(scip, var, val, n, minwidth, widthfactor, nchildren)
    ccall((:SCIPbranchVarValNary, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cint, Cdouble, Cdouble, Ptr{Cint}), scip, var, val, n, minwidth, widthfactor, nchildren)
end

function SCIPbranchLP(scip, result)
    ccall((:SCIPbranchLP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RESULT}), scip, result)
end

function SCIPbranchExtern(scip, result)
    ccall((:SCIPbranchExtern, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RESULT}), scip, result)
end

function SCIPbranchPseudo(scip, result)
    ccall((:SCIPbranchPseudo, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RESULT}), scip, result)
end

function SCIPincludeCompr(scip, name, desc, priority, minnnodes, comprcopy, comprfree, comprinit, comprexit, comprinitsol, comprexitsol, comprexec, comprdata)
    ccall((:SCIPincludeCompr, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_COMPRDATA}), scip, name, desc, priority, minnnodes, comprcopy, comprfree, comprinit, comprexit, comprinitsol, comprexitsol, comprexec, comprdata)
end

function SCIPincludeComprBasic(scip, compr, name, desc, priority, minnnodes, comprexec, comprdata)
    ccall((:SCIPincludeComprBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_COMPR}}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, Ptr{Cvoid}, Ptr{SCIP_COMPRDATA}), scip, compr, name, desc, priority, minnnodes, comprexec, comprdata)
end

function SCIPsetComprCopy(scip, compr, comprcopy)
    ccall((:SCIPsetComprCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_COMPR}, Ptr{Cvoid}), scip, compr, comprcopy)
end

function SCIPsetComprFree(scip, compr, comprfree)
    ccall((:SCIPsetComprFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_COMPR}, Ptr{Cvoid}), scip, compr, comprfree)
end

function SCIPsetComprInit(scip, compr, comprinit)
    ccall((:SCIPsetComprInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_COMPR}, Ptr{Cvoid}), scip, compr, comprinit)
end

function SCIPsetComprExit(scip, compr, comprexit)
    ccall((:SCIPsetComprExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_COMPR}, Ptr{Cvoid}), scip, compr, comprexit)
end

function SCIPsetComprInitsol(scip, compr, comprinitsol)
    ccall((:SCIPsetComprInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_COMPR}, Ptr{Cvoid}), scip, compr, comprinitsol)
end

function SCIPsetComprExitsol(scip, compr, comprexitsol)
    ccall((:SCIPsetComprExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_COMPR}, Ptr{Cvoid}), scip, compr, comprexitsol)
end

function SCIPfindCompr(scip, name)
    ccall((:SCIPfindCompr, libscip), Ptr{SCIP_COMPR}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetComprs(scip)
    ccall((:SCIPgetComprs, libscip), Ptr{Ptr{SCIP_COMPR}}, (Ptr{SCIP},), scip)
end

function SCIPgetNCompr(scip)
    ccall((:SCIPgetNCompr, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPsetComprPriority(scip, compr, priority)
    ccall((:SCIPsetComprPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_COMPR}, Cint), scip, compr, priority)
end

function SCIPincludeConcsolverType(scip, name, prefpriodefault, concsolvercreateinst, concsolverdestroyinst, concsolverinitseeds, concsolverexec, concsolvercopysolvdata, concsolverstop, concsolversyncwrite, concsolversyncread, concsolvertypefreedata, data)
    ccall((:SCIPincludeConcsolverType, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Cdouble, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_CONCSOLVERTYPEDATA}), scip, name, prefpriodefault, concsolvercreateinst, concsolverdestroyinst, concsolverinitseeds, concsolverexec, concsolvercopysolvdata, concsolverstop, concsolversyncwrite, concsolversyncread, concsolvertypefreedata, data)
end

function SCIPfindConcsolverType(scip, name)
    ccall((:SCIPfindConcsolverType, libscip), Ptr{SCIP_CONCSOLVERTYPE}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetConcsolverTypes(scip)
    ccall((:SCIPgetConcsolverTypes, libscip), Ptr{Ptr{SCIP_CONCSOLVERTYPE}}, (Ptr{SCIP},), scip)
end

function SCIPgetNConcsolverTypes(scip)
    ccall((:SCIPgetNConcsolverTypes, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPconstructSyncstore(scip)
    ccall((:SCIPconstructSyncstore, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPfreeSyncstore(scip)
    ccall((:SCIPfreeSyncstore, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPgetSyncstore(scip)
    ccall((:SCIPgetSyncstore, libscip), Ptr{SCIP_SYNCSTORE}, (Ptr{SCIP},), scip)
end

function SCIPincludeConflicthdlr(scip, name, desc, priority, conflictcopy, conflictfree, conflictinit, conflictexit, conflictinitsol, conflictexitsol, conflictexec, conflicthdlrdata)
    ccall((:SCIPincludeConflicthdlr, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_CONFLICTHDLRDATA}), scip, name, desc, priority, conflictcopy, conflictfree, conflictinit, conflictexit, conflictinitsol, conflictexitsol, conflictexec, conflicthdlrdata)
end

function SCIPincludeConflicthdlrBasic(scip, conflicthdlrptr, name, desc, priority, conflictexec, conflicthdlrdata)
    ccall((:SCIPincludeConflicthdlrBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONFLICTHDLR}}, Ptr{Cchar}, Ptr{Cchar}, Cint, Ptr{Cvoid}, Ptr{SCIP_CONFLICTHDLRDATA}), scip, conflicthdlrptr, name, desc, priority, conflictexec, conflicthdlrdata)
end

function SCIPsetConflicthdlrCopy(scip, conflicthdlr, conflictcopy)
    ccall((:SCIPsetConflicthdlrCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONFLICTHDLR}, Ptr{Cvoid}), scip, conflicthdlr, conflictcopy)
end

function SCIPsetConflicthdlrFree(scip, conflicthdlr, conflictfree)
    ccall((:SCIPsetConflicthdlrFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONFLICTHDLR}, Ptr{Cvoid}), scip, conflicthdlr, conflictfree)
end

function SCIPsetConflicthdlrInit(scip, conflicthdlr, conflictinit)
    ccall((:SCIPsetConflicthdlrInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONFLICTHDLR}, Ptr{Cvoid}), scip, conflicthdlr, conflictinit)
end

function SCIPsetConflicthdlrExit(scip, conflicthdlr, conflictexit)
    ccall((:SCIPsetConflicthdlrExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONFLICTHDLR}, Ptr{Cvoid}), scip, conflicthdlr, conflictexit)
end

function SCIPsetConflicthdlrInitsol(scip, conflicthdlr, conflictinitsol)
    ccall((:SCIPsetConflicthdlrInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONFLICTHDLR}, Ptr{Cvoid}), scip, conflicthdlr, conflictinitsol)
end

function SCIPsetConflicthdlrExitsol(scip, conflicthdlr, conflictexitsol)
    ccall((:SCIPsetConflicthdlrExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONFLICTHDLR}, Ptr{Cvoid}), scip, conflicthdlr, conflictexitsol)
end

function SCIPfindConflicthdlr(scip, name)
    ccall((:SCIPfindConflicthdlr, libscip), Ptr{SCIP_CONFLICTHDLR}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetConflicthdlrs(scip)
    ccall((:SCIPgetConflicthdlrs, libscip), Ptr{Ptr{SCIP_CONFLICTHDLR}}, (Ptr{SCIP},), scip)
end

function SCIPgetNConflicthdlrs(scip)
    ccall((:SCIPgetNConflicthdlrs, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPsetConflicthdlrPriority(scip, conflicthdlr, priority)
    ccall((:SCIPsetConflicthdlrPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONFLICTHDLR}, Cint), scip, conflicthdlr, priority)
end

function SCIPisConflictAnalysisApplicable(scip)
    ccall((:SCIPisConflictAnalysisApplicable, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPinitConflictAnalysis(scip, conftype, iscutoffinvolved)
    ccall((:SCIPinitConflictAnalysis, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_CONFTYPE, Cuint), scip, conftype, iscutoffinvolved)
end

function SCIPaddConflictLb(scip, var, bdchgidx)
    ccall((:SCIPaddConflictLb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}), scip, var, bdchgidx)
end

function SCIPaddConflictRelaxedLb(scip, var, bdchgidx, relaxedlb)
    ccall((:SCIPaddConflictRelaxedLb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, Cdouble), scip, var, bdchgidx, relaxedlb)
end

function SCIPaddConflictUb(scip, var, bdchgidx)
    ccall((:SCIPaddConflictUb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}), scip, var, bdchgidx)
end

function SCIPaddConflictRelaxedUb(scip, var, bdchgidx, relaxedub)
    ccall((:SCIPaddConflictRelaxedUb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, Cdouble), scip, var, bdchgidx, relaxedub)
end

function SCIPaddConflictBd(scip, var, boundtype, bdchgidx)
    ccall((:SCIPaddConflictBd, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BOUNDTYPE, Ptr{SCIP_BDCHGIDX}), scip, var, boundtype, bdchgidx)
end

function SCIPaddConflictRelaxedBd(scip, var, boundtype, bdchgidx, relaxedbd)
    ccall((:SCIPaddConflictRelaxedBd, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BOUNDTYPE, Ptr{SCIP_BDCHGIDX}, Cdouble), scip, var, boundtype, bdchgidx, relaxedbd)
end

function SCIPaddConflictBinvar(scip, var)
    ccall((:SCIPaddConflictBinvar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPisConflictVarUsed(scip, var, boundtype, bdchgidx, used)
    ccall((:SCIPisConflictVarUsed, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BOUNDTYPE, Ptr{SCIP_BDCHGIDX}, Ptr{Cuint}), scip, var, boundtype, bdchgidx, used)
end

function SCIPgetConflictVarLb(scip, var)
    ccall((:SCIPgetConflictVarLb, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetConflictVarUb(scip, var)
    ccall((:SCIPgetConflictVarUb, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPanalyzeConflict(scip, validdepth, success)
    ccall((:SCIPanalyzeConflict, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Cuint}), scip, validdepth, success)
end

function SCIPanalyzeConflictCons(scip, cons, success)
    ccall((:SCIPanalyzeConflictCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Cuint}), scip, cons, success)
end

function SCIPincludeConshdlr(scip, name, desc, sepapriority, enfopriority, chckpriority, sepafreq, propfreq, eagerfreq, maxprerounds, delaysepa, delayprop, needscons, proptiming, presoltiming, conshdlrcopy, consfree, consinit, consexit, consinitpre, consexitpre, consinitsol, consexitsol, consdelete, constrans, consinitlp, conssepalp, conssepasol, consenfolp, consenforelax, consenfops, conscheck, consprop, conspresol, consresprop, conslock, consactive, consdeactive, consenable, consdisable, consdelvars, consprint, conscopy, consparse, consgetvars, consgetnvars, consgetdivebdchgs, conshdlrdata)
    ccall((:SCIPincludeConshdlr, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cuint, Cuint, Cuint, SCIP_PROPTIMING, SCIP_PRESOLTIMING, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_CONSHDLRDATA}), scip, name, desc, sepapriority, enfopriority, chckpriority, sepafreq, propfreq, eagerfreq, maxprerounds, delaysepa, delayprop, needscons, proptiming, presoltiming, conshdlrcopy, consfree, consinit, consexit, consinitpre, consexitpre, consinitsol, consexitsol, consdelete, constrans, consinitlp, conssepalp, conssepasol, consenfolp, consenforelax, consenfops, conscheck, consprop, conspresol, consresprop, conslock, consactive, consdeactive, consenable, consdisable, consdelvars, consprint, conscopy, consparse, consgetvars, consgetnvars, consgetdivebdchgs, conshdlrdata)
end

function SCIPincludeConshdlrBasic(scip, conshdlrptr, name, desc, enfopriority, chckpriority, eagerfreq, needscons, consenfolp, consenfops, conscheck, conslock, conshdlrdata)
    ccall((:SCIPincludeConshdlrBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONSHDLR}}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, Cint, Cuint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_CONSHDLRDATA}), scip, conshdlrptr, name, desc, enfopriority, chckpriority, eagerfreq, needscons, consenfolp, consenfops, conscheck, conslock, conshdlrdata)
end

function SCIPsetConshdlrSepa(scip, conshdlr, conssepalp, conssepasol, sepafreq, sepapriority, delaysepa)
    ccall((:SCIPsetConshdlrSepa, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Cuint), scip, conshdlr, conssepalp, conssepasol, sepafreq, sepapriority, delaysepa)
end

function SCIPsetConshdlrProp(scip, conshdlr, consprop, propfreq, delayprop, proptiming)
    ccall((:SCIPsetConshdlrProp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}, Cint, Cuint, SCIP_PROPTIMING), scip, conshdlr, consprop, propfreq, delayprop, proptiming)
end

function SCIPsetConshdlrEnforelax(scip, conshdlr, consenforelax)
    ccall((:SCIPsetConshdlrEnforelax, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consenforelax)
end

function SCIPsetConshdlrCopy(scip, conshdlr, conshdlrcopy, conscopy)
    ccall((:SCIPsetConshdlrCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}, Ptr{Cvoid}), scip, conshdlr, conshdlrcopy, conscopy)
end

function SCIPsetConshdlrFree(scip, conshdlr, consfree)
    ccall((:SCIPsetConshdlrFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consfree)
end

function SCIPsetConshdlrInit(scip, conshdlr, consinit)
    ccall((:SCIPsetConshdlrInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consinit)
end

function SCIPsetConshdlrExit(scip, conshdlr, consexit)
    ccall((:SCIPsetConshdlrExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consexit)
end

function SCIPsetConshdlrInitsol(scip, conshdlr, consinitsol)
    ccall((:SCIPsetConshdlrInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consinitsol)
end

function SCIPsetConshdlrExitsol(scip, conshdlr, consexitsol)
    ccall((:SCIPsetConshdlrExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consexitsol)
end

function SCIPsetConshdlrInitpre(scip, conshdlr, consinitpre)
    ccall((:SCIPsetConshdlrInitpre, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consinitpre)
end

function SCIPsetConshdlrExitpre(scip, conshdlr, consexitpre)
    ccall((:SCIPsetConshdlrExitpre, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consexitpre)
end

function SCIPsetConshdlrPresol(scip, conshdlr, conspresol, maxprerounds, presoltiming)
    ccall((:SCIPsetConshdlrPresol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}, Cint, SCIP_PRESOLTIMING), scip, conshdlr, conspresol, maxprerounds, presoltiming)
end

function SCIPsetConshdlrDelete(scip, conshdlr, consdelete)
    ccall((:SCIPsetConshdlrDelete, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consdelete)
end

function SCIPsetConshdlrTrans(scip, conshdlr, constrans)
    ccall((:SCIPsetConshdlrTrans, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, constrans)
end

function SCIPsetConshdlrInitlp(scip, conshdlr, consinitlp)
    ccall((:SCIPsetConshdlrInitlp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consinitlp)
end

function SCIPsetConshdlrResprop(scip, conshdlr, consresprop)
    ccall((:SCIPsetConshdlrResprop, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consresprop)
end

function SCIPsetConshdlrActive(scip, conshdlr, consactive)
    ccall((:SCIPsetConshdlrActive, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consactive)
end

function SCIPsetConshdlrDeactive(scip, conshdlr, consdeactive)
    ccall((:SCIPsetConshdlrDeactive, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consdeactive)
end

function SCIPsetConshdlrEnable(scip, conshdlr, consenable)
    ccall((:SCIPsetConshdlrEnable, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consenable)
end

function SCIPsetConshdlrDisable(scip, conshdlr, consdisable)
    ccall((:SCIPsetConshdlrDisable, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consdisable)
end

function SCIPsetConshdlrDelvars(scip, conshdlr, consdelvars)
    ccall((:SCIPsetConshdlrDelvars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consdelvars)
end

function SCIPsetConshdlrPrint(scip, conshdlr, consprint)
    ccall((:SCIPsetConshdlrPrint, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consprint)
end

function SCIPsetConshdlrParse(scip, conshdlr, consparse)
    ccall((:SCIPsetConshdlrParse, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consparse)
end

function SCIPsetConshdlrGetVars(scip, conshdlr, consgetvars)
    ccall((:SCIPsetConshdlrGetVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consgetvars)
end

function SCIPsetConshdlrGetNVars(scip, conshdlr, consgetnvars)
    ccall((:SCIPsetConshdlrGetNVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consgetnvars)
end

function SCIPsetConshdlrGetDiveBdChgs(scip, conshdlr, consgetdivebdchgs)
    ccall((:SCIPsetConshdlrGetDiveBdChgs, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{Cvoid}), scip, conshdlr, consgetdivebdchgs)
end

function SCIPfindConshdlr(scip, name)
    ccall((:SCIPfindConshdlr, libscip), Ptr{SCIP_CONSHDLR}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetConshdlrs(scip)
    ccall((:SCIPgetConshdlrs, libscip), Ptr{Ptr{SCIP_CONSHDLR}}, (Ptr{SCIP},), scip)
end

function SCIPgetNConshdlrs(scip)
    ccall((:SCIPgetNConshdlrs, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPcreateCons(scip, cons, name, conshdlr, consdata, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_CONSDATA}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, conshdlr, consdata, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPparseCons(scip, cons, str, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode, success)
    ccall((:SCIPparseCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Ptr{Cuint}), scip, cons, str, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode, success)
end

function SCIPcaptureCons(scip, cons)
    ccall((:SCIPcaptureCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPreleaseCons(scip, cons)
    ccall((:SCIPreleaseCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}), scip, cons)
end

function SCIPchgConsName(scip, cons, name)
    ccall((:SCIPchgConsName, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Cchar}), scip, cons, name)
end

function SCIPsetConsInitial(scip, cons, initial)
    ccall((:SCIPsetConsInitial, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cuint), scip, cons, initial)
end

function SCIPsetConsSeparated(scip, cons, separate)
    ccall((:SCIPsetConsSeparated, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cuint), scip, cons, separate)
end

function SCIPsetConsEnforced(scip, cons, enforce)
    ccall((:SCIPsetConsEnforced, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cuint), scip, cons, enforce)
end

function SCIPsetConsChecked(scip, cons, check)
    ccall((:SCIPsetConsChecked, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cuint), scip, cons, check)
end

function SCIPsetConsPropagated(scip, cons, propagate)
    ccall((:SCIPsetConsPropagated, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cuint), scip, cons, propagate)
end

function SCIPsetConsLocal(scip, cons, _local)
    ccall((:SCIPsetConsLocal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cuint), scip, cons, _local)
end

function SCIPsetConsModifiable(scip, cons, modifiable)
    ccall((:SCIPsetConsModifiable, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cuint), scip, cons, modifiable)
end

function SCIPsetConsDynamic(scip, cons, dynamic)
    ccall((:SCIPsetConsDynamic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cuint), scip, cons, dynamic)
end

function SCIPsetConsRemovable(scip, cons, removable)
    ccall((:SCIPsetConsRemovable, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cuint), scip, cons, removable)
end

function SCIPsetConsStickingAtNode(scip, cons, stickingatnode)
    ccall((:SCIPsetConsStickingAtNode, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cuint), scip, cons, stickingatnode)
end

function SCIPupdateConsFlags(scip, cons0, cons1)
    ccall((:SCIPupdateConsFlags, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_CONS}), scip, cons0, cons1)
end

function SCIPtransformCons(scip, cons, transcons)
    ccall((:SCIPtransformCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_CONS}}), scip, cons, transcons)
end

function SCIPtransformConss(scip, nconss, conss, transconss)
    ccall((:SCIPtransformConss, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_CONS}}, Ptr{Ptr{SCIP_CONS}}), scip, nconss, conss, transconss)
end

function SCIPgetTransformedCons(scip, cons, transcons)
    ccall((:SCIPgetTransformedCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_CONS}}), scip, cons, transcons)
end

function SCIPgetTransformedConss(scip, nconss, conss, transconss)
    ccall((:SCIPgetTransformedConss, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_CONS}}, Ptr{Ptr{SCIP_CONS}}), scip, nconss, conss, transconss)
end

function SCIPaddConsAge(scip, cons, deltaage)
    ccall((:SCIPaddConsAge, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cdouble), scip, cons, deltaage)
end

function SCIPincConsAge(scip, cons)
    ccall((:SCIPincConsAge, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPresetConsAge(scip, cons)
    ccall((:SCIPresetConsAge, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPenableCons(scip, cons)
    ccall((:SCIPenableCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPdisableCons(scip, cons)
    ccall((:SCIPdisableCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPenableConsSeparation(scip, cons)
    ccall((:SCIPenableConsSeparation, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPdisableConsSeparation(scip, cons)
    ccall((:SCIPdisableConsSeparation, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPenableConsPropagation(scip, cons)
    ccall((:SCIPenableConsPropagation, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPdisableConsPropagation(scip, cons)
    ccall((:SCIPdisableConsPropagation, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPmarkConsPropagate(scip, cons)
    ccall((:SCIPmarkConsPropagate, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPunmarkConsPropagate(scip, cons)
    ccall((:SCIPunmarkConsPropagate, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPaddConsLocksType(scip, cons, locktype, nlockspos, nlocksneg)
    ccall((:SCIPaddConsLocksType, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, SCIP_LOCKTYPE, Cint, Cint), scip, cons, locktype, nlockspos, nlocksneg)
end

function SCIPaddConsLocks(scip, cons, nlockspos, nlocksneg)
    ccall((:SCIPaddConsLocks, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cint, Cint), scip, cons, nlockspos, nlocksneg)
end

function SCIPcheckCons(scip, cons, sol, checkintegrality, checklprows, printreason, result)
    ccall((:SCIPcheckCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}, Cuint, Cuint, Cuint, Ptr{SCIP_RESULT}), scip, cons, sol, checkintegrality, checklprows, printreason, result)
end

function SCIPenfopsCons(scip, cons, solinfeasible, objinfeasible, result)
    ccall((:SCIPenfopsCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cuint, Cuint, Ptr{SCIP_RESULT}), scip, cons, solinfeasible, objinfeasible, result)
end

function SCIPenfolpCons(scip, cons, solinfeasible, result)
    ccall((:SCIPenfolpCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cuint, Ptr{SCIP_RESULT}), scip, cons, solinfeasible, result)
end

function SCIPenforelaxCons(scip, cons, sol, solinfeasible, result)
    ccall((:SCIPenforelaxCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}, Cuint, Ptr{SCIP_RESULT}), scip, cons, sol, solinfeasible, result)
end

function SCIPinitlpCons(scip, cons, infeasible)
    ccall((:SCIPinitlpCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Cuint}), scip, cons, infeasible)
end

function SCIPsepalpCons(scip, cons, result)
    ccall((:SCIPsepalpCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_RESULT}), scip, cons, result)
end

function SCIPsepasolCons(scip, cons, sol, result)
    ccall((:SCIPsepasolCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}, Ptr{SCIP_RESULT}), scip, cons, sol, result)
end

function SCIPpropCons(scip, cons, proptiming, result)
    ccall((:SCIPpropCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, SCIP_PROPTIMING, Ptr{SCIP_RESULT}), scip, cons, proptiming, result)
end

function SCIPrespropCons(scip, cons, infervar, inferinfo, boundtype, bdchgidx, relaxedbd, result)
    ccall((:SCIPrespropCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cint, SCIP_BOUNDTYPE, Ptr{SCIP_BDCHGIDX}, Cdouble, Ptr{SCIP_RESULT}), scip, cons, infervar, inferinfo, boundtype, bdchgidx, relaxedbd, result)
end

function SCIPpresolCons(scip, cons, nrounds, presoltiming, nnewfixedvars, nnewaggrvars, nnewchgvartypes, nnewchgbds, nnewholes, nnewdelconss, nnewaddconss, nnewupgdconss, nnewchgcoefs, nnewchgsides, nfixedvars, naggrvars, nchgvartypes, nchgbds, naddholes, ndelconss, naddconss, nupgdconss, nchgcoefs, nchgsides, result)
    ccall((:SCIPpresolCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cint, SCIP_PRESOLTIMING, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{SCIP_RESULT}), scip, cons, nrounds, presoltiming, nnewfixedvars, nnewaggrvars, nnewchgvartypes, nnewchgbds, nnewholes, nnewdelconss, nnewaddconss, nnewupgdconss, nnewchgcoefs, nnewchgsides, nfixedvars, naggrvars, nchgvartypes, nchgbds, naddholes, ndelconss, naddconss, nupgdconss, nchgcoefs, nchgsides, result)
end

function SCIPactiveCons(scip, cons)
    ccall((:SCIPactiveCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPdeactiveCons(scip, cons)
    ccall((:SCIPdeactiveCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPprintCons(scip, cons, file)
    ccall((:SCIPprintCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Libc.FILE}), scip, cons, file)
end

function SCIPgetConsVars(scip, cons, vars, varssize, success)
    ccall((:SCIPgetConsVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Cuint}), scip, cons, vars, varssize, success)
end

function SCIPgetConsNVars(scip, cons, nvars, success)
    ccall((:SCIPgetConsNVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Cint}, Ptr{Cuint}), scip, cons, nvars, success)
end

function SCIPcopyPlugins(sourcescip, targetscip, copyreaders, copypricers, copyconshdlrs, copyconflicthdlrs, copypresolvers, copyrelaxators, copyseparators, copypropagators, copyheuristics, copyeventhdlrs, copynodeselectors, copybranchrules, copydisplays, copydialogs, copytables, copynlpis, passmessagehdlr, valid)
    ccall((:SCIPcopyPlugins, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Ptr{Cuint}), sourcescip, targetscip, copyreaders, copypricers, copyconshdlrs, copyconflicthdlrs, copypresolvers, copyrelaxators, copyseparators, copypropagators, copyheuristics, copyeventhdlrs, copynodeselectors, copybranchrules, copydisplays, copydialogs, copytables, copynlpis, passmessagehdlr, valid)
end

function SCIPcopyBenders(sourcescip, targetscip, varmap, threadsafe, valid)
    ccall((:SCIPcopyBenders, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Cuint, Ptr{Cuint}), sourcescip, targetscip, varmap, threadsafe, valid)
end

function SCIPcopyProb(sourcescip, targetscip, varmap, consmap, _global, name)
    ccall((:SCIPcopyProb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cuint, Ptr{Cchar}), sourcescip, targetscip, varmap, consmap, _global, name)
end

function SCIPcopyOrigProb(sourcescip, targetscip, varmap, consmap, name)
    ccall((:SCIPcopyOrigProb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Ptr{Cchar}), sourcescip, targetscip, varmap, consmap, name)
end

function SCIPenableConsCompression(scip)
    ccall((:SCIPenableConsCompression, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPisConsCompressionEnabled(scip)
    ccall((:SCIPisConsCompressionEnabled, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPgetVarCopy(sourcescip, targetscip, sourcevar, targetvar, varmap, consmap, _global, success)
    ccall((:SCIPgetVarCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cuint, Ptr{Cuint}), sourcescip, targetscip, sourcevar, targetvar, varmap, consmap, _global, success)
end

function SCIPcopyVars(sourcescip, targetscip, varmap, consmap, fixedvars, fixedvals, nfixedvars, _global)
    ccall((:SCIPcopyVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Cuint), sourcescip, targetscip, varmap, consmap, fixedvars, fixedvals, nfixedvars, _global)
end

function SCIPcopyOrigVars(sourcescip, targetscip, varmap, consmap, fixedvars, fixedvals, nfixedvars)
    ccall((:SCIPcopyOrigVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint), sourcescip, targetscip, varmap, consmap, fixedvars, fixedvals, nfixedvars)
end

function SCIPmergeVariableStatistics(sourcescip, targetscip, sourcevars, targetvars, nvars)
    ccall((:SCIPmergeVariableStatistics, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}, Cint), sourcescip, targetscip, sourcevars, targetvars, nvars)
end

function SCIPtranslateSubSol(scip, subscip, subsol, heur, subvars, newsol)
    ccall((:SCIPtranslateSubSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{SCIP_HEUR}, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_SOL}}), scip, subscip, subsol, heur, subvars, newsol)
end

function SCIPtranslateSubSols(scip, subscip, heur, subvars, success, solindex)
    ccall((:SCIPtranslateSubSols, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HEUR}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cuint}, Ptr{Cint}), scip, subscip, heur, subvars, success, solindex)
end

function SCIPgetConsCopy(sourcescip, targetscip, sourcecons, targetcons, sourceconshdlr, varmap, consmap, name, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode, _global, valid)
    ccall((:SCIPgetConsCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_CONS}}, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Ptr{Cchar}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Ptr{Cuint}), sourcescip, targetscip, sourcecons, targetcons, sourceconshdlr, varmap, consmap, name, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode, _global, valid)
end

function SCIPcopyConss(sourcescip, targetscip, varmap, consmap, _global, enablepricing, valid)
    ccall((:SCIPcopyConss, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cuint, Cuint, Ptr{Cuint}), sourcescip, targetscip, varmap, consmap, _global, enablepricing, valid)
end

function SCIPcopyOrigConss(sourcescip, targetscip, varmap, consmap, enablepricing, valid)
    ccall((:SCIPcopyOrigConss, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cuint, Ptr{Cuint}), sourcescip, targetscip, varmap, consmap, enablepricing, valid)
end

function SCIPconvertCutsToConss(scip, varmap, consmap, _global, ncutsadded)
    ccall((:SCIPconvertCutsToConss, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cuint, Ptr{Cint}), scip, varmap, consmap, _global, ncutsadded)
end

function SCIPcopyCuts(sourcescip, targetscip, varmap, consmap, _global, ncutsadded)
    ccall((:SCIPcopyCuts, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cuint, Ptr{Cint}), sourcescip, targetscip, varmap, consmap, _global, ncutsadded)
end

function SCIPcopyConflicts(sourcescip, targetscip, varmap, consmap, _global, enablepricing, valid)
    ccall((:SCIPcopyConflicts, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cuint, Cuint, Ptr{Cuint}), sourcescip, targetscip, varmap, consmap, _global, enablepricing, valid)
end

function SCIPcopyImplicationsCliques(sourcescip, targetscip, varmap, consmap, _global, infeasible, nbdchgs, ncopied)
    ccall((:SCIPcopyImplicationsCliques, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cuint, Ptr{Cuint}, Ptr{Cint}, Ptr{Cint}), sourcescip, targetscip, varmap, consmap, _global, infeasible, nbdchgs, ncopied)
end

function SCIPcopyParamSettings(sourcescip, targetscip)
    ccall((:SCIPcopyParamSettings, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}), sourcescip, targetscip)
end

function SCIPgetSubscipDepth(scip)
    ccall((:SCIPgetSubscipDepth, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPsetSubscipDepth(scip, newdepth)
    ccall((:SCIPsetSubscipDepth, libscip), Cvoid, (Ptr{SCIP}, Cint), scip, newdepth)
end

function SCIPcopy(sourcescip, targetscip, varmap, consmap, suffix, _global, enablepricing, threadsafe, passmessagehdlr, valid)
    ccall((:SCIPcopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Ptr{Cchar}, Cuint, Cuint, Cuint, Cuint, Ptr{Cuint}), sourcescip, targetscip, varmap, consmap, suffix, _global, enablepricing, threadsafe, passmessagehdlr, valid)
end

function SCIPcopyConsCompression(sourcescip, targetscip, varmap, consmap, suffix, fixedvars, fixedvals, nfixedvars, _global, enablepricing, threadsafe, passmessagehdlr, valid)
    ccall((:SCIPcopyConsCompression, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Ptr{Cchar}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Cuint, Cuint, Cuint, Cuint, Ptr{Cuint}), sourcescip, targetscip, varmap, consmap, suffix, fixedvars, fixedvals, nfixedvars, _global, enablepricing, threadsafe, passmessagehdlr, valid)
end

function SCIPcopyOrig(sourcescip, targetscip, varmap, consmap, suffix, enablepricing, threadsafe, passmessagehdlr, valid)
    ccall((:SCIPcopyOrig, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Ptr{Cchar}, Cuint, Cuint, Cuint, Ptr{Cuint}), sourcescip, targetscip, varmap, consmap, suffix, enablepricing, threadsafe, passmessagehdlr, valid)
end

function SCIPcopyOrigConsCompression(sourcescip, targetscip, varmap, consmap, suffix, fixedvars, fixedvals, nfixedvars, enablepricing, threadsafe, passmessagehdlr, valid)
    ccall((:SCIPcopyOrigConsCompression, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Ptr{Cchar}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Cuint, Cuint, Cuint, Ptr{Cuint}), sourcescip, targetscip, varmap, consmap, suffix, fixedvars, fixedvals, nfixedvars, enablepricing, threadsafe, passmessagehdlr, valid)
end

function SCIPcheckCopyLimits(sourcescip, success)
    ccall((:SCIPcheckCopyLimits, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cuint}), sourcescip, success)
end

function SCIPcopyLimits(sourcescip, targetscip)
    ccall((:SCIPcopyLimits, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}), sourcescip, targetscip)
end

function SCIPsetCommonSubscipParams(sourcescip, subscip, nsubnodes, nstallnodes, bestsollimit)
    ccall((:SCIPsetCommonSubscipParams, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP}, Clonglong, Clonglong, Cint), sourcescip, subscip, nsubnodes, nstallnodes, bestsollimit)
end

function SCIPgetCutEfficacy(scip, sol, cut)
    ccall((:SCIPgetCutEfficacy, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{SCIP_ROW}), scip, sol, cut)
end

function SCIPisCutEfficacious(scip, sol, cut)
    ccall((:SCIPisCutEfficacious, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{SCIP_ROW}), scip, sol, cut)
end

function SCIPisEfficacious(scip, efficacy)
    ccall((:SCIPisEfficacious, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, efficacy)
end

function SCIPgetVectorEfficacyNorm(scip, vals, nvals)
    ccall((:SCIPgetVectorEfficacyNorm, libscip), Cdouble, (Ptr{SCIP}, Ptr{Cdouble}, Cint), scip, vals, nvals)
end

function SCIPisCutApplicable(scip, cut)
    ccall((:SCIPisCutApplicable, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, cut)
end

function SCIPaddCut(scip, sol, cut, forcecut, infeasible)
    ccall((:SCIPaddCut, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{SCIP_ROW}, Cuint, Ptr{Cuint}), scip, sol, cut, forcecut, infeasible)
end

function SCIPaddRow(scip, row, forcecut, infeasible)
    ccall((:SCIPaddRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Cuint, Ptr{Cuint}), scip, row, forcecut, infeasible)
end

function SCIPisCutNew(scip, row)
    ccall((:SCIPisCutNew, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPaddPoolCut(scip, row)
    ccall((:SCIPaddPoolCut, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPdelPoolCut(scip, row)
    ccall((:SCIPdelPoolCut, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetPoolCuts(scip)
    ccall((:SCIPgetPoolCuts, libscip), Ptr{Ptr{SCIP_CUT}}, (Ptr{SCIP},), scip)
end

function SCIPgetNPoolCuts(scip)
    ccall((:SCIPgetNPoolCuts, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetGlobalCutpool(scip)
    ccall((:SCIPgetGlobalCutpool, libscip), Ptr{SCIP_CUTPOOL}, (Ptr{SCIP},), scip)
end

function SCIPcreateCutpool(scip, cutpool, agelimit)
    ccall((:SCIPcreateCutpool, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CUTPOOL}}, Cint), scip, cutpool, agelimit)
end

function SCIPfreeCutpool(scip, cutpool)
    ccall((:SCIPfreeCutpool, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CUTPOOL}}), scip, cutpool)
end

function SCIPaddRowCutpool(scip, cutpool, row)
    ccall((:SCIPaddRowCutpool, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CUTPOOL}, Ptr{SCIP_ROW}), scip, cutpool, row)
end

function SCIPaddNewRowCutpool(scip, cutpool, row)
    ccall((:SCIPaddNewRowCutpool, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CUTPOOL}, Ptr{SCIP_ROW}), scip, cutpool, row)
end

function SCIPdelRowCutpool(scip, cutpool, row)
    ccall((:SCIPdelRowCutpool, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CUTPOOL}, Ptr{SCIP_ROW}), scip, cutpool, row)
end

function SCIPseparateCutpool(scip, cutpool, result)
    ccall((:SCIPseparateCutpool, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CUTPOOL}, Ptr{SCIP_RESULT}), scip, cutpool, result)
end

function SCIPseparateSolCutpool(scip, cutpool, sol, result)
    ccall((:SCIPseparateSolCutpool, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CUTPOOL}, Ptr{SCIP_SOL}, Ptr{SCIP_RESULT}), scip, cutpool, sol, result)
end

function SCIPaddDelayedPoolCut(scip, row)
    ccall((:SCIPaddDelayedPoolCut, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPdelDelayedPoolCut(scip, row)
    ccall((:SCIPdelDelayedPoolCut, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetDelayedPoolCuts(scip)
    ccall((:SCIPgetDelayedPoolCuts, libscip), Ptr{Ptr{SCIP_CUT}}, (Ptr{SCIP},), scip)
end

function SCIPgetNDelayedPoolCuts(scip)
    ccall((:SCIPgetNDelayedPoolCuts, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetDelayedGlobalCutpool(scip)
    ccall((:SCIPgetDelayedGlobalCutpool, libscip), Ptr{SCIP_CUTPOOL}, (Ptr{SCIP},), scip)
end

function SCIPseparateSol(scip, sol, pretendroot, allowlocal, onlydelayed, delayed, cutoff)
    ccall((:SCIPseparateSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cuint, Cuint, Cuint, Ptr{Cuint}, Ptr{Cuint}), scip, sol, pretendroot, allowlocal, onlydelayed, delayed, cutoff)
end

function SCIPgetCuts(scip)
    ccall((:SCIPgetCuts, libscip), Ptr{Ptr{SCIP_ROW}}, (Ptr{SCIP},), scip)
end

function SCIPgetNCuts(scip)
    ccall((:SCIPgetNCuts, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPclearCuts(scip)
    ccall((:SCIPclearCuts, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPremoveInefficaciousCuts(scip)
    ccall((:SCIPremoveInefficaciousCuts, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateRealarray(scip, realarray)
    ccall((:SCIPcreateRealarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_REALARRAY}}), scip, realarray)
end

function SCIPfreeRealarray(scip, realarray)
    ccall((:SCIPfreeRealarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_REALARRAY}}), scip, realarray)
end

function SCIPextendRealarray(scip, realarray, minidx, maxidx)
    ccall((:SCIPextendRealarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_REALARRAY}, Cint, Cint), scip, realarray, minidx, maxidx)
end

function SCIPclearRealarray(scip, realarray)
    ccall((:SCIPclearRealarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_REALARRAY}), scip, realarray)
end

function SCIPgetRealarrayVal(scip, realarray, idx)
    ccall((:SCIPgetRealarrayVal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_REALARRAY}, Cint), scip, realarray, idx)
end

function SCIPsetRealarrayVal(scip, realarray, idx, val)
    ccall((:SCIPsetRealarrayVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_REALARRAY}, Cint, Cdouble), scip, realarray, idx, val)
end

function SCIPincRealarrayVal(scip, realarray, idx, incval)
    ccall((:SCIPincRealarrayVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_REALARRAY}, Cint, Cdouble), scip, realarray, idx, incval)
end

function SCIPgetRealarrayMinIdx(scip, realarray)
    ccall((:SCIPgetRealarrayMinIdx, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_REALARRAY}), scip, realarray)
end

function SCIPgetRealarrayMaxIdx(scip, realarray)
    ccall((:SCIPgetRealarrayMaxIdx, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_REALARRAY}), scip, realarray)
end

function SCIPcreateIntarray(scip, intarray)
    ccall((:SCIPcreateIntarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_INTARRAY}}), scip, intarray)
end

function SCIPfreeIntarray(scip, intarray)
    ccall((:SCIPfreeIntarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_INTARRAY}}), scip, intarray)
end

function SCIPextendIntarray(scip, intarray, minidx, maxidx)
    ccall((:SCIPextendIntarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_INTARRAY}, Cint, Cint), scip, intarray, minidx, maxidx)
end

function SCIPclearIntarray(scip, intarray)
    ccall((:SCIPclearIntarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_INTARRAY}), scip, intarray)
end

function SCIPgetIntarrayVal(scip, intarray, idx)
    ccall((:SCIPgetIntarrayVal, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_INTARRAY}, Cint), scip, intarray, idx)
end

function SCIPsetIntarrayVal(scip, intarray, idx, val)
    ccall((:SCIPsetIntarrayVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_INTARRAY}, Cint, Cint), scip, intarray, idx, val)
end

function SCIPincIntarrayVal(scip, intarray, idx, incval)
    ccall((:SCIPincIntarrayVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_INTARRAY}, Cint, Cint), scip, intarray, idx, incval)
end

function SCIPgetIntarrayMinIdx(scip, intarray)
    ccall((:SCIPgetIntarrayMinIdx, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_INTARRAY}), scip, intarray)
end

function SCIPgetIntarrayMaxIdx(scip, intarray)
    ccall((:SCIPgetIntarrayMaxIdx, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_INTARRAY}), scip, intarray)
end

function SCIPcreateBoolarray(scip, boolarray)
    ccall((:SCIPcreateBoolarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_BOOLARRAY}}), scip, boolarray)
end

function SCIPfreeBoolarray(scip, boolarray)
    ccall((:SCIPfreeBoolarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_BOOLARRAY}}), scip, boolarray)
end

function SCIPextendBoolarray(scip, boolarray, minidx, maxidx)
    ccall((:SCIPextendBoolarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BOOLARRAY}, Cint, Cint), scip, boolarray, minidx, maxidx)
end

function SCIPclearBoolarray(scip, boolarray)
    ccall((:SCIPclearBoolarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BOOLARRAY}), scip, boolarray)
end

function SCIPgetBoolarrayVal(scip, boolarray, idx)
    ccall((:SCIPgetBoolarrayVal, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_BOOLARRAY}, Cint), scip, boolarray, idx)
end

function SCIPsetBoolarrayVal(scip, boolarray, idx, val)
    ccall((:SCIPsetBoolarrayVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_BOOLARRAY}, Cint, Cuint), scip, boolarray, idx, val)
end

function SCIPgetBoolarrayMinIdx(scip, boolarray)
    ccall((:SCIPgetBoolarrayMinIdx, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_BOOLARRAY}), scip, boolarray)
end

function SCIPgetBoolarrayMaxIdx(scip, boolarray)
    ccall((:SCIPgetBoolarrayMaxIdx, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_BOOLARRAY}), scip, boolarray)
end

function SCIPcreatePtrarray(scip, ptrarray)
    ccall((:SCIPcreatePtrarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_PTRARRAY}}), scip, ptrarray)
end

function SCIPfreePtrarray(scip, ptrarray)
    ccall((:SCIPfreePtrarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_PTRARRAY}}), scip, ptrarray)
end

function SCIPextendPtrarray(scip, ptrarray, minidx, maxidx)
    ccall((:SCIPextendPtrarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PTRARRAY}, Cint, Cint), scip, ptrarray, minidx, maxidx)
end

function SCIPclearPtrarray(scip, ptrarray)
    ccall((:SCIPclearPtrarray, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PTRARRAY}), scip, ptrarray)
end

function SCIPgetPtrarrayVal(scip, ptrarray, idx)
    ccall((:SCIPgetPtrarrayVal, libscip), Ptr{Cvoid}, (Ptr{SCIP}, Ptr{SCIP_PTRARRAY}, Cint), scip, ptrarray, idx)
end

function SCIPsetPtrarrayVal(scip, ptrarray, idx, val)
    ccall((:SCIPsetPtrarrayVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PTRARRAY}, Cint, Ptr{Cvoid}), scip, ptrarray, idx, val)
end

function SCIPgetPtrarrayMinIdx(scip, ptrarray)
    ccall((:SCIPgetPtrarrayMinIdx, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_PTRARRAY}), scip, ptrarray)
end

function SCIPgetPtrarrayMaxIdx(scip, ptrarray)
    ccall((:SCIPgetPtrarrayMaxIdx, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_PTRARRAY}), scip, ptrarray)
end

function SCIPcreateDisjointset(scip, djset, ncomponents)
    ccall((:SCIPcreateDisjointset, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_DISJOINTSET}}, Cint), scip, djset, ncomponents)
end

function SCIPfreeDisjointset(scip, djset)
    ccall((:SCIPfreeDisjointset, libscip), Cvoid, (Ptr{SCIP}, Ptr{Ptr{SCIP_DISJOINTSET}}), scip, djset)
end

function SCIPcreateDigraph(scip, digraph, nnodes)
    ccall((:SCIPcreateDigraph, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_DIGRAPH}}, Cint), scip, digraph, nnodes)
end

function SCIPcopyDigraph(scip, targetdigraph, sourcedigraph)
    ccall((:SCIPcopyDigraph, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_DIGRAPH}}, Ptr{SCIP_DIGRAPH}), scip, targetdigraph, sourcedigraph)
end

function SCIPenableDebugSol(scip)
    ccall((:SCIPenableDebugSol, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPdisableDebugSol(scip)
    ccall((:SCIPdisableDebugSol, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPcreateDecomp(scip, decomp, nblocks, original, benderslabels)
    ccall((:SCIPcreateDecomp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_DECOMP}}, Cint, Cuint, Cuint), scip, decomp, nblocks, original, benderslabels)
end

function SCIPfreeDecomp(scip, decomp)
    ccall((:SCIPfreeDecomp, libscip), Cvoid, (Ptr{SCIP}, Ptr{Ptr{SCIP_DECOMP}}), scip, decomp)
end

function SCIPaddDecomp(scip, decomp)
    ccall((:SCIPaddDecomp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DECOMP}), scip, decomp)
end

function SCIPgetDecomps(scip, decomps, ndecomps, original)
    ccall((:SCIPgetDecomps, libscip), Cvoid, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_DECOMP}}}, Ptr{Cint}, Cuint), scip, decomps, ndecomps, original)
end

function SCIPhasConsOnlyLinkVars(scip, decomp, cons, hasonlylinkvars)
    ccall((:SCIPhasConsOnlyLinkVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DECOMP}, Ptr{SCIP_CONS}, Ptr{Cuint}), scip, decomp, cons, hasonlylinkvars)
end

function SCIPcomputeDecompConsLabels(scip, decomp, conss, nconss)
    ccall((:SCIPcomputeDecompConsLabels, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DECOMP}, Ptr{Ptr{SCIP_CONS}}, Cint), scip, decomp, conss, nconss)
end

function SCIPcomputeDecompVarsLabels(scip, decomp, conss, nconss)
    ccall((:SCIPcomputeDecompVarsLabels, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DECOMP}, Ptr{Ptr{SCIP_CONS}}, Cint), scip, decomp, conss, nconss)
end

function SCIPassignDecompLinkConss(scip, decomp, conss, nconss, nskipconss)
    ccall((:SCIPassignDecompLinkConss, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DECOMP}, Ptr{Ptr{SCIP_CONS}}, Cint, Ptr{Cint}), scip, decomp, conss, nconss, nskipconss)
end

function SCIPcomputeDecompStats(scip, decomp, uselimits)
    ccall((:SCIPcomputeDecompStats, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DECOMP}, Cuint), scip, decomp, uselimits)
end

function SCIPincludeDialog(scip, dialog, dialogcopy, dialogexec, dialogdesc, dialogfree, name, desc, issubmenu, dialogdata)
    ccall((:SCIPincludeDialog, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_DIALOG}}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cchar}, Ptr{Cchar}, Cuint, Ptr{SCIP_DIALOGDATA}), scip, dialog, dialogcopy, dialogexec, dialogdesc, dialogfree, name, desc, issubmenu, dialogdata)
end

function SCIPexistsDialog(scip, dialog)
    ccall((:SCIPexistsDialog, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_DIALOG}), scip, dialog)
end

function SCIPcaptureDialog(scip, dialog)
    ccall((:SCIPcaptureDialog, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DIALOG}), scip, dialog)
end

function SCIPreleaseDialog(scip, dialog)
    ccall((:SCIPreleaseDialog, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_DIALOG}}), scip, dialog)
end

function SCIPsetRootDialog(scip, dialog)
    ccall((:SCIPsetRootDialog, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DIALOG}), scip, dialog)
end

function SCIPgetRootDialog(scip)
    ccall((:SCIPgetRootDialog, libscip), Ptr{SCIP_DIALOG}, (Ptr{SCIP},), scip)
end

function SCIPaddDialogEntry(scip, dialog, subdialog)
    ccall((:SCIPaddDialogEntry, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DIALOG}, Ptr{SCIP_DIALOG}), scip, dialog, subdialog)
end

function SCIPaddDialogInputLine(scip, inputline)
    ccall((:SCIPaddDialogInputLine, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}), scip, inputline)
end

function SCIPaddDialogHistoryLine(scip, inputline)
    ccall((:SCIPaddDialogHistoryLine, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}), scip, inputline)
end

function SCIPstartInteraction(scip)
    ccall((:SCIPstartInteraction, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeDisp(scip, name, desc, header, dispstatus, dispcopy, dispfree, dispinit, dispexit, dispinitsol, dispexitsol, dispoutput, dispdata, width, priority, position, stripline)
    ccall((:SCIPincludeDisp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, SCIP_DISPSTATUS, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_DISPDATA}, Cint, Cint, Cint, Cuint), scip, name, desc, header, dispstatus, dispcopy, dispfree, dispinit, dispexit, dispinitsol, dispexitsol, dispoutput, dispdata, width, priority, position, stripline)
end

function SCIPfindDisp(scip, name)
    ccall((:SCIPfindDisp, libscip), Ptr{SCIP_DISP}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetDisps(scip)
    ccall((:SCIPgetDisps, libscip), Ptr{Ptr{SCIP_DISP}}, (Ptr{SCIP},), scip)
end

function SCIPgetNDisps(scip)
    ccall((:SCIPgetNDisps, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPautoselectDisps(scip)
    ccall((:SCIPautoselectDisps, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPchgDispMode(disp, mode)
    ccall((:SCIPchgDispMode, libscip), Cvoid, (Ptr{SCIP_DISP}, SCIP_DISPMODE), disp, mode)
end

function SCIPincludeEventhdlr(scip, name, desc, eventcopy, eventfree, eventinit, eventexit, eventinitsol, eventexitsol, eventdelete, eventexec, eventhdlrdata)
    ccall((:SCIPincludeEventhdlr, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_EVENTHDLRDATA}), scip, name, desc, eventcopy, eventfree, eventinit, eventexit, eventinitsol, eventexitsol, eventdelete, eventexec, eventhdlrdata)
end

function SCIPincludeEventhdlrBasic(scip, eventhdlrptr, name, desc, eventexec, eventhdlrdata)
    ccall((:SCIPincludeEventhdlrBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_EVENTHDLR}}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cvoid}, Ptr{SCIP_EVENTHDLRDATA}), scip, eventhdlrptr, name, desc, eventexec, eventhdlrdata)
end

function SCIPsetEventhdlrCopy(scip, eventhdlr, eventcopy)
    ccall((:SCIPsetEventhdlrCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EVENTHDLR}, Ptr{Cvoid}), scip, eventhdlr, eventcopy)
end

function SCIPsetEventhdlrFree(scip, eventhdlr, eventfree)
    ccall((:SCIPsetEventhdlrFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EVENTHDLR}, Ptr{Cvoid}), scip, eventhdlr, eventfree)
end

function SCIPsetEventhdlrInit(scip, eventhdlr, eventinit)
    ccall((:SCIPsetEventhdlrInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EVENTHDLR}, Ptr{Cvoid}), scip, eventhdlr, eventinit)
end

function SCIPsetEventhdlrExit(scip, eventhdlr, eventexit)
    ccall((:SCIPsetEventhdlrExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EVENTHDLR}, Ptr{Cvoid}), scip, eventhdlr, eventexit)
end

function SCIPsetEventhdlrInitsol(scip, eventhdlr, eventinitsol)
    ccall((:SCIPsetEventhdlrInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EVENTHDLR}, Ptr{Cvoid}), scip, eventhdlr, eventinitsol)
end

function SCIPsetEventhdlrExitsol(scip, eventhdlr, eventexitsol)
    ccall((:SCIPsetEventhdlrExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EVENTHDLR}, Ptr{Cvoid}), scip, eventhdlr, eventexitsol)
end

function SCIPsetEventhdlrDelete(scip, eventhdlr, eventdelete)
    ccall((:SCIPsetEventhdlrDelete, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EVENTHDLR}, Ptr{Cvoid}), scip, eventhdlr, eventdelete)
end

function SCIPfindEventhdlr(scip, name)
    ccall((:SCIPfindEventhdlr, libscip), Ptr{SCIP_EVENTHDLR}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetEventhdlrs(scip)
    ccall((:SCIPgetEventhdlrs, libscip), Ptr{Ptr{SCIP_EVENTHDLR}}, (Ptr{SCIP},), scip)
end

function SCIPgetNEventhdlrs(scip)
    ccall((:SCIPgetNEventhdlrs, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPcatchEvent(scip, eventtype, eventhdlr, eventdata, filterpos)
    ccall((:SCIPcatchEvent, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_EVENTTYPE, Ptr{SCIP_EVENTHDLR}, Ptr{SCIP_EVENTDATA}, Ptr{Cint}), scip, eventtype, eventhdlr, eventdata, filterpos)
end

function SCIPdropEvent(scip, eventtype, eventhdlr, eventdata, filterpos)
    ccall((:SCIPdropEvent, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_EVENTTYPE, Ptr{SCIP_EVENTHDLR}, Ptr{SCIP_EVENTDATA}, Cint), scip, eventtype, eventhdlr, eventdata, filterpos)
end

function SCIPcatchVarEvent(scip, var, eventtype, eventhdlr, eventdata, filterpos)
    ccall((:SCIPcatchVarEvent, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_EVENTTYPE, Ptr{SCIP_EVENTHDLR}, Ptr{SCIP_EVENTDATA}, Ptr{Cint}), scip, var, eventtype, eventhdlr, eventdata, filterpos)
end

function SCIPdropVarEvent(scip, var, eventtype, eventhdlr, eventdata, filterpos)
    ccall((:SCIPdropVarEvent, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_EVENTTYPE, Ptr{SCIP_EVENTHDLR}, Ptr{SCIP_EVENTDATA}, Cint), scip, var, eventtype, eventhdlr, eventdata, filterpos)
end

function SCIPcatchRowEvent(scip, row, eventtype, eventhdlr, eventdata, filterpos)
    ccall((:SCIPcatchRowEvent, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, SCIP_EVENTTYPE, Ptr{SCIP_EVENTHDLR}, Ptr{SCIP_EVENTDATA}, Ptr{Cint}), scip, row, eventtype, eventhdlr, eventdata, filterpos)
end

function SCIPdropRowEvent(scip, row, eventtype, eventhdlr, eventdata, filterpos)
    ccall((:SCIPdropRowEvent, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, SCIP_EVENTTYPE, Ptr{SCIP_EVENTHDLR}, Ptr{SCIP_EVENTDATA}, Cint), scip, row, eventtype, eventhdlr, eventdata, filterpos)
end

function SCIPgetExprtreeTransformedVars(scip, tree)
    ccall((:SCIPgetExprtreeTransformedVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EXPRTREE}), scip, tree)
end

function SCIPevalExprtreeSol(scip, tree, sol, val)
    ccall((:SCIPevalExprtreeSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EXPRTREE}, Ptr{SCIP_SOL}, Ptr{Cdouble}), scip, tree, sol, val)
end

function SCIPevalExprtreeGlobalBounds(scip, tree, infinity, val)
    ccall((:SCIPevalExprtreeGlobalBounds, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EXPRTREE}, Cdouble, Ptr{SCIP_INTERVAL}), scip, tree, infinity, val)
end

function SCIPevalExprtreeLocalBounds(scip, tree, infinity, val)
    ccall((:SCIPevalExprtreeLocalBounds, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EXPRTREE}, Cdouble, Ptr{SCIP_INTERVAL}), scip, tree, infinity, val)
end

function SCIPversion()
    ccall((:SCIPversion, libscip), Cdouble, ())
end

function SCIPmajorVersion()
    ccall((:SCIPmajorVersion, libscip), Cint, ())
end

function SCIPminorVersion()
    ccall((:SCIPminorVersion, libscip), Cint, ())
end

function SCIPtechVersion()
    ccall((:SCIPtechVersion, libscip), Cint, ())
end

function SCIPsubversion()
    ccall((:SCIPsubversion, libscip), Cint, ())
end

function SCIPprintVersion(scip, file)
    ccall((:SCIPprintVersion, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintBuildOptions(scip, file)
    ccall((:SCIPprintBuildOptions, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintError(retcode)
    ccall((:SCIPprintError, libscip), Cvoid, (SCIP_RETCODE,), retcode)
end

function SCIPcreate(scip)
    ccall((:SCIPcreate, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP}},), scip)
end

function SCIPfree(scip)
    ccall((:SCIPfree, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP}},), scip)
end

function SCIPgetStage(scip)
    ccall((:SCIPgetStage, libscip), SCIP_STAGE, (Ptr{SCIP},), scip)
end

function SCIPprintStage(scip, file)
    ccall((:SCIPprintStage, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPgetStatus(scip)
    ccall((:SCIPgetStatus, libscip), SCIP_STATUS, (Ptr{SCIP},), scip)
end

function SCIPprintStatus(scip, file)
    ccall((:SCIPprintStatus, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPisTransformed(scip)
    ccall((:SCIPisTransformed, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPisExactSolve(scip)
    ccall((:SCIPisExactSolve, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPisPresolveFinished(scip)
    ccall((:SCIPisPresolveFinished, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPhasPerformedPresolve(scip)
    ccall((:SCIPhasPerformedPresolve, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPpressedCtrlC(scip)
    ccall((:SCIPpressedCtrlC, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPisStopped(scip)
    ccall((:SCIPisStopped, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPincludeExternalCodeInformation(scip, name, description)
    ccall((:SCIPincludeExternalCodeInformation, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}), scip, name, description)
end

function SCIPgetExternalCodeNames(scip)
    ccall((:SCIPgetExternalCodeNames, libscip), Ptr{Ptr{Cchar}}, (Ptr{SCIP},), scip)
end

function SCIPgetExternalCodeDescriptions(scip)
    ccall((:SCIPgetExternalCodeDescriptions, libscip), Ptr{Ptr{Cchar}}, (Ptr{SCIP},), scip)
end

function SCIPgetNExternalCodes(scip)
    ccall((:SCIPgetNExternalCodes, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPprintExternalCodes(scip, file)
    ccall((:SCIPprintExternalCodes, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPincludeHeur(scip, name, desc, dispchar, priority, freq, freqofs, maxdepth, timingmask, usessubscip, heurcopy, heurfree, heurinit, heurexit, heurinitsol, heurexitsol, heurexec, heurdata)
    ccall((:SCIPincludeHeur, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Cchar, Cint, Cint, Cint, Cint, SCIP_HEURTIMING, Cuint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_HEURDATA}), scip, name, desc, dispchar, priority, freq, freqofs, maxdepth, timingmask, usessubscip, heurcopy, heurfree, heurinit, heurexit, heurinitsol, heurexitsol, heurexec, heurdata)
end

function SCIPincludeHeurBasic(scip, heur, name, desc, dispchar, priority, freq, freqofs, maxdepth, timingmask, usessubscip, heurexec, heurdata)
    ccall((:SCIPincludeHeurBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_HEUR}}, Ptr{Cchar}, Ptr{Cchar}, Cchar, Cint, Cint, Cint, Cint, SCIP_HEURTIMING, Cuint, Ptr{Cvoid}, Ptr{SCIP_HEURDATA}), scip, heur, name, desc, dispchar, priority, freq, freqofs, maxdepth, timingmask, usessubscip, heurexec, heurdata)
end

function SCIPsetHeurCopy(scip, heur, heurcopy)
    ccall((:SCIPsetHeurCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Ptr{Cvoid}), scip, heur, heurcopy)
end

function SCIPsetHeurFree(scip, heur, heurfree)
    ccall((:SCIPsetHeurFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Ptr{Cvoid}), scip, heur, heurfree)
end

function SCIPsetHeurInit(scip, heur, heurinit)
    ccall((:SCIPsetHeurInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Ptr{Cvoid}), scip, heur, heurinit)
end

function SCIPsetHeurExit(scip, heur, heurexit)
    ccall((:SCIPsetHeurExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Ptr{Cvoid}), scip, heur, heurexit)
end

function SCIPsetHeurInitsol(scip, heur, heurinitsol)
    ccall((:SCIPsetHeurInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Ptr{Cvoid}), scip, heur, heurinitsol)
end

function SCIPsetHeurExitsol(scip, heur, heurexitsol)
    ccall((:SCIPsetHeurExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Ptr{Cvoid}), scip, heur, heurexitsol)
end

function SCIPfindHeur(scip, name)
    ccall((:SCIPfindHeur, libscip), Ptr{SCIP_HEUR}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetHeurs(scip)
    ccall((:SCIPgetHeurs, libscip), Ptr{Ptr{SCIP_HEUR}}, (Ptr{SCIP},), scip)
end

function SCIPgetNHeurs(scip)
    ccall((:SCIPgetNHeurs, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPsetHeurPriority(scip, heur, priority)
    ccall((:SCIPsetHeurPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Cint), scip, heur, priority)
end

function SCIPcreateDiveset(scip, diveset, heur, name, minreldepth, maxreldepth, maxlpiterquot, maxdiveubquot, maxdiveavgquot, maxdiveubquotnosol, maxdiveavgquotnosol, lpresolvedomchgquot, lpsolvefreq, maxlpiterofs, initialseed, backtrack, onlylpbranchcands, ispublic, specificsos1score, divesetgetscore, divesetavailable)
    ccall((:SCIPcreateDiveset, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_DIVESET}}, Ptr{SCIP_HEUR}, Ptr{Cchar}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cint, Cint, Cuint, Cuint, Cuint, Cuint, Cuint, Ptr{Cvoid}, Ptr{Cvoid}), scip, diveset, heur, name, minreldepth, maxreldepth, maxlpiterquot, maxdiveubquot, maxdiveavgquot, maxdiveubquotnosol, maxdiveavgquotnosol, lpresolvedomchgquot, lpsolvefreq, maxlpiterofs, initialseed, backtrack, onlylpbranchcands, ispublic, specificsos1score, divesetgetscore, divesetavailable)
end

function SCIPisDivesetAvailable(scip, diveset, available)
    ccall((:SCIPisDivesetAvailable, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DIVESET}, Ptr{Cuint}), scip, diveset, available)
end

function SCIPhasCurrentNodeLP(scip)
    ccall((:SCIPhasCurrentNodeLP, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPisLPConstructed(scip)
    ccall((:SCIPisLPConstructed, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPconstructLP(scip, cutoff)
    ccall((:SCIPconstructLP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cuint}), scip, cutoff)
end

function SCIPflushLP(scip)
    ccall((:SCIPflushLP, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPgetLPSolstat(scip)
    ccall((:SCIPgetLPSolstat, libscip), SCIP_LPSOLSTAT, (Ptr{SCIP},), scip)
end

function SCIPisLPPrimalReliable(scip)
    ccall((:SCIPisLPPrimalReliable, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPisLPDualReliable(scip)
    ccall((:SCIPisLPDualReliable, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPisLPRelax(scip)
    ccall((:SCIPisLPRelax, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPgetLPObjval(scip)
    ccall((:SCIPgetLPObjval, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetLPColumnObjval(scip)
    ccall((:SCIPgetLPColumnObjval, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetLPLooseObjval(scip)
    ccall((:SCIPgetLPLooseObjval, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetGlobalPseudoObjval(scip)
    ccall((:SCIPgetGlobalPseudoObjval, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetPseudoObjval(scip)
    ccall((:SCIPgetPseudoObjval, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPisRootLPRelax(scip)
    ccall((:SCIPisRootLPRelax, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPgetLPRootObjval(scip)
    ccall((:SCIPgetLPRootObjval, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetLPRootColumnObjval(scip)
    ccall((:SCIPgetLPRootColumnObjval, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetLPRootLooseObjval(scip)
    ccall((:SCIPgetLPRootLooseObjval, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetLPFeastol(scip)
    ccall((:SCIPgetLPFeastol, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPsetLPFeastol(scip, newfeastol)
    ccall((:SCIPsetLPFeastol, libscip), Cvoid, (Ptr{SCIP}, Cdouble), scip, newfeastol)
end

function SCIPresetLPFeastol(scip)
    ccall((:SCIPresetLPFeastol, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPgetLPColsData(scip, cols, ncols)
    ccall((:SCIPgetLPColsData, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_COL}}}, Ptr{Cint}), scip, cols, ncols)
end

function SCIPgetLPCols(scip)
    ccall((:SCIPgetLPCols, libscip), Ptr{Ptr{SCIP_COL}}, (Ptr{SCIP},), scip)
end

function SCIPgetNLPCols(scip)
    ccall((:SCIPgetNLPCols, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetLPRowsData(scip, rows, nrows)
    ccall((:SCIPgetLPRowsData, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_ROW}}}, Ptr{Cint}), scip, rows, nrows)
end

function SCIPgetLPRows(scip)
    ccall((:SCIPgetLPRows, libscip), Ptr{Ptr{SCIP_ROW}}, (Ptr{SCIP},), scip)
end

function SCIPgetNLPRows(scip)
    ccall((:SCIPgetNLPRows, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPallColsInLP(scip)
    ccall((:SCIPallColsInLP, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPisLPSolBasic(scip)
    ccall((:SCIPisLPSolBasic, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPgetLPBasisInd(scip, basisind)
    ccall((:SCIPgetLPBasisInd, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cint}), scip, basisind)
end

function SCIPgetLPBInvRow(scip, r, coefs, inds, ninds)
    ccall((:SCIPgetLPBInvRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}), scip, r, coefs, inds, ninds)
end

function SCIPgetLPBInvCol(scip, c, coefs, inds, ninds)
    ccall((:SCIPgetLPBInvCol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}), scip, c, coefs, inds, ninds)
end

function SCIPgetLPBInvARow(scip, r, binvrow, coefs, inds, ninds)
    ccall((:SCIPgetLPBInvARow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}), scip, r, binvrow, coefs, inds, ninds)
end

function SCIPgetLPBInvACol(scip, c, coefs, inds, ninds)
    ccall((:SCIPgetLPBInvACol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}), scip, c, coefs, inds, ninds)
end

function SCIPsumLPRows(scip, weights, sumcoef, sumlhs, sumrhs)
    ccall((:SCIPsumLPRows, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cdouble}, Ptr{SCIP_REALARRAY}, Ptr{Cdouble}, Ptr{Cdouble}), scip, weights, sumcoef, sumlhs, sumrhs)
end

function SCIPwriteLP(scip, filename)
    ccall((:SCIPwriteLP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}), scip, filename)
end

function SCIPwriteMIP(scip, filename, genericnames, origobj, lazyconss)
    ccall((:SCIPwriteMIP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Cuint, Cuint, Cuint), scip, filename, genericnames, origobj, lazyconss)
end

function SCIPgetLPI(scip, lpi)
    ccall((:SCIPgetLPI, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_LPI}}), scip, lpi)
end

function SCIPprintLPSolutionQuality(scip, file)
    ccall((:SCIPprintLPSolutionQuality, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPcomputeLPRelIntPoint(scip, relaxrows, inclobjcutoff, timelimit, iterlimit, point)
    ccall((:SCIPcomputeLPRelIntPoint, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cuint, Cuint, Cdouble, Cint, Ptr{Ptr{SCIP_SOL}}), scip, relaxrows, inclobjcutoff, timelimit, iterlimit, point)
end

function SCIPgetColRedcost(scip, col)
    ccall((:SCIPgetColRedcost, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_COL}), scip, col)
end

function SCIPgetColFarkasCoef(scip, col)
    ccall((:SCIPgetColFarkasCoef, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_COL}), scip, col)
end

function SCIPmarkColNotRemovableLocal(scip, col)
    ccall((:SCIPmarkColNotRemovableLocal, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_COL}), scip, col)
end

function SCIPcreateRowConshdlr(scip, row, conshdlr, name, len, cols, vals, lhs, rhs, _local, modifiable, removable)
    ccall((:SCIPcreateRowConshdlr, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Ptr{SCIP_CONSHDLR}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_COL}}, Ptr{Cdouble}, Cdouble, Cdouble, Cuint, Cuint, Cuint), scip, row, conshdlr, name, len, cols, vals, lhs, rhs, _local, modifiable, removable)
end

function SCIPcreateRowCons(scip, row, cons, name, len, cols, vals, lhs, rhs, _local, modifiable, removable)
    ccall((:SCIPcreateRowCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Ptr{SCIP_CONS}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_COL}}, Ptr{Cdouble}, Cdouble, Cdouble, Cuint, Cuint, Cuint), scip, row, cons, name, len, cols, vals, lhs, rhs, _local, modifiable, removable)
end

function SCIPcreateRowSepa(scip, row, sepa, name, len, cols, vals, lhs, rhs, _local, modifiable, removable)
    ccall((:SCIPcreateRowSepa, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Ptr{SCIP_SEPA}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_COL}}, Ptr{Cdouble}, Cdouble, Cdouble, Cuint, Cuint, Cuint), scip, row, sepa, name, len, cols, vals, lhs, rhs, _local, modifiable, removable)
end

function SCIPcreateRowUnspec(scip, row, name, len, cols, vals, lhs, rhs, _local, modifiable, removable)
    ccall((:SCIPcreateRowUnspec, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_COL}}, Ptr{Cdouble}, Cdouble, Cdouble, Cuint, Cuint, Cuint), scip, row, name, len, cols, vals, lhs, rhs, _local, modifiable, removable)
end

function SCIPcreateRow(scip, row, name, len, cols, vals, lhs, rhs, _local, modifiable, removable)
    ccall((:SCIPcreateRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_COL}}, Ptr{Cdouble}, Cdouble, Cdouble, Cuint, Cuint, Cuint), scip, row, name, len, cols, vals, lhs, rhs, _local, modifiable, removable)
end

function SCIPcreateEmptyRowConshdlr(scip, row, conshdlr, name, lhs, rhs, _local, modifiable, removable)
    ccall((:SCIPcreateEmptyRowConshdlr, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Ptr{SCIP_CONSHDLR}, Ptr{Cchar}, Cdouble, Cdouble, Cuint, Cuint, Cuint), scip, row, conshdlr, name, lhs, rhs, _local, modifiable, removable)
end

function SCIPcreateEmptyRowCons(scip, row, cons, name, lhs, rhs, _local, modifiable, removable)
    ccall((:SCIPcreateEmptyRowCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Ptr{SCIP_CONS}, Ptr{Cchar}, Cdouble, Cdouble, Cuint, Cuint, Cuint), scip, row, cons, name, lhs, rhs, _local, modifiable, removable)
end

function SCIPcreateEmptyRowSepa(scip, row, sepa, name, lhs, rhs, _local, modifiable, removable)
    ccall((:SCIPcreateEmptyRowSepa, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Ptr{SCIP_SEPA}, Ptr{Cchar}, Cdouble, Cdouble, Cuint, Cuint, Cuint), scip, row, sepa, name, lhs, rhs, _local, modifiable, removable)
end

function SCIPcreateEmptyRowUnspec(scip, row, name, lhs, rhs, _local, modifiable, removable)
    ccall((:SCIPcreateEmptyRowUnspec, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Ptr{Cchar}, Cdouble, Cdouble, Cuint, Cuint, Cuint), scip, row, name, lhs, rhs, _local, modifiable, removable)
end

function SCIPcreateEmptyRow(scip, row, name, lhs, rhs, _local, modifiable, removable)
    ccall((:SCIPcreateEmptyRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}, Ptr{Cchar}, Cdouble, Cdouble, Cuint, Cuint, Cuint), scip, row, name, lhs, rhs, _local, modifiable, removable)
end

function SCIPcaptureRow(scip, row)
    ccall((:SCIPcaptureRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPreleaseRow(scip, row)
    ccall((:SCIPreleaseRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_ROW}}), scip, row)
end

function SCIPchgRowLhs(scip, row, lhs)
    ccall((:SCIPchgRowLhs, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Cdouble), scip, row, lhs)
end

function SCIPchgRowRhs(scip, row, rhs)
    ccall((:SCIPchgRowRhs, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Cdouble), scip, row, rhs)
end

function SCIPcacheRowExtensions(scip, row)
    ccall((:SCIPcacheRowExtensions, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPflushRowExtensions(scip, row)
    ccall((:SCIPflushRowExtensions, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPaddVarToRow(scip, row, var, val)
    ccall((:SCIPaddVarToRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Ptr{SCIP_VAR}, Cdouble), scip, row, var, val)
end

function SCIPaddVarsToRow(scip, row, nvars, vars, vals)
    ccall((:SCIPaddVarsToRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}), scip, row, nvars, vars, vals)
end

function SCIPaddVarsToRowSameCoef(scip, row, nvars, vars, val)
    ccall((:SCIPaddVarsToRowSameCoef, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Cint, Ptr{Ptr{SCIP_VAR}}, Cdouble), scip, row, nvars, vars, val)
end

function SCIPcalcRowIntegralScalar(scip, row, mindelta, maxdelta, maxdnom, maxscale, usecontvars, intscalar, success)
    ccall((:SCIPcalcRowIntegralScalar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Cdouble, Cdouble, Clonglong, Cdouble, Cuint, Ptr{Cdouble}, Ptr{Cuint}), scip, row, mindelta, maxdelta, maxdnom, maxscale, usecontvars, intscalar, success)
end

function SCIPmakeRowIntegral(scip, row, mindelta, maxdelta, maxdnom, maxscale, usecontvars, success)
    ccall((:SCIPmakeRowIntegral, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Cdouble, Cdouble, Clonglong, Cdouble, Cuint, Ptr{Cuint}), scip, row, mindelta, maxdelta, maxdnom, maxscale, usecontvars, success)
end

function SCIPmarkRowNotRemovableLocal(scip, row)
    ccall((:SCIPmarkRowNotRemovableLocal, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowNumIntCols(scip, row)
    ccall((:SCIPgetRowNumIntCols, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowMinCoef(scip, row)
    ccall((:SCIPgetRowMinCoef, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowMaxCoef(scip, row)
    ccall((:SCIPgetRowMaxCoef, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowMinActivity(scip, row)
    ccall((:SCIPgetRowMinActivity, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowMaxActivity(scip, row)
    ccall((:SCIPgetRowMaxActivity, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPrecalcRowLPActivity(scip, row)
    ccall((:SCIPrecalcRowLPActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowLPActivity(scip, row)
    ccall((:SCIPgetRowLPActivity, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowLPFeasibility(scip, row)
    ccall((:SCIPgetRowLPFeasibility, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPrecalcRowPseudoActivity(scip, row)
    ccall((:SCIPrecalcRowPseudoActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowPseudoActivity(scip, row)
    ccall((:SCIPgetRowPseudoActivity, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowPseudoFeasibility(scip, row)
    ccall((:SCIPgetRowPseudoFeasibility, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPrecalcRowActivity(scip, row)
    ccall((:SCIPrecalcRowActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowActivity(scip, row)
    ccall((:SCIPgetRowActivity, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowFeasibility(scip, row)
    ccall((:SCIPgetRowFeasibility, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPgetRowSolActivity(scip, row, sol)
    ccall((:SCIPgetRowSolActivity, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}, Ptr{SCIP_SOL}), scip, row, sol)
end

function SCIPgetRowSolFeasibility(scip, row, sol)
    ccall((:SCIPgetRowSolFeasibility, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}, Ptr{SCIP_SOL}), scip, row, sol)
end

function SCIPgetRowObjParallelism(scip, row)
    ccall((:SCIPgetRowObjParallelism, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPprintRow(scip, row, file)
    ccall((:SCIPprintRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Ptr{Libc.FILE}), scip, row, file)
end

function SCIPstartDive(scip)
    ccall((:SCIPstartDive, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPendDive(scip)
    ccall((:SCIPendDive, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPchgCutoffboundDive(scip, newcutoffbound)
    ccall((:SCIPchgCutoffboundDive, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble), scip, newcutoffbound)
end

function SCIPchgVarObjDive(scip, var, newobj)
    ccall((:SCIPchgVarObjDive, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newobj)
end

function SCIPchgVarLbDive(scip, var, newbound)
    ccall((:SCIPchgVarLbDive, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newbound)
end

function SCIPchgVarUbDive(scip, var, newbound)
    ccall((:SCIPchgVarUbDive, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newbound)
end

function SCIPaddRowDive(scip, row)
    ccall((:SCIPaddRowDive, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPchgRowLhsDive(scip, row, newlhs)
    ccall((:SCIPchgRowLhsDive, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Cdouble), scip, row, newlhs)
end

function SCIPchgRowRhsDive(scip, row, newrhs)
    ccall((:SCIPchgRowRhsDive, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}, Cdouble), scip, row, newrhs)
end

function SCIPgetVarObjDive(scip, var)
    ccall((:SCIPgetVarObjDive, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarLbDive(scip, var)
    ccall((:SCIPgetVarLbDive, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarUbDive(scip, var)
    ccall((:SCIPgetVarUbDive, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPsolveDiveLP(scip, itlim, lperror, cutoff)
    ccall((:SCIPsolveDiveLP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Cuint}, Ptr{Cuint}), scip, itlim, lperror, cutoff)
end

function SCIPgetLastDivenode(scip)
    ccall((:SCIPgetLastDivenode, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPinDive(scip)
    ccall((:SCIPinDive, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPgetLPDegeneracy(scip, degeneracy, varconsratio)
    ccall((:SCIPgetLPDegeneracy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cdouble}, Ptr{Cdouble}), scip, degeneracy, varconsratio)
end

function SCIPblkmem(scip)
    ccall((:SCIPblkmem, libscip), Ptr{BMS_BLKMEM}, (Ptr{SCIP},), scip)
end

const BMS_BufMem = Cvoid

const BMS_BUFMEM = BMS_BufMem

function SCIPbuffer(scip)
    ccall((:SCIPbuffer, libscip), Ptr{BMS_BUFMEM}, (Ptr{SCIP},), scip)
end

function SCIPcleanbuffer(scip)
    ccall((:SCIPcleanbuffer, libscip), Ptr{BMS_BUFMEM}, (Ptr{SCIP},), scip)
end

function SCIPgetMemUsed(scip)
    ccall((:SCIPgetMemUsed, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetMemTotal(scip)
    ccall((:SCIPgetMemTotal, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetMemExternEstim(scip)
    ccall((:SCIPgetMemExternEstim, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPcalcMemGrowSize(scip, num)
    ccall((:SCIPcalcMemGrowSize, libscip), Cint, (Ptr{SCIP}, Cint), scip, num)
end

function SCIPensureBlockMemoryArray_call(scip, arrayptr, elemsize, arraysize, minsize)
    ccall((:SCIPensureBlockMemoryArray_call, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Cvoid}}, Csize_t, Ptr{Cint}, Cint), scip, arrayptr, elemsize, arraysize, minsize)
end

function SCIPprintMemoryDiagnostic(scip)
    ccall((:SCIPprintMemoryDiagnostic, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPsetMessagehdlr(scip, messagehdlr)
    ccall((:SCIPsetMessagehdlr, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_MESSAGEHDLR}), scip, messagehdlr)
end

function SCIPgetMessagehdlr(scip)
    ccall((:SCIPgetMessagehdlr, libscip), Ptr{SCIP_MESSAGEHDLR}, (Ptr{SCIP},), scip)
end

function SCIPsetMessagehdlrLogfile(scip, filename)
    ccall((:SCIPsetMessagehdlrLogfile, libscip), Cvoid, (Ptr{SCIP}, Ptr{Cchar}), scip, filename)
end

function SCIPsetMessagehdlrQuiet(scip, quiet)
    ccall((:SCIPsetMessagehdlrQuiet, libscip), Cvoid, (Ptr{SCIP}, Cuint), scip, quiet)
end

function SCIPgetVerbLevel(scip)
    ccall((:SCIPgetVerbLevel, libscip), SCIP_VERBLEVEL, (Ptr{SCIP},), scip)
end

const SCIP_Nlpi = Cvoid

const SCIP_NLPI = SCIP_Nlpi

function SCIPincludeNlpi(scip, nlpi)
    ccall((:SCIPincludeNlpi, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLPI}), scip, nlpi)
end

function SCIPfindNlpi(scip, name)
    ccall((:SCIPfindNlpi, libscip), Ptr{SCIP_NLPI}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetNlpis(scip)
    ccall((:SCIPgetNlpis, libscip), Ptr{Ptr{SCIP_NLPI}}, (Ptr{SCIP},), scip)
end

function SCIPgetNNlpis(scip)
    ccall((:SCIPgetNNlpis, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPsetNlpiPriority(scip, nlpi, priority)
    ccall((:SCIPsetNlpiPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLPI}, Cint), scip, nlpi, priority)
end

function SCIPisNLPEnabled(scip)
    ccall((:SCIPisNLPEnabled, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPenableNLP(scip)
    ccall((:SCIPenableNLP, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPisNLPConstructed(scip)
    ccall((:SCIPisNLPConstructed, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPhasNLPContinuousNonlinearity(scip)
    ccall((:SCIPhasNLPContinuousNonlinearity, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPgetNLPVarsData(scip, vars, nvars)
    ccall((:SCIPgetNLPVarsData, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Cint}), scip, vars, nvars)
end

function SCIPgetNLPVars(scip)
    ccall((:SCIPgetNLPVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP},), scip)
end

function SCIPgetNNLPVars(scip)
    ccall((:SCIPgetNNLPVars, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNLPVarsNonlinearity(scip, nlcount)
    ccall((:SCIPgetNLPVarsNonlinearity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cint}), scip, nlcount)
end

function SCIPgetNLPVarsLbDualsol(scip)
    ccall((:SCIPgetNLPVarsLbDualsol, libscip), Ptr{Cdouble}, (Ptr{SCIP},), scip)
end

function SCIPgetNLPVarsUbDualsol(scip)
    ccall((:SCIPgetNLPVarsUbDualsol, libscip), Ptr{Cdouble}, (Ptr{SCIP},), scip)
end

function SCIPgetNLPNlRowsData(scip, nlrows, nnlrows)
    ccall((:SCIPgetNLPNlRowsData, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_NLROW}}}, Ptr{Cint}), scip, nlrows, nnlrows)
end

function SCIPgetNLPNlRows(scip)
    ccall((:SCIPgetNLPNlRows, libscip), Ptr{Ptr{SCIP_NLROW}}, (Ptr{SCIP},), scip)
end

function SCIPgetNNLPNlRows(scip)
    ccall((:SCIPgetNNLPNlRows, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPaddNlRow(scip, nlrow)
    ccall((:SCIPaddNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}), scip, nlrow)
end

function SCIPdelNlRow(scip, nlrow)
    ccall((:SCIPdelNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}), scip, nlrow)
end

function SCIPflushNLP(scip)
    ccall((:SCIPflushNLP, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPsetNLPInitialGuess(scip, initialguess)
    ccall((:SCIPsetNLPInitialGuess, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cdouble}), scip, initialguess)
end

function SCIPsetNLPInitialGuessSol(scip, sol)
    ccall((:SCIPsetNLPInitialGuessSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPsolveNLP(scip)
    ccall((:SCIPsolveNLP, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

@enum SCIP_NlpSolStat::UInt32 begin
    SCIP_NLPSOLSTAT_GLOBOPT = 0
    SCIP_NLPSOLSTAT_LOCOPT = 1
    SCIP_NLPSOLSTAT_FEASIBLE = 2
    SCIP_NLPSOLSTAT_LOCINFEASIBLE = 3
    SCIP_NLPSOLSTAT_GLOBINFEASIBLE = 4
    SCIP_NLPSOLSTAT_UNBOUNDED = 5
    SCIP_NLPSOLSTAT_UNKNOWN = 6
end

const SCIP_NLPSOLSTAT = SCIP_NlpSolStat

function SCIPgetNLPSolstat(scip)
    ccall((:SCIPgetNLPSolstat, libscip), SCIP_NLPSOLSTAT, (Ptr{SCIP},), scip)
end

@enum SCIP_NlpTermStat::UInt32 begin
    SCIP_NLPTERMSTAT_OKAY = 0
    SCIP_NLPTERMSTAT_TILIM = 1
    SCIP_NLPTERMSTAT_ITLIM = 2
    SCIP_NLPTERMSTAT_LOBJLIM = 3
    SCIP_NLPTERMSTAT_NUMERR = 5
    SCIP_NLPTERMSTAT_EVALERR = 6
    SCIP_NLPTERMSTAT_MEMERR = 7
    SCIP_NLPTERMSTAT_LICERR = 8
    SCIP_NLPTERMSTAT_OTHER = 9
end

const SCIP_NLPTERMSTAT = SCIP_NlpTermStat

function SCIPgetNLPTermstat(scip)
    ccall((:SCIPgetNLPTermstat, libscip), SCIP_NLPTERMSTAT, (Ptr{SCIP},), scip)
end

const SCIP_NlpStatistics = Cvoid

const SCIP_NLPSTATISTICS = SCIP_NlpStatistics

function SCIPgetNLPStatistics(scip, statistics)
    ccall((:SCIPgetNLPStatistics, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLPSTATISTICS}), scip, statistics)
end

function SCIPgetNLPObjval(scip)
    ccall((:SCIPgetNLPObjval, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPhasNLPSolution(scip)
    ccall((:SCIPhasNLPSolution, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPgetNLPFracVars(scip, fracvars, fracvarssol, fracvarsfrac, nfracvars, npriofracvars)
    ccall((:SCIPgetNLPFracVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cdouble}}, Ptr{Cint}, Ptr{Cint}), scip, fracvars, fracvarssol, fracvarsfrac, nfracvars, npriofracvars)
end

@enum SCIP_NlpParam::UInt32 begin
    SCIP_NLPPAR_FROMSCRATCH = 0
    SCIP_NLPPAR_VERBLEVEL = 1
    SCIP_NLPPAR_FEASTOL = 2
    SCIP_NLPPAR_RELOBJTOL = 3
    SCIP_NLPPAR_LOBJLIM = 4
    SCIP_NLPPAR_INFINITY = 5
    SCIP_NLPPAR_ITLIM = 6
    SCIP_NLPPAR_TILIM = 7
    SCIP_NLPPAR_OPTFILE = 8
    SCIP_NLPPAR_FASTFAIL = 9
end

const SCIP_NLPPARAM = SCIP_NlpParam

function SCIPgetNLPIntPar(scip, type, ival)
    ccall((:SCIPgetNLPIntPar, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_NLPPARAM, Ptr{Cint}), scip, type, ival)
end

function SCIPsetNLPIntPar(scip, type, ival)
    ccall((:SCIPsetNLPIntPar, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_NLPPARAM, Cint), scip, type, ival)
end

function SCIPgetNLPRealPar(scip, type, dval)
    ccall((:SCIPgetNLPRealPar, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_NLPPARAM, Ptr{Cdouble}), scip, type, dval)
end

function SCIPsetNLPRealPar(scip, type, dval)
    ccall((:SCIPsetNLPRealPar, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_NLPPARAM, Cdouble), scip, type, dval)
end

function SCIPgetNLPStringPar(scip, type, sval)
    ccall((:SCIPgetNLPStringPar, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_NLPPARAM, Ptr{Ptr{Cchar}}), scip, type, sval)
end

function SCIPsetNLPStringPar(scip, type, sval)
    ccall((:SCIPsetNLPStringPar, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_NLPPARAM, Ptr{Cchar}), scip, type, sval)
end

function SCIPwriteNLP(scip, filename)
    ccall((:SCIPwriteNLP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}), scip, filename)
end

const SCIP_NlpiProblem = Cvoid

const SCIP_NLPIPROBLEM = SCIP_NlpiProblem

function SCIPgetNLPI(scip, nlpi, nlpiproblem)
    ccall((:SCIPgetNLPI, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_NLPI}}, Ptr{Ptr{SCIP_NLPIPROBLEM}}), scip, nlpi, nlpiproblem)
end

function SCIPstartDiveNLP(scip)
    ccall((:SCIPstartDiveNLP, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPendDiveNLP(scip)
    ccall((:SCIPendDiveNLP, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPchgVarObjDiveNLP(scip, var, coef)
    ccall((:SCIPchgVarObjDiveNLP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, coef)
end

function SCIPchgVarBoundsDiveNLP(scip, var, lb, ub)
    ccall((:SCIPchgVarBoundsDiveNLP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble), scip, var, lb, ub)
end

function SCIPchgVarsBoundsDiveNLP(scip, nvars, vars, lbs, ubs)
    ccall((:SCIPchgVarsBoundsDiveNLP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cdouble}), scip, nvars, vars, lbs, ubs)
end

function SCIPsolveDiveNLP(scip)
    ccall((:SCIPsolveDiveNLP, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateNlRow(scip, nlrow, name, constant, nlinvars, linvars, lincoefs, nquadvars, quadvars, nquadelems, quadelems, expression, lhs, rhs, curvature)
    ccall((:SCIPcreateNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_NLROW}}, Ptr{Cchar}, Cdouble, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{SCIP_QUADELEM}, Ptr{SCIP_EXPRTREE}, Cdouble, Cdouble, SCIP_EXPRCURV), scip, nlrow, name, constant, nlinvars, linvars, lincoefs, nquadvars, quadvars, nquadelems, quadelems, expression, lhs, rhs, curvature)
end

function SCIPcreateEmptyNlRow(scip, nlrow, name, lhs, rhs)
    ccall((:SCIPcreateEmptyNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_NLROW}}, Ptr{Cchar}, Cdouble, Cdouble), scip, nlrow, name, lhs, rhs)
end

function SCIPcreateNlRowFromRow(scip, nlrow, row)
    ccall((:SCIPcreateNlRowFromRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_NLROW}}, Ptr{SCIP_ROW}), scip, nlrow, row)
end

function SCIPcaptureNlRow(scip, nlrow)
    ccall((:SCIPcaptureNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}), scip, nlrow)
end

function SCIPreleaseNlRow(scip, nlrow)
    ccall((:SCIPreleaseNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_NLROW}}), scip, nlrow)
end

function SCIPchgNlRowLhs(scip, nlrow, lhs)
    ccall((:SCIPchgNlRowLhs, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Cdouble), scip, nlrow, lhs)
end

function SCIPchgNlRowRhs(scip, nlrow, rhs)
    ccall((:SCIPchgNlRowRhs, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Cdouble), scip, nlrow, rhs)
end

function SCIPchgNlRowConstant(scip, nlrow, constant)
    ccall((:SCIPchgNlRowConstant, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Cdouble), scip, nlrow, constant)
end

function SCIPaddLinearCoefToNlRow(scip, nlrow, var, val)
    ccall((:SCIPaddLinearCoefToNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{SCIP_VAR}, Cdouble), scip, nlrow, var, val)
end

function SCIPaddLinearCoefsToNlRow(scip, nlrow, nvars, vars, vals)
    ccall((:SCIPaddLinearCoefsToNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}), scip, nlrow, nvars, vars, vals)
end

function SCIPchgNlRowLinearCoef(scip, nlrow, var, coef)
    ccall((:SCIPchgNlRowLinearCoef, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{SCIP_VAR}, Cdouble), scip, nlrow, var, coef)
end

function SCIPaddQuadVarToNlRow(scip, nlrow, var)
    ccall((:SCIPaddQuadVarToNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{SCIP_VAR}), scip, nlrow, var)
end

function SCIPaddQuadVarsToNlRow(scip, nlrow, nvars, vars)
    ccall((:SCIPaddQuadVarsToNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Cint, Ptr{Ptr{SCIP_VAR}}), scip, nlrow, nvars, vars)
end

function SCIPaddQuadElementToNlRow(scip, nlrow, quadelem)
    ccall((:SCIPaddQuadElementToNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, SCIP_QUADELEM), scip, nlrow, quadelem)
end

function SCIPaddQuadElementsToNlRow(scip, nlrow, nquadelems, quadelems)
    ccall((:SCIPaddQuadElementsToNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Cint, Ptr{SCIP_QUADELEM}), scip, nlrow, nquadelems, quadelems)
end

function SCIPchgNlRowQuadElement(scip, nlrow, quadelement)
    ccall((:SCIPchgNlRowQuadElement, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, SCIP_QUADELEM), scip, nlrow, quadelement)
end

function SCIPsetNlRowExprtree(scip, nlrow, exprtree)
    ccall((:SCIPsetNlRowExprtree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{SCIP_EXPRTREE}), scip, nlrow, exprtree)
end

function SCIPsetNlRowExprtreeParam(scip, nlrow, paramidx, paramval)
    ccall((:SCIPsetNlRowExprtreeParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Cint, Cdouble), scip, nlrow, paramidx, paramval)
end

function SCIPsetNlRowExprtreeParams(scip, nlrow, paramvals)
    ccall((:SCIPsetNlRowExprtreeParams, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{Cdouble}), scip, nlrow, paramvals)
end

function SCIPrecalcNlRowNLPActivity(scip, nlrow)
    ccall((:SCIPrecalcNlRowNLPActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}), scip, nlrow)
end

function SCIPgetNlRowNLPActivity(scip, nlrow, activity)
    ccall((:SCIPgetNlRowNLPActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{Cdouble}), scip, nlrow, activity)
end

function SCIPgetNlRowNLPFeasibility(scip, nlrow, feasibility)
    ccall((:SCIPgetNlRowNLPFeasibility, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{Cdouble}), scip, nlrow, feasibility)
end

function SCIPrecalcNlRowPseudoActivity(scip, nlrow)
    ccall((:SCIPrecalcNlRowPseudoActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}), scip, nlrow)
end

function SCIPgetNlRowPseudoActivity(scip, nlrow, pseudoactivity)
    ccall((:SCIPgetNlRowPseudoActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{Cdouble}), scip, nlrow, pseudoactivity)
end

function SCIPgetNlRowPseudoFeasibility(scip, nlrow, pseudofeasibility)
    ccall((:SCIPgetNlRowPseudoFeasibility, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{Cdouble}), scip, nlrow, pseudofeasibility)
end

function SCIPrecalcNlRowActivity(scip, nlrow)
    ccall((:SCIPrecalcNlRowActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}), scip, nlrow)
end

function SCIPgetNlRowActivity(scip, nlrow, activity)
    ccall((:SCIPgetNlRowActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{Cdouble}), scip, nlrow, activity)
end

function SCIPgetNlRowFeasibility(scip, nlrow, feasibility)
    ccall((:SCIPgetNlRowFeasibility, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{Cdouble}), scip, nlrow, feasibility)
end

function SCIPgetNlRowSolActivity(scip, nlrow, sol, activity)
    ccall((:SCIPgetNlRowSolActivity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{SCIP_SOL}, Ptr{Cdouble}), scip, nlrow, sol, activity)
end

function SCIPgetNlRowSolFeasibility(scip, nlrow, sol, feasibility)
    ccall((:SCIPgetNlRowSolFeasibility, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{SCIP_SOL}, Ptr{Cdouble}), scip, nlrow, sol, feasibility)
end

function SCIPgetNlRowActivityBounds(scip, nlrow, minactivity, maxactivity)
    ccall((:SCIPgetNlRowActivityBounds, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{Cdouble}, Ptr{Cdouble}), scip, nlrow, minactivity, maxactivity)
end

function SCIPprintNlRow(scip, nlrow, file)
    ccall((:SCIPprintNlRow, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLROW}, Ptr{Libc.FILE}), scip, nlrow, file)
end

function SCIPincludeNodesel(scip, name, desc, stdpriority, memsavepriority, nodeselcopy, nodeselfree, nodeselinit, nodeselexit, nodeselinitsol, nodeselexitsol, nodeselselect, nodeselcomp, nodeseldata)
    ccall((:SCIPincludeNodesel, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_NODESELDATA}), scip, name, desc, stdpriority, memsavepriority, nodeselcopy, nodeselfree, nodeselinit, nodeselexit, nodeselinitsol, nodeselexitsol, nodeselselect, nodeselcomp, nodeseldata)
end

function SCIPincludeNodeselBasic(scip, nodesel, name, desc, stdpriority, memsavepriority, nodeselselect, nodeselcomp, nodeseldata)
    ccall((:SCIPincludeNodeselBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_NODESEL}}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_NODESELDATA}), scip, nodesel, name, desc, stdpriority, memsavepriority, nodeselselect, nodeselcomp, nodeseldata)
end

function SCIPsetNodeselCopy(scip, nodesel, nodeselcopy)
    ccall((:SCIPsetNodeselCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODESEL}, Ptr{Cvoid}), scip, nodesel, nodeselcopy)
end

function SCIPsetNodeselFree(scip, nodesel, nodeselfree)
    ccall((:SCIPsetNodeselFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODESEL}, Ptr{Cvoid}), scip, nodesel, nodeselfree)
end

function SCIPsetNodeselInit(scip, nodesel, nodeselinit)
    ccall((:SCIPsetNodeselInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODESEL}, Ptr{Cvoid}), scip, nodesel, nodeselinit)
end

function SCIPsetNodeselExit(scip, nodesel, nodeselexit)
    ccall((:SCIPsetNodeselExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODESEL}, Ptr{Cvoid}), scip, nodesel, nodeselexit)
end

function SCIPsetNodeselInitsol(scip, nodesel, nodeselinitsol)
    ccall((:SCIPsetNodeselInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODESEL}, Ptr{Cvoid}), scip, nodesel, nodeselinitsol)
end

function SCIPsetNodeselExitsol(scip, nodesel, nodeselexitsol)
    ccall((:SCIPsetNodeselExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODESEL}, Ptr{Cvoid}), scip, nodesel, nodeselexitsol)
end

function SCIPfindNodesel(scip, name)
    ccall((:SCIPfindNodesel, libscip), Ptr{SCIP_NODESEL}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetNodesels(scip)
    ccall((:SCIPgetNodesels, libscip), Ptr{Ptr{SCIP_NODESEL}}, (Ptr{SCIP},), scip)
end

function SCIPgetNNodesels(scip)
    ccall((:SCIPgetNNodesels, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPsetNodeselStdPriority(scip, nodesel, priority)
    ccall((:SCIPsetNodeselStdPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODESEL}, Cint), scip, nodesel, priority)
end

function SCIPsetNodeselMemsavePriority(scip, nodesel, priority)
    ccall((:SCIPsetNodeselMemsavePriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODESEL}, Cint), scip, nodesel, priority)
end

function SCIPgetNodesel(scip)
    ccall((:SCIPgetNodesel, libscip), Ptr{SCIP_NODESEL}, (Ptr{SCIP},), scip)
end

function SCIPaddSquareLinearization(scip, sqrcoef, refpoint, isint, lincoef, linconstant, success)
    ccall((:SCIPaddSquareLinearization, libscip), Cvoid, (Ptr{SCIP}, Cdouble, Cdouble, Cuint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}), scip, sqrcoef, refpoint, isint, lincoef, linconstant, success)
end

function SCIPaddSquareSecant(scip, sqrcoef, lb, ub, refpoint, lincoef, linconstant, success)
    ccall((:SCIPaddSquareSecant, libscip), Cvoid, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}), scip, sqrcoef, lb, ub, refpoint, lincoef, linconstant, success)
end

function SCIPaddBilinLinearization(scip, bilincoef, refpointx, refpointy, lincoefx, lincoefy, linconstant, success)
    ccall((:SCIPaddBilinLinearization, libscip), Cvoid, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}), scip, bilincoef, refpointx, refpointy, lincoefx, lincoefy, linconstant, success)
end

function SCIPaddBilinMcCormick(scip, bilincoef, lbx, ubx, refpointx, lby, uby, refpointy, overestimate, lincoefx, lincoefy, linconstant, success)
    ccall((:SCIPaddBilinMcCormick, libscip), Cvoid, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cuint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}), scip, bilincoef, lbx, ubx, refpointx, lby, uby, refpointy, overestimate, lincoefx, lincoefy, linconstant, success)
end

function SCIPcomputeBilinEnvelope1(scip, bilincoef, lbx, ubx, refpointx, lby, uby, refpointy, overestimate, xcoef, ycoef, constant, lincoefx, lincoefy, linconstant, success)
    ccall((:SCIPcomputeBilinEnvelope1, libscip), Cvoid, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cuint, Cdouble, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}), scip, bilincoef, lbx, ubx, refpointx, lby, uby, refpointy, overestimate, xcoef, ycoef, constant, lincoefx, lincoefy, linconstant, success)
end

function SCIPcomputeBilinEnvelope2(scip, bilincoef, lbx, ubx, refpointx, lby, uby, refpointy, overestimate, alpha1, beta1, gamma1, alpha2, beta2, gamma2, lincoefx, lincoefy, linconstant, success)
    ccall((:SCIPcomputeBilinEnvelope2, libscip), Cvoid, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cuint, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}), scip, bilincoef, lbx, ubx, refpointx, lby, uby, refpointy, overestimate, alpha1, beta1, gamma1, alpha2, beta2, gamma2, lincoefx, lincoefy, linconstant, success)
end

function SCIPcreateNlpiProb(scip, nlpi, nlrows, nnlrows, nlpiprob, var2idx, nlrow2idx, nlscore, cutoffbound, setobj, onlyconvex)
    ccall((:SCIPcreateNlpiProb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLPI}, Ptr{Ptr{SCIP_NLROW}}, Cint, Ptr{SCIP_NLPIPROBLEM}, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Ptr{Cdouble}, Cdouble, Cuint, Cuint), scip, nlpi, nlrows, nnlrows, nlpiprob, var2idx, nlrow2idx, nlscore, cutoffbound, setobj, onlyconvex)
end

function SCIPupdateNlpiProb(scip, nlpi, nlpiprob, var2nlpiidx, nlpivars, nlpinvars, cutoffbound)
    ccall((:SCIPupdateNlpiProb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLPI}, Ptr{SCIP_NLPIPROBLEM}, Ptr{SCIP_HASHMAP}, Ptr{Ptr{SCIP_VAR}}, Cint, Cdouble), scip, nlpi, nlpiprob, var2nlpiidx, nlpivars, nlpinvars, cutoffbound)
end

function SCIPaddNlpiProbRows(scip, nlpi, nlpiprob, var2idx, rows, nrows)
    ccall((:SCIPaddNlpiProbRows, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NLPI}, Ptr{SCIP_NLPIPROBLEM}, Ptr{SCIP_HASHMAP}, Ptr{Ptr{SCIP_ROW}}, Cint), scip, nlpi, nlpiprob, var2idx, rows, nrows)
end

function SCIPepsilon(scip)
    ccall((:SCIPepsilon, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPsumepsilon(scip)
    ccall((:SCIPsumepsilon, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPfeastol(scip)
    ccall((:SCIPfeastol, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPlpfeastol(scip)
    ccall((:SCIPlpfeastol, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPdualfeastol(scip)
    ccall((:SCIPdualfeastol, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPbarrierconvtol(scip)
    ccall((:SCIPbarrierconvtol, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPcutoffbounddelta(scip)
    ccall((:SCIPcutoffbounddelta, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPrelaxfeastol(scip)
    ccall((:SCIPrelaxfeastol, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPchgFeastol(scip, feastol)
    ccall((:SCIPchgFeastol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble), scip, feastol)
end

function SCIPchgLpfeastol(scip, lpfeastol, printnewvalue)
    ccall((:SCIPchgLpfeastol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble, Cuint), scip, lpfeastol, printnewvalue)
end

function SCIPchgDualfeastol(scip, dualfeastol)
    ccall((:SCIPchgDualfeastol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble), scip, dualfeastol)
end

function SCIPchgBarrierconvtol(scip, barrierconvtol)
    ccall((:SCIPchgBarrierconvtol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble), scip, barrierconvtol)
end

function SCIPchgRelaxfeastol(scip, relaxfeastol)
    ccall((:SCIPchgRelaxfeastol, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, relaxfeastol)
end

function SCIPmarkLimitChanged(scip)
    ccall((:SCIPmarkLimitChanged, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPinfinity(scip)
    ccall((:SCIPinfinity, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetHugeValue(scip)
    ccall((:SCIPgetHugeValue, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPisEQ(scip, val1, val2)
    ccall((:SCIPisEQ, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisLT(scip, val1, val2)
    ccall((:SCIPisLT, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisLE(scip, val1, val2)
    ccall((:SCIPisLE, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisGT(scip, val1, val2)
    ccall((:SCIPisGT, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisGE(scip, val1, val2)
    ccall((:SCIPisGE, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisInfinity(scip, val)
    ccall((:SCIPisInfinity, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisHugeValue(scip, val)
    ccall((:SCIPisHugeValue, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisZero(scip, val)
    ccall((:SCIPisZero, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisPositive(scip, val)
    ccall((:SCIPisPositive, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisNegative(scip, val)
    ccall((:SCIPisNegative, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisIntegral(scip, val)
    ccall((:SCIPisIntegral, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisScalingIntegral(scip, val, scalar)
    ccall((:SCIPisScalingIntegral, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val, scalar)
end

function SCIPisFracIntegral(scip, val)
    ccall((:SCIPisFracIntegral, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPfloor(scip, val)
    ccall((:SCIPfloor, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPceil(scip, val)
    ccall((:SCIPceil, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPround(scip, val)
    ccall((:SCIPround, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPfrac(scip, val)
    ccall((:SCIPfrac, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisSumEQ(scip, val1, val2)
    ccall((:SCIPisSumEQ, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumLT(scip, val1, val2)
    ccall((:SCIPisSumLT, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumLE(scip, val1, val2)
    ccall((:SCIPisSumLE, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumGT(scip, val1, val2)
    ccall((:SCIPisSumGT, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumGE(scip, val1, val2)
    ccall((:SCIPisSumGE, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumZero(scip, val)
    ccall((:SCIPisSumZero, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisSumPositive(scip, val)
    ccall((:SCIPisSumPositive, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisSumNegative(scip, val)
    ccall((:SCIPisSumNegative, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisFeasEQ(scip, val1, val2)
    ccall((:SCIPisFeasEQ, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisFeasLT(scip, val1, val2)
    ccall((:SCIPisFeasLT, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisFeasLE(scip, val1, val2)
    ccall((:SCIPisFeasLE, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisFeasGT(scip, val1, val2)
    ccall((:SCIPisFeasGT, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisFeasGE(scip, val1, val2)
    ccall((:SCIPisFeasGE, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisFeasZero(scip, val)
    ccall((:SCIPisFeasZero, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisFeasPositive(scip, val)
    ccall((:SCIPisFeasPositive, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisFeasNegative(scip, val)
    ccall((:SCIPisFeasNegative, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisFeasIntegral(scip, val)
    ccall((:SCIPisFeasIntegral, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisFeasFracIntegral(scip, val)
    ccall((:SCIPisFeasFracIntegral, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPfeasFloor(scip, val)
    ccall((:SCIPfeasFloor, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPfeasCeil(scip, val)
    ccall((:SCIPfeasCeil, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPfeasRound(scip, val)
    ccall((:SCIPfeasRound, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPfeasFrac(scip, val)
    ccall((:SCIPfeasFrac, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisDualfeasEQ(scip, val1, val2)
    ccall((:SCIPisDualfeasEQ, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisDualfeasLT(scip, val1, val2)
    ccall((:SCIPisDualfeasLT, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisDualfeasLE(scip, val1, val2)
    ccall((:SCIPisDualfeasLE, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisDualfeasGT(scip, val1, val2)
    ccall((:SCIPisDualfeasGT, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisDualfeasGE(scip, val1, val2)
    ccall((:SCIPisDualfeasGE, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisDualfeasZero(scip, val)
    ccall((:SCIPisDualfeasZero, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisDualfeasPositive(scip, val)
    ccall((:SCIPisDualfeasPositive, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisDualfeasNegative(scip, val)
    ccall((:SCIPisDualfeasNegative, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisDualfeasIntegral(scip, val)
    ccall((:SCIPisDualfeasIntegral, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisDualfeasFracIntegral(scip, val)
    ccall((:SCIPisDualfeasFracIntegral, libscip), Cuint, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPdualfeasFloor(scip, val)
    ccall((:SCIPdualfeasFloor, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPdualfeasCeil(scip, val)
    ccall((:SCIPdualfeasCeil, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPdualfeasRound(scip, val)
    ccall((:SCIPdualfeasRound, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPdualfeasFrac(scip, val)
    ccall((:SCIPdualfeasFrac, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, val)
end

function SCIPisLbBetter(scip, newlb, oldlb, oldub)
    ccall((:SCIPisLbBetter, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble), scip, newlb, oldlb, oldub)
end

function SCIPisUbBetter(scip, newub, oldlb, oldub)
    ccall((:SCIPisUbBetter, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble), scip, newub, oldlb, oldub)
end

function SCIPisRelEQ(scip, val1, val2)
    ccall((:SCIPisRelEQ, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisRelLT(scip, val1, val2)
    ccall((:SCIPisRelLT, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisRelLE(scip, val1, val2)
    ccall((:SCIPisRelLE, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisRelGT(scip, val1, val2)
    ccall((:SCIPisRelGT, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisRelGE(scip, val1, val2)
    ccall((:SCIPisRelGE, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumRelEQ(scip, val1, val2)
    ccall((:SCIPisSumRelEQ, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumRelLT(scip, val1, val2)
    ccall((:SCIPisSumRelLT, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumRelLE(scip, val1, val2)
    ccall((:SCIPisSumRelLE, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumRelGT(scip, val1, val2)
    ccall((:SCIPisSumRelGT, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPisSumRelGE(scip, val1, val2)
    ccall((:SCIPisSumRelGE, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, val1, val2)
end

function SCIPconvertRealToInt(scip, real)
    ccall((:SCIPconvertRealToInt, libscip), Cint, (Ptr{SCIP}, Cdouble), scip, real)
end

function SCIPconvertRealToLongint(scip, real)
    ccall((:SCIPconvertRealToLongint, libscip), Clonglong, (Ptr{SCIP}, Cdouble), scip, real)
end

function SCIPisUpdateUnreliable(scip, newvalue, oldvalue)
    ccall((:SCIPisUpdateUnreliable, libscip), Cuint, (Ptr{SCIP}, Cdouble, Cdouble), scip, newvalue, oldvalue)
end

function SCIPprintReal(scip, file, val, width, precision)
    ccall((:SCIPprintReal, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}, Cdouble, Cint, Cint), scip, file, val, width, precision)
end

function SCIPparseReal(scip, str, value, endptr)
    ccall((:SCIPparseReal, libscip), Cuint, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cdouble}, Ptr{Ptr{Cchar}}), scip, str, value, endptr)
end

function SCIPaddBoolParam(scip, name, desc, valueptr, isadvanced, defaultvalue, paramchgd, paramdata)
    ccall((:SCIPaddBoolParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cuint}, Cuint, Cuint, Ptr{Cvoid}, Ptr{SCIP_PARAMDATA}), scip, name, desc, valueptr, isadvanced, defaultvalue, paramchgd, paramdata)
end

function SCIPaddIntParam(scip, name, desc, valueptr, isadvanced, defaultvalue, minvalue, maxvalue, paramchgd, paramdata)
    ccall((:SCIPaddIntParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cint}, Cuint, Cint, Cint, Cint, Ptr{Cvoid}, Ptr{SCIP_PARAMDATA}), scip, name, desc, valueptr, isadvanced, defaultvalue, minvalue, maxvalue, paramchgd, paramdata)
end

function SCIPaddLongintParam(scip, name, desc, valueptr, isadvanced, defaultvalue, minvalue, maxvalue, paramchgd, paramdata)
    ccall((:SCIPaddLongintParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Clonglong}, Cuint, Clonglong, Clonglong, Clonglong, Ptr{Cvoid}, Ptr{SCIP_PARAMDATA}), scip, name, desc, valueptr, isadvanced, defaultvalue, minvalue, maxvalue, paramchgd, paramdata)
end

function SCIPaddRealParam(scip, name, desc, valueptr, isadvanced, defaultvalue, minvalue, maxvalue, paramchgd, paramdata)
    ccall((:SCIPaddRealParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cdouble}, Cuint, Cdouble, Cdouble, Cdouble, Ptr{Cvoid}, Ptr{SCIP_PARAMDATA}), scip, name, desc, valueptr, isadvanced, defaultvalue, minvalue, maxvalue, paramchgd, paramdata)
end

function SCIPaddCharParam(scip, name, desc, valueptr, isadvanced, defaultvalue, allowedvalues, paramchgd, paramdata)
    ccall((:SCIPaddCharParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Cuint, Cchar, Ptr{Cchar}, Ptr{Cvoid}, Ptr{SCIP_PARAMDATA}), scip, name, desc, valueptr, isadvanced, defaultvalue, allowedvalues, paramchgd, paramdata)
end

function SCIPaddStringParam(scip, name, desc, valueptr, isadvanced, defaultvalue, paramchgd, paramdata)
    ccall((:SCIPaddStringParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Ptr{Cchar}}, Cuint, Ptr{Cchar}, Ptr{Cvoid}, Ptr{SCIP_PARAMDATA}), scip, name, desc, valueptr, isadvanced, defaultvalue, paramchgd, paramdata)
end

function SCIPisParamFixed(scip, name)
    ccall((:SCIPisParamFixed, libscip), Cuint, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetParam(scip, name)
    ccall((:SCIPgetParam, libscip), Ptr{SCIP_PARAM}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetBoolParam(scip, name, value)
    ccall((:SCIPgetBoolParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cuint}), scip, name, value)
end

function SCIPgetIntParam(scip, name, value)
    ccall((:SCIPgetIntParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cint}), scip, name, value)
end

function SCIPgetLongintParam(scip, name, value)
    ccall((:SCIPgetLongintParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Clonglong}), scip, name, value)
end

function SCIPgetRealParam(scip, name, value)
    ccall((:SCIPgetRealParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cdouble}), scip, name, value)
end

function SCIPgetCharParam(scip, name, value)
    ccall((:SCIPgetCharParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}), scip, name, value)
end

function SCIPgetStringParam(scip, name, value)
    ccall((:SCIPgetStringParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Ptr{Cchar}}), scip, name, value)
end

function SCIPfixParam(scip, name)
    ccall((:SCIPfixParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPunfixParam(scip, name)
    ccall((:SCIPunfixParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPsetParam(scip, name, value)
    ccall((:SCIPsetParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cvoid}), scip, name, value)
end

function SCIPchgBoolParam(scip, param, value)
    ccall((:SCIPchgBoolParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PARAM}, Cuint), scip, param, value)
end

function SCIPsetBoolParam(scip, name, value)
    ccall((:SCIPsetBoolParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Cuint), scip, name, value)
end

function SCIPisBoolParamValid(scip, param, value)
    ccall((:SCIPisBoolParamValid, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_PARAM}, Cuint), scip, param, value)
end

function SCIPchgIntParam(scip, param, value)
    ccall((:SCIPchgIntParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PARAM}, Cint), scip, param, value)
end

function SCIPsetIntParam(scip, name, value)
    ccall((:SCIPsetIntParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Cint), scip, name, value)
end

function SCIPisIntParamValid(scip, param, value)
    ccall((:SCIPisIntParamValid, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_PARAM}, Cint), scip, param, value)
end

function SCIPchgLongintParam(scip, param, value)
    ccall((:SCIPchgLongintParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PARAM}, Clonglong), scip, param, value)
end

function SCIPsetLongintParam(scip, name, value)
    ccall((:SCIPsetLongintParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Clonglong), scip, name, value)
end

function SCIPisLongintParamValid(scip, param, value)
    ccall((:SCIPisLongintParamValid, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_PARAM}, Clonglong), scip, param, value)
end

function SCIPchgRealParam(scip, param, value)
    ccall((:SCIPchgRealParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PARAM}, Cdouble), scip, param, value)
end

function SCIPsetRealParam(scip, name, value)
    ccall((:SCIPsetRealParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Cdouble), scip, name, value)
end

function SCIPisRealParamValid(scip, param, value)
    ccall((:SCIPisRealParamValid, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_PARAM}, Cdouble), scip, param, value)
end

function SCIPchgCharParam(scip, param, value)
    ccall((:SCIPchgCharParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PARAM}, Cchar), scip, param, value)
end

function SCIPsetCharParam(scip, name, value)
    ccall((:SCIPsetCharParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Cchar), scip, name, value)
end

function SCIPisCharParamValid(scip, param, value)
    ccall((:SCIPisCharParamValid, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_PARAM}, Cchar), scip, param, value)
end

function SCIPchgStringParam(scip, param, value)
    ccall((:SCIPchgStringParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PARAM}, Ptr{Cchar}), scip, param, value)
end

function SCIPsetStringParam(scip, name, value)
    ccall((:SCIPsetStringParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}), scip, name, value)
end

function SCIPisStringParamValid(scip, param, value)
    ccall((:SCIPisStringParamValid, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_PARAM}, Ptr{Cchar}), scip, param, value)
end

function SCIPreadParams(scip, filename)
    ccall((:SCIPreadParams, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}), scip, filename)
end

function SCIPwriteParam(scip, param, filename, comments, onlychanged)
    ccall((:SCIPwriteParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PARAM}, Ptr{Cchar}, Cuint, Cuint), scip, param, filename, comments, onlychanged)
end

function SCIPwriteParams(scip, filename, comments, onlychanged)
    ccall((:SCIPwriteParams, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Cuint, Cuint), scip, filename, comments, onlychanged)
end

function SCIPresetParam(scip, name)
    ccall((:SCIPresetParam, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPresetParams(scip)
    ccall((:SCIPresetParams, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPsetEmphasis(scip, paramemphasis, quiet)
    ccall((:SCIPsetEmphasis, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_PARAMEMPHASIS, Cuint), scip, paramemphasis, quiet)
end

function SCIPsetSubscipsOff(scip, quiet)
    ccall((:SCIPsetSubscipsOff, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cuint), scip, quiet)
end

function SCIPsetHeuristics(scip, paramsetting, quiet)
    ccall((:SCIPsetHeuristics, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_PARAMSETTING, Cuint), scip, paramsetting, quiet)
end

function SCIPsetPresolving(scip, paramsetting, quiet)
    ccall((:SCIPsetPresolving, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_PARAMSETTING, Cuint), scip, paramsetting, quiet)
end

function SCIPsetSeparating(scip, paramsetting, quiet)
    ccall((:SCIPsetSeparating, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_PARAMSETTING, Cuint), scip, paramsetting, quiet)
end

function SCIPgetParams(scip)
    ccall((:SCIPgetParams, libscip), Ptr{Ptr{SCIP_PARAM}}, (Ptr{SCIP},), scip)
end

function SCIPgetNParams(scip)
    ccall((:SCIPgetNParams, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetSubscipsOff(scip)
    ccall((:SCIPgetSubscipsOff, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPincludePresol(scip, name, desc, priority, maxrounds, timing, presolcopy, presolfree, presolinit, presolexit, presolinitpre, presolexitpre, presolexec, presoldata)
    ccall((:SCIPincludePresol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, SCIP_PRESOLTIMING, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_PRESOLDATA}), scip, name, desc, priority, maxrounds, timing, presolcopy, presolfree, presolinit, presolexit, presolinitpre, presolexitpre, presolexec, presoldata)
end

function SCIPincludePresolBasic(scip, presolptr, name, desc, priority, maxrounds, timing, presolexec, presoldata)
    ccall((:SCIPincludePresolBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_PRESOL}}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, SCIP_PRESOLTIMING, Ptr{Cvoid}, Ptr{SCIP_PRESOLDATA}), scip, presolptr, name, desc, priority, maxrounds, timing, presolexec, presoldata)
end

function SCIPsetPresolCopy(scip, presol, presolcopy)
    ccall((:SCIPsetPresolCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRESOL}, Ptr{Cvoid}), scip, presol, presolcopy)
end

function SCIPsetPresolFree(scip, presol, presolfree)
    ccall((:SCIPsetPresolFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRESOL}, Ptr{Cvoid}), scip, presol, presolfree)
end

function SCIPsetPresolInit(scip, presol, presolinit)
    ccall((:SCIPsetPresolInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRESOL}, Ptr{Cvoid}), scip, presol, presolinit)
end

function SCIPsetPresolExit(scip, presol, presolexit)
    ccall((:SCIPsetPresolExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRESOL}, Ptr{Cvoid}), scip, presol, presolexit)
end

function SCIPsetPresolInitpre(scip, presol, presolinitpre)
    ccall((:SCIPsetPresolInitpre, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRESOL}, Ptr{Cvoid}), scip, presol, presolinitpre)
end

function SCIPsetPresolExitpre(scip, presol, presolexitpre)
    ccall((:SCIPsetPresolExitpre, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRESOL}, Ptr{Cvoid}), scip, presol, presolexitpre)
end

function SCIPfindPresol(scip, name)
    ccall((:SCIPfindPresol, libscip), Ptr{SCIP_PRESOL}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetPresols(scip)
    ccall((:SCIPgetPresols, libscip), Ptr{Ptr{SCIP_PRESOL}}, (Ptr{SCIP},), scip)
end

function SCIPgetNPresols(scip)
    ccall((:SCIPgetNPresols, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPsetPresolPriority(scip, presol, priority)
    ccall((:SCIPsetPresolPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRESOL}, Cint), scip, presol, priority)
end

function SCIPincludePricer(scip, name, desc, priority, delay, pricercopy, pricerfree, pricerinit, pricerexit, pricerinitsol, pricerexitsol, pricerredcost, pricerfarkas, pricerdata)
    ccall((:SCIPincludePricer, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cuint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_PRICERDATA}), scip, name, desc, priority, delay, pricercopy, pricerfree, pricerinit, pricerexit, pricerinitsol, pricerexitsol, pricerredcost, pricerfarkas, pricerdata)
end

function SCIPincludePricerBasic(scip, pricerptr, name, desc, priority, delay, pricerredcost, pricerfarkas, pricerdata)
    ccall((:SCIPincludePricerBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_PRICER}}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cuint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_PRICERDATA}), scip, pricerptr, name, desc, priority, delay, pricerredcost, pricerfarkas, pricerdata)
end

function SCIPsetPricerCopy(scip, pricer, pricercopy)
    ccall((:SCIPsetPricerCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRICER}, Ptr{Cvoid}), scip, pricer, pricercopy)
end

function SCIPsetPricerFree(scip, pricer, pricerfree)
    ccall((:SCIPsetPricerFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRICER}, Ptr{Cvoid}), scip, pricer, pricerfree)
end

function SCIPsetPricerInit(scip, pricer, pricerinit)
    ccall((:SCIPsetPricerInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRICER}, Ptr{Cvoid}), scip, pricer, pricerinit)
end

function SCIPsetPricerExit(scip, pricer, pricerexit)
    ccall((:SCIPsetPricerExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRICER}, Ptr{Cvoid}), scip, pricer, pricerexit)
end

function SCIPsetPricerInitsol(scip, pricer, pricerinitsol)
    ccall((:SCIPsetPricerInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRICER}, Ptr{Cvoid}), scip, pricer, pricerinitsol)
end

function SCIPsetPricerExitsol(scip, pricer, pricerexitsol)
    ccall((:SCIPsetPricerExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRICER}, Ptr{Cvoid}), scip, pricer, pricerexitsol)
end

function SCIPfindPricer(scip, name)
    ccall((:SCIPfindPricer, libscip), Ptr{SCIP_PRICER}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetPricers(scip)
    ccall((:SCIPgetPricers, libscip), Ptr{Ptr{SCIP_PRICER}}, (Ptr{SCIP},), scip)
end

function SCIPgetNPricers(scip)
    ccall((:SCIPgetNPricers, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNActivePricers(scip)
    ccall((:SCIPgetNActivePricers, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPsetPricerPriority(scip, pricer, priority)
    ccall((:SCIPsetPricerPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRICER}, Cint), scip, pricer, priority)
end

function SCIPactivatePricer(scip, pricer)
    ccall((:SCIPactivatePricer, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRICER}), scip, pricer)
end

function SCIPdeactivatePricer(scip, pricer)
    ccall((:SCIPdeactivatePricer, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PRICER}), scip, pricer)
end

function SCIPcreateProb(scip, name, probdelorig, probtrans, probdeltrans, probinitsol, probexitsol, probcopy, probdata)
    ccall((:SCIPcreateProb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_PROBDATA}), scip, name, probdelorig, probtrans, probdeltrans, probinitsol, probexitsol, probcopy, probdata)
end

function SCIPcreateProbBasic(scip, name)
    ccall((:SCIPcreateProbBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPsetProbDelorig(scip, probdelorig)
    ccall((:SCIPsetProbDelorig, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cvoid}), scip, probdelorig)
end

function SCIPsetProbTrans(scip, probtrans)
    ccall((:SCIPsetProbTrans, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cvoid}), scip, probtrans)
end

function SCIPsetProbDeltrans(scip, probdeltrans)
    ccall((:SCIPsetProbDeltrans, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cvoid}), scip, probdeltrans)
end

function SCIPsetProbInitsol(scip, probinitsol)
    ccall((:SCIPsetProbInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cvoid}), scip, probinitsol)
end

function SCIPsetProbExitsol(scip, probexitsol)
    ccall((:SCIPsetProbExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cvoid}), scip, probexitsol)
end

function SCIPsetProbCopy(scip, probcopy)
    ccall((:SCIPsetProbCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cvoid}), scip, probcopy)
end

function SCIPreadProb(scip, filename, extension)
    ccall((:SCIPreadProb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}), scip, filename, extension)
end

function SCIPwriteOrigProblem(scip, filename, extension, genericnames)
    ccall((:SCIPwriteOrigProblem, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Cuint), scip, filename, extension, genericnames)
end

function SCIPwriteTransProblem(scip, filename, extension, genericnames)
    ccall((:SCIPwriteTransProblem, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Cuint), scip, filename, extension, genericnames)
end

function SCIPfreeProb(scip)
    ccall((:SCIPfreeProb, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPpermuteProb(scip, randseed, permuteconss, permutebinvars, permuteintvars, permuteimplvars, permutecontvars)
    ccall((:SCIPpermuteProb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, randseed, permuteconss, permutebinvars, permuteintvars, permuteimplvars, permutecontvars)
end

function SCIPgetProbData(scip)
    ccall((:SCIPgetProbData, libscip), Ptr{SCIP_PROBDATA}, (Ptr{SCIP},), scip)
end

function SCIPsetProbData(scip, probdata)
    ccall((:SCIPsetProbData, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROBDATA}), scip, probdata)
end

function SCIPgetProbName(scip)
    ccall((:SCIPgetProbName, libscip), Ptr{Cchar}, (Ptr{SCIP},), scip)
end

function SCIPsetProbName(scip, name)
    ccall((:SCIPsetProbName, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPchgReoptObjective(scip, objsense, vars, coefs, nvars)
    ccall((:SCIPchgReoptObjective, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_OBJSENSE, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint), scip, objsense, vars, coefs, nvars)
end

function SCIPgetObjsense(scip)
    ccall((:SCIPgetObjsense, libscip), SCIP_OBJSENSE, (Ptr{SCIP},), scip)
end

function SCIPsetObjsense(scip, objsense)
    ccall((:SCIPsetObjsense, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_OBJSENSE), scip, objsense)
end

function SCIPaddObjoffset(scip, addval)
    ccall((:SCIPaddObjoffset, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble), scip, addval)
end

function SCIPaddOrigObjoffset(scip, addval)
    ccall((:SCIPaddOrigObjoffset, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble), scip, addval)
end

function SCIPgetOrigObjoffset(scip)
    ccall((:SCIPgetOrigObjoffset, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetOrigObjscale(scip)
    ccall((:SCIPgetOrigObjscale, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetTransObjoffset(scip)
    ccall((:SCIPgetTransObjoffset, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetTransObjscale(scip)
    ccall((:SCIPgetTransObjscale, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPsetObjlimit(scip, objlimit)
    ccall((:SCIPsetObjlimit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble), scip, objlimit)
end

function SCIPgetObjlimit(scip)
    ccall((:SCIPgetObjlimit, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPsetObjIntegral(scip)
    ccall((:SCIPsetObjIntegral, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPisObjIntegral(scip)
    ccall((:SCIPisObjIntegral, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPgetObjNorm(scip)
    ccall((:SCIPgetObjNorm, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPaddVar(scip, var)
    ccall((:SCIPaddVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPaddPricedVar(scip, var, score)
    ccall((:SCIPaddPricedVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, score)
end

function SCIPdelVar(scip, var, deleted)
    ccall((:SCIPdelVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{Cuint}), scip, var, deleted)
end

function SCIPgetVarsData(scip, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars)
    ccall((:SCIPgetVarsData, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars)
end

function SCIPgetVars(scip)
    ccall((:SCIPgetVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP},), scip)
end

function SCIPgetNVars(scip)
    ccall((:SCIPgetNVars, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNBinVars(scip)
    ccall((:SCIPgetNBinVars, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNIntVars(scip)
    ccall((:SCIPgetNIntVars, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNImplVars(scip)
    ccall((:SCIPgetNImplVars, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNContVars(scip)
    ccall((:SCIPgetNContVars, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNObjVars(scip)
    ccall((:SCIPgetNObjVars, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetFixedVars(scip)
    ccall((:SCIPgetFixedVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP},), scip)
end

function SCIPgetNFixedVars(scip)
    ccall((:SCIPgetNFixedVars, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetOrigVarsData(scip, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars)
    ccall((:SCIPgetOrigVarsData, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars)
end

function SCIPgetOrigVars(scip)
    ccall((:SCIPgetOrigVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP},), scip)
end

function SCIPgetNOrigVars(scip)
    ccall((:SCIPgetNOrigVars, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNOrigBinVars(scip)
    ccall((:SCIPgetNOrigBinVars, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNOrigIntVars(scip)
    ccall((:SCIPgetNOrigIntVars, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNOrigImplVars(scip)
    ccall((:SCIPgetNOrigImplVars, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNOrigContVars(scip)
    ccall((:SCIPgetNOrigContVars, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNTotalVars(scip)
    ccall((:SCIPgetNTotalVars, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetSolVarsData(scip, sol, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars)
    ccall((:SCIPgetSolVarsData, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, sol, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars)
end

function SCIPfindVar(scip, name)
    ccall((:SCIPfindVar, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPallVarsInProb(scip)
    ccall((:SCIPallVarsInProb, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPaddCons(scip, cons)
    ccall((:SCIPaddCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPdelCons(scip, cons)
    ccall((:SCIPdelCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPfindOrigCons(scip, name)
    ccall((:SCIPfindOrigCons, libscip), Ptr{SCIP_CONS}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPfindCons(scip, name)
    ccall((:SCIPfindCons, libscip), Ptr{SCIP_CONS}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetNUpgrConss(scip)
    ccall((:SCIPgetNUpgrConss, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNConss(scip)
    ccall((:SCIPgetNConss, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetConss(scip)
    ccall((:SCIPgetConss, libscip), Ptr{Ptr{SCIP_CONS}}, (Ptr{SCIP},), scip)
end

function SCIPgetNOrigConss(scip)
    ccall((:SCIPgetNOrigConss, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetOrigConss(scip)
    ccall((:SCIPgetOrigConss, libscip), Ptr{Ptr{SCIP_CONS}}, (Ptr{SCIP},), scip)
end

function SCIPgetNCheckConss(scip)
    ccall((:SCIPgetNCheckConss, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPaddConflict(scip, node, cons, validnode, conftype, iscutoffinvolved)
    ccall((:SCIPaddConflict, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Ptr{SCIP_CONS}, Ptr{SCIP_NODE}, SCIP_CONFTYPE, Cuint), scip, node, cons, validnode, conftype, iscutoffinvolved)
end

function SCIPclearConflictStore(scip, event)
    ccall((:SCIPclearConflictStore, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_EVENT}), scip, event)
end

function SCIPaddConsNode(scip, node, cons, validnode)
    ccall((:SCIPaddConsNode, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Ptr{SCIP_CONS}, Ptr{SCIP_NODE}), scip, node, cons, validnode)
end

function SCIPaddConsLocal(scip, cons, validnode)
    ccall((:SCIPaddConsLocal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_NODE}), scip, cons, validnode)
end

function SCIPdelConsNode(scip, node, cons)
    ccall((:SCIPdelConsNode, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Ptr{SCIP_CONS}), scip, node, cons)
end

function SCIPdelConsLocal(scip, cons)
    ccall((:SCIPdelConsLocal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLocalOrigEstimate(scip)
    ccall((:SCIPgetLocalOrigEstimate, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetLocalTransEstimate(scip)
    ccall((:SCIPgetLocalTransEstimate, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetLocalDualbound(scip)
    ccall((:SCIPgetLocalDualbound, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetLocalLowerbound(scip)
    ccall((:SCIPgetLocalLowerbound, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetNodeDualbound(scip, node)
    ccall((:SCIPgetNodeDualbound, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_NODE}), scip, node)
end

function SCIPgetNodeLowerbound(scip, node)
    ccall((:SCIPgetNodeLowerbound, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_NODE}), scip, node)
end

function SCIPupdateLocalDualbound(scip, newbound)
    ccall((:SCIPupdateLocalDualbound, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble), scip, newbound)
end

function SCIPupdateLocalLowerbound(scip, newbound)
    ccall((:SCIPupdateLocalLowerbound, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble), scip, newbound)
end

function SCIPupdateNodeDualbound(scip, node, newbound)
    ccall((:SCIPupdateNodeDualbound, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Cdouble), scip, node, newbound)
end

function SCIPupdateNodeLowerbound(scip, node, newbound)
    ccall((:SCIPupdateNodeLowerbound, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Cdouble), scip, node, newbound)
end

function SCIPchgChildPrio(scip, child, priority)
    ccall((:SCIPchgChildPrio, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Cdouble), scip, child, priority)
end

function SCIPinProbing(scip)
    ccall((:SCIPinProbing, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPstartProbing(scip)
    ccall((:SCIPstartProbing, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPnewProbingNode(scip)
    ccall((:SCIPnewProbingNode, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPgetProbingDepth(scip)
    ccall((:SCIPgetProbingDepth, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPbacktrackProbing(scip, probingdepth)
    ccall((:SCIPbacktrackProbing, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint), scip, probingdepth)
end

function SCIPendProbing(scip)
    ccall((:SCIPendProbing, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPchgVarLbProbing(scip, var, newbound)
    ccall((:SCIPchgVarLbProbing, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newbound)
end

function SCIPchgVarUbProbing(scip, var, newbound)
    ccall((:SCIPchgVarUbProbing, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newbound)
end

function SCIPgetVarObjProbing(scip, var)
    ccall((:SCIPgetVarObjProbing, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPfixVarProbing(scip, var, fixedval)
    ccall((:SCIPfixVarProbing, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, fixedval)
end

function SCIPchgVarObjProbing(scip, var, newobj)
    ccall((:SCIPchgVarObjProbing, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newobj)
end

function SCIPisObjChangedProbing(scip)
    ccall((:SCIPisObjChangedProbing, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPpropagateProbing(scip, maxproprounds, cutoff, ndomredsfound)
    ccall((:SCIPpropagateProbing, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Cuint}, Ptr{Clonglong}), scip, maxproprounds, cutoff, ndomredsfound)
end

function SCIPpropagateProbingImplications(scip, cutoff)
    ccall((:SCIPpropagateProbingImplications, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cuint}), scip, cutoff)
end

function SCIPsolveProbingLP(scip, itlim, lperror, cutoff)
    ccall((:SCIPsolveProbingLP, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Cuint}, Ptr{Cuint}), scip, itlim, lperror, cutoff)
end

function SCIPsolveProbingLPWithPricing(scip, pretendroot, displayinfo, maxpricerounds, lperror, cutoff)
    ccall((:SCIPsolveProbingLPWithPricing, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cuint, Cuint, Cint, Ptr{Cuint}, Ptr{Cuint}), scip, pretendroot, displayinfo, maxpricerounds, lperror, cutoff)
end

function SCIPsetProbingLPState(scip, lpistate, lpinorms, primalfeas, dualfeas)
    ccall((:SCIPsetProbingLPState, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_LPISTATE}}, Ptr{Ptr{SCIP_LPINORMS}}, Cuint, Cuint), scip, lpistate, lpinorms, primalfeas, dualfeas)
end

function SCIPaddRowProbing(scip, row)
    ccall((:SCIPaddRowProbing, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_ROW}), scip, row)
end

function SCIPapplyCutsProbing(scip, cutoff)
    ccall((:SCIPapplyCutsProbing, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cuint}), scip, cutoff)
end

function SCIPsolveProbingRelax(scip, cutoff)
    ccall((:SCIPsolveProbingRelax, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cuint}), scip, cutoff)
end

function SCIPsnprintfProbingStats(scip, strbuf, len)
    ccall((:SCIPsnprintfProbingStats, libscip), Ptr{Cchar}, (Ptr{SCIP}, Ptr{Cchar}, Cint), scip, strbuf, len)
end

function SCIPgetDivesetScore(scip, diveset, divetype, divecand, divecandsol, divecandfrac, candscore, roundup)
    ccall((:SCIPgetDivesetScore, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DIVESET}, SCIP_DIVETYPE, Ptr{SCIP_VAR}, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cuint}), scip, diveset, divetype, divecand, divecandsol, divecandfrac, candscore, roundup)
end

function SCIPupdateDivesetLPStats(scip, diveset, niterstoadd, divecontext)
    ccall((:SCIPupdateDivesetLPStats, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_DIVESET}, Clonglong, SCIP_DIVECONTEXT), scip, diveset, niterstoadd, divecontext)
end

function SCIPupdateDivesetStats(scip, diveset, nprobingnodes, nbacktracks, nsolsfound, nbestsolsfound, nconflictsfound, leavewassol, divecontext)
    ccall((:SCIPupdateDivesetStats, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_DIVESET}, Cint, Cint, Clonglong, Clonglong, Clonglong, Cuint, SCIP_DIVECONTEXT), scip, diveset, nprobingnodes, nbacktracks, nsolsfound, nbestsolsfound, nconflictsfound, leavewassol, divecontext)
end

function SCIPgetDiveBoundChanges(scip, diveset, sol, success, infeasible)
    ccall((:SCIPgetDiveBoundChanges, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DIVESET}, Ptr{SCIP_SOL}, Ptr{Cuint}, Ptr{Cuint}), scip, diveset, sol, success, infeasible)
end

function SCIPaddDiveBoundChange(scip, var, dir, value, preferred)
    ccall((:SCIPaddDiveBoundChange, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR, Cdouble, Cuint), scip, var, dir, value, preferred)
end

function SCIPgetDiveBoundChangeData(scip, variables, directions, values, ndivebdchgs, preferred)
    ccall((:SCIPgetDiveBoundChangeData, libscip), Cvoid, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{SCIP_BRANCHDIR}}, Ptr{Ptr{Cdouble}}, Ptr{Cint}, Cuint), scip, variables, directions, values, ndivebdchgs, preferred)
end

function SCIPclearDiveBoundChanges(scip)
    ccall((:SCIPclearDiveBoundChanges, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPincludeProp(scip, name, desc, priority, freq, delay, timingmask, presolpriority, presolmaxrounds, presoltiming, propcopy, propfree, propinit, propexit, propinitpre, propexitpre, propinitsol, propexitsol, proppresol, propexec, propresprop, propdata)
    ccall((:SCIPincludeProp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, Cuint, SCIP_PROPTIMING, Cint, Cint, SCIP_PRESOLTIMING, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_PROPDATA}), scip, name, desc, priority, freq, delay, timingmask, presolpriority, presolmaxrounds, presoltiming, propcopy, propfree, propinit, propexit, propinitpre, propexitpre, propinitsol, propexitsol, proppresol, propexec, propresprop, propdata)
end

function SCIPincludePropBasic(scip, propptr, name, desc, priority, freq, delay, timingmask, propexec, propdata)
    ccall((:SCIPincludePropBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_PROP}}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, Cuint, SCIP_PROPTIMING, Ptr{Cvoid}, Ptr{SCIP_PROPDATA}), scip, propptr, name, desc, priority, freq, delay, timingmask, propexec, propdata)
end

function SCIPsetPropCopy(scip, prop, propcopy)
    ccall((:SCIPsetPropCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}), scip, prop, propcopy)
end

function SCIPsetPropFree(scip, prop, propfree)
    ccall((:SCIPsetPropFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}), scip, prop, propfree)
end

function SCIPsetPropInit(scip, prop, propinit)
    ccall((:SCIPsetPropInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}), scip, prop, propinit)
end

function SCIPsetPropExit(scip, prop, propexit)
    ccall((:SCIPsetPropExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}), scip, prop, propexit)
end

function SCIPsetPropInitsol(scip, prop, propinitsol)
    ccall((:SCIPsetPropInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}), scip, prop, propinitsol)
end

function SCIPsetPropExitsol(scip, prop, propexitsol)
    ccall((:SCIPsetPropExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}), scip, prop, propexitsol)
end

function SCIPsetPropInitpre(scip, prop, propinitpre)
    ccall((:SCIPsetPropInitpre, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}), scip, prop, propinitpre)
end

function SCIPsetPropExitpre(scip, prop, propexitpre)
    ccall((:SCIPsetPropExitpre, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}), scip, prop, propexitpre)
end

function SCIPsetPropPresol(scip, prop, proppresol, presolpriority, presolmaxrounds, presoltiming)
    ccall((:SCIPsetPropPresol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}, Cint, Cint, SCIP_PRESOLTIMING), scip, prop, proppresol, presolpriority, presolmaxrounds, presoltiming)
end

function SCIPsetPropResprop(scip, prop, propresprop)
    ccall((:SCIPsetPropResprop, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Cvoid}), scip, prop, propresprop)
end

function SCIPfindProp(scip, name)
    ccall((:SCIPfindProp, libscip), Ptr{SCIP_PROP}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetProps(scip)
    ccall((:SCIPgetProps, libscip), Ptr{Ptr{SCIP_PROP}}, (Ptr{SCIP},), scip)
end

function SCIPgetNProps(scip)
    ccall((:SCIPgetNProps, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPsetPropPriority(scip, prop, priority)
    ccall((:SCIPsetPropPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Cint), scip, prop, priority)
end

function SCIPsetPropPresolPriority(scip, prop, presolpriority)
    ccall((:SCIPsetPropPresolPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Cint), scip, prop, presolpriority)
end

function SCIPcreateRandom(scip, randnumgen, initialseed, useglobalseed)
    ccall((:SCIPcreateRandom, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_RANDNUMGEN}}, Cuint, Cuint), scip, randnumgen, initialseed, useglobalseed)
end

function SCIPfreeRandom(scip, randnumgen)
    ccall((:SCIPfreeRandom, libscip), Cvoid, (Ptr{SCIP}, Ptr{Ptr{SCIP_RANDNUMGEN}}), scip, randnumgen)
end

function SCIPsetRandomSeed(scip, randnumgen, seed)
    ccall((:SCIPsetRandomSeed, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_RANDNUMGEN}, Cuint), scip, randnumgen, seed)
end

function SCIPinitializeRandomSeed(scip, initialseedvalue)
    ccall((:SCIPinitializeRandomSeed, libscip), Cuint, (Ptr{SCIP}, Cuint), scip, initialseedvalue)
end

function SCIPincludeReader(scip, name, desc, extension, readercopy, readerfree, readerread, readerwrite, readerdata)
    ccall((:SCIPincludeReader, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_READERDATA}), scip, name, desc, extension, readercopy, readerfree, readerread, readerwrite, readerdata)
end

function SCIPincludeReaderBasic(scip, readerptr, name, desc, extension, readerdata)
    ccall((:SCIPincludeReaderBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_READER}}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{SCIP_READERDATA}), scip, readerptr, name, desc, extension, readerdata)
end

function SCIPsetReaderCopy(scip, reader, readercopy)
    ccall((:SCIPsetReaderCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_READER}, Ptr{Cvoid}), scip, reader, readercopy)
end

function SCIPsetReaderFree(scip, reader, readerfree)
    ccall((:SCIPsetReaderFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_READER}, Ptr{Cvoid}), scip, reader, readerfree)
end

function SCIPsetReaderRead(scip, reader, readerread)
    ccall((:SCIPsetReaderRead, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_READER}, Ptr{Cvoid}), scip, reader, readerread)
end

function SCIPsetReaderWrite(scip, reader, readerwrite)
    ccall((:SCIPsetReaderWrite, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_READER}, Ptr{Cvoid}), scip, reader, readerwrite)
end

function SCIPfindReader(scip, name)
    ccall((:SCIPfindReader, libscip), Ptr{SCIP_READER}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetReaders(scip)
    ccall((:SCIPgetReaders, libscip), Ptr{Ptr{SCIP_READER}}, (Ptr{SCIP},), scip)
end

function SCIPgetNReaders(scip)
    ccall((:SCIPgetNReaders, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPincludeRelax(scip, name, desc, priority, freq, relaxcopy, relaxfree, relaxinit, relaxexit, relaxinitsol, relaxexitsol, relaxexec, relaxdata)
    ccall((:SCIPincludeRelax, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_RELAXDATA}), scip, name, desc, priority, freq, relaxcopy, relaxfree, relaxinit, relaxexit, relaxinitsol, relaxexitsol, relaxexec, relaxdata)
end

function SCIPincludeRelaxBasic(scip, relaxptr, name, desc, priority, freq, relaxexec, relaxdata)
    ccall((:SCIPincludeRelaxBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_RELAX}}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, Ptr{Cvoid}, Ptr{SCIP_RELAXDATA}), scip, relaxptr, name, desc, priority, freq, relaxexec, relaxdata)
end

function SCIPsetRelaxCopy(scip, relax, relaxcopy)
    ccall((:SCIPsetRelaxCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}, Ptr{Cvoid}), scip, relax, relaxcopy)
end

function SCIPsetRelaxFree(scip, relax, relaxfree)
    ccall((:SCIPsetRelaxFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}, Ptr{Cvoid}), scip, relax, relaxfree)
end

function SCIPsetRelaxInit(scip, relax, relaxinit)
    ccall((:SCIPsetRelaxInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}, Ptr{Cvoid}), scip, relax, relaxinit)
end

function SCIPsetRelaxExit(scip, relax, relaxexit)
    ccall((:SCIPsetRelaxExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}, Ptr{Cvoid}), scip, relax, relaxexit)
end

function SCIPsetRelaxInitsol(scip, relax, relaxinitsol)
    ccall((:SCIPsetRelaxInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}, Ptr{Cvoid}), scip, relax, relaxinitsol)
end

function SCIPsetRelaxExitsol(scip, relax, relaxexitsol)
    ccall((:SCIPsetRelaxExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}, Ptr{Cvoid}), scip, relax, relaxexitsol)
end

function SCIPfindRelax(scip, name)
    ccall((:SCIPfindRelax, libscip), Ptr{SCIP_RELAX}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetRelaxs(scip)
    ccall((:SCIPgetRelaxs, libscip), Ptr{Ptr{SCIP_RELAX}}, (Ptr{SCIP},), scip)
end

function SCIPgetNRelaxs(scip)
    ccall((:SCIPgetNRelaxs, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPsetRelaxPriority(scip, relax, priority)
    ccall((:SCIPsetRelaxPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}, Cint), scip, relax, priority)
end

function SCIPgetReoptChildIDs(scip, node, ids, mem, nids)
    ccall((:SCIPgetReoptChildIDs, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Ptr{Cuint}, Cint, Ptr{Cint}), scip, node, ids, mem, nids)
end

function SCIPgetReoptLeaveIDs(scip, node, ids, mem, nids)
    ccall((:SCIPgetReoptLeaveIDs, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Ptr{Cuint}, Cint, Ptr{Cint}), scip, node, ids, mem, nids)
end

function SCIPgetNReoptnodes(scip, node)
    ccall((:SCIPgetNReoptnodes, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_NODE}), scip, node)
end

function SCIPgetNReoptLeaves(scip, node)
    ccall((:SCIPgetNReoptLeaves, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_NODE}), scip, node)
end

function SCIPgetReoptnode(scip, id)
    ccall((:SCIPgetReoptnode, libscip), Ptr{SCIP_REOPTNODE}, (Ptr{SCIP}, Cuint), scip, id)
end

function SCIPaddReoptnodeBndchg(scip, reoptnode, var, bound, boundtype)
    ccall((:SCIPaddReoptnodeBndchg, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_REOPTNODE}, Ptr{SCIP_VAR}, Cdouble, SCIP_BOUNDTYPE), scip, reoptnode, var, bound, boundtype)
end

function SCIPsetReoptCompression(scip, representation, nrepresentatives, success)
    ccall((:SCIPsetReoptCompression, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_REOPTNODE}}, Cint, Ptr{Cuint}), scip, representation, nrepresentatives, success)
end

function SCIPaddReoptnodeCons(scip, reoptnode, vars, vals, boundtypes, lhs, rhs, nvars, constype, linear)
    ccall((:SCIPaddReoptnodeCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_REOPTNODE}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{SCIP_BOUNDTYPE}, Cdouble, Cdouble, Cint, REOPT_CONSTYPE, Cuint), scip, reoptnode, vars, vals, boundtypes, lhs, rhs, nvars, constype, linear)
end

function SCIPgetReoptnodePath(scip, reoptnode, vars, vals, boundtypes, mem, nvars, nafterdualvars)
    ccall((:SCIPgetReoptnodePath, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_REOPTNODE}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{SCIP_BOUNDTYPE}, Cint, Ptr{Cint}, Ptr{Cint}), scip, reoptnode, vars, vals, boundtypes, mem, nvars, nafterdualvars)
end

function SCIPinitRepresentation(scip, representatives, nrepresentatives)
    ccall((:SCIPinitRepresentation, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_REOPTNODE}}, Cint), scip, representatives, nrepresentatives)
end

function SCIPresetRepresentation(scip, representatives, nrepresentatives)
    ccall((:SCIPresetRepresentation, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_REOPTNODE}}, Cint), scip, representatives, nrepresentatives)
end

function SCIPfreeRepresentation(scip, representatives, nrepresentatives)
    ccall((:SCIPfreeRepresentation, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_REOPTNODE}}, Cint), scip, representatives, nrepresentatives)
end

function SCIPapplyReopt(scip, reoptnode, id, estimate, childnodes, ncreatedchilds, naddedconss, childnodessize, success)
    ccall((:SCIPapplyReopt, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_REOPTNODE}, Cuint, Cdouble, Ptr{Ptr{SCIP_NODE}}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cuint}), scip, reoptnode, id, estimate, childnodes, ncreatedchilds, naddedconss, childnodessize, success)
end

function SCIPresetReoptnodeDualcons(scip, node)
    ccall((:SCIPresetReoptnodeDualcons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}), scip, node)
end

function SCIPsplitReoptRoot(scip, ncreatedchilds, naddedconss)
    ccall((:SCIPsplitReoptRoot, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cint}, Ptr{Cint}), scip, ncreatedchilds, naddedconss)
end

function SCIPreoptimizeNode(scip, node)
    ccall((:SCIPreoptimizeNode, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_NODE}), scip, node)
end

function SCIPdeleteReoptnode(scip, reoptnode)
    ccall((:SCIPdeleteReoptnode, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_REOPTNODE}}), scip, reoptnode)
end

function SCIPgetReoptSimilarity(scip, run1, run2)
    ccall((:SCIPgetReoptSimilarity, libscip), Cdouble, (Ptr{SCIP}, Cint, Cint), scip, run1, run2)
end

function SCIPgetVarCoefChg(scip, varidx, negated, entering, leaving)
    ccall((:SCIPgetVarCoefChg, libscip), Cvoid, (Ptr{SCIP}, Cint, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), scip, varidx, negated, entering, leaving)
end

function SCIPincludeSepa(scip, name, desc, priority, freq, maxbounddist, usessubscip, delay, sepacopy, sepafree, sepainit, sepaexit, sepainitsol, sepaexitsol, sepaexeclp, sepaexecsol, sepadata)
    ccall((:SCIPincludeSepa, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, Cdouble, Cuint, Cuint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_SEPADATA}), scip, name, desc, priority, freq, maxbounddist, usessubscip, delay, sepacopy, sepafree, sepainit, sepaexit, sepainitsol, sepaexitsol, sepaexeclp, sepaexecsol, sepadata)
end

function SCIPincludeSepaBasic(scip, sepa, name, desc, priority, freq, maxbounddist, usessubscip, delay, sepaexeclp, sepaexecsol, sepadata)
    ccall((:SCIPincludeSepaBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SEPA}}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, Cdouble, Cuint, Cuint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_SEPADATA}), scip, sepa, name, desc, priority, freq, maxbounddist, usessubscip, delay, sepaexeclp, sepaexecsol, sepadata)
end

function SCIPsetSepaCopy(scip, sepa, sepacopy)
    ccall((:SCIPsetSepaCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SEPA}, Ptr{Cvoid}), scip, sepa, sepacopy)
end

function SCIPsetSepaFree(scip, sepa, sepafree)
    ccall((:SCIPsetSepaFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SEPA}, Ptr{Cvoid}), scip, sepa, sepafree)
end

function SCIPsetSepaInit(scip, sepa, sepainit)
    ccall((:SCIPsetSepaInit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SEPA}, Ptr{Cvoid}), scip, sepa, sepainit)
end

function SCIPsetSepaExit(scip, sepa, sepaexit)
    ccall((:SCIPsetSepaExit, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SEPA}, Ptr{Cvoid}), scip, sepa, sepaexit)
end

function SCIPsetSepaInitsol(scip, sepa, sepainitsol)
    ccall((:SCIPsetSepaInitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SEPA}, Ptr{Cvoid}), scip, sepa, sepainitsol)
end

function SCIPsetSepaExitsol(scip, sepa, sepaexitsol)
    ccall((:SCIPsetSepaExitsol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SEPA}, Ptr{Cvoid}), scip, sepa, sepaexitsol)
end

function SCIPfindSepa(scip, name)
    ccall((:SCIPfindSepa, libscip), Ptr{SCIP_SEPA}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetSepas(scip)
    ccall((:SCIPgetSepas, libscip), Ptr{Ptr{SCIP_SEPA}}, (Ptr{SCIP},), scip)
end

function SCIPgetNSepas(scip)
    ccall((:SCIPgetNSepas, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPsetSepaPriority(scip, sepa, priority)
    ccall((:SCIPsetSepaPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SEPA}, Cint), scip, sepa, priority)
end

function SCIPgetSepaMinEfficacy(scip)
    ccall((:SCIPgetSepaMinEfficacy, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPcreateSol(scip, sol, heur)
    ccall((:SCIPcreateSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_HEUR}), scip, sol, heur)
end

function SCIPcreateLPSol(scip, sol, heur)
    ccall((:SCIPcreateLPSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_HEUR}), scip, sol, heur)
end

function SCIPcreateNLPSol(scip, sol, heur)
    ccall((:SCIPcreateNLPSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_HEUR}), scip, sol, heur)
end

function SCIPcreateRelaxSol(scip, sol, heur)
    ccall((:SCIPcreateRelaxSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_HEUR}), scip, sol, heur)
end

function SCIPcreatePseudoSol(scip, sol, heur)
    ccall((:SCIPcreatePseudoSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_HEUR}), scip, sol, heur)
end

function SCIPcreateCurrentSol(scip, sol, heur)
    ccall((:SCIPcreateCurrentSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_HEUR}), scip, sol, heur)
end

function SCIPcreatePartialSol(scip, sol, heur)
    ccall((:SCIPcreatePartialSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_HEUR}), scip, sol, heur)
end

function SCIPcreateUnknownSol(scip, sol, heur)
    ccall((:SCIPcreateUnknownSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_HEUR}), scip, sol, heur)
end

function SCIPcreateOrigSol(scip, sol, heur)
    ccall((:SCIPcreateOrigSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_HEUR}), scip, sol, heur)
end

function SCIPcreateSolCopy(scip, sol, sourcesol)
    ccall((:SCIPcreateSolCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_SOL}), scip, sol, sourcesol)
end

function SCIPcreateSolCopyOrig(scip, sol, sourcesol)
    ccall((:SCIPcreateSolCopyOrig, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_SOL}), scip, sol, sourcesol)
end

function SCIPcreateFiniteSolCopy(scip, sol, sourcesol, success)
    ccall((:SCIPcreateFiniteSolCopy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{SCIP_SOL}, Ptr{Cuint}), scip, sol, sourcesol, success)
end

function SCIPfreeSol(scip, sol)
    ccall((:SCIPfreeSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}), scip, sol)
end

function SCIPlinkLPSol(scip, sol)
    ccall((:SCIPlinkLPSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPlinkNLPSol(scip, sol)
    ccall((:SCIPlinkNLPSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPlinkRelaxSol(scip, sol)
    ccall((:SCIPlinkRelaxSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPlinkPseudoSol(scip, sol)
    ccall((:SCIPlinkPseudoSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPlinkCurrentSol(scip, sol)
    ccall((:SCIPlinkCurrentSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPclearSol(scip, sol)
    ccall((:SCIPclearSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPunlinkSol(scip, sol)
    ccall((:SCIPunlinkSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPsetSolVal(scip, sol, var, val)
    ccall((:SCIPsetSolVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{SCIP_VAR}, Cdouble), scip, sol, var, val)
end

function SCIPsetSolVals(scip, sol, nvars, vars, vals)
    ccall((:SCIPsetSolVals, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}), scip, sol, nvars, vars, vals)
end

function SCIPincSolVal(scip, sol, var, incval)
    ccall((:SCIPincSolVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{SCIP_VAR}, Cdouble), scip, sol, var, incval)
end

function SCIPgetSolVal(scip, sol, var)
    ccall((:SCIPgetSolVal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{SCIP_VAR}), scip, sol, var)
end

function SCIPgetSolVals(scip, sol, nvars, vars, vals)
    ccall((:SCIPgetSolVals, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}), scip, sol, nvars, vars, vals)
end

function SCIPgetSolOrigObj(scip, sol)
    ccall((:SCIPgetSolOrigObj, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPgetSolTransObj(scip, sol)
    ccall((:SCIPgetSolTransObj, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPrecomputeSolObj(scip, sol)
    ccall((:SCIPrecomputeSolObj, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPtransformObj(scip, obj)
    ccall((:SCIPtransformObj, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, obj)
end

function SCIPretransformObj(scip, obj)
    ccall((:SCIPretransformObj, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, obj)
end

function SCIPgetSolTime(scip, sol)
    ccall((:SCIPgetSolTime, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPgetSolRunnum(scip, sol)
    ccall((:SCIPgetSolRunnum, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPgetSolNodenum(scip, sol)
    ccall((:SCIPgetSolNodenum, libscip), Clonglong, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPgetSolHeur(scip, sol)
    ccall((:SCIPgetSolHeur, libscip), Ptr{SCIP_HEUR}, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPareSolsEqual(scip, sol1, sol2)
    ccall((:SCIPareSolsEqual, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{SCIP_SOL}), scip, sol1, sol2)
end

function SCIPadjustImplicitSolVals(scip, sol, uselprows)
    ccall((:SCIPadjustImplicitSolVals, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cuint), scip, sol, uselprows)
end

function SCIPprintSol(scip, sol, file, printzeros)
    ccall((:SCIPprintSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{Libc.FILE}, Cuint), scip, sol, file, printzeros)
end

function SCIPprintTransSol(scip, sol, file, printzeros)
    ccall((:SCIPprintTransSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{Libc.FILE}, Cuint), scip, sol, file, printzeros)
end

function SCIPprintMIPStart(scip, sol, file)
    ccall((:SCIPprintMIPStart, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{Libc.FILE}), scip, sol, file)
end

function SCIPgetDualSolVal(scip, cons, dualsolval, boundconstraint)
    ccall((:SCIPgetDualSolVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Cdouble}, Ptr{Cuint}), scip, cons, dualsolval, boundconstraint)
end

function SCIPisDualSolAvailable(scip, printreason)
    ccall((:SCIPisDualSolAvailable, libscip), Cuint, (Ptr{SCIP}, Cuint), scip, printreason)
end

function SCIPprintDualSol(scip, file, printzeros)
    ccall((:SCIPprintDualSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, Cuint), scip, file, printzeros)
end

function SCIPprintRay(scip, sol, file, printzeros)
    ccall((:SCIPprintRay, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{Libc.FILE}, Cuint), scip, sol, file, printzeros)
end

function SCIPgetNSols(scip)
    ccall((:SCIPgetNSols, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetSols(scip)
    ccall((:SCIPgetSols, libscip), Ptr{Ptr{SCIP_SOL}}, (Ptr{SCIP},), scip)
end

function SCIPgetBestSol(scip)
    ccall((:SCIPgetBestSol, libscip), Ptr{SCIP_SOL}, (Ptr{SCIP},), scip)
end

function SCIPprintBestSol(scip, file, printzeros)
    ccall((:SCIPprintBestSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, Cuint), scip, file, printzeros)
end

function SCIPprintBestTransSol(scip, file, printzeros)
    ccall((:SCIPprintBestTransSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, Cuint), scip, file, printzeros)
end

function SCIProundSol(scip, sol, success)
    ccall((:SCIProundSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{Cuint}), scip, sol, success)
end

function SCIPretransformSol(scip, sol)
    ccall((:SCIPretransformSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPreadSol(scip, filename)
    ccall((:SCIPreadSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}), scip, filename)
end

function SCIPreadSolFile(scip, filename, sol, xml, partial, error)
    ccall((:SCIPreadSolFile, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{SCIP_SOL}, Cuint, Ptr{Cuint}, Ptr{Cuint}), scip, filename, sol, xml, partial, error)
end

function SCIPaddSol(scip, sol, stored)
    ccall((:SCIPaddSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{Cuint}), scip, sol, stored)
end

function SCIPaddSolFree(scip, sol, stored)
    ccall((:SCIPaddSolFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Ptr{Cuint}), scip, sol, stored)
end

function SCIPaddCurrentSol(scip, heur, stored)
    ccall((:SCIPaddCurrentSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Ptr{Cuint}), scip, heur, stored)
end

function SCIPtrySol(scip, sol, printreason, completely, checkbounds, checkintegrality, checklprows, stored)
    ccall((:SCIPtrySol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cuint, Cuint, Cuint, Cuint, Cuint, Ptr{Cuint}), scip, sol, printreason, completely, checkbounds, checkintegrality, checklprows, stored)
end

function SCIPtrySolFree(scip, sol, printreason, completely, checkbounds, checkintegrality, checklprows, stored)
    ccall((:SCIPtrySolFree, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_SOL}}, Cuint, Cuint, Cuint, Cuint, Cuint, Ptr{Cuint}), scip, sol, printreason, completely, checkbounds, checkintegrality, checklprows, stored)
end

function SCIPtryCurrentSol(scip, heur, printreason, completely, checkintegrality, checklprows, stored)
    ccall((:SCIPtryCurrentSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Cuint, Cuint, Cuint, Cuint, Ptr{Cuint}), scip, heur, printreason, completely, checkintegrality, checklprows, stored)
end

function SCIPgetPartialSols(scip)
    ccall((:SCIPgetPartialSols, libscip), Ptr{Ptr{SCIP_SOL}}, (Ptr{SCIP},), scip)
end

function SCIPgetNPartialSols(scip)
    ccall((:SCIPgetNPartialSols, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPcheckSol(scip, sol, printreason, completely, checkbounds, checkintegrality, checklprows, feasible)
    ccall((:SCIPcheckSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cuint, Cuint, Cuint, Cuint, Cuint, Ptr{Cuint}), scip, sol, printreason, completely, checkbounds, checkintegrality, checklprows, feasible)
end

function SCIPcheckSolOrig(scip, sol, feasible, printreason, completely)
    ccall((:SCIPcheckSolOrig, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{Cuint}, Cuint, Cuint), scip, sol, feasible, printreason, completely)
end

function SCIPupdateSolIntegralityViolation(scip, sol, absviol)
    ccall((:SCIPupdateSolIntegralityViolation, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cdouble), scip, sol, absviol)
end

function SCIPupdateSolBoundViolation(scip, sol, absviol, relviol)
    ccall((:SCIPupdateSolBoundViolation, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cdouble, Cdouble), scip, sol, absviol, relviol)
end

function SCIPupdateSolLPRowViolation(scip, sol, absviol, relviol)
    ccall((:SCIPupdateSolLPRowViolation, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cdouble, Cdouble), scip, sol, absviol, relviol)
end

function SCIPupdateSolConsViolation(scip, sol, absviol, relviol)
    ccall((:SCIPupdateSolConsViolation, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cdouble, Cdouble), scip, sol, absviol, relviol)
end

function SCIPupdateSolLPConsViolation(scip, sol, absviol, relviol)
    ccall((:SCIPupdateSolLPConsViolation, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cdouble, Cdouble), scip, sol, absviol, relviol)
end

function SCIPactivateSolViolationUpdates(scip)
    ccall((:SCIPactivateSolViolationUpdates, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPdeactivateSolViolationUpdates(scip)
    ccall((:SCIPdeactivateSolViolationUpdates, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPhasPrimalRay(scip)
    ccall((:SCIPhasPrimalRay, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPgetPrimalRayVal(scip, var)
    ccall((:SCIPgetPrimalRayVal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPupdatePrimalRay(scip, primalray)
    ccall((:SCIPupdatePrimalRay, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, primalray)
end

function SCIPtransformProb(scip)
    ccall((:SCIPtransformProb, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPpresolve(scip)
    ccall((:SCIPpresolve, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPsolve(scip)
    ccall((:SCIPsolve, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPsolveParallel(scip)
    ccall((:SCIPsolveParallel, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPsolveConcurrent(scip)
    ccall((:SCIPsolveConcurrent, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPfreeSolve(scip, restart)
    ccall((:SCIPfreeSolve, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cuint), scip, restart)
end

function SCIPfreeReoptSolve(scip)
    ccall((:SCIPfreeReoptSolve, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPfreeTransform(scip)
    ccall((:SCIPfreeTransform, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPinterruptSolve(scip)
    ccall((:SCIPinterruptSolve, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPrestartSolve(scip)
    ccall((:SCIPrestartSolve, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPenableReoptimization(scip, enable)
    ccall((:SCIPenableReoptimization, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cuint), scip, enable)
end

function SCIPisReoptEnabled(scip)
    ccall((:SCIPisReoptEnabled, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPgetReoptSolsRun(scip, run, sols, allocmem, nsols)
    ccall((:SCIPgetReoptSolsRun, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_SOL}}, Cint, Ptr{Cint}), scip, run, sols, allocmem, nsols)
end

function SCIPresetReoptSolMarks(scip)
    ccall((:SCIPresetReoptSolMarks, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPcheckReoptRestart(scip, node, restart)
    ccall((:SCIPcheckReoptRestart, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Ptr{Cuint}), scip, node, restart)
end

function SCIPaddReoptDualBndchg(scip, node, var, newbound, oldbound)
    ccall((:SCIPaddReoptDualBndchg, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Ptr{SCIP_VAR}, Cdouble, Cdouble), scip, node, var, newbound, oldbound)
end

function SCIPgetReoptLastOptSol(scip)
    ccall((:SCIPgetReoptLastOptSol, libscip), Ptr{SCIP_SOL}, (Ptr{SCIP},), scip)
end

function SCIPgetReoptOldObjCoef(scip, var, run, objcoef)
    ccall((:SCIPgetReoptOldObjCoef, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cint, Ptr{Cdouble}), scip, var, run, objcoef)
end

function SCIPisInRestart(scip)
    ccall((:SCIPisInRestart, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPgetNRuns(scip)
    ccall((:SCIPgetNRuns, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNReoptRuns(scip)
    ccall((:SCIPgetNReoptRuns, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPaddNNodes(scip, nnodes)
    ccall((:SCIPaddNNodes, libscip), Cvoid, (Ptr{SCIP}, Clonglong), scip, nnodes)
end

function SCIPgetNNodes(scip)
    ccall((:SCIPgetNNodes, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNTotalNodes(scip)
    ccall((:SCIPgetNTotalNodes, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNFeasibleLeaves(scip)
    ccall((:SCIPgetNFeasibleLeaves, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNInfeasibleLeaves(scip)
    ccall((:SCIPgetNInfeasibleLeaves, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNObjlimLeaves(scip)
    ccall((:SCIPgetNObjlimLeaves, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNRootboundChgs(scip)
    ccall((:SCIPgetNRootboundChgs, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNRootboundChgsRun(scip)
    ccall((:SCIPgetNRootboundChgsRun, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNDelayedCutoffs(scip)
    ccall((:SCIPgetNDelayedCutoffs, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNLPs(scip)
    ccall((:SCIPgetNLPs, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNLPIterations(scip)
    ccall((:SCIPgetNLPIterations, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNNZs(scip)
    ccall((:SCIPgetNNZs, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNRootLPIterations(scip)
    ccall((:SCIPgetNRootLPIterations, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNRootFirstLPIterations(scip)
    ccall((:SCIPgetNRootFirstLPIterations, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNPrimalLPs(scip)
    ccall((:SCIPgetNPrimalLPs, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNPrimalLPIterations(scip)
    ccall((:SCIPgetNPrimalLPIterations, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNDualLPs(scip)
    ccall((:SCIPgetNDualLPs, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNDualLPIterations(scip)
    ccall((:SCIPgetNDualLPIterations, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNBarrierLPs(scip)
    ccall((:SCIPgetNBarrierLPs, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNBarrierLPIterations(scip)
    ccall((:SCIPgetNBarrierLPIterations, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNResolveLPs(scip)
    ccall((:SCIPgetNResolveLPs, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNResolveLPIterations(scip)
    ccall((:SCIPgetNResolveLPIterations, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNPrimalResolveLPs(scip)
    ccall((:SCIPgetNPrimalResolveLPs, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNPrimalResolveLPIterations(scip)
    ccall((:SCIPgetNPrimalResolveLPIterations, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNDualResolveLPs(scip)
    ccall((:SCIPgetNDualResolveLPs, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNDualResolveLPIterations(scip)
    ccall((:SCIPgetNDualResolveLPIterations, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNNodeLPs(scip)
    ccall((:SCIPgetNNodeLPs, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNNodeZeroIterationLPs(scip)
    ccall((:SCIPgetNNodeZeroIterationLPs, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNNodeLPIterations(scip)
    ccall((:SCIPgetNNodeLPIterations, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNNodeInitLPs(scip)
    ccall((:SCIPgetNNodeInitLPs, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNNodeInitLPIterations(scip)
    ccall((:SCIPgetNNodeInitLPIterations, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNDivingLPs(scip)
    ccall((:SCIPgetNDivingLPs, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNDivingLPIterations(scip)
    ccall((:SCIPgetNDivingLPIterations, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNStrongbranchs(scip)
    ccall((:SCIPgetNStrongbranchs, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNStrongbranchLPIterations(scip)
    ccall((:SCIPgetNStrongbranchLPIterations, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNRootStrongbranchs(scip)
    ccall((:SCIPgetNRootStrongbranchs, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNRootStrongbranchLPIterations(scip)
    ccall((:SCIPgetNRootStrongbranchLPIterations, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNPriceRounds(scip)
    ccall((:SCIPgetNPriceRounds, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNPricevars(scip)
    ccall((:SCIPgetNPricevars, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNPricevarsFound(scip)
    ccall((:SCIPgetNPricevarsFound, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNPricevarsApplied(scip)
    ccall((:SCIPgetNPricevarsApplied, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNSepaRounds(scip)
    ccall((:SCIPgetNSepaRounds, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNCutsFound(scip)
    ccall((:SCIPgetNCutsFound, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNCutsFoundRound(scip)
    ccall((:SCIPgetNCutsFoundRound, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNCutsApplied(scip)
    ccall((:SCIPgetNCutsApplied, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNConflictConssFound(scip)
    ccall((:SCIPgetNConflictConssFound, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNConflictConssFoundNode(scip)
    ccall((:SCIPgetNConflictConssFoundNode, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNConflictConssApplied(scip)
    ccall((:SCIPgetNConflictConssApplied, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNConflictDualproofsApplied(scip)
    ccall((:SCIPgetNConflictDualproofsApplied, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetMaxDepth(scip)
    ccall((:SCIPgetMaxDepth, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetMaxTotalDepth(scip)
    ccall((:SCIPgetMaxTotalDepth, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNBacktracks(scip)
    ccall((:SCIPgetNBacktracks, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNActiveConss(scip)
    ccall((:SCIPgetNActiveConss, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNEnabledConss(scip)
    ccall((:SCIPgetNEnabledConss, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetAvgDualbound(scip)
    ccall((:SCIPgetAvgDualbound, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetAvgLowerbound(scip)
    ccall((:SCIPgetAvgLowerbound, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetDualbound(scip)
    ccall((:SCIPgetDualbound, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetLowerbound(scip)
    ccall((:SCIPgetLowerbound, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetDualboundRoot(scip)
    ccall((:SCIPgetDualboundRoot, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetLowerboundRoot(scip)
    ccall((:SCIPgetLowerboundRoot, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetFirstLPDualboundRoot(scip)
    ccall((:SCIPgetFirstLPDualboundRoot, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetFirstLPLowerboundRoot(scip)
    ccall((:SCIPgetFirstLPLowerboundRoot, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetFirstPrimalBound(scip)
    ccall((:SCIPgetFirstPrimalBound, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetPrimalbound(scip)
    ccall((:SCIPgetPrimalbound, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetUpperbound(scip)
    ccall((:SCIPgetUpperbound, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetCutoffbound(scip)
    ccall((:SCIPgetCutoffbound, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPupdateCutoffbound(scip, cutoffbound)
    ccall((:SCIPupdateCutoffbound, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble), scip, cutoffbound)
end

function SCIPisPrimalboundSol(scip)
    ccall((:SCIPisPrimalboundSol, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPgetGap(scip)
    ccall((:SCIPgetGap, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetTransGap(scip)
    ccall((:SCIPgetTransGap, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetNSolsFound(scip)
    ccall((:SCIPgetNSolsFound, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNLimSolsFound(scip)
    ccall((:SCIPgetNLimSolsFound, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetNBestSolsFound(scip)
    ccall((:SCIPgetNBestSolsFound, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetAvgPseudocost(scip, solvaldelta)
    ccall((:SCIPgetAvgPseudocost, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, solvaldelta)
end

function SCIPgetAvgPseudocostCurrentRun(scip, solvaldelta)
    ccall((:SCIPgetAvgPseudocostCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Cdouble), scip, solvaldelta)
end

function SCIPgetAvgPseudocostCount(scip, dir)
    ccall((:SCIPgetAvgPseudocostCount, libscip), Cdouble, (Ptr{SCIP}, SCIP_BRANCHDIR), scip, dir)
end

function SCIPgetAvgPseudocostCountCurrentRun(scip, dir)
    ccall((:SCIPgetAvgPseudocostCountCurrentRun, libscip), Cdouble, (Ptr{SCIP}, SCIP_BRANCHDIR), scip, dir)
end

function SCIPgetPseudocostCount(scip, dir, onlycurrentrun)
    ccall((:SCIPgetPseudocostCount, libscip), Cdouble, (Ptr{SCIP}, SCIP_BRANCHDIR, Cuint), scip, dir, onlycurrentrun)
end

function SCIPgetAvgPseudocostScore(scip)
    ccall((:SCIPgetAvgPseudocostScore, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetPseudocostVariance(scip, branchdir, onlycurrentrun)
    ccall((:SCIPgetPseudocostVariance, libscip), Cdouble, (Ptr{SCIP}, SCIP_BRANCHDIR, Cuint), scip, branchdir, onlycurrentrun)
end

function SCIPgetAvgPseudocostScoreCurrentRun(scip)
    ccall((:SCIPgetAvgPseudocostScoreCurrentRun, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetAvgConflictScore(scip)
    ccall((:SCIPgetAvgConflictScore, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetAvgConflictScoreCurrentRun(scip)
    ccall((:SCIPgetAvgConflictScoreCurrentRun, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetAvgConflictlengthScore(scip)
    ccall((:SCIPgetAvgConflictlengthScore, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetAvgConflictlengthScoreCurrentRun(scip)
    ccall((:SCIPgetAvgConflictlengthScoreCurrentRun, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetAvgInferences(scip, dir)
    ccall((:SCIPgetAvgInferences, libscip), Cdouble, (Ptr{SCIP}, SCIP_BRANCHDIR), scip, dir)
end

function SCIPgetAvgInferencesCurrentRun(scip, dir)
    ccall((:SCIPgetAvgInferencesCurrentRun, libscip), Cdouble, (Ptr{SCIP}, SCIP_BRANCHDIR), scip, dir)
end

function SCIPgetAvgInferenceScore(scip)
    ccall((:SCIPgetAvgInferenceScore, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetAvgInferenceScoreCurrentRun(scip)
    ccall((:SCIPgetAvgInferenceScoreCurrentRun, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetAvgCutoffs(scip, dir)
    ccall((:SCIPgetAvgCutoffs, libscip), Cdouble, (Ptr{SCIP}, SCIP_BRANCHDIR), scip, dir)
end

function SCIPgetAvgCutoffsCurrentRun(scip, dir)
    ccall((:SCIPgetAvgCutoffsCurrentRun, libscip), Cdouble, (Ptr{SCIP}, SCIP_BRANCHDIR), scip, dir)
end

function SCIPgetAvgCutoffScore(scip)
    ccall((:SCIPgetAvgCutoffScore, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetAvgCutoffScoreCurrentRun(scip)
    ccall((:SCIPgetAvgCutoffScoreCurrentRun, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetDeterministicTime(scip)
    ccall((:SCIPgetDeterministicTime, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPprintOrigProblem(scip, file, extension, genericnames)
    ccall((:SCIPprintOrigProblem, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, Ptr{Cchar}, Cuint), scip, file, extension, genericnames)
end

function SCIPprintTransProblem(scip, file, extension, genericnames)
    ccall((:SCIPprintTransProblem, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, Ptr{Cchar}, Cuint), scip, file, extension, genericnames)
end

function SCIPprintStatusStatistics(scip, file)
    ccall((:SCIPprintStatusStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintTimingStatistics(scip, file)
    ccall((:SCIPprintTimingStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintOrigProblemStatistics(scip, file)
    ccall((:SCIPprintOrigProblemStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintTransProblemStatistics(scip, file)
    ccall((:SCIPprintTransProblemStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintPresolverStatistics(scip, file)
    ccall((:SCIPprintPresolverStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintConstraintStatistics(scip, file)
    ccall((:SCIPprintConstraintStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintConstraintTimingStatistics(scip, file)
    ccall((:SCIPprintConstraintTimingStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintPropagatorStatistics(scip, file)
    ccall((:SCIPprintPropagatorStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintConflictStatistics(scip, file)
    ccall((:SCIPprintConflictStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintSeparatorStatistics(scip, file)
    ccall((:SCIPprintSeparatorStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintPricerStatistics(scip, file)
    ccall((:SCIPprintPricerStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintBranchruleStatistics(scip, file)
    ccall((:SCIPprintBranchruleStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintHeuristicStatistics(scip, file)
    ccall((:SCIPprintHeuristicStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintCompressionStatistics(scip, file)
    ccall((:SCIPprintCompressionStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintLPStatistics(scip, file)
    ccall((:SCIPprintLPStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintNLPStatistics(scip, file)
    ccall((:SCIPprintNLPStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintRelaxatorStatistics(scip, file)
    ccall((:SCIPprintRelaxatorStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintTreeStatistics(scip, file)
    ccall((:SCIPprintTreeStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintRootStatistics(scip, file)
    ccall((:SCIPprintRootStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintSolutionStatistics(scip, file)
    ccall((:SCIPprintSolutionStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintConcsolverStatistics(scip, file)
    ccall((:SCIPprintConcsolverStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintBendersStatistics(scip, file)
    ccall((:SCIPprintBendersStatistics, libscip), Cvoid, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintStatistics(scip, file)
    ccall((:SCIPprintStatistics, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintReoptStatistics(scip, file)
    ccall((:SCIPprintReoptStatistics, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintBranchingStatistics(scip, file)
    ccall((:SCIPprintBranchingStatistics, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}), scip, file)
end

function SCIPprintDisplayLine(scip, file, verblevel, endline)
    ccall((:SCIPprintDisplayLine, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, SCIP_VERBLEVEL, Cuint), scip, file, verblevel, endline)
end

function SCIPgetNImplications(scip)
    ccall((:SCIPgetNImplications, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPwriteImplicationConflictGraph(scip, filename)
    ccall((:SCIPwriteImplicationConflictGraph, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}), scip, filename)
end

function SCIPstoreSolutionGap(scip)
    ccall((:SCIPstoreSolutionGap, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPincludeTable(scip, name, desc, active, tablecopy, tablefree, tableinit, tableexit, tableinitsol, tableexitsol, tableoutput, tabledata, position, earlieststage)
    ccall((:SCIPincludeTable, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Cchar}, Cuint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_TABLEDATA}, Cint, SCIP_STAGE), scip, name, desc, active, tablecopy, tablefree, tableinit, tableexit, tableinitsol, tableexitsol, tableoutput, tabledata, position, earlieststage)
end

function SCIPfindTable(scip, name)
    ccall((:SCIPfindTable, libscip), Ptr{SCIP_TABLE}, (Ptr{SCIP}, Ptr{Cchar}), scip, name)
end

function SCIPgetTables(scip)
    ccall((:SCIPgetTables, libscip), Ptr{Ptr{SCIP_TABLE}}, (Ptr{SCIP},), scip)
end

function SCIPgetNTables(scip)
    ccall((:SCIPgetNTables, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetTimeOfDay(scip)
    ccall((:SCIPgetTimeOfDay, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPcreateClock(scip, clck)
    ccall((:SCIPcreateClock, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CLOCK}}), scip, clck)
end

function SCIPcreateCPUClock(scip, clck)
    ccall((:SCIPcreateCPUClock, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CLOCK}}), scip, clck)
end

function SCIPcreateWallClock(scip, clck)
    ccall((:SCIPcreateWallClock, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CLOCK}}), scip, clck)
end

function SCIPfreeClock(scip, clck)
    ccall((:SCIPfreeClock, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CLOCK}}), scip, clck)
end

function SCIPresetClock(scip, clck)
    ccall((:SCIPresetClock, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CLOCK}), scip, clck)
end

function SCIPstartClock(scip, clck)
    ccall((:SCIPstartClock, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CLOCK}), scip, clck)
end

function SCIPstopClock(scip, clck)
    ccall((:SCIPstopClock, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CLOCK}), scip, clck)
end

function SCIPenableOrDisableStatisticTiming(scip)
    ccall((:SCIPenableOrDisableStatisticTiming, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPstartSolvingTime(scip)
    ccall((:SCIPstartSolvingTime, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPstopSolvingTime(scip)
    ccall((:SCIPstopSolvingTime, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPgetClockTime(scip, clck)
    ccall((:SCIPgetClockTime, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CLOCK}), scip, clck)
end

function SCIPsetClockTime(scip, clck, sec)
    ccall((:SCIPsetClockTime, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CLOCK}, Cdouble), scip, clck, sec)
end

function SCIPgetTotalTime(scip)
    ccall((:SCIPgetTotalTime, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetSolvingTime(scip)
    ccall((:SCIPgetSolvingTime, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetReadingTime(scip)
    ccall((:SCIPgetReadingTime, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetPresolvingTime(scip)
    ccall((:SCIPgetPresolvingTime, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetFirstLPTime(scip)
    ccall((:SCIPgetFirstLPTime, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPgetFocusNode(scip)
    ccall((:SCIPgetFocusNode, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetCurrentNode(scip)
    ccall((:SCIPgetCurrentNode, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetDepth(scip)
    ccall((:SCIPgetDepth, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetFocusDepth(scip)
    ccall((:SCIPgetFocusDepth, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetPlungeDepth(scip)
    ccall((:SCIPgetPlungeDepth, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetRootNode(scip)
    ccall((:SCIPgetRootNode, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetEffectiveRootDepth(scip)
    ccall((:SCIPgetEffectiveRootDepth, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPinRepropagation(scip)
    ccall((:SCIPinRepropagation, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPgetChildren(scip, children, nchildren)
    ccall((:SCIPgetChildren, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_NODE}}}, Ptr{Cint}), scip, children, nchildren)
end

function SCIPgetNChildren(scip)
    ccall((:SCIPgetNChildren, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetSiblings(scip, siblings, nsiblings)
    ccall((:SCIPgetSiblings, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_NODE}}}, Ptr{Cint}), scip, siblings, nsiblings)
end

function SCIPgetNSiblings(scip)
    ccall((:SCIPgetNSiblings, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetLeaves(scip, leaves, nleaves)
    ccall((:SCIPgetLeaves, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_NODE}}}, Ptr{Cint}), scip, leaves, nleaves)
end

function SCIPgetNLeaves(scip)
    ccall((:SCIPgetNLeaves, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNNodesLeft(scip)
    ccall((:SCIPgetNNodesLeft, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetPrioChild(scip)
    ccall((:SCIPgetPrioChild, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetPrioSibling(scip)
    ccall((:SCIPgetPrioSibling, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetBestChild(scip)
    ccall((:SCIPgetBestChild, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetBestSibling(scip)
    ccall((:SCIPgetBestSibling, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetBestLeaf(scip)
    ccall((:SCIPgetBestLeaf, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetBestNode(scip)
    ccall((:SCIPgetBestNode, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetBestboundNode(scip)
    ccall((:SCIPgetBestboundNode, libscip), Ptr{SCIP_NODE}, (Ptr{SCIP},), scip)
end

function SCIPgetOpenNodesData(scip, leaves, children, siblings, nleaves, nchildren, nsiblings)
    ccall((:SCIPgetOpenNodesData, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_NODE}}}, Ptr{Ptr{Ptr{SCIP_NODE}}}, Ptr{Ptr{Ptr{SCIP_NODE}}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, leaves, children, siblings, nleaves, nchildren, nsiblings)
end

function SCIPcutoffNode(scip, node)
    ccall((:SCIPcutoffNode, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}), scip, node)
end

function SCIPrepropagateNode(scip, node)
    ccall((:SCIPrepropagateNode, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}), scip, node)
end

function SCIPgetCutoffdepth(scip)
    ccall((:SCIPgetCutoffdepth, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetRepropdepth(scip)
    ccall((:SCIPgetRepropdepth, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPprintNodeRootPath(scip, node, file)
    ccall((:SCIPprintNodeRootPath, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Ptr{Libc.FILE}), scip, node, file)
end

function SCIPsetFocusnodeLP(scip, solvelp)
    ccall((:SCIPsetFocusnodeLP, libscip), Cvoid, (Ptr{SCIP}, Cuint), scip, solvelp)
end

function SCIPwasNodeLastBranchParent(scip, node)
    ccall((:SCIPwasNodeLastBranchParent, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_NODE}), scip, node)
end

function SCIPvalidateSolve(scip, primalreference, dualreference, reftol, quiet, feasible, primalboundcheck, dualboundcheck)
    ccall((:SCIPvalidateSolve, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble, Cuint, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), scip, primalreference, dualreference, reftol, quiet, feasible, primalboundcheck, dualboundcheck)
end

function SCIPcreateVar(scip, var, name, lb, ub, obj, vartype, initial, removable, vardelorig, vartrans, vardeltrans, varcopy, vardata)
    ccall((:SCIPcreateVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cchar}, Cdouble, Cdouble, Cdouble, SCIP_VARTYPE, Cuint, Cuint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_VARDATA}), scip, var, name, lb, ub, obj, vartype, initial, removable, vardelorig, vartrans, vardeltrans, varcopy, vardata)
end

function SCIPcreateVarBasic(scip, var, name, lb, ub, obj, vartype)
    ccall((:SCIPcreateVarBasic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cchar}, Cdouble, Cdouble, Cdouble, SCIP_VARTYPE), scip, var, name, lb, ub, obj, vartype)
end

function SCIPwriteVarName(scip, file, var, type)
    ccall((:SCIPwriteVarName, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, Ptr{SCIP_VAR}, Cuint), scip, file, var, type)
end

function SCIPwriteVarsList(scip, file, vars, nvars, type, delimiter)
    ccall((:SCIPwriteVarsList, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, Ptr{Ptr{SCIP_VAR}}, Cint, Cuint, Cchar), scip, file, vars, nvars, type, delimiter)
end

function SCIPwriteVarsLinearsum(scip, file, vars, vals, nvars, type)
    ccall((:SCIPwriteVarsLinearsum, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Cuint), scip, file, vars, vals, nvars, type)
end

function SCIPwriteVarsPolynomial(scip, file, monomialvars, monomialexps, monomialcoefs, monomialnvars, nmonomials, type)
    ccall((:SCIPwriteVarsPolynomial, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{Cdouble}}, Ptr{Cdouble}, Ptr{Cint}, Cint, Cuint), scip, file, monomialvars, monomialexps, monomialcoefs, monomialnvars, nmonomials, type)
end

function SCIPparseVar(scip, var, str, initial, removable, varcopy, vardelorig, vartrans, vardeltrans, vardata, endptr, success)
    ccall((:SCIPparseVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cchar}, Cuint, Cuint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{SCIP_VARDATA}, Ptr{Ptr{Cchar}}, Ptr{Cuint}), scip, var, str, initial, removable, varcopy, vardelorig, vartrans, vardeltrans, vardata, endptr, success)
end

function SCIPparseVarName(scip, str, var, endptr)
    ccall((:SCIPparseVarName, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{Cchar}}), scip, str, var, endptr)
end

function SCIPparseVarsList(scip, str, vars, nvars, varssize, requiredsize, endptr, delimiter, success)
    ccall((:SCIPparseVarsList, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Ptr{Cchar}}, Cchar, Ptr{Cuint}), scip, str, vars, nvars, varssize, requiredsize, endptr, delimiter, success)
end

function SCIPparseVarsLinearsum(scip, str, vars, vals, nvars, varssize, requiredsize, endptr, success)
    ccall((:SCIPparseVarsLinearsum, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Ptr{Cchar}}, Ptr{Cuint}), scip, str, vars, vals, nvars, varssize, requiredsize, endptr, success)
end

function SCIPparseVarsPolynomial(scip, str, monomialvars, monomialexps, monomialcoefs, monomialnvars, nmonomials, endptr, success)
    ccall((:SCIPparseVarsPolynomial, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{Ptr{Ptr{Ptr{SCIP_VAR}}}}, Ptr{Ptr{Ptr{Cdouble}}}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cint}}, Ptr{Cint}, Ptr{Ptr{Cchar}}, Ptr{Cuint}), scip, str, monomialvars, monomialexps, monomialcoefs, monomialnvars, nmonomials, endptr, success)
end

function SCIPfreeParseVarsPolynomialData(scip, monomialvars, monomialexps, monomialcoefs, monomialnvars, nmonomials)
    ccall((:SCIPfreeParseVarsPolynomialData, libscip), Cvoid, (Ptr{SCIP}, Ptr{Ptr{Ptr{Ptr{SCIP_VAR}}}}, Ptr{Ptr{Ptr{Cdouble}}}, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cint}}, Cint), scip, monomialvars, monomialexps, monomialcoefs, monomialnvars, nmonomials)
end

function SCIPcaptureVar(scip, var)
    ccall((:SCIPcaptureVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPreleaseVar(scip, var)
    ccall((:SCIPreleaseVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}), scip, var)
end

function SCIPchgVarName(scip, var, name)
    ccall((:SCIPchgVarName, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{Cchar}), scip, var, name)
end

function SCIPtransformVar(scip, var, transvar)
    ccall((:SCIPtransformVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}), scip, var, transvar)
end

function SCIPtransformVars(scip, nvars, vars, transvars)
    ccall((:SCIPtransformVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}), scip, nvars, vars, transvars)
end

function SCIPgetTransformedVar(scip, var, transvar)
    ccall((:SCIPgetTransformedVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}), scip, var, transvar)
end

function SCIPgetTransformedVars(scip, nvars, vars, transvars)
    ccall((:SCIPgetTransformedVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}), scip, nvars, vars, transvars)
end

function SCIPgetNegatedVar(scip, var, negvar)
    ccall((:SCIPgetNegatedVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}), scip, var, negvar)
end

function SCIPgetNegatedVars(scip, nvars, vars, negvars)
    ccall((:SCIPgetNegatedVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}), scip, nvars, vars, negvars)
end

function SCIPgetBinvarRepresentative(scip, var, repvar, negated)
    ccall((:SCIPgetBinvarRepresentative, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cuint}), scip, var, repvar, negated)
end

function SCIPgetBinvarRepresentatives(scip, nvars, vars, repvars, negated)
    ccall((:SCIPgetBinvarRepresentatives, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cuint}), scip, nvars, vars, repvars, negated)
end

function SCIPflattenVarAggregationGraph(scip, var)
    ccall((:SCIPflattenVarAggregationGraph, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetProbvarLinearSum(scip, vars, scalars, nvars, varssize, constant, requiredsize, mergemultiples)
    ccall((:SCIPgetProbvarLinearSum, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cint}, Cint, Ptr{Cdouble}, Ptr{Cint}, Cuint), scip, vars, scalars, nvars, varssize, constant, requiredsize, mergemultiples)
end

function SCIPgetProbvarSum(scip, var, scalar, constant)
    ccall((:SCIPgetProbvarSum, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cdouble}), scip, var, scalar, constant)
end

function SCIPgetActiveVars(scip, vars, nvars, varssize, requiredsize)
    ccall((:SCIPgetActiveVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Cint, Ptr{Cint}), scip, vars, nvars, varssize, requiredsize)
end

function SCIPgetVarRedcost(scip, var)
    ccall((:SCIPgetVarRedcost, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarImplRedcost(scip, var, varfixing)
    ccall((:SCIPgetVarImplRedcost, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cuint), scip, var, varfixing)
end

function SCIPgetVarFarkasCoef(scip, var)
    ccall((:SCIPgetVarFarkasCoef, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarLbAtIndex(scip, var, bdchgidx, after)
    ccall((:SCIPgetVarLbAtIndex, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, Cuint), scip, var, bdchgidx, after)
end

function SCIPgetVarUbAtIndex(scip, var, bdchgidx, after)
    ccall((:SCIPgetVarUbAtIndex, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, Cuint), scip, var, bdchgidx, after)
end

function SCIPgetVarBdAtIndex(scip, var, boundtype, bdchgidx, after)
    ccall((:SCIPgetVarBdAtIndex, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BOUNDTYPE, Ptr{SCIP_BDCHGIDX}, Cuint), scip, var, boundtype, bdchgidx, after)
end

function SCIPgetVarWasFixedAtIndex(scip, var, bdchgidx, after)
    ccall((:SCIPgetVarWasFixedAtIndex, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_BDCHGIDX}, Cuint), scip, var, bdchgidx, after)
end

function SCIPgetVarSol(scip, var)
    ccall((:SCIPgetVarSol, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarSols(scip, nvars, vars, vals)
    ccall((:SCIPgetVarSols, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}), scip, nvars, vars, vals)
end

function SCIPclearRelaxSolVals(scip, relax)
    ccall((:SCIPclearRelaxSolVals, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}), scip, relax)
end

function SCIPsetRelaxSolVal(scip, relax, var, val)
    ccall((:SCIPsetRelaxSolVal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}, Ptr{SCIP_VAR}, Cdouble), scip, relax, var, val)
end

function SCIPsetRelaxSolVals(scip, relax, nvars, vars, vals, includeslp)
    ccall((:SCIPsetRelaxSolVals, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cuint), scip, relax, nvars, vars, vals, includeslp)
end

function SCIPsetRelaxSolValsSol(scip, relax, sol, includeslp)
    ccall((:SCIPsetRelaxSolValsSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}, Ptr{SCIP_SOL}, Cuint), scip, relax, sol, includeslp)
end

function SCIPisRelaxSolValid(scip)
    ccall((:SCIPisRelaxSolValid, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPmarkRelaxSolValid(scip, relax, includeslp)
    ccall((:SCIPmarkRelaxSolValid, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_RELAX}, Cuint), scip, relax, includeslp)
end

function SCIPmarkRelaxSolInvalid(scip)
    ccall((:SCIPmarkRelaxSolInvalid, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPgetRelaxSolVal(scip, var)
    ccall((:SCIPgetRelaxSolVal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetRelaxSolObj(scip)
    ccall((:SCIPgetRelaxSolObj, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPisStrongbranchDownFirst(scip, var)
    ccall((:SCIPisStrongbranchDownFirst, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPstartStrongbranch(scip, enablepropagation)
    ccall((:SCIPstartStrongbranch, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cuint), scip, enablepropagation)
end

function SCIPendStrongbranch(scip)
    ccall((:SCIPendStrongbranch, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPgetVarStrongbranchFrac(scip, var, itlim, idempotent, down, up, downvalid, upvalid, downinf, upinf, downconflict, upconflict, lperror)
    ccall((:SCIPgetVarStrongbranchFrac, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cint, Cuint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), scip, var, itlim, idempotent, down, up, downvalid, upvalid, downinf, upinf, downconflict, upconflict, lperror)
end

function SCIPgetVarStrongbranchWithPropagation(scip, var, solval, lpobjval, itlim, maxproprounds, down, up, downvalid, upvalid, ndomredsdown, ndomredsup, downinf, upinf, downconflict, upconflict, lperror, newlbs, newubs)
    ccall((:SCIPgetVarStrongbranchWithPropagation, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Clonglong}, Ptr{Clonglong}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cdouble}, Ptr{Cdouble}), scip, var, solval, lpobjval, itlim, maxproprounds, down, up, downvalid, upvalid, ndomredsdown, ndomredsup, downinf, upinf, downconflict, upconflict, lperror, newlbs, newubs)
end

function SCIPgetVarStrongbranchInt(scip, var, itlim, idempotent, down, up, downvalid, upvalid, downinf, upinf, downconflict, upconflict, lperror)
    ccall((:SCIPgetVarStrongbranchInt, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cint, Cuint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), scip, var, itlim, idempotent, down, up, downvalid, upvalid, downinf, upinf, downconflict, upconflict, lperror)
end

function SCIPgetVarsStrongbranchesFrac(scip, vars, nvars, itlim, down, up, downvalid, upvalid, downinf, upinf, downconflict, upconflict, lperror)
    ccall((:SCIPgetVarsStrongbranchesFrac, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), scip, vars, nvars, itlim, down, up, downvalid, upvalid, downinf, upinf, downconflict, upconflict, lperror)
end

function SCIPgetVarsStrongbranchesInt(scip, vars, nvars, itlim, down, up, downvalid, upvalid, downinf, upinf, downconflict, upconflict, lperror)
    ccall((:SCIPgetVarsStrongbranchesInt, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), scip, vars, nvars, itlim, down, up, downvalid, upvalid, downinf, upinf, downconflict, upconflict, lperror)
end

function SCIPgetLastStrongbranchLPSolStat(scip, branchdir)
    ccall((:SCIPgetLastStrongbranchLPSolStat, libscip), SCIP_LPSOLSTAT, (Ptr{SCIP}, SCIP_BRANCHDIR), scip, branchdir)
end

function SCIPgetVarStrongbranchLast(scip, var, down, up, downvalid, upvalid, solval, lpobjval)
    ccall((:SCIPgetVarStrongbranchLast, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cdouble}, Ptr{Cdouble}), scip, var, down, up, downvalid, upvalid, solval, lpobjval)
end

function SCIPsetVarStrongbranchData(scip, var, lpobjval, primsol, down, up, downvalid, upvalid, iter, itlim)
    ccall((:SCIPsetVarStrongbranchData, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble, Cdouble, Cuint, Cuint, Clonglong, Cint), scip, var, lpobjval, primsol, down, up, downvalid, upvalid, iter, itlim)
end

function SCIPtryStrongbranchLPSol(scip, foundsol, cutoff)
    ccall((:SCIPtryStrongbranchLPSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cuint}, Ptr{Cuint}), scip, foundsol, cutoff)
end

function SCIPgetVarStrongbranchNode(scip, var)
    ccall((:SCIPgetVarStrongbranchNode, libscip), Clonglong, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarStrongbranchLPAge(scip, var)
    ccall((:SCIPgetVarStrongbranchLPAge, libscip), Clonglong, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarNStrongbranchs(scip, var)
    ccall((:SCIPgetVarNStrongbranchs, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPaddVarLocksType(scip, var, locktype, nlocksdown, nlocksup)
    ccall((:SCIPaddVarLocksType, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_LOCKTYPE, Cint, Cint), scip, var, locktype, nlocksdown, nlocksup)
end

function SCIPaddVarLocks(scip, var, nlocksdown, nlocksup)
    ccall((:SCIPaddVarLocks, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cint, Cint), scip, var, nlocksdown, nlocksup)
end

function SCIPlockVarCons(scip, var, cons, lockdown, lockup)
    ccall((:SCIPlockVarCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_CONS}, Cuint, Cuint), scip, var, cons, lockdown, lockup)
end

function SCIPunlockVarCons(scip, var, cons, lockdown, lockup)
    ccall((:SCIPunlockVarCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_CONS}, Cuint, Cuint), scip, var, cons, lockdown, lockup)
end

function SCIPchgVarObj(scip, var, newobj)
    ccall((:SCIPchgVarObj, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newobj)
end

function SCIPaddVarObj(scip, var, addobj)
    ccall((:SCIPaddVarObj, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, addobj)
end

function SCIPadjustedVarLb(scip, var, lb)
    ccall((:SCIPadjustedVarLb, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, lb)
end

function SCIPadjustedVarUb(scip, var, ub)
    ccall((:SCIPadjustedVarUb, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, ub)
end

function SCIPchgVarLb(scip, var, newbound)
    ccall((:SCIPchgVarLb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newbound)
end

function SCIPchgVarUb(scip, var, newbound)
    ccall((:SCIPchgVarUb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newbound)
end

function SCIPchgVarLbNode(scip, node, var, newbound)
    ccall((:SCIPchgVarLbNode, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Ptr{SCIP_VAR}, Cdouble), scip, node, var, newbound)
end

function SCIPchgVarUbNode(scip, node, var, newbound)
    ccall((:SCIPchgVarUbNode, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_NODE}, Ptr{SCIP_VAR}, Cdouble), scip, node, var, newbound)
end

function SCIPchgVarLbGlobal(scip, var, newbound)
    ccall((:SCIPchgVarLbGlobal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newbound)
end

function SCIPchgVarUbGlobal(scip, var, newbound)
    ccall((:SCIPchgVarUbGlobal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, newbound)
end

function SCIPchgVarLbLazy(scip, var, lazylb)
    ccall((:SCIPchgVarLbLazy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, lazylb)
end

function SCIPchgVarUbLazy(scip, var, lazyub)
    ccall((:SCIPchgVarUbLazy, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, lazyub)
end

function SCIPtightenVarLb(scip, var, newbound, force, infeasible, tightened)
    ccall((:SCIPtightenVarLb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cuint, Ptr{Cuint}, Ptr{Cuint}), scip, var, newbound, force, infeasible, tightened)
end

function SCIPtightenVarUb(scip, var, newbound, force, infeasible, tightened)
    ccall((:SCIPtightenVarUb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cuint, Ptr{Cuint}, Ptr{Cuint}), scip, var, newbound, force, infeasible, tightened)
end

function SCIPinferVarFixCons(scip, var, fixedval, infercons, inferinfo, force, infeasible, tightened)
    ccall((:SCIPinferVarFixCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Ptr{SCIP_CONS}, Cint, Cuint, Ptr{Cuint}, Ptr{Cuint}), scip, var, fixedval, infercons, inferinfo, force, infeasible, tightened)
end

function SCIPinferVarLbCons(scip, var, newbound, infercons, inferinfo, force, infeasible, tightened)
    ccall((:SCIPinferVarLbCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Ptr{SCIP_CONS}, Cint, Cuint, Ptr{Cuint}, Ptr{Cuint}), scip, var, newbound, infercons, inferinfo, force, infeasible, tightened)
end

function SCIPinferVarUbCons(scip, var, newbound, infercons, inferinfo, force, infeasible, tightened)
    ccall((:SCIPinferVarUbCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Ptr{SCIP_CONS}, Cint, Cuint, Ptr{Cuint}, Ptr{Cuint}), scip, var, newbound, infercons, inferinfo, force, infeasible, tightened)
end

function SCIPinferBinvarCons(scip, var, fixedval, infercons, inferinfo, infeasible, tightened)
    ccall((:SCIPinferBinvarCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cuint, Ptr{SCIP_CONS}, Cint, Ptr{Cuint}, Ptr{Cuint}), scip, var, fixedval, infercons, inferinfo, infeasible, tightened)
end

function SCIPinferVarFixProp(scip, var, fixedval, inferprop, inferinfo, force, infeasible, tightened)
    ccall((:SCIPinferVarFixProp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Ptr{SCIP_PROP}, Cint, Cuint, Ptr{Cuint}, Ptr{Cuint}), scip, var, fixedval, inferprop, inferinfo, force, infeasible, tightened)
end

function SCIPinferVarLbProp(scip, var, newbound, inferprop, inferinfo, force, infeasible, tightened)
    ccall((:SCIPinferVarLbProp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Ptr{SCIP_PROP}, Cint, Cuint, Ptr{Cuint}, Ptr{Cuint}), scip, var, newbound, inferprop, inferinfo, force, infeasible, tightened)
end

function SCIPinferVarUbProp(scip, var, newbound, inferprop, inferinfo, force, infeasible, tightened)
    ccall((:SCIPinferVarUbProp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Ptr{SCIP_PROP}, Cint, Cuint, Ptr{Cuint}, Ptr{Cuint}), scip, var, newbound, inferprop, inferinfo, force, infeasible, tightened)
end

function SCIPinferBinvarProp(scip, var, fixedval, inferprop, inferinfo, infeasible, tightened)
    ccall((:SCIPinferBinvarProp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cuint, Ptr{SCIP_PROP}, Cint, Ptr{Cuint}, Ptr{Cuint}), scip, var, fixedval, inferprop, inferinfo, infeasible, tightened)
end

function SCIPtightenVarLbGlobal(scip, var, newbound, force, infeasible, tightened)
    ccall((:SCIPtightenVarLbGlobal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cuint, Ptr{Cuint}, Ptr{Cuint}), scip, var, newbound, force, infeasible, tightened)
end

function SCIPtightenVarUbGlobal(scip, var, newbound, force, infeasible, tightened)
    ccall((:SCIPtightenVarUbGlobal, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cuint, Ptr{Cuint}, Ptr{Cuint}), scip, var, newbound, force, infeasible, tightened)
end

function SCIPcomputeVarLbGlobal(scip, var)
    ccall((:SCIPcomputeVarLbGlobal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPcomputeVarUbGlobal(scip, var)
    ccall((:SCIPcomputeVarUbGlobal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPcomputeVarLbLocal(scip, var)
    ccall((:SCIPcomputeVarLbLocal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPcomputeVarUbLocal(scip, var)
    ccall((:SCIPcomputeVarUbLocal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarMultaggrLbGlobal(scip, var)
    ccall((:SCIPgetVarMultaggrLbGlobal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarMultaggrUbGlobal(scip, var)
    ccall((:SCIPgetVarMultaggrUbGlobal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarMultaggrLbLocal(scip, var)
    ccall((:SCIPgetVarMultaggrLbLocal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarMultaggrUbLocal(scip, var)
    ccall((:SCIPgetVarMultaggrUbLocal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarClosestVlb(scip, var, sol, closestvlb, closestvlbidx)
    ccall((:SCIPgetVarClosestVlb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_SOL}, Ptr{Cdouble}, Ptr{Cint}), scip, var, sol, closestvlb, closestvlbidx)
end

function SCIPgetVarClosestVub(scip, var, sol, closestvub, closestvubidx)
    ccall((:SCIPgetVarClosestVub, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_SOL}, Ptr{Cdouble}, Ptr{Cint}), scip, var, sol, closestvub, closestvubidx)
end

function SCIPaddVarVlb(scip, var, vlbvar, vlbcoef, vlbconstant, infeasible, nbdchgs)
    ccall((:SCIPaddVarVlb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Ptr{Cuint}, Ptr{Cint}), scip, var, vlbvar, vlbcoef, vlbconstant, infeasible, nbdchgs)
end

function SCIPaddVarVub(scip, var, vubvar, vubcoef, vubconstant, infeasible, nbdchgs)
    ccall((:SCIPaddVarVub, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Ptr{Cuint}, Ptr{Cint}), scip, var, vubvar, vubcoef, vubconstant, infeasible, nbdchgs)
end

function SCIPaddVarImplication(scip, var, varfixing, implvar, impltype, implbound, infeasible, nbdchgs)
    ccall((:SCIPaddVarImplication, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cuint, Ptr{SCIP_VAR}, SCIP_BOUNDTYPE, Cdouble, Ptr{Cuint}, Ptr{Cint}), scip, var, varfixing, implvar, impltype, implbound, infeasible, nbdchgs)
end

function SCIPaddClique(scip, vars, values, nvars, isequation, infeasible, nbdchgs)
    ccall((:SCIPaddClique, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cuint}, Cint, Cuint, Ptr{Cuint}, Ptr{Cint}), scip, vars, values, nvars, isequation, infeasible, nbdchgs)
end

function SCIPcalcCliquePartition(scip, vars, nvars, cliquepartition, ncliques)
    ccall((:SCIPcalcCliquePartition, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Cint}, Ptr{Cint}), scip, vars, nvars, cliquepartition, ncliques)
end

function SCIPcalcNegatedCliquePartition(scip, vars, nvars, cliquepartition, ncliques)
    ccall((:SCIPcalcNegatedCliquePartition, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Cint}, Ptr{Cint}), scip, vars, nvars, cliquepartition, ncliques)
end

function SCIPcleanupCliques(scip, infeasible)
    ccall((:SCIPcleanupCliques, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cuint}), scip, infeasible)
end

function SCIPgetNCliques(scip)
    ccall((:SCIPgetNCliques, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetNCliquesCreated(scip)
    ccall((:SCIPgetNCliquesCreated, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetCliques(scip)
    ccall((:SCIPgetCliques, libscip), Ptr{Ptr{SCIP_CLIQUE}}, (Ptr{SCIP},), scip)
end

function SCIPhaveVarsCommonClique(scip, var1, value1, var2, value2, regardimplics)
    ccall((:SCIPhaveVarsCommonClique, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cuint, Ptr{SCIP_VAR}, Cuint, Cuint), scip, var1, value1, var2, value2, regardimplics)
end

function SCIPwriteCliqueGraph(scip, fname, writenodeweights)
    ccall((:SCIPwriteCliqueGraph, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Cuint), scip, fname, writenodeweights)
end

function SCIPremoveVarFromGlobalStructures(scip, var)
    ccall((:SCIPremoveVarFromGlobalStructures, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPchgVarBranchFactor(scip, var, branchfactor)
    ccall((:SCIPchgVarBranchFactor, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, branchfactor)
end

function SCIPscaleVarBranchFactor(scip, var, scale)
    ccall((:SCIPscaleVarBranchFactor, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, scale)
end

function SCIPaddVarBranchFactor(scip, var, addfactor)
    ccall((:SCIPaddVarBranchFactor, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, addfactor)
end

function SCIPchgVarBranchPriority(scip, var, branchpriority)
    ccall((:SCIPchgVarBranchPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cint), scip, var, branchpriority)
end

function SCIPupdateVarBranchPriority(scip, var, branchpriority)
    ccall((:SCIPupdateVarBranchPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cint), scip, var, branchpriority)
end

function SCIPaddVarBranchPriority(scip, var, addpriority)
    ccall((:SCIPaddVarBranchPriority, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cint), scip, var, addpriority)
end

function SCIPchgVarBranchDirection(scip, var, branchdirection)
    ccall((:SCIPchgVarBranchDirection, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, branchdirection)
end

function SCIPchgVarType(scip, var, vartype, infeasible)
    ccall((:SCIPchgVarType, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_VARTYPE, Ptr{Cuint}), scip, var, vartype, infeasible)
end

function SCIPfixVar(scip, var, fixedval, infeasible, fixed)
    ccall((:SCIPfixVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Ptr{Cuint}, Ptr{Cuint}), scip, var, fixedval, infeasible, fixed)
end

function SCIPaggregateVars(scip, varx, vary, scalarx, scalary, rhs, infeasible, redundant, aggregated)
    ccall((:SCIPaggregateVars, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), scip, varx, vary, scalarx, scalary, rhs, infeasible, redundant, aggregated)
end

function SCIPmultiaggregateVar(scip, var, naggvars, aggvars, scalars, constant, infeasible, aggregated)
    ccall((:SCIPmultiaggregateVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble, Ptr{Cuint}, Ptr{Cuint}), scip, var, naggvars, aggvars, scalars, constant, infeasible, aggregated)
end

function SCIPdoNotAggr(scip)
    ccall((:SCIPdoNotAggr, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPdoNotMultaggr(scip)
    ccall((:SCIPdoNotMultaggr, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPdoNotMultaggrVar(scip, var)
    ccall((:SCIPdoNotMultaggrVar, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPallowDualReds(scip)
    ccall((:SCIPallowDualReds, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPallowStrongDualReds(scip)
    ccall((:SCIPallowStrongDualReds, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPallowObjProp(scip)
    ccall((:SCIPallowObjProp, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPallowWeakDualReds(scip)
    ccall((:SCIPallowWeakDualReds, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPmarkDoNotMultaggrVar(scip, var)
    ccall((:SCIPmarkDoNotMultaggrVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPenableVarHistory(scip)
    ccall((:SCIPenableVarHistory, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPdisableVarHistory(scip)
    ccall((:SCIPdisableVarHistory, libscip), Cvoid, (Ptr{SCIP},), scip)
end

function SCIPupdateVarPseudocost(scip, var, solvaldelta, objdelta, weight)
    ccall((:SCIPupdateVarPseudocost, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble), scip, var, solvaldelta, objdelta, weight)
end

function SCIPgetVarPseudocostVal(scip, var, solvaldelta)
    ccall((:SCIPgetVarPseudocostVal, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, solvaldelta)
end

function SCIPgetVarPseudocostValCurrentRun(scip, var, solvaldelta)
    ccall((:SCIPgetVarPseudocostValCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, solvaldelta)
end

function SCIPgetVarPseudocost(scip, var, dir)
    ccall((:SCIPgetVarPseudocost, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarPseudocostCurrentRun(scip, var, dir)
    ccall((:SCIPgetVarPseudocostCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarPseudocostCount(scip, var, dir)
    ccall((:SCIPgetVarPseudocostCount, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarPseudocostCountCurrentRun(scip, var, dir)
    ccall((:SCIPgetVarPseudocostCountCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarPseudocostVariance(scip, var, dir, onlycurrentrun)
    ccall((:SCIPgetVarPseudocostVariance, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR, Cuint), scip, var, dir, onlycurrentrun)
end

function SCIPcalculatePscostConfidenceBound(scip, var, dir, onlycurrentrun, clevel)
    ccall((:SCIPcalculatePscostConfidenceBound, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR, Cuint, SCIP_CONFIDENCELEVEL), scip, var, dir, onlycurrentrun, clevel)
end

function SCIPsignificantVarPscostDifference(scip, varx, fracx, vary, fracy, dir, clevel, onesided)
    ccall((:SCIPsignificantVarPscostDifference, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Ptr{SCIP_VAR}, Cdouble, SCIP_BRANCHDIR, SCIP_CONFIDENCELEVEL, Cuint), scip, varx, fracx, vary, fracy, dir, clevel, onesided)
end

function SCIPpscostThresholdProbabilityTest(scip, var, frac, threshold, dir, clevel)
    ccall((:SCIPpscostThresholdProbabilityTest, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble, SCIP_BRANCHDIR, SCIP_CONFIDENCELEVEL), scip, var, frac, threshold, dir, clevel)
end

function SCIPisVarPscostRelerrorReliable(scip, var, threshold, clevel)
    ccall((:SCIPisVarPscostRelerrorReliable, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, SCIP_CONFIDENCELEVEL), scip, var, threshold, clevel)
end

function SCIPgetVarPseudocostScore(scip, var, solval)
    ccall((:SCIPgetVarPseudocostScore, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, solval)
end

function SCIPgetVarPseudocostScoreCurrentRun(scip, var, solval)
    ccall((:SCIPgetVarPseudocostScoreCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, solval)
end

function SCIPgetVarVSIDS(scip, var, dir)
    ccall((:SCIPgetVarVSIDS, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarVSIDSCurrentRun(scip, var, dir)
    ccall((:SCIPgetVarVSIDSCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarConflictScore(scip, var)
    ccall((:SCIPgetVarConflictScore, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarConflictScoreCurrentRun(scip, var)
    ccall((:SCIPgetVarConflictScoreCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarConflictlengthScore(scip, var)
    ccall((:SCIPgetVarConflictlengthScore, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarConflictlengthScoreCurrentRun(scip, var)
    ccall((:SCIPgetVarConflictlengthScoreCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarAvgConflictlength(scip, var, dir)
    ccall((:SCIPgetVarAvgConflictlength, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarAvgConflictlengthCurrentRun(scip, var, dir)
    ccall((:SCIPgetVarAvgConflictlengthCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarAvgInferences(scip, var, dir)
    ccall((:SCIPgetVarAvgInferences, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarAvgInferencesCurrentRun(scip, var, dir)
    ccall((:SCIPgetVarAvgInferencesCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarAvgInferenceScore(scip, var)
    ccall((:SCIPgetVarAvgInferenceScore, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarAvgInferenceScoreCurrentRun(scip, var)
    ccall((:SCIPgetVarAvgInferenceScoreCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPinitVarBranchStats(scip, var, downpscost, uppscost, downvsids, upvsids, downconflen, upconflen, downinfer, upinfer, downcutoff, upcutoff)
    ccall((:SCIPinitVarBranchStats, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), scip, var, downpscost, uppscost, downvsids, upvsids, downconflen, upconflen, downinfer, upinfer, downcutoff, upcutoff)
end

function SCIPinitVarValueBranchStats(scip, var, value, downvsids, upvsids, downconflen, upconflen, downinfer, upinfer, downcutoff, upcutoff)
    ccall((:SCIPinitVarValueBranchStats, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), scip, var, value, downvsids, upvsids, downconflen, upconflen, downinfer, upinfer, downcutoff, upcutoff)
end

function SCIPgetVarAvgCutoffs(scip, var, dir)
    ccall((:SCIPgetVarAvgCutoffs, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarAvgCutoffsCurrentRun(scip, var, dir)
    ccall((:SCIPgetVarAvgCutoffsCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, SCIP_BRANCHDIR), scip, var, dir)
end

function SCIPgetVarAvgCutoffScore(scip, var)
    ccall((:SCIPgetVarAvgCutoffScore, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarAvgCutoffScoreCurrentRun(scip, var)
    ccall((:SCIPgetVarAvgCutoffScoreCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, var)
end

function SCIPgetVarAvgInferenceCutoffScore(scip, var, cutoffweight)
    ccall((:SCIPgetVarAvgInferenceCutoffScore, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, cutoffweight)
end

function SCIPgetVarAvgInferenceCutoffScoreCurrentRun(scip, var, cutoffweight)
    ccall((:SCIPgetVarAvgInferenceCutoffScoreCurrentRun, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble), scip, var, cutoffweight)
end

function SCIPprintVar(scip, var, file)
    ccall((:SCIPprintVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{Libc.FILE}), scip, var, file)
end

function SCIPselectVarPseudoStrongBranching(scip, pseudocands, skipdown, skipup, npseudocands, npriopseudocands, bestpseudocand, bestdown, bestup, bestscore, bestdownvalid, bestupvalid, provedbound, result)
    ccall((:SCIPselectVarPseudoStrongBranching, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cuint}, Ptr{Cuint}, Cint, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cdouble}, Ptr{SCIP_RESULT}), scip, pseudocands, skipdown, skipup, npseudocands, npriopseudocands, bestpseudocand, bestdown, bestup, bestscore, bestdownvalid, bestupvalid, provedbound, result)
end

function SCIPincludeBranchruleAllfullstrong(scip)
    ccall((:SCIPincludeBranchruleAllfullstrong, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeBranchruleCloud(scip)
    ccall((:SCIPincludeBranchruleCloud, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeBranchruleDistribution(scip)
    ccall((:SCIPincludeBranchruleDistribution, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPvarCalcDistributionParameters(scip, varlb, varub, vartype, mean, variance)
    ccall((:SCIPvarCalcDistributionParameters, libscip), Cvoid, (Ptr{SCIP}, Cdouble, Cdouble, SCIP_VARTYPE, Ptr{Cdouble}, Ptr{Cdouble}), scip, varlb, varub, vartype, mean, variance)
end

function SCIPcalcCumulativeDistribution(scip, mean, variance, value)
    ccall((:SCIPcalcCumulativeDistribution, libscip), Cdouble, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble), scip, mean, variance, value)
end

function SCIProwCalcProbability(scip, row, mu, sigma2, rowinfinitiesdown, rowinfinitiesup)
    ccall((:SCIProwCalcProbability, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_ROW}, Cdouble, Cdouble, Cint, Cint), scip, row, mu, sigma2, rowinfinitiesdown, rowinfinitiesup)
end

function SCIPupdateDistributionScore(scip, currentprob, newprobup, newprobdown, upscore, downscore, scoreparam)
    ccall((:SCIPupdateDistributionScore, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}, Cchar), scip, currentprob, newprobup, newprobdown, upscore, downscore, scoreparam)
end

function SCIPincludeBranchruleFullstrong(scip)
    ccall((:SCIPincludeBranchruleFullstrong, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPselectVarStrongBranching(scip, lpcands, lpcandssol, lpcandsfrac, skipdown, skipup, nlpcands, npriolpcands, ncomplete, start, maxproprounds, probingbounds, forcestrongbranch, bestcand, bestdown, bestup, bestscore, bestdownvalid, bestupvalid, provedbound, result)
    ccall((:SCIPselectVarStrongBranching, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Cint, Cint, Cint, Ptr{Cint}, Cint, Cuint, Cuint, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cdouble}, Ptr{SCIP_RESULT}), scip, lpcands, lpcandssol, lpcandsfrac, skipdown, skipup, nlpcands, npriolpcands, ncomplete, start, maxproprounds, probingbounds, forcestrongbranch, bestcand, bestdown, bestup, bestscore, bestdownvalid, bestupvalid, provedbound, result)
end

function SCIPincludeBranchruleInference(scip)
    ccall((:SCIPincludeBranchruleInference, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeBranchruleLeastinf(scip)
    ccall((:SCIPincludeBranchruleLeastinf, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeBranchruleLookahead(scip)
    ccall((:SCIPincludeBranchruleLookahead, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeBranchruleMostinf(scip)
    ccall((:SCIPincludeBranchruleMostinf, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeBranchruleMultAggr(scip)
    ccall((:SCIPincludeBranchruleMultAggr, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeBranchruleNodereopt(scip)
    ccall((:SCIPincludeBranchruleNodereopt, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeBranchrulePscost(scip)
    ccall((:SCIPincludeBranchrulePscost, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPselectBranchVarPscost(scip, branchcands, branchcandssol, branchcandsscore, nbranchcands, var, brpoint)
    ccall((:SCIPselectBranchVarPscost, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}), scip, branchcands, branchcandssol, branchcandsscore, nbranchcands, var, brpoint)
end

function SCIPincludeBranchruleRandom(scip)
    ccall((:SCIPincludeBranchruleRandom, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeBranchruleRelpscost(scip)
    ccall((:SCIPincludeBranchruleRelpscost, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPexecRelpscostBranching(scip, branchcands, branchcandssol, branchcandsfrac, nbranchcands, executebranching, result)
    ccall((:SCIPexecRelpscostBranching, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cuint, Ptr{SCIP_RESULT}), scip, branchcands, branchcandssol, branchcandsfrac, nbranchcands, executebranching, result)
end

function SCIPincludeBranchruleVanillafullstrong(scip)
    ccall((:SCIPincludeBranchruleVanillafullstrong, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPgetVanillafullstrongData(scip, cands, candscores, ncands, npriocands, bestcand)
    ccall((:SCIPgetVanillafullstrongData, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{Cdouble}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, cands, candscores, ncands, npriocands, bestcand)
end

function SCIPincludeComprLargestrepr(scip)
    ccall((:SCIPincludeComprLargestrepr, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeComprWeakcompr(scip)
    ccall((:SCIPincludeComprWeakcompr, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeConshdlrAbspower(scip)
    ccall((:SCIPincludeConshdlrAbspower, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateConsAbspower(scip, cons, name, x, z, exponent, xoffset, zcoef, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsAbspower, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, x, z, exponent, xoffset, zcoef, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicAbspower(scip, cons, name, x, z, exponent, xoffset, zcoef, lhs, rhs)
    ccall((:SCIPcreateConsBasicAbspower, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), scip, cons, name, x, z, exponent, xoffset, zcoef, lhs, rhs)
end

function SCIPgetNlRowAbspower(scip, cons, nlrow)
    ccall((:SCIPgetNlRowAbspower, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_NLROW}}), scip, cons, nlrow)
end

function SCIPgetNonlinearVarAbspower(scip, cons)
    ccall((:SCIPgetNonlinearVarAbspower, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinearVarAbspower(scip, cons)
    ccall((:SCIPgetLinearVarAbspower, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetExponentAbspower(scip, cons)
    ccall((:SCIPgetExponentAbspower, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetOffsetAbspower(scip, cons)
    ccall((:SCIPgetOffsetAbspower, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetCoefLinearAbspower(scip, cons)
    ccall((:SCIPgetCoefLinearAbspower, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLhsAbspower(scip, cons)
    ccall((:SCIPgetLhsAbspower, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsAbspower(scip, cons)
    ccall((:SCIPgetRhsAbspower, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetViolationAbspower(scip, cons, sol)
    ccall((:SCIPgetViolationAbspower, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}), scip, cons, sol)
end

function SCIPisConvexAbspower(scip, cons)
    ccall((:SCIPisConvexAbspower, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPincludeConshdlrAnd(scip)
    ccall((:SCIPincludeConshdlrAnd, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateConsAnd(scip, cons, name, resvar, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsAnd, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_VAR}, Cint, Ptr{Ptr{SCIP_VAR}}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, resvar, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicAnd(scip, cons, name, resvar, nvars, vars)
    ccall((:SCIPcreateConsBasicAnd, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_VAR}, Cint, Ptr{Ptr{SCIP_VAR}}), scip, cons, name, resvar, nvars, vars)
end

function SCIPgetNVarsAnd(scip, cons)
    ccall((:SCIPgetNVarsAnd, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsAnd(scip, cons)
    ccall((:SCIPgetVarsAnd, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetResultantAnd(scip, cons)
    ccall((:SCIPgetResultantAnd, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPisAndConsSorted(scip, cons)
    ccall((:SCIPisAndConsSorted, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPsortAndCons(scip, cons)
    ccall((:SCIPsortAndCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPchgAndConsCheckFlagWhenUpgr(scip, cons, flag)
    ccall((:SCIPchgAndConsCheckFlagWhenUpgr, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cuint), scip, cons, flag)
end

function SCIPchgAndConsRemovableFlagWhenUpgr(scip, cons, flag)
    ccall((:SCIPchgAndConsRemovableFlagWhenUpgr, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cuint), scip, cons, flag)
end

function SCIPincludeConshdlrBenders(scip)
    ccall((:SCIPincludeConshdlrBenders, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPconsBendersEnforceSolution(scip, sol, conshdlr, result, type, checkint)
    ccall((:SCIPconsBendersEnforceSolution, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_RESULT}, SCIP_BENDERSENFOTYPE, Cuint), scip, sol, conshdlr, result, type, checkint)
end

function SCIPincludeConshdlrBenderslp(scip)
    ccall((:SCIPincludeConshdlrBenderslp, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeConshdlrBivariate(scip)
    ccall((:SCIPincludeConshdlrBivariate, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

@enum SCIP_BIVAR_CONVEXITY::UInt32 begin
    SCIP_BIVAR_ALLCONVEX = 0
    SCIP_BIVAR_1CONVEX_INDEFINITE = 1
    SCIP_BIVAR_CONVEX_CONCAVE = 2
    SCIP_BIVAR_UNKNOWN = 3
end

function SCIPcreateConsBivariate(scip, cons, name, f, convextype, z, zcoef, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsBivariate, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_EXPRTREE}, SCIP_BIVAR_CONVEXITY, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, f, convextype, z, zcoef, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicBivariate(scip, cons, name, f, convextype, z, zcoef, lhs, rhs)
    ccall((:SCIPcreateConsBasicBivariate, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_EXPRTREE}, SCIP_BIVAR_CONVEXITY, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble), scip, cons, name, f, convextype, z, zcoef, lhs, rhs)
end

function SCIPgetLinearVarBivariate(scip, cons)
    ccall((:SCIPgetLinearVarBivariate, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinearCoefBivariate(scip, cons)
    ccall((:SCIPgetLinearCoefBivariate, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetExprtreeBivariate(scip, cons)
    ccall((:SCIPgetExprtreeBivariate, libscip), Ptr{SCIP_EXPRTREE}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLhsBivariate(scip, cons)
    ccall((:SCIPgetLhsBivariate, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsBivariate(scip, cons)
    ccall((:SCIPgetRhsBivariate, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPincludeConshdlrBounddisjunction(scip)
    ccall((:SCIPincludeConshdlrBounddisjunction, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateConsBounddisjunction(scip, cons, name, nvars, vars, boundtypes, bounds, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsBounddisjunction, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{SCIP_BOUNDTYPE}, Ptr{Cdouble}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, nvars, vars, boundtypes, bounds, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicBounddisjunction(scip, cons, name, nvars, vars, boundtypes, bounds)
    ccall((:SCIPcreateConsBasicBounddisjunction, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{SCIP_BOUNDTYPE}, Ptr{Cdouble}), scip, cons, name, nvars, vars, boundtypes, bounds)
end

function SCIPgetNVarsBounddisjunction(scip, cons)
    ccall((:SCIPgetNVarsBounddisjunction, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsBounddisjunction(scip, cons)
    ccall((:SCIPgetVarsBounddisjunction, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetBoundtypesBounddisjunction(scip, cons)
    ccall((:SCIPgetBoundtypesBounddisjunction, libscip), Ptr{SCIP_BOUNDTYPE}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetBoundsBounddisjunction(scip, cons)
    ccall((:SCIPgetBoundsBounddisjunction, libscip), Ptr{Cdouble}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPincludeConshdlrCardinality(scip)
    ccall((:SCIPincludeConshdlrCardinality, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateConsCardinality(scip, cons, name, nvars, vars, cardval, indvars, weights, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsCardinality, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, nvars, vars, cardval, indvars, weights, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicCardinality(scip, cons, name, nvars, vars, cardval, indvars, weights)
    ccall((:SCIPcreateConsBasicCardinality, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}), scip, cons, name, nvars, vars, cardval, indvars, weights)
end

function SCIPchgCardvalCardinality(scip, cons, cardval)
    ccall((:SCIPchgCardvalCardinality, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cint), scip, cons, cardval)
end

function SCIPaddVarCardinality(scip, cons, var, indvar, weight)
    ccall((:SCIPaddVarCardinality, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, indvar, weight)
end

function SCIPappendVarCardinality(scip, cons, var, indvar)
    ccall((:SCIPappendVarCardinality, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}), scip, cons, var, indvar)
end

function SCIPgetNVarsCardinality(scip, cons)
    ccall((:SCIPgetNVarsCardinality, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsCardinality(scip, cons)
    ccall((:SCIPgetVarsCardinality, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetCardvalCardinality(scip, cons)
    ccall((:SCIPgetCardvalCardinality, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetWeightsCardinality(scip, cons)
    ccall((:SCIPgetWeightsCardinality, libscip), Ptr{Cdouble}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPincludeConshdlrConjunction(scip)
    ccall((:SCIPincludeConshdlrConjunction, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateConsConjunction(scip, cons, name, nconss, conss, enforce, check, _local, modifiable, dynamic)
    ccall((:SCIPcreateConsConjunction, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_CONS}}, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, nconss, conss, enforce, check, _local, modifiable, dynamic)
end

function SCIPcreateConsBasicConjunction(scip, cons, name, nconss, conss)
    ccall((:SCIPcreateConsBasicConjunction, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_CONS}}), scip, cons, name, nconss, conss)
end

function SCIPaddConsElemConjunction(scip, cons, addcons)
    ccall((:SCIPaddConsElemConjunction, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_CONS}), scip, cons, addcons)
end

function SCIPincludeConshdlrCountsols(scip)
    ccall((:SCIPincludeConshdlrCountsols, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPdialogExecCountPresolve(scip, dialog, dialoghdlr, nextdialog)
    ccall((:SCIPdialogExecCountPresolve, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DIALOG}, Ptr{SCIP_DIALOGHDLR}, Ptr{Ptr{SCIP_DIALOG}}), scip, dialog, dialoghdlr, nextdialog)
end

function SCIPdialogExecCount(scip, dialog, dialoghdlr, nextdialog)
    ccall((:SCIPdialogExecCount, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DIALOG}, Ptr{SCIP_DIALOGHDLR}, Ptr{Ptr{SCIP_DIALOG}}), scip, dialog, dialoghdlr, nextdialog)
end

function SCIPdialogExecWriteAllsolutions(scip, dialog, dialoghdlr, nextdialog)
    ccall((:SCIPdialogExecWriteAllsolutions, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DIALOG}, Ptr{SCIP_DIALOGHDLR}, Ptr{Ptr{SCIP_DIALOG}}), scip, dialog, dialoghdlr, nextdialog)
end

function SCIPcount(scip)
    ccall((:SCIPcount, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPgetNCountedSols(scip, valid)
    ccall((:SCIPgetNCountedSols, libscip), Clonglong, (Ptr{SCIP}, Ptr{Cuint}), scip, valid)
end

function SCIPgetNCountedSolsstr(scip, buffer, buffersize, requiredsize)
    ccall((:SCIPgetNCountedSolsstr, libscip), Cvoid, (Ptr{SCIP}, Ptr{Ptr{Cchar}}, Cint, Ptr{Cint}), scip, buffer, buffersize, requiredsize)
end

function SCIPgetNCountedFeasSubtrees(scip)
    ccall((:SCIPgetNCountedFeasSubtrees, libscip), Clonglong, (Ptr{SCIP},), scip)
end

function SCIPgetCountedSparseSols(scip, vars, nvars, sols, nsols)
    ccall((:SCIPgetCountedSparseSols, libscip), Cvoid, (Ptr{SCIP}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Cint}, Ptr{Ptr{Ptr{SCIP_SPARSESOL}}}, Ptr{Cint}), scip, vars, nvars, sols, nsols)
end

function SCIPsetParamsCountsols(scip)
    ccall((:SCIPsetParamsCountsols, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeConshdlrCumulative(scip)
    ccall((:SCIPincludeConshdlrCumulative, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateConsCumulative(scip, cons, name, nvars, vars, durations, demands, capacity, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsCumulative, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Ptr{Cint}, Cint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, nvars, vars, durations, demands, capacity, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicCumulative(scip, cons, name, nvars, vars, durations, demands, capacity)
    ccall((:SCIPcreateConsBasicCumulative, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Ptr{Cint}, Cint), scip, cons, name, nvars, vars, durations, demands, capacity)
end

function SCIPsetHminCumulative(scip, cons, hmin)
    ccall((:SCIPsetHminCumulative, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cint), scip, cons, hmin)
end

function SCIPgetHminCumulative(scip, cons)
    ccall((:SCIPgetHminCumulative, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPsetHmaxCumulative(scip, cons, hmax)
    ccall((:SCIPsetHmaxCumulative, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cint), scip, cons, hmax)
end

function SCIPgetHmaxCumulative(scip, cons)
    ccall((:SCIPgetHmaxCumulative, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsCumulative(scip, cons)
    ccall((:SCIPgetVarsCumulative, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetNVarsCumulative(scip, cons)
    ccall((:SCIPgetNVarsCumulative, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetCapacityCumulative(scip, cons)
    ccall((:SCIPgetCapacityCumulative, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDurationsCumulative(scip, cons)
    ccall((:SCIPgetDurationsCumulative, libscip), Ptr{Cint}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDemandsCumulative(scip, cons)
    ccall((:SCIPgetDemandsCumulative, libscip), Ptr{Cint}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPcheckCumulativeCondition(scip, sol, nvars, vars, durations, demands, capacity, hmin, hmax, violated, cons, printreason)
    ccall((:SCIPcheckCumulativeCondition, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint, Ptr{Cuint}, Ptr{SCIP_CONS}, Cuint), scip, sol, nvars, vars, durations, demands, capacity, hmin, hmax, violated, cons, printreason)
end

function SCIPnormalizeCumulativeCondition(scip, nvars, vars, durations, demands, capacity, nchgcoefs, nchgsides)
    ccall((:SCIPnormalizeCumulativeCondition, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, nvars, vars, durations, demands, capacity, nchgcoefs, nchgsides)
end

function SCIPsplitCumulativeCondition(scip, nvars, vars, durations, demands, capacity, hmin, hmax, split)
    ccall((:SCIPsplitCumulativeCondition, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, nvars, vars, durations, demands, capacity, hmin, hmax, split)
end

function SCIPpresolveCumulativeCondition(scip, nvars, vars, durations, hmin, hmax, downlocks, uplocks, cons, delvars, nfixedvars, nchgsides, cutoff)
    ccall((:SCIPpresolveCumulativeCondition, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Cint, Cint, Ptr{Cuint}, Ptr{Cuint}, Ptr{SCIP_CONS}, Ptr{Cuint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}), scip, nvars, vars, durations, hmin, hmax, downlocks, uplocks, cons, delvars, nfixedvars, nchgsides, cutoff)
end

function SCIPpropCumulativeCondition(scip, presoltiming, nvars, vars, durations, demands, capacity, hmin, hmax, cons, nchgbds, initialized, explanation, cutoff)
    ccall((:SCIPpropCumulativeCondition, libscip), SCIP_RETCODE, (Ptr{SCIP}, SCIP_PRESOLTIMING, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint, Ptr{SCIP_CONS}, Ptr{Cint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), scip, presoltiming, nvars, vars, durations, demands, capacity, hmin, hmax, cons, nchgbds, initialized, explanation, cutoff)
end

function SCIPrespropCumulativeCondition(scip, nvars, vars, durations, demands, capacity, hmin, hmax, infervar, inferinfo, boundtype, bdchgidx, relaxedbd, explanation, result)
    ccall((:SCIPrespropCumulativeCondition, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint, Ptr{SCIP_VAR}, Cint, SCIP_BOUNDTYPE, Ptr{SCIP_BDCHGIDX}, Cdouble, Ptr{Cuint}, Ptr{SCIP_RESULT}), scip, nvars, vars, durations, demands, capacity, hmin, hmax, infervar, inferinfo, boundtype, bdchgidx, relaxedbd, explanation, result)
end

function SCIPvisualizeConsCumulative(scip, cons)
    ccall((:SCIPvisualizeConsCumulative, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPsetSolveCumulative(scip, solveCumulative)
    ccall((:SCIPsetSolveCumulative, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cvoid}), scip, solveCumulative)
end

function SCIPsolveCumulative(scip, njobs, ests, lsts, objvals, durations, demands, capacity, hmin, hmax, timelimit, memorylimit, maxnodes, solved, infeasible, unbounded, error)
    ccall((:SCIPsolveCumulative, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint, Cdouble, Cdouble, Clonglong, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), scip, njobs, ests, lsts, objvals, durations, demands, capacity, hmin, hmax, timelimit, memorylimit, maxnodes, solved, infeasible, unbounded, error)
end

function SCIPcreateWorstCaseProfile(scip, profile, nvars, vars, durations, demands)
    ccall((:SCIPcreateWorstCaseProfile, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROFILE}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Ptr{Cint}), scip, profile, nvars, vars, durations, demands)
end

function SCIPcomputeHmin(scip, profile, capacity)
    ccall((:SCIPcomputeHmin, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_PROFILE}, Cint), scip, profile, capacity)
end

function SCIPcomputeHmax(scip, profile, capacity)
    ccall((:SCIPcomputeHmax, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_PROFILE}, Cint), scip, profile, capacity)
end

function SCIPincludeConshdlrDisjunction(scip)
    ccall((:SCIPincludeConshdlrDisjunction, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateConsDisjunction(scip, cons, name, nconss, conss, relaxcons, initial, enforce, check, _local, modifiable, dynamic)
    ccall((:SCIPcreateConsDisjunction, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_CONS}}, Ptr{SCIP_CONS}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, nconss, conss, relaxcons, initial, enforce, check, _local, modifiable, dynamic)
end

function SCIPcreateConsBasicDisjunction(scip, cons, name, nconss, conss, relaxcons)
    ccall((:SCIPcreateConsBasicDisjunction, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_CONS}}, Ptr{SCIP_CONS}), scip, cons, name, nconss, conss, relaxcons)
end

function SCIPaddConsElemDisjunction(scip, cons, addcons)
    ccall((:SCIPaddConsElemDisjunction, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_CONS}), scip, cons, addcons)
end

function SCIPincludeConshdlrIndicator(scip)
    ccall((:SCIPincludeConshdlrIndicator, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateConsIndicator(scip, cons, name, binvar, nvars, vars, vals, rhs, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsIndicator, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_VAR}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, binvar, nvars, vars, vals, rhs, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicIndicator(scip, cons, name, binvar, nvars, vars, vals, rhs)
    ccall((:SCIPcreateConsBasicIndicator, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_VAR}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble), scip, cons, name, binvar, nvars, vars, vals, rhs)
end

function SCIPcreateConsIndicatorLinCons(scip, cons, name, binvar, lincons, slackvar, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsIndicatorLinCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_VAR}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, binvar, lincons, slackvar, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicIndicatorLinCons(scip, cons, name, binvar, lincons, slackvar)
    ccall((:SCIPcreateConsBasicIndicatorLinCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_VAR}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}), scip, cons, name, binvar, lincons, slackvar)
end

function SCIPaddVarIndicator(scip, cons, var, val)
    ccall((:SCIPaddVarIndicator, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, val)
end

function SCIPgetLinearConsIndicator(cons)
    ccall((:SCIPgetLinearConsIndicator, libscip), Ptr{SCIP_CONS}, (Ptr{SCIP_CONS},), cons)
end

function SCIPsetLinearConsIndicator(scip, cons, lincons)
    ccall((:SCIPsetLinearConsIndicator, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_CONS}), scip, cons, lincons)
end

function SCIPsetBinaryVarIndicator(scip, cons, binvar)
    ccall((:SCIPsetBinaryVarIndicator, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}), scip, cons, binvar)
end

function SCIPgetBinaryVarIndicator(cons)
    ccall((:SCIPgetBinaryVarIndicator, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_CONS},), cons)
end

function SCIPgetSlackVarIndicator(cons)
    ccall((:SCIPgetSlackVarIndicator, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_CONS},), cons)
end

function SCIPsetSlackVarUb(scip, cons, ub)
    ccall((:SCIPsetSlackVarUb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cdouble), scip, cons, ub)
end

function SCIPisViolatedIndicator(scip, cons, sol)
    ccall((:SCIPisViolatedIndicator, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}), scip, cons, sol)
end

function SCIPmakeIndicatorFeasible(scip, cons, sol, changed)
    ccall((:SCIPmakeIndicatorFeasible, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}, Ptr{Cuint}), scip, cons, sol, changed)
end

function SCIPmakeIndicatorsFeasible(scip, conshdlr, sol, changed)
    ccall((:SCIPmakeIndicatorsFeasible, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_SOL}, Ptr{Cuint}), scip, conshdlr, sol, changed)
end

function SCIPaddLinearConsIndicator(scip, conshdlr, lincons)
    ccall((:SCIPaddLinearConsIndicator, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_CONS}), scip, conshdlr, lincons)
end

function SCIPaddRowIndicator(scip, conshdlr, row)
    ccall((:SCIPaddRowIndicator, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_ROW}), scip, conshdlr, row)
end

function SCIPincludeConshdlrIntegral(scip)
    ccall((:SCIPincludeConshdlrIntegral, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeConshdlrKnapsack(scip)
    ccall((:SCIPincludeConshdlrKnapsack, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateConsKnapsack(scip, cons, name, nvars, vars, weights, capacity, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsKnapsack, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Clonglong}, Clonglong, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, nvars, vars, weights, capacity, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicKnapsack(scip, cons, name, nvars, vars, weights, capacity)
    ccall((:SCIPcreateConsBasicKnapsack, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Clonglong}, Clonglong), scip, cons, name, nvars, vars, weights, capacity)
end

function SCIPaddCoefKnapsack(scip, cons, var, weight)
    ccall((:SCIPaddCoefKnapsack, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Clonglong), scip, cons, var, weight)
end

function SCIPgetCapacityKnapsack(scip, cons)
    ccall((:SCIPgetCapacityKnapsack, libscip), Clonglong, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPchgCapacityKnapsack(scip, cons, capacity)
    ccall((:SCIPchgCapacityKnapsack, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Clonglong), scip, cons, capacity)
end

function SCIPgetNVarsKnapsack(scip, cons)
    ccall((:SCIPgetNVarsKnapsack, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsKnapsack(scip, cons)
    ccall((:SCIPgetVarsKnapsack, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetWeightsKnapsack(scip, cons)
    ccall((:SCIPgetWeightsKnapsack, libscip), Ptr{Clonglong}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDualsolKnapsack(scip, cons)
    ccall((:SCIPgetDualsolKnapsack, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDualfarkasKnapsack(scip, cons)
    ccall((:SCIPgetDualfarkasKnapsack, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRowKnapsack(scip, cons)
    ccall((:SCIPgetRowKnapsack, libscip), Ptr{SCIP_ROW}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPsolveKnapsackExactly(scip, nitems, weights, profits, capacity, items, solitems, nonsolitems, nsolitems, nnonsolitems, solval, success)
    ccall((:SCIPsolveKnapsackExactly, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Clonglong}, Ptr{Cdouble}, Clonglong, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cuint}), scip, nitems, weights, profits, capacity, items, solitems, nonsolitems, nsolitems, nnonsolitems, solval, success)
end

function SCIPsolveKnapsackApproximately(scip, nitems, weights, profits, capacity, items, solitems, nonsolitems, nsolitems, nnonsolitems, solval)
    ccall((:SCIPsolveKnapsackApproximately, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Clonglong}, Ptr{Cdouble}, Clonglong, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}), scip, nitems, weights, profits, capacity, items, solitems, nonsolitems, nsolitems, nnonsolitems, solval)
end

function SCIPseparateKnapsackCuts(scip, cons, sepa, vars, nvars, weights, capacity, sol, usegubs, cutoff, ncuts)
    ccall((:SCIPseparateKnapsackCuts, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_SEPA}, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Clonglong}, Clonglong, Ptr{SCIP_SOL}, Cuint, Ptr{Cuint}, Ptr{Cint}), scip, cons, sepa, vars, nvars, weights, capacity, sol, usegubs, cutoff, ncuts)
end

function SCIPseparateRelaxedKnapsack(scip, cons, sepa, nknapvars, knapvars, knapvals, valscale, rhs, sol, cutoff, ncuts)
    ccall((:SCIPseparateRelaxedKnapsack, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_SEPA}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble, Cdouble, Ptr{SCIP_SOL}, Ptr{Cuint}, Ptr{Cint}), scip, cons, sepa, nknapvars, knapvars, knapvals, valscale, rhs, sol, cutoff, ncuts)
end

function SCIPcleanupConssKnapsack(scip, onlychecked, infeasible)
    ccall((:SCIPcleanupConssKnapsack, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cuint, Ptr{Cuint}), scip, onlychecked, infeasible)
end

function SCIPincludeConshdlrLinear(scip)
    ccall((:SCIPincludeConshdlrLinear, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

const SCIP_LinConsUpgrade = Cvoid

const SCIP_LINCONSUPGRADE = SCIP_LinConsUpgrade

function SCIPincludeLinconsUpgrade(scip, linconsupgd, priority, conshdlrname)
    ccall((:SCIPincludeLinconsUpgrade, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cvoid}, Cint, Ptr{Cchar}), scip, linconsupgd, priority, conshdlrname)
end

function SCIPcreateConsLinear(scip, cons, name, nvars, vars, vals, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsLinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble, Cdouble, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, nvars, vars, vals, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicLinear(scip, cons, name, nvars, vars, vals, lhs, rhs)
    ccall((:SCIPcreateConsBasicLinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble, Cdouble), scip, cons, name, nvars, vars, vals, lhs, rhs)
end

function SCIPcopyConsLinear(scip, cons, sourcescip, name, nvars, sourcevars, sourcecoefs, lhs, rhs, varmap, consmap, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode, _global, valid)
    ccall((:SCIPcopyConsLinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{SCIP}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble, Cdouble, Ptr{SCIP_HASHMAP}, Ptr{SCIP_HASHMAP}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Ptr{Cuint}), scip, cons, sourcescip, name, nvars, sourcevars, sourcecoefs, lhs, rhs, varmap, consmap, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode, _global, valid)
end

function SCIPaddCoefLinear(scip, cons, var, val)
    ccall((:SCIPaddCoefLinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, val)
end

function SCIPchgCoefLinear(scip, cons, var, val)
    ccall((:SCIPchgCoefLinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, val)
end

function SCIPdelCoefLinear(scip, cons, var)
    ccall((:SCIPdelCoefLinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}), scip, cons, var)
end

function SCIPgetLhsLinear(scip, cons)
    ccall((:SCIPgetLhsLinear, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsLinear(scip, cons)
    ccall((:SCIPgetRhsLinear, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPchgLhsLinear(scip, cons, lhs)
    ccall((:SCIPchgLhsLinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cdouble), scip, cons, lhs)
end

function SCIPchgRhsLinear(scip, cons, rhs)
    ccall((:SCIPchgRhsLinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cdouble), scip, cons, rhs)
end

function SCIPgetNVarsLinear(scip, cons)
    ccall((:SCIPgetNVarsLinear, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsLinear(scip, cons)
    ccall((:SCIPgetVarsLinear, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetValsLinear(scip, cons)
    ccall((:SCIPgetValsLinear, libscip), Ptr{Cdouble}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetActivityLinear(scip, cons, sol)
    ccall((:SCIPgetActivityLinear, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}), scip, cons, sol)
end

function SCIPgetFeasibilityLinear(scip, cons, sol)
    ccall((:SCIPgetFeasibilityLinear, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}), scip, cons, sol)
end

function SCIPgetDualsolLinear(scip, cons)
    ccall((:SCIPgetDualsolLinear, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDualfarkasLinear(scip, cons)
    ccall((:SCIPgetDualfarkasLinear, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRowLinear(scip, cons)
    ccall((:SCIPgetRowLinear, libscip), Ptr{SCIP_ROW}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPupgradeConsLinear(scip, cons, upgdcons)
    ccall((:SCIPupgradeConsLinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_CONS}}), scip, cons, upgdcons)
end

function SCIPclassifyConstraintTypesLinear(scip, linconsstats)
    ccall((:SCIPclassifyConstraintTypesLinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_LINCONSSTATS}), scip, linconsstats)
end

function SCIPcleanupConssLinear(scip, onlychecked, infeasible)
    ccall((:SCIPcleanupConssLinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cuint, Ptr{Cuint}), scip, onlychecked, infeasible)
end

function SCIPincludeConshdlrLinking(scip)
    ccall((:SCIPincludeConshdlrLinking, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateConsLinking(scip, cons, name, linkvar, binvars, vals, nbinvars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsLinking, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, linkvar, binvars, vals, nbinvars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicLinking(scip, cons, name, linkvar, binvars, vals, nbinvars)
    ccall((:SCIPcreateConsBasicLinking, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_VAR}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint), scip, cons, name, linkvar, binvars, vals, nbinvars)
end

function SCIPexistsConsLinking(scip, linkvar)
    ccall((:SCIPexistsConsLinking, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, linkvar)
end

function SCIPgetConsLinking(scip, linkvar)
    ccall((:SCIPgetConsLinking, libscip), Ptr{SCIP_CONS}, (Ptr{SCIP}, Ptr{SCIP_VAR}), scip, linkvar)
end

function SCIPgetLinkvarLinking(scip, cons)
    ccall((:SCIPgetLinkvarLinking, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetBinvarsLinking(scip, cons, binvars, nbinvars)
    ccall((:SCIPgetBinvarsLinking, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Cint}), scip, cons, binvars, nbinvars)
end

function SCIPgetNBinvarsLinking(scip, cons)
    ccall((:SCIPgetNBinvarsLinking, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetValsLinking(scip, cons)
    ccall((:SCIPgetValsLinking, libscip), Ptr{Cdouble}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetBinvarsDataLinking(cons, binvars, vals, nbinvars)
    ccall((:SCIPgetBinvarsDataLinking, libscip), SCIP_RETCODE, (Ptr{SCIP_CONS}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{Cdouble}}, Ptr{Cint}), cons, binvars, vals, nbinvars)
end

function SCIPincludeConshdlrLogicor(scip)
    ccall((:SCIPincludeConshdlrLogicor, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateConsLogicor(scip, cons, name, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsLogicor, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicLogicor(scip, cons, name, nvars, vars)
    ccall((:SCIPcreateConsBasicLogicor, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}), scip, cons, name, nvars, vars)
end

function SCIPaddCoefLogicor(scip, cons, var)
    ccall((:SCIPaddCoefLogicor, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}), scip, cons, var)
end

function SCIPgetNVarsLogicor(scip, cons)
    ccall((:SCIPgetNVarsLogicor, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsLogicor(scip, cons)
    ccall((:SCIPgetVarsLogicor, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDualsolLogicor(scip, cons)
    ccall((:SCIPgetDualsolLogicor, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDualfarkasLogicor(scip, cons)
    ccall((:SCIPgetDualfarkasLogicor, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRowLogicor(scip, cons)
    ccall((:SCIPgetRowLogicor, libscip), Ptr{SCIP_ROW}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPcleanupConssLogicor(scip, onlychecked, naddconss, ndelconss, nchgcoefs)
    ccall((:SCIPcleanupConssLogicor, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cuint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, onlychecked, naddconss, ndelconss, nchgcoefs)
end

function SCIPincludeConshdlrNonlinear(scip)
    ccall((:SCIPincludeConshdlrNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeNonlinconsUpgrade(scip, nonlinconsupgd, nodereform, priority, active, conshdlrname)
    ccall((:SCIPincludeNonlinconsUpgrade, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cuint, Ptr{Cchar}), scip, nonlinconsupgd, nodereform, priority, active, conshdlrname)
end

function SCIPcreateConsNonlinear(scip, cons, name, nlinvars, linvars, lincoefs, nexprtrees, exprtrees, nonlincoefs, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Ptr{Ptr{SCIP_EXPRTREE}}, Ptr{Cdouble}, Cdouble, Cdouble, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, nlinvars, linvars, lincoefs, nexprtrees, exprtrees, nonlincoefs, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicNonlinear(scip, cons, name, nlinvars, linvars, lincoefs, nexprtrees, exprtrees, nonlincoefs, lhs, rhs)
    ccall((:SCIPcreateConsBasicNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Ptr{Ptr{SCIP_EXPRTREE}}, Ptr{Cdouble}, Cdouble, Cdouble), scip, cons, name, nlinvars, linvars, lincoefs, nexprtrees, exprtrees, nonlincoefs, lhs, rhs)
end

const SCIP_ExprGraphNode = Cvoid

const SCIP_EXPRGRAPHNODE = SCIP_ExprGraphNode

function SCIPcreateConsNonlinear2(scip, cons, name, nlinvars, linvars, lincoefs, exprgraphnode, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsNonlinear2, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{SCIP_EXPRGRAPHNODE}, Cdouble, Cdouble, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, nlinvars, linvars, lincoefs, exprgraphnode, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicNonlinear2(scip, cons, name, nlinvars, linvars, lincoefs, exprgraphnode, lhs, rhs)
    ccall((:SCIPcreateConsBasicNonlinear2, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{SCIP_EXPRGRAPHNODE}, Cdouble, Cdouble), scip, cons, name, nlinvars, linvars, lincoefs, exprgraphnode, lhs, rhs)
end

function SCIPaddLinearVarNonlinear(scip, cons, var, coef)
    ccall((:SCIPaddLinearVarNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, coef)
end

function SCIPsetExprtreesNonlinear(scip, cons, nexprtrees, exprtrees, coefs)
    ccall((:SCIPsetExprtreesNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cint, Ptr{Ptr{SCIP_EXPRTREE}}, Ptr{Cdouble}), scip, cons, nexprtrees, exprtrees, coefs)
end

function SCIPaddExprtreesNonlinear(scip, cons, nexprtrees, exprtrees, coefs)
    ccall((:SCIPaddExprtreesNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cint, Ptr{Ptr{SCIP_EXPRTREE}}, Ptr{Cdouble}), scip, cons, nexprtrees, exprtrees, coefs)
end

function SCIPgetNlRowNonlinear(scip, cons, nlrow)
    ccall((:SCIPgetNlRowNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_NLROW}}), scip, cons, nlrow)
end

function SCIPgetNLinearVarsNonlinear(scip, cons)
    ccall((:SCIPgetNLinearVarsNonlinear, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinearVarsNonlinear(scip, cons)
    ccall((:SCIPgetLinearVarsNonlinear, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinearCoefsNonlinear(scip, cons)
    ccall((:SCIPgetLinearCoefsNonlinear, libscip), Ptr{Cdouble}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetNExprtreesNonlinear(scip, cons)
    ccall((:SCIPgetNExprtreesNonlinear, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetExprtreesNonlinear(scip, cons)
    ccall((:SCIPgetExprtreesNonlinear, libscip), Ptr{Ptr{SCIP_EXPRTREE}}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetExprtreeCoefsNonlinear(scip, cons)
    ccall((:SCIPgetExprtreeCoefsNonlinear, libscip), Ptr{Cdouble}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetExprgraphNodeNonlinear(scip, cons)
    ccall((:SCIPgetExprgraphNodeNonlinear, libscip), Ptr{SCIP_EXPRGRAPHNODE}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLhsNonlinear(scip, cons)
    ccall((:SCIPgetLhsNonlinear, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsNonlinear(scip, cons)
    ccall((:SCIPgetRhsNonlinear, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPcheckCurvatureNonlinear(scip, cons)
    ccall((:SCIPcheckCurvatureNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetCurvatureNonlinear(scip, cons, checkcurv, curvature)
    ccall((:SCIPgetCurvatureNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cuint, Ptr{SCIP_EXPRCURV}), scip, cons, checkcurv, curvature)
end

function SCIPgetExprtreeCurvaturesNonlinear(scip, cons, checkcurv, curvatures)
    ccall((:SCIPgetExprtreeCurvaturesNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cuint, Ptr{Ptr{SCIP_EXPRCURV}}), scip, cons, checkcurv, curvatures)
end

function SCIPgetViolationNonlinear(scip, cons, sol, violation)
    ccall((:SCIPgetViolationNonlinear, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}, Ptr{Cdouble}), scip, cons, sol, violation)
end

function SCIPgetLinvarMayDecreaseNonlinear(scip, cons)
    ccall((:SCIPgetLinvarMayDecreaseNonlinear, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinvarMayIncreaseNonlinear(scip, cons)
    ccall((:SCIPgetLinvarMayIncreaseNonlinear, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

const SCIP_ExprGraph = Cvoid

const SCIP_EXPRGRAPH = SCIP_ExprGraph

function SCIPgetExprgraphNonlinear(scip, conshdlr)
    ccall((:SCIPgetExprgraphNonlinear, libscip), Ptr{SCIP_EXPRGRAPH}, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}), scip, conshdlr)
end

function SCIPcomputeHyperplaneThreePoints(scip, a1, a2, a3, b1, b2, b3, c1, c2, c3, alpha, beta, gamma_, delta)
    ccall((:SCIPcomputeHyperplaneThreePoints, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), scip, a1, a2, a3, b1, b2, b3, c1, c2, c3, alpha, beta, gamma_, delta)
end

function SCIPincludeConshdlrOr(scip)
    ccall((:SCIPincludeConshdlrOr, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateConsOr(scip, cons, name, resvar, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsOr, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_VAR}, Cint, Ptr{Ptr{SCIP_VAR}}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, resvar, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicOr(scip, cons, name, resvar, nvars, vars)
    ccall((:SCIPcreateConsBasicOr, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_VAR}, Cint, Ptr{Ptr{SCIP_VAR}}), scip, cons, name, resvar, nvars, vars)
end

function SCIPgetNVarsOr(scip, cons)
    ccall((:SCIPgetNVarsOr, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsOr(scip, cons)
    ccall((:SCIPgetVarsOr, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetResultantOr(scip, cons)
    ccall((:SCIPgetResultantOr, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPincludeConshdlrOrbisack(scip)
    ccall((:SCIPincludeConshdlrOrbisack, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcheckSolutionOrbisack(scip, sol, vars1, vars2, nrows, printreason, feasible)
    ccall((:SCIPcheckSolutionOrbisack, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}, Cint, Cuint, Ptr{Cuint}), scip, sol, vars1, vars2, nrows, printreason, feasible)
end

function SCIPcreateConsOrbisack(scip, cons, name, vars1, vars2, nrows, ispporbisack, isparttype, ismodelcons, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsOrbisack, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}, Cint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, vars1, vars2, nrows, ispporbisack, isparttype, ismodelcons, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicOrbisack(scip, cons, name, vars1, vars2, nrows, ispporbisack, isparttype, ismodelcons)
    ccall((:SCIPcreateConsBasicOrbisack, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}, Cint, Cuint, Cuint, Cuint), scip, cons, name, vars1, vars2, nrows, ispporbisack, isparttype, ismodelcons)
end

function SCIPincludeConshdlrOrbitope(scip)
    ccall((:SCIPincludeConshdlrOrbitope, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

@enum SCIP_OrbitopeType::UInt32 begin
    SCIP_ORBITOPETYPE_FULL = 0
    SCIP_ORBITOPETYPE_PARTITIONING = 1
    SCIP_ORBITOPETYPE_PACKING = 2
end

const SCIP_ORBITOPETYPE = SCIP_OrbitopeType

function SCIPcreateConsOrbitope(scip, cons, name, vars, orbitopetype, nspcons, nblocks, resolveprop, ismodelcons, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsOrbitope, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{Ptr{Ptr{SCIP_VAR}}}, SCIP_ORBITOPETYPE, Cint, Cint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, vars, orbitopetype, nspcons, nblocks, resolveprop, ismodelcons, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicOrbitope(scip, cons, name, vars, orbitopetype, nspcons, nblocks, resolveprop, ismodelcons)
    ccall((:SCIPcreateConsBasicOrbitope, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{Ptr{Ptr{SCIP_VAR}}}, SCIP_ORBITOPETYPE, Cint, Cint, Cuint, Cuint), scip, cons, name, vars, orbitopetype, nspcons, nblocks, resolveprop, ismodelcons)
end

function SCIPincludeConshdlrPseudoboolean(scip)
    ccall((:SCIPincludeConshdlrPseudoboolean, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

@enum SCIP_LinearConsType::Int32 begin
    SCIP_LINEARCONSTYPE_INVALIDCONS = -1
    SCIP_LINEARCONSTYPE_LINEAR = 0
    SCIP_LINEARCONSTYPE_LOGICOR = 1
    SCIP_LINEARCONSTYPE_KNAPSACK = 2
    SCIP_LINEARCONSTYPE_SETPPC = 3
end

const SCIP_LINEARCONSTYPE = SCIP_LinearConsType

function SCIPcreateConsPseudobooleanWithConss(scip, cons, name, lincons, linconstype, andconss, andcoefs, nandconss, indvar, weight, issoftcons, intvar, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsPseudobooleanWithConss, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_CONS}, SCIP_LINEARCONSTYPE, Ptr{Ptr{SCIP_CONS}}, Ptr{Cdouble}, Cint, Ptr{SCIP_VAR}, Cdouble, Cuint, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, lincons, linconstype, andconss, andcoefs, nandconss, indvar, weight, issoftcons, intvar, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsPseudoboolean(scip, cons, name, linvars, nlinvars, linvals, terms, nterms, ntermvars, termvals, indvar, weight, issoftcons, intvar, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsPseudoboolean, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Cdouble}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{SCIP_VAR}, Cdouble, Cuint, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, linvars, nlinvars, linvals, terms, nterms, ntermvars, termvals, indvar, weight, issoftcons, intvar, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicPseudoboolean(scip, cons, name, linvars, nlinvars, linvals, terms, nterms, ntermvars, termvals, indvar, weight, issoftcons, intvar, lhs, rhs)
    ccall((:SCIPcreateConsBasicPseudoboolean, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Cdouble}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{SCIP_VAR}, Cdouble, Cuint, Ptr{SCIP_VAR}, Cdouble, Cdouble), scip, cons, name, linvars, nlinvars, linvals, terms, nterms, ntermvars, termvals, indvar, weight, issoftcons, intvar, lhs, rhs)
end

function SCIPaddCoefPseudoboolean(scip, cons, var, val)
    ccall((:SCIPaddCoefPseudoboolean, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, val)
end

function SCIPaddTermPseudoboolean(scip, cons, vars, nvars, val)
    ccall((:SCIPaddTermPseudoboolean, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_VAR}}, Cint, Cdouble), scip, cons, vars, nvars, val)
end

function SCIPgetIndVarPseudoboolean(scip, cons)
    ccall((:SCIPgetIndVarPseudoboolean, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinearConsPseudoboolean(scip, cons)
    ccall((:SCIPgetLinearConsPseudoboolean, libscip), Ptr{SCIP_CONS}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinearConsTypePseudoboolean(scip, cons)
    ccall((:SCIPgetLinearConsTypePseudoboolean, libscip), SCIP_LINEARCONSTYPE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetNLinVarsWithoutAndPseudoboolean(scip, cons)
    ccall((:SCIPgetNLinVarsWithoutAndPseudoboolean, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinDatasWithoutAndPseudoboolean(scip, cons, linvars, lincoefs, nlinvars)
    ccall((:SCIPgetLinDatasWithoutAndPseudoboolean, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cint}), scip, cons, linvars, lincoefs, nlinvars)
end

function SCIPgetAndDatasPseudoboolean(scip, cons, andconss, andcoefs, nandconss)
    ccall((:SCIPgetAndDatasPseudoboolean, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cdouble}, Ptr{Cint}), scip, cons, andconss, andcoefs, nandconss)
end

function SCIPgetNAndsPseudoboolean(scip, cons)
    ccall((:SCIPgetNAndsPseudoboolean, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPchgLhsPseudoboolean(scip, cons, lhs)
    ccall((:SCIPchgLhsPseudoboolean, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cdouble), scip, cons, lhs)
end

function SCIPchgRhsPseudoboolean(scip, cons, rhs)
    ccall((:SCIPchgRhsPseudoboolean, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cdouble), scip, cons, rhs)
end

function SCIPgetLhsPseudoboolean(scip, cons)
    ccall((:SCIPgetLhsPseudoboolean, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsPseudoboolean(scip, cons)
    ccall((:SCIPgetRhsPseudoboolean, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPincludeConshdlrQuadratic(scip)
    ccall((:SCIPincludeConshdlrQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

const SCIP_QuadVarEventData = Cvoid

const SCIP_QUADVAREVENTDATA = SCIP_QuadVarEventData

struct SCIP_QuadVarTerm
    var::Ptr{SCIP_VAR}
    lincoef::Cdouble
    sqrcoef::Cdouble
    nadjbilin::Cint
    adjbilinsize::Cint
    adjbilin::Ptr{Cint}
    eventdata::Ptr{SCIP_QUADVAREVENTDATA}
end

const SCIP_QUADVARTERM = SCIP_QuadVarTerm

struct SCIP_BilinTerm
    var1::Ptr{SCIP_VAR}
    var2::Ptr{SCIP_VAR}
    coef::Cdouble
end

const SCIP_BILINTERM = SCIP_BilinTerm

struct SCIP_RowPrep
    vars::Ptr{Ptr{SCIP_VAR}}
    coefs::Ptr{Cdouble}
    nvars::Cint
    varssize::Cint
    side::Cdouble
    sidetype::SCIP_SIDETYPE
    _local::Cuint
    name::NTuple{1024, Cchar}
end

const SCIP_ROWPREP = SCIP_RowPrep

function SCIPincludeQuadconsUpgrade(scip, quadconsupgd, priority, active, conshdlrname)
    ccall((:SCIPincludeQuadconsUpgrade, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cvoid}, Cint, Cuint, Ptr{Cchar}), scip, quadconsupgd, priority, active, conshdlrname)
end

function SCIPcreateConsQuadratic(scip, cons, name, nlinvars, linvars, lincoefs, nquadterms, quadvars1, quadvars2, quadcoeffs, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable)
    ccall((:SCIPcreateConsQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble, Cdouble, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, nlinvars, linvars, lincoefs, nquadterms, quadvars1, quadvars2, quadcoeffs, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable)
end

function SCIPcreateConsBasicQuadratic(scip, cons, name, nlinvars, linvars, lincoefs, nquadterms, quadvars1, quadvars2, quadcoefs, lhs, rhs)
    ccall((:SCIPcreateConsBasicQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cdouble, Cdouble), scip, cons, name, nlinvars, linvars, lincoefs, nquadterms, quadvars1, quadvars2, quadcoefs, lhs, rhs)
end

function SCIPcreateConsQuadratic2(scip, cons, name, nlinvars, linvars, lincoefs, nquadvarterms, quadvarterms, nbilinterms, bilinterms, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable)
    ccall((:SCIPcreateConsQuadratic2, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Ptr{SCIP_QUADVARTERM}, Cint, Ptr{SCIP_BILINTERM}, Cdouble, Cdouble, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, nlinvars, linvars, lincoefs, nquadvarterms, quadvarterms, nbilinterms, bilinterms, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable)
end

function SCIPcreateConsBasicQuadratic2(scip, cons, name, nlinvars, linvars, lincoefs, nquadvarterms, quadvarterms, nbilinterms, bilinterms, lhs, rhs)
    ccall((:SCIPcreateConsBasicQuadratic2, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cint, Ptr{SCIP_QUADVARTERM}, Cint, Ptr{SCIP_BILINTERM}, Cdouble, Cdouble), scip, cons, name, nlinvars, linvars, lincoefs, nquadvarterms, quadvarterms, nbilinterms, bilinterms, lhs, rhs)
end

function SCIPaddConstantQuadratic(scip, cons, constant)
    ccall((:SCIPaddConstantQuadratic, libscip), Cvoid, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cdouble), scip, cons, constant)
end

function SCIPaddLinearVarQuadratic(scip, cons, var, coef)
    ccall((:SCIPaddLinearVarQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, coef)
end

function SCIPaddQuadVarQuadratic(scip, cons, var, lincoef, sqrcoef)
    ccall((:SCIPaddQuadVarQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble, Cdouble), scip, cons, var, lincoef, sqrcoef)
end

function SCIPaddQuadVarLinearCoefQuadratic(scip, cons, var, coef)
    ccall((:SCIPaddQuadVarLinearCoefQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, coef)
end

function SCIPaddSquareCoefQuadratic(scip, cons, var, coef)
    ccall((:SCIPaddSquareCoefQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, coef)
end

function SCIPaddBilinTermQuadratic(scip, cons, var1, var2, coef)
    ccall((:SCIPaddBilinTermQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var1, var2, coef)
end

function SCIPgetNlRowQuadratic(scip, cons, nlrow)
    ccall((:SCIPgetNlRowQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_NLROW}}), scip, cons, nlrow)
end

function SCIPgetNLinearVarsQuadratic(scip, cons)
    ccall((:SCIPgetNLinearVarsQuadratic, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinearVarsQuadratic(scip, cons)
    ccall((:SCIPgetLinearVarsQuadratic, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetCoefsLinearVarsQuadratic(scip, cons)
    ccall((:SCIPgetCoefsLinearVarsQuadratic, libscip), Ptr{Cdouble}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetNQuadVarTermsQuadratic(scip, cons)
    ccall((:SCIPgetNQuadVarTermsQuadratic, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetQuadVarTermsQuadratic(scip, cons)
    ccall((:SCIPgetQuadVarTermsQuadratic, libscip), Ptr{SCIP_QUADVARTERM}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPsortQuadVarTermsQuadratic(scip, cons)
    ccall((:SCIPsortQuadVarTermsQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPfindQuadVarTermQuadratic(scip, cons, var, pos)
    ccall((:SCIPfindQuadVarTermQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Ptr{Cint}), scip, cons, var, pos)
end

function SCIPgetNBilinTermsQuadratic(scip, cons)
    ccall((:SCIPgetNBilinTermsQuadratic, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetBilinTermsQuadratic(scip, cons)
    ccall((:SCIPgetBilinTermsQuadratic, libscip), Ptr{SCIP_BILINTERM}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLhsQuadratic(scip, cons)
    ccall((:SCIPgetLhsQuadratic, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsQuadratic(scip, cons)
    ccall((:SCIPgetRhsQuadratic, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinvarMayDecreaseQuadratic(scip, cons)
    ccall((:SCIPgetLinvarMayDecreaseQuadratic, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLinvarMayIncreaseQuadratic(scip, cons)
    ccall((:SCIPgetLinvarMayIncreaseQuadratic, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPcheckCurvatureQuadratic(scip, cons)
    ccall((:SCIPcheckCurvatureQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPisConvexQuadratic(scip, cons)
    ccall((:SCIPisConvexQuadratic, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPisConcaveQuadratic(scip, cons)
    ccall((:SCIPisConcaveQuadratic, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPisConvexConsQuadratic(scip, cons, assumevarfixed, result)
    ccall((:SCIPisConvexConsQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_HASHMAP}, Ptr{Cuint}), scip, cons, assumevarfixed, result)
end

function SCIPgetViolationQuadratic(scip, cons, sol, violation)
    ccall((:SCIPgetViolationQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}, Ptr{Cdouble}), scip, cons, sol, violation)
end

function SCIPisLinearLocalQuadratic(scip, cons)
    ccall((:SCIPisLinearLocalQuadratic, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPaddToNlpiProblemQuadratic(scip, cons, nlpi, nlpiprob, scipvar2nlpivar, names)
    ccall((:SCIPaddToNlpiProblemQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_NLPI}, Ptr{SCIP_NLPIPROBLEM}, Ptr{SCIP_HASHMAP}, Cuint), scip, cons, nlpi, nlpiprob, scipvar2nlpivar, names)
end

function SCIPchgLhsQuadratic(scip, cons, lhs)
    ccall((:SCIPchgLhsQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cdouble), scip, cons, lhs)
end

function SCIPchgRhsQuadratic(scip, cons, rhs)
    ccall((:SCIPchgRhsQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Cdouble), scip, cons, rhs)
end

function SCIPgetFeasibilityQuadratic(scip, cons, sol, feasibility)
    ccall((:SCIPgetFeasibilityQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}, Ptr{Cdouble}), scip, cons, sol, feasibility)
end

function SCIPgetActivityQuadratic(scip, cons, sol, activity)
    ccall((:SCIPgetActivityQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_SOL}, Ptr{Cdouble}), scip, cons, sol, activity)
end

function SCIPchgLinearCoefQuadratic(scip, cons, var, coef)
    ccall((:SCIPchgLinearCoefQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, coef)
end

function SCIPchgSquareCoefQuadratic(scip, cons, var, coef)
    ccall((:SCIPchgSquareCoefQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, coef)
end

function SCIPchgBilinCoefQuadratic(scip, cons, var1, var2, coef)
    ccall((:SCIPchgBilinCoefQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var1, var2, coef)
end

function SCIPgetNAllBilinearTermsQuadratic(scip)
    ccall((:SCIPgetNAllBilinearTermsQuadratic, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPgetAllBilinearTermsQuadratic(scip, x, y, nbilinterms, nunderests, noverests, maxnonconvexity)
    ccall((:SCIPgetAllBilinearTermsQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Ptr{Ptr{SCIP_VAR}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}), scip, x, y, nbilinterms, nunderests, noverests, maxnonconvexity)
end

function SCIPaddBilinearIneqQuadratic(scip, x, y, idx, xcoef, ycoef, constant, success)
    ccall((:SCIPaddBilinearIneqQuadratic, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cint, Cdouble, Cdouble, Cdouble, Ptr{Cuint}), scip, x, y, idx, xcoef, ycoef, constant, success)
end

function SCIPincludeConshdlrSetppc(scip)
    ccall((:SCIPincludeConshdlrSetppc, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

@enum SCIP_SetppcType::UInt32 begin
    SCIP_SETPPCTYPE_PARTITIONING = 0
    SCIP_SETPPCTYPE_PACKING = 1
    SCIP_SETPPCTYPE_COVERING = 2
end

const SCIP_SETPPCTYPE = SCIP_SetppcType

function SCIPcreateConsSetpart(scip, cons, name, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsSetpart, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicSetpart(scip, cons, name, nvars, vars)
    ccall((:SCIPcreateConsBasicSetpart, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}), scip, cons, name, nvars, vars)
end

function SCIPcreateConsSetpack(scip, cons, name, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsSetpack, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicSetpack(scip, cons, name, nvars, vars)
    ccall((:SCIPcreateConsBasicSetpack, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}), scip, cons, name, nvars, vars)
end

function SCIPcreateConsSetcover(scip, cons, name, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsSetcover, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicSetcover(scip, cons, name, nvars, vars)
    ccall((:SCIPcreateConsBasicSetcover, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}), scip, cons, name, nvars, vars)
end

function SCIPaddCoefSetppc(scip, cons, var)
    ccall((:SCIPaddCoefSetppc, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}), scip, cons, var)
end

function SCIPgetNVarsSetppc(scip, cons)
    ccall((:SCIPgetNVarsSetppc, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsSetppc(scip, cons)
    ccall((:SCIPgetVarsSetppc, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetTypeSetppc(scip, cons)
    ccall((:SCIPgetTypeSetppc, libscip), SCIP_SETPPCTYPE, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDualsolSetppc(scip, cons)
    ccall((:SCIPgetDualsolSetppc, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDualfarkasSetppc(scip, cons)
    ccall((:SCIPgetDualfarkasSetppc, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRowSetppc(scip, cons)
    ccall((:SCIPgetRowSetppc, libscip), Ptr{SCIP_ROW}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetNFixedonesSetppc(scip, cons)
    ccall((:SCIPgetNFixedonesSetppc, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetNFixedzerosSetppc(scip, cons)
    ccall((:SCIPgetNFixedzerosSetppc, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPcleanupConssSetppc(scip, onlychecked, infeasible, naddconss, ndelconss, nchgcoefs, nfixedvars)
    ccall((:SCIPcleanupConssSetppc, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cuint, Ptr{Cuint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, onlychecked, infeasible, naddconss, ndelconss, nchgcoefs, nfixedvars)
end

function SCIPincludeConshdlrSOC(scip)
    ccall((:SCIPincludeConshdlrSOC, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateConsSOC(scip, cons, name, nvars, vars, coefs, offsets, constant, rhsvar, rhscoeff, rhsoffset, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable)
    ccall((:SCIPcreateConsSOC, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, nvars, vars, coefs, offsets, constant, rhsvar, rhscoeff, rhsoffset, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable)
end

function SCIPcreateConsBasicSOC(scip, cons, name, nvars, vars, coefs, offsets, constant, rhsvar, rhscoeff, rhsoffset)
    ccall((:SCIPcreateConsBasicSOC, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Ptr{SCIP_VAR}, Cdouble, Cdouble), scip, cons, name, nvars, vars, coefs, offsets, constant, rhsvar, rhscoeff, rhsoffset)
end

function SCIPgetNlRowSOC(scip, cons, nlrow)
    ccall((:SCIPgetNlRowSOC, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{Ptr{SCIP_NLROW}}), scip, cons, nlrow)
end

function SCIPgetNLhsVarsSOC(scip, cons)
    ccall((:SCIPgetNLhsVarsSOC, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLhsVarsSOC(scip, cons)
    ccall((:SCIPgetLhsVarsSOC, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLhsCoefsSOC(scip, cons)
    ccall((:SCIPgetLhsCoefsSOC, libscip), Ptr{Cdouble}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLhsOffsetsSOC(scip, cons)
    ccall((:SCIPgetLhsOffsetsSOC, libscip), Ptr{Cdouble}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetLhsConstantSOC(scip, cons)
    ccall((:SCIPgetLhsConstantSOC, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsVarSOC(scip, cons)
    ccall((:SCIPgetRhsVarSOC, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsCoefSOC(scip, cons)
    ccall((:SCIPgetRhsCoefSOC, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsOffsetSOC(scip, cons)
    ccall((:SCIPgetRhsOffsetSOC, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPaddToNlpiProblemSOC(scip, cons, nlpi, nlpiprob, scipvar2nlpivar, names)
    ccall((:SCIPaddToNlpiProblemSOC, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_NLPI}, Ptr{SCIP_NLPIPROBLEM}, Ptr{SCIP_HASHMAP}, Cuint), scip, cons, nlpi, nlpiprob, scipvar2nlpivar, names)
end

function SCIPincludeConshdlrSOS1(scip)
    ccall((:SCIPincludeConshdlrSOS1, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateConsSOS1(scip, cons, name, nvars, vars, weights, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsSOS1, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, nvars, vars, weights, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicSOS1(scip, cons, name, nvars, vars, weights)
    ccall((:SCIPcreateConsBasicSOS1, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}), scip, cons, name, nvars, vars, weights)
end

function SCIPaddVarSOS1(scip, cons, var, weight)
    ccall((:SCIPaddVarSOS1, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, weight)
end

function SCIPappendVarSOS1(scip, cons, var)
    ccall((:SCIPappendVarSOS1, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}), scip, cons, var)
end

function SCIPgetNVarsSOS1(scip, cons)
    ccall((:SCIPgetNVarsSOS1, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsSOS1(scip, cons)
    ccall((:SCIPgetVarsSOS1, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetWeightsSOS1(scip, cons)
    ccall((:SCIPgetWeightsSOS1, libscip), Ptr{Cdouble}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetConflictgraphSOS1(conshdlr)
    ccall((:SCIPgetConflictgraphSOS1, libscip), Ptr{SCIP_DIGRAPH}, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPgetNSOS1Vars(conshdlr)
    ccall((:SCIPgetNSOS1Vars, libscip), Cint, (Ptr{SCIP_CONSHDLR},), conshdlr)
end

function SCIPvarIsSOS1(conshdlr, var)
    ccall((:SCIPvarIsSOS1, libscip), Cuint, (Ptr{SCIP_CONSHDLR}, Ptr{SCIP_VAR}), conshdlr, var)
end

function SCIPvarGetNodeSOS1(conshdlr, var)
    ccall((:SCIPvarGetNodeSOS1, libscip), Cint, (Ptr{SCIP_CONSHDLR}, Ptr{SCIP_VAR}), conshdlr, var)
end

function SCIPnodeGetVarSOS1(conflictgraph, node)
    ccall((:SCIPnodeGetVarSOS1, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_DIGRAPH}, Cint), conflictgraph, node)
end

function SCIPmakeSOS1sFeasible(scip, conshdlr, sol, changed, success)
    ccall((:SCIPmakeSOS1sFeasible, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONSHDLR}, Ptr{SCIP_SOL}, Ptr{Cuint}, Ptr{Cuint}), scip, conshdlr, sol, changed, success)
end

function SCIPincludeConshdlrSOS2(scip)
    ccall((:SCIPincludeConshdlrSOS2, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateConsSOS2(scip, cons, name, nvars, vars, weights, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsSOS2, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, nvars, vars, weights, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicSOS2(scip, cons, name, nvars, vars, weights)
    ccall((:SCIPcreateConsBasicSOS2, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}), scip, cons, name, nvars, vars, weights)
end

function SCIPaddVarSOS2(scip, cons, var, weight)
    ccall((:SCIPaddVarSOS2, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}, Cdouble), scip, cons, var, weight)
end

function SCIPappendVarSOS2(scip, cons, var)
    ccall((:SCIPappendVarSOS2, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_CONS}, Ptr{SCIP_VAR}), scip, cons, var)
end

function SCIPgetNVarsSOS2(scip, cons)
    ccall((:SCIPgetNVarsSOS2, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsSOS2(scip, cons)
    ccall((:SCIPgetVarsSOS2, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetWeightsSOS2(scip, cons)
    ccall((:SCIPgetWeightsSOS2, libscip), Ptr{Cdouble}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPincludeConshdlrSuperindicator(scip)
    ccall((:SCIPincludeConshdlrSuperindicator, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateConsSuperindicator(scip, cons, name, binvar, slackcons, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsSuperindicator, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_VAR}, Ptr{SCIP_CONS}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, binvar, slackcons, initial, separate, enforce, check, propagate, _local, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicSuperindicator(scip, cons, name, binvar, slackcons)
    ccall((:SCIPcreateConsBasicSuperindicator, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_VAR}, Ptr{SCIP_CONS}), scip, cons, name, binvar, slackcons)
end

function SCIPgetBinaryVarSuperindicator(cons)
    ccall((:SCIPgetBinaryVarSuperindicator, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP_CONS},), cons)
end

function SCIPgetSlackConsSuperindicator(cons)
    ccall((:SCIPgetSlackConsSuperindicator, libscip), Ptr{SCIP_CONS}, (Ptr{SCIP_CONS},), cons)
end

function SCIPtransformMinUC(scip, success)
    ccall((:SCIPtransformMinUC, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cuint}), scip, success)
end

function SCIPdialogExecChangeMinUC(scip, dialog, dialoghdlr, nextdialog)
    ccall((:SCIPdialogExecChangeMinUC, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_DIALOG}, Ptr{SCIP_DIALOGHDLR}, Ptr{Ptr{SCIP_DIALOG}}), scip, dialog, dialoghdlr, nextdialog)
end

function SCIPincludeConshdlrSymresack(scip)
    ccall((:SCIPincludeConshdlrSymresack, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateSymbreakCons(scip, cons, name, perm, vars, nvars, ismodelcons, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateSymbreakCons, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{Cint}, Ptr{Ptr{SCIP_VAR}}, Cint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, perm, vars, nvars, ismodelcons, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsSymresack(scip, cons, name, perm, vars, nvars, ismodelcons, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsSymresack, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{Cint}, Ptr{Ptr{SCIP_VAR}}, Cint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, perm, vars, nvars, ismodelcons, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicSymresack(scip, cons, name, perm, vars, nvars, ismodelcons)
    ccall((:SCIPcreateConsBasicSymresack, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{Cint}, Ptr{Ptr{SCIP_VAR}}, Cint, Cuint), scip, cons, name, perm, vars, nvars, ismodelcons)
end

function SCIPincludeConshdlrVarbound(scip)
    ccall((:SCIPincludeConshdlrVarbound, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateConsVarbound(scip, cons, name, var, vbdvar, vbdcoef, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsVarbound, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, var, vbdvar, vbdcoef, lhs, rhs, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicVarbound(scip, cons, name, var, vbdvar, vbdcoef, lhs, rhs)
    ccall((:SCIPcreateConsBasicVarbound, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Ptr{SCIP_VAR}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cdouble), scip, cons, name, var, vbdvar, vbdcoef, lhs, rhs)
end

function SCIPgetLhsVarbound(scip, cons)
    ccall((:SCIPgetLhsVarbound, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsVarbound(scip, cons)
    ccall((:SCIPgetRhsVarbound, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarVarbound(scip, cons)
    ccall((:SCIPgetVarVarbound, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVbdvarVarbound(scip, cons)
    ccall((:SCIPgetVbdvarVarbound, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVbdcoefVarbound(scip, cons)
    ccall((:SCIPgetVbdcoefVarbound, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDualsolVarbound(scip, cons)
    ccall((:SCIPgetDualsolVarbound, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetDualfarkasVarbound(scip, cons)
    ccall((:SCIPgetDualfarkasVarbound, libscip), Cdouble, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRowVarbound(scip, cons)
    ccall((:SCIPgetRowVarbound, libscip), Ptr{SCIP_ROW}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPcleanupConssVarbound(scip, onlychecked, infeasible, naddconss, ndelconss, nchgbds)
    ccall((:SCIPcleanupConssVarbound, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cuint, Ptr{Cuint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, onlychecked, infeasible, naddconss, ndelconss, nchgbds)
end

function SCIPincludeConshdlrXor(scip)
    ccall((:SCIPincludeConshdlrXor, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateConsXor(scip, cons, name, rhs, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
    ccall((:SCIPcreateConsXor, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cuint, Cint, Ptr{Ptr{SCIP_VAR}}, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint, Cuint), scip, cons, name, rhs, nvars, vars, initial, separate, enforce, check, propagate, _local, modifiable, dynamic, removable, stickingatnode)
end

function SCIPcreateConsBasicXor(scip, cons, name, rhs, nvars, vars)
    ccall((:SCIPcreateConsBasicXor, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_CONS}}, Ptr{Cchar}, Cuint, Cint, Ptr{Ptr{SCIP_VAR}}), scip, cons, name, rhs, nvars, vars)
end

function SCIPgetNVarsXor(scip, cons)
    ccall((:SCIPgetNVarsXor, libscip), Cint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetVarsXor(scip, cons)
    ccall((:SCIPgetVarsXor, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetIntVarXor(scip, cons)
    ccall((:SCIPgetIntVarXor, libscip), Ptr{SCIP_VAR}, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPgetRhsXor(scip, cons)
    ccall((:SCIPgetRhsXor, libscip), Cuint, (Ptr{SCIP}, Ptr{SCIP_CONS}), scip, cons)
end

function SCIPincludeConshdlrComponents(scip)
    ccall((:SCIPincludeConshdlrComponents, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeDispDefault(scip)
    ccall((:SCIPincludeDispDefault, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeEventHdlrEstim(scip)
    ccall((:SCIPincludeEventHdlrEstim, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPgetTreesizeEstimation(scip)
    ccall((:SCIPgetTreesizeEstimation, libscip), Cdouble, (Ptr{SCIP},), scip)
end

function SCIPincludeEventHdlrSolvingphase(scip)
    ccall((:SCIPincludeEventHdlrSolvingphase, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeEventHdlrSofttimelimit(scip)
    ccall((:SCIPincludeEventHdlrSofttimelimit, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurActconsdiving(scip)
    ccall((:SCIPincludeHeurActconsdiving, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurAdaptivediving(scip)
    ccall((:SCIPincludeHeurAdaptivediving, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurBound(scip)
    ccall((:SCIPincludeHeurBound, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurClique(scip)
    ccall((:SCIPincludeHeurClique, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurCoefdiving(scip)
    ccall((:SCIPincludeHeurCoefdiving, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurCompletesol(scip)
    ccall((:SCIPincludeHeurCompletesol, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurConflictdiving(scip)
    ccall((:SCIPincludeHeurConflictdiving, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurCrossover(scip)
    ccall((:SCIPincludeHeurCrossover, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurDins(scip)
    ccall((:SCIPincludeHeurDins, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurDistributiondiving(scip)
    ccall((:SCIPincludeHeurDistributiondiving, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurDualval(scip)
    ccall((:SCIPincludeHeurDualval, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPapplyHeurDualval(scip, heur, result, refpoint)
    ccall((:SCIPapplyHeurDualval, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Ptr{SCIP_RESULT}, Ptr{SCIP_SOL}), scip, heur, result, refpoint)
end

function SCIPincludeHeurFarkasdiving(scip)
    ccall((:SCIPincludeHeurFarkasdiving, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurFeaspump(scip)
    ccall((:SCIPincludeHeurFeaspump, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurFixandinfer(scip)
    ccall((:SCIPincludeHeurFixandinfer, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurFracdiving(scip)
    ccall((:SCIPincludeHeurFracdiving, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurGins(scip)
    ccall((:SCIPincludeHeurGins, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurGuideddiving(scip)
    ccall((:SCIPincludeHeurGuideddiving, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurIndicator(scip)
    ccall((:SCIPincludeHeurIndicator, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPheurPassIndicator(scip, heur, nindconss, indconss, solcand, obj)
    ccall((:SCIPheurPassIndicator, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Cint, Ptr{Ptr{SCIP_CONS}}, Ptr{Cuint}, Cdouble), scip, heur, nindconss, indconss, solcand, obj)
end

function SCIPincludeHeurIntdiving(scip)
    ccall((:SCIPincludeHeurIntdiving, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurIntshifting(scip)
    ccall((:SCIPincludeHeurIntshifting, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurLinesearchdiving(scip)
    ccall((:SCIPincludeHeurLinesearchdiving, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurLocalbranching(scip)
    ccall((:SCIPincludeHeurLocalbranching, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurLocks(scip)
    ccall((:SCIPincludeHeurLocks, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPapplyLockFixings(scip, heurdata, cutoff, allrowsfulfilled)
    ccall((:SCIPapplyLockFixings, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEURDATA}, Ptr{Cuint}, Ptr{Cuint}), scip, heurdata, cutoff, allrowsfulfilled)
end

function SCIPincludeHeurLpface(scip)
    ccall((:SCIPincludeHeurLpface, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurAlns(scip)
    ccall((:SCIPincludeHeurAlns, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurMultistart(scip)
    ccall((:SCIPincludeHeurMultistart, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurMutation(scip)
    ccall((:SCIPincludeHeurMutation, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurMpec(scip)
    ccall((:SCIPincludeHeurMpec, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurNlpdiving(scip)
    ccall((:SCIPincludeHeurNlpdiving, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurObjpscostdiving(scip)
    ccall((:SCIPincludeHeurObjpscostdiving, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurOctane(scip)
    ccall((:SCIPincludeHeurOctane, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurOfins(scip)
    ccall((:SCIPincludeHeurOfins, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurOneopt(scip)
    ccall((:SCIPincludeHeurOneopt, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurPADM(scip)
    ccall((:SCIPincludeHeurPADM, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurPscostdiving(scip)
    ccall((:SCIPincludeHeurPscostdiving, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurProximity(scip)
    ccall((:SCIPincludeHeurProximity, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPapplyProximity(scip, heur, result, minimprove, nnodes, nlpiters, nusednodes, nusedlpiters, freesubscip)
    ccall((:SCIPapplyProximity, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Ptr{SCIP_RESULT}, Cdouble, Clonglong, Clonglong, Ptr{Clonglong}, Ptr{Clonglong}, Cuint), scip, heur, result, minimprove, nnodes, nlpiters, nusednodes, nusedlpiters, freesubscip)
end

function SCIPdeleteSubproblemProximity(scip)
    ccall((:SCIPdeleteSubproblemProximity, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurRandrounding(scip)
    ccall((:SCIPincludeHeurRandrounding, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurRens(scip)
    ccall((:SCIPincludeHeurRens, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPapplyRens(scip, heur, result, minfixingrate, minimprove, maxnodes, nstallnodes, startsol, binarybounds, uselprows)
    ccall((:SCIPapplyRens, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Ptr{SCIP_RESULT}, Cdouble, Cdouble, Clonglong, Clonglong, Cchar, Cuint, Cuint), scip, heur, result, minfixingrate, minimprove, maxnodes, nstallnodes, startsol, binarybounds, uselprows)
end

function SCIPincludeHeurReoptsols(scip)
    ccall((:SCIPincludeHeurReoptsols, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPreoptsolsGetNCheckedsols(scip)
    ccall((:SCIPreoptsolsGetNCheckedsols, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPreoptsolsGetNImprovingsols(scip)
    ccall((:SCIPreoptsolsGetNImprovingsols, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurRepair(scip)
    ccall((:SCIPincludeHeurRepair, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurRins(scip)
    ccall((:SCIPincludeHeurRins, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurRootsoldiving(scip)
    ccall((:SCIPincludeHeurRootsoldiving, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurRounding(scip)
    ccall((:SCIPincludeHeurRounding, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurShiftandpropagate(scip)
    ccall((:SCIPincludeHeurShiftandpropagate, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurShifting(scip)
    ccall((:SCIPincludeHeurShifting, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurSimplerounding(scip)
    ccall((:SCIPincludeHeurSimplerounding, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurSubNlp(scip)
    ccall((:SCIPincludeHeurSubNlp, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPupdateStartpointHeurSubNlp(scip, heur, solcand, violation)
    ccall((:SCIPupdateStartpointHeurSubNlp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Ptr{SCIP_SOL}, Cdouble), scip, heur, solcand, violation)
end

function SCIPapplyHeurSubNlp(scip, heur, result, refpoint, itercontingent, timelimit, minimprove, iterused, resultsol)
    ccall((:SCIPapplyHeurSubNlp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Ptr{SCIP_RESULT}, Ptr{SCIP_SOL}, Clonglong, Cdouble, Cdouble, Ptr{Clonglong}, Ptr{SCIP_SOL}), scip, heur, result, refpoint, itercontingent, timelimit, minimprove, iterused, resultsol)
end

function SCIPresolveSolHeurSubNlp(scip, heur, sol, success, itercontingent, timelimit)
    ccall((:SCIPresolveSolHeurSubNlp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Ptr{SCIP_SOL}, Ptr{Cuint}, Clonglong, Cdouble), scip, heur, sol, success, itercontingent, timelimit)
end

function SCIPaddLinearConsToNlpHeurSubNlp(scip, heur, addcombconss, addcontconss)
    ccall((:SCIPaddLinearConsToNlpHeurSubNlp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Cuint, Cuint), scip, heur, addcombconss, addcontconss)
end

function SCIPgetSubScipHeurSubNlp(scip, heur)
    ccall((:SCIPgetSubScipHeurSubNlp, libscip), Ptr{SCIP}, (Ptr{SCIP}, Ptr{SCIP_HEUR}), scip, heur)
end

function SCIPgetVarMappingScip2SubScipHeurSubNlp(scip, heur)
    ccall((:SCIPgetVarMappingScip2SubScipHeurSubNlp, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP}, Ptr{SCIP_HEUR}), scip, heur)
end

function SCIPgetVarMappingSubScip2ScipHeurSubNlp(scip, heur)
    ccall((:SCIPgetVarMappingSubScip2ScipHeurSubNlp, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP}, Ptr{SCIP_HEUR}), scip, heur)
end

function SCIPgetStartCandidateHeurSubNlp(scip, heur)
    ccall((:SCIPgetStartCandidateHeurSubNlp, libscip), Ptr{SCIP_SOL}, (Ptr{SCIP}, Ptr{SCIP_HEUR}), scip, heur)
end

function SCIPincludeHeurTrivial(scip)
    ccall((:SCIPincludeHeurTrivial, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurTrivialnegation(scip)
    ccall((:SCIPincludeHeurTrivialnegation, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurTrustregion(scip)
    ccall((:SCIPincludeHeurTrustregion, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurTrySol(scip)
    ccall((:SCIPincludeHeurTrySol, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPheurPassSolTrySol(scip, heur, sol)
    ccall((:SCIPheurPassSolTrySol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Ptr{SCIP_SOL}), scip, heur, sol)
end

function SCIPheurPassSolAddSol(scip, heur, sol)
    ccall((:SCIPheurPassSolAddSol, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Ptr{SCIP_SOL}), scip, heur, sol)
end

function SCIPincludeHeurTwoopt(scip)
    ccall((:SCIPincludeHeurTwoopt, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurUndercover(scip)
    ccall((:SCIPincludeHeurUndercover, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcomputeCoverUndercover(scip, coversize, cover, timelimit, memorylimit, objlimit, globalbounds, onlyconvexify, coverbd, coveringobj, success)
    ccall((:SCIPcomputeCoverUndercover, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cint}, Ptr{Ptr{SCIP_VAR}}, Cdouble, Cdouble, Cdouble, Cuint, Cuint, Cuint, Cchar, Ptr{Cuint}), scip, coversize, cover, timelimit, memorylimit, objlimit, globalbounds, onlyconvexify, coverbd, coveringobj, success)
end

function SCIPincludeHeurVbounds(scip)
    ccall((:SCIPincludeHeurVbounds, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurVeclendiving(scip)
    ccall((:SCIPincludeHeurVeclendiving, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeHeurZeroobj(scip)
    ccall((:SCIPincludeHeurZeroobj, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPapplyZeroobj(scip, heur, result, minimprove, nnodes)
    ccall((:SCIPapplyZeroobj, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_HEUR}, Ptr{SCIP_RESULT}, Cdouble, Clonglong), scip, heur, result, minimprove, nnodes)
end

function SCIPincludeHeurZirounding(scip)
    ccall((:SCIPincludeHeurZirounding, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeNodeselBfs(scip)
    ccall((:SCIPincludeNodeselBfs, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeNodeselBreadthfirst(scip)
    ccall((:SCIPincludeNodeselBreadthfirst, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeNodeselDfs(scip)
    ccall((:SCIPincludeNodeselDfs, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeNodeselEstimate(scip)
    ccall((:SCIPincludeNodeselEstimate, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeNodeselHybridestim(scip)
    ccall((:SCIPincludeNodeselHybridestim, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeNodeselUct(scip)
    ccall((:SCIPincludeNodeselUct, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeNodeselRestartdfs(scip)
    ccall((:SCIPincludeNodeselRestartdfs, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePresolBoundshift(scip)
    ccall((:SCIPincludePresolBoundshift, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePresolConvertinttobin(scip)
    ccall((:SCIPincludePresolConvertinttobin, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePresolDomcol(scip)
    ccall((:SCIPincludePresolDomcol, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePresolDualagg(scip)
    ccall((:SCIPincludePresolDualagg, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePresolDualcomp(scip)
    ccall((:SCIPincludePresolDualcomp, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePresolDualinfer(scip)
    ccall((:SCIPincludePresolDualinfer, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePresolGateextraction(scip)
    ccall((:SCIPincludePresolGateextraction, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePresolImplics(scip)
    ccall((:SCIPincludePresolImplics, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePresolInttobinary(scip)
    ccall((:SCIPincludePresolInttobinary, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePresolRedvub(scip)
    ccall((:SCIPincludePresolRedvub, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePresolQPKKTref(scip)
    ccall((:SCIPincludePresolQPKKTref, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePresolTrivial(scip)
    ccall((:SCIPincludePresolTrivial, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePresolTworowbnd(scip)
    ccall((:SCIPincludePresolTworowbnd, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePresolSparsify(scip)
    ccall((:SCIPincludePresolSparsify, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePresolDualsparsify(scip)
    ccall((:SCIPincludePresolDualsparsify, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePresolStuffing(scip)
    ccall((:SCIPincludePresolStuffing, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePropDualfix(scip)
    ccall((:SCIPincludePropDualfix, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPgenVBoundAdd(scip, genvboundprop, vars, var, coefs, ncoefs, coefprimalbound, constant, boundtype)
    ccall((:SCIPgenVBoundAdd, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{Ptr{SCIP_VAR}}, Ptr{SCIP_VAR}, Ptr{Cdouble}, Cint, Cdouble, Cdouble, SCIP_BOUNDTYPE), scip, genvboundprop, vars, var, coefs, ncoefs, coefprimalbound, constant, boundtype)
end

function SCIPincludePropGenvbounds(scip)
    ccall((:SCIPincludePropGenvbounds, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePropNlobbt(scip)
    ccall((:SCIPincludePropNlobbt, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePropObbt(scip)
    ccall((:SCIPincludePropObbt, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePropProbing(scip)
    ccall((:SCIPincludePropProbing, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPapplyProbingVar(scip, vars, nvars, probingpos, boundtype, bound, maxproprounds, impllbs, implubs, proplbs, propubs, cutoff)
    ccall((:SCIPapplyProbingVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP_VAR}}, Cint, Cint, SCIP_BOUNDTYPE, Cdouble, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}), scip, vars, nvars, probingpos, boundtype, bound, maxproprounds, impllbs, implubs, proplbs, propubs, cutoff)
end

function SCIPanalyzeDeductionsProbing(scip, probingvar, leftub, rightlb, nvars, vars, leftimpllbs, leftimplubs, leftproplbs, leftpropubs, rightimpllbs, rightimplubs, rightproplbs, rightpropubs, nfixedvars, naggrvars, nimplications, nchgbds, cutoff)
    ccall((:SCIPanalyzeDeductionsProbing, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Cint, Ptr{Ptr{SCIP_VAR}}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cuint}), scip, probingvar, leftub, rightlb, nvars, vars, leftimpllbs, leftimplubs, leftproplbs, leftpropubs, rightimpllbs, rightimplubs, rightproplbs, rightpropubs, nfixedvars, naggrvars, nimplications, nchgbds, cutoff)
end

function SCIPincludePropPseudoobj(scip)
    ccall((:SCIPincludePropPseudoobj, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPpropagateCutoffboundVar(scip, prop, var, cutoffbound, pseudoobjval, tightened)
    ccall((:SCIPpropagateCutoffboundVar, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_PROP}, Ptr{SCIP_VAR}, Cdouble, Cdouble, Ptr{Cuint}), scip, prop, var, cutoffbound, pseudoobjval, tightened)
end

function SCIPincludePropRedcost(scip)
    ccall((:SCIPincludePropRedcost, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludePropRootredcost(scip)
    ccall((:SCIPincludePropRootredcost, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

const SYM_SPEC = UInt32

@enum SYM_Rhssense::UInt32 begin
    SYM_SENSE_UNKOWN = 0
    SYM_SENSE_INEQUALITY = 1
    SYM_SENSE_EQUATION = 2
    SYM_SENSE_XOR = 3
    SYM_SENSE_AND = 4
    SYM_SENSE_OR = 5
    SYM_SENSE_BOUNDIS_TYPE_1 = 6
    SYM_SENSE_BOUNDIS_TYPE_2 = 7
end

const SYM_RHSSENSE = SYM_Rhssense

const SYM_HANDLETYPE = UInt32

const SYM_Vartype = Cvoid

const SYM_VARTYPE = SYM_Vartype

const SYM_Matrixdata = Cvoid

const SYM_MATRIXDATA = SYM_Matrixdata

function SCIPincludePropSymmetry(scip)
    ccall((:SCIPincludePropSymmetry, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPgetSymmetry(scip, npermvars, permvars, permvarmap, nperms, perms, permstrans, log10groupsize, binvaraffected, components, componentbegins, vartocomponent, ncomponents)
    ccall((:SCIPgetSymmetry, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cint}, Ptr{Ptr{Ptr{SCIP_VAR}}}, Ptr{Ptr{SCIP_HASHMAP}}, Ptr{Cint}, Ptr{Ptr{Ptr{Cint}}}, Ptr{Ptr{Ptr{Cint}}}, Ptr{Cdouble}, Ptr{Cuint}, Ptr{Ptr{Cint}}, Ptr{Ptr{Cint}}, Ptr{Ptr{Cint}}, Ptr{Cint}), scip, npermvars, permvars, permvarmap, nperms, perms, permstrans, log10groupsize, binvaraffected, components, componentbegins, vartocomponent, ncomponents)
end

function SCIPisOrbitalfixingEnabled(scip)
    ccall((:SCIPisOrbitalfixingEnabled, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPgetSymmetryNGenerators(scip)
    ccall((:SCIPgetSymmetryNGenerators, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPincludePropVbounds(scip)
    ccall((:SCIPincludePropVbounds, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPisPropagatedVbounds(scip)
    ccall((:SCIPisPropagatedVbounds, libscip), Cuint, (Ptr{SCIP},), scip)
end

function SCIPexecPropVbounds(scip, force, result)
    ccall((:SCIPexecPropVbounds, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cuint, Ptr{SCIP_RESULT}), scip, force, result)
end

function SCIPincludeReaderBnd(scip)
    ccall((:SCIPincludeReaderBnd, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeReaderCcg(scip)
    ccall((:SCIPincludeReaderCcg, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPwriteCcg(scip, file, name, transformed, vars, nvars, conss, nconss, result)
    ccall((:SCIPwriteCcg, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, Ptr{Cchar}, Cuint, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Ptr{SCIP_CONS}}, Cint, Ptr{SCIP_RESULT}), scip, file, name, transformed, vars, nvars, conss, nconss, result)
end

function SCIPincludeReaderCip(scip)
    ccall((:SCIPincludeReaderCip, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeReaderCnf(scip)
    ccall((:SCIPincludeReaderCnf, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeReaderCor(scip)
    ccall((:SCIPincludeReaderCor, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPreadCor(scip, filename, result)
    ccall((:SCIPreadCor, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{SCIP_RESULT}), scip, filename, result)
end

function SCIPcorHasRead(reader)
    ccall((:SCIPcorHasRead, libscip), Cuint, (Ptr{SCIP_READER},), reader)
end

function SCIPcorGetNVarNames(reader)
    ccall((:SCIPcorGetNVarNames, libscip), Cint, (Ptr{SCIP_READER},), reader)
end

function SCIPcorGetNConsNames(reader)
    ccall((:SCIPcorGetNConsNames, libscip), Cint, (Ptr{SCIP_READER},), reader)
end

function SCIPcorGetVarName(reader, i)
    ccall((:SCIPcorGetVarName, libscip), Ptr{Cchar}, (Ptr{SCIP_READER}, Cint), reader, i)
end

function SCIPcorGetConsName(reader, i)
    ccall((:SCIPcorGetConsName, libscip), Ptr{Cchar}, (Ptr{SCIP_READER}, Cint), reader, i)
end

function SCIPincludeReaderDec(scip)
    ccall((:SCIPincludeReaderDec, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeReaderDiff(scip)
    ccall((:SCIPincludeReaderDiff, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPreadDiff(scip, reader, filename, result)
    ccall((:SCIPreadDiff, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_READER}, Ptr{Cchar}, Ptr{SCIP_RESULT}), scip, reader, filename, result)
end

function SCIPwriteDiff(scip, file, name, transformed, objsense, objscale, objoffset, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars, conss, nconss, result)
    ccall((:SCIPwriteDiff, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, Ptr{Cchar}, Cuint, SCIP_OBJSENSE, Cdouble, Cdouble, Ptr{Ptr{SCIP_VAR}}, Cint, Cint, Cint, Cint, Cint, Ptr{Ptr{SCIP_CONS}}, Cint, Ptr{SCIP_RESULT}), scip, file, name, transformed, objsense, objscale, objoffset, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars, conss, nconss, result)
end

function SCIPincludeReaderFix(scip)
    ccall((:SCIPincludeReaderFix, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeReaderFzn(scip)
    ccall((:SCIPincludeReaderFzn, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPprintSolReaderFzn(scip, sol, file)
    ccall((:SCIPprintSolReaderFzn, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}, Ptr{Libc.FILE}), scip, sol, file)
end

function SCIPincludeReaderGms(scip)
    ccall((:SCIPincludeReaderGms, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPwriteGms(scip, file, name, transformed, objsense, objscale, objoffset, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars, conss, nconss, result)
    ccall((:SCIPwriteGms, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, Ptr{Cchar}, Cuint, SCIP_OBJSENSE, Cdouble, Cdouble, Ptr{Ptr{SCIP_VAR}}, Cint, Cint, Cint, Cint, Cint, Ptr{Ptr{SCIP_CONS}}, Cint, Ptr{SCIP_RESULT}), scip, file, name, transformed, objsense, objscale, objoffset, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars, conss, nconss, result)
end

function SCIPincludeReaderLp(scip)
    ccall((:SCIPincludeReaderLp, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPreadLp(scip, reader, filename, result)
    ccall((:SCIPreadLp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_READER}, Ptr{Cchar}, Ptr{SCIP_RESULT}), scip, reader, filename, result)
end

function SCIPwriteLp(scip, file, name, transformed, objsense, objscale, objoffset, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars, conss, nconss, result)
    ccall((:SCIPwriteLp, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, Ptr{Cchar}, Cuint, SCIP_OBJSENSE, Cdouble, Cdouble, Ptr{Ptr{SCIP_VAR}}, Cint, Cint, Cint, Cint, Cint, Ptr{Ptr{SCIP_CONS}}, Cint, Ptr{SCIP_RESULT}), scip, file, name, transformed, objsense, objscale, objoffset, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars, conss, nconss, result)
end

function SCIPincludeReaderMps(scip)
    ccall((:SCIPincludeReaderMps, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPreadMps(scip, reader, filename, result, varnames, consnames, varnamessize, consnamessize, nvarnames, nconsnames)
    ccall((:SCIPreadMps, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_READER}, Ptr{Cchar}, Ptr{SCIP_RESULT}, Ptr{Ptr{Ptr{Cchar}}}, Ptr{Ptr{Ptr{Cchar}}}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), scip, reader, filename, result, varnames, consnames, varnamessize, consnamessize, nvarnames, nconsnames)
end

function SCIPwriteMps(scip, reader, file, name, transformed, objsense, objscale, objoffset, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars, fixedvars, nfixedvars, conss, nconss, result)
    ccall((:SCIPwriteMps, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_READER}, Ptr{Libc.FILE}, Ptr{Cchar}, Cuint, SCIP_OBJSENSE, Cdouble, Cdouble, Ptr{Ptr{SCIP_VAR}}, Cint, Cint, Cint, Cint, Cint, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Ptr{SCIP_CONS}}, Cint, Ptr{SCIP_RESULT}), scip, reader, file, name, transformed, objsense, objscale, objoffset, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars, fixedvars, nfixedvars, conss, nconss, result)
end

function SCIPincludeReaderMst(scip)
    ccall((:SCIPincludeReaderMst, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeReaderOpb(scip)
    ccall((:SCIPincludeReaderOpb, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPreadOpb(scip, reader, filename, result)
    ccall((:SCIPreadOpb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_READER}, Ptr{Cchar}, Ptr{SCIP_RESULT}), scip, reader, filename, result)
end

function SCIPwriteOpb(scip, file, name, transformed, objsense, objscale, objoffset, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars, fixedvars, nfixedvars, conss, nconss, genericnames, result)
    ccall((:SCIPwriteOpb, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, Ptr{Cchar}, Cuint, SCIP_OBJSENSE, Cdouble, Cdouble, Ptr{Ptr{SCIP_VAR}}, Cint, Cint, Cint, Cint, Cint, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Ptr{SCIP_CONS}}, Cint, Cuint, Ptr{SCIP_RESULT}), scip, file, name, transformed, objsense, objscale, objoffset, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars, fixedvars, nfixedvars, conss, nconss, genericnames, result)
end

function SCIPincludeReaderOsil(scip)
    ccall((:SCIPincludeReaderOsil, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeReaderPip(scip)
    ccall((:SCIPincludeReaderPip, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPreadPip(scip, reader, filename, result)
    ccall((:SCIPreadPip, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_READER}, Ptr{Cchar}, Ptr{SCIP_RESULT}), scip, reader, filename, result)
end

function SCIPwritePip(scip, file, name, transformed, objsense, objscale, objoffset, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars, conss, nconss, result)
    ccall((:SCIPwritePip, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, Ptr{Cchar}, Cuint, SCIP_OBJSENSE, Cdouble, Cdouble, Ptr{Ptr{SCIP_VAR}}, Cint, Cint, Cint, Cint, Cint, Ptr{Ptr{SCIP_CONS}}, Cint, Ptr{SCIP_RESULT}), scip, file, name, transformed, objsense, objscale, objoffset, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars, conss, nconss, result)
end

function SCIPincludeReaderPpm(scip)
    ccall((:SCIPincludeReaderPpm, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPwritePpm(scip, file, name, readerdata, transformed, vars, nvars, conss, nconss, result)
    ccall((:SCIPwritePpm, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, Ptr{Cchar}, Ptr{SCIP_READERDATA}, Cuint, Ptr{Ptr{SCIP_VAR}}, Cint, Ptr{Ptr{SCIP_CONS}}, Cint, Ptr{SCIP_RESULT}), scip, file, name, readerdata, transformed, vars, nvars, conss, nconss, result)
end

function SCIPincludeReaderPbm(scip)
    ccall((:SCIPincludeReaderPbm, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPwritePbm(scip, file, name, readerdata, transformed, nvars, conss, nconss, result)
    ccall((:SCIPwritePbm, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, Ptr{Cchar}, Ptr{SCIP_READERDATA}, Cuint, Cint, Ptr{Ptr{SCIP_CONS}}, Cint, Ptr{SCIP_RESULT}), scip, file, name, readerdata, transformed, nvars, conss, nconss, result)
end

function SCIPincludeReaderRlp(scip)
    ccall((:SCIPincludeReaderRlp, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeReaderSmps(scip)
    ccall((:SCIPincludeReaderSmps, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeReaderSol(scip)
    ccall((:SCIPincludeReaderSol, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeReaderSto(scip)
    ccall((:SCIPincludeReaderSto, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPreadSto(scip, filename, result)
    ccall((:SCIPreadSto, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{SCIP_RESULT}), scip, filename, result)
end

function SCIPwriteSto(scip, file, name, transformed, objsense, objscale, objoffset, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars, conss, nconss, result)
    ccall((:SCIPwriteSto, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Libc.FILE}, Ptr{Cchar}, Cuint, SCIP_OBJSENSE, Cdouble, Cdouble, Ptr{Ptr{SCIP_VAR}}, Cint, Cint, Cint, Cint, Cint, Ptr{Ptr{SCIP_CONS}}, Cint, Ptr{SCIP_RESULT}), scip, file, name, transformed, objsense, objscale, objoffset, vars, nvars, nbinvars, nintvars, nimplvars, ncontvars, conss, nconss, result)
end

function SCIPstoGetNScenarios(scip)
    ccall((:SCIPstoGetNScenarios, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPincludeReaderTim(scip)
    ccall((:SCIPincludeReaderTim, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPreadTim(scip, filename, result)
    ccall((:SCIPreadTim, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Cchar}, Ptr{SCIP_RESULT}), scip, filename, result)
end

function SCIPtimHasRead(reader)
    ccall((:SCIPtimHasRead, libscip), Cuint, (Ptr{SCIP_READER},), reader)
end

function SCIPtimGetNStages(scip)
    ccall((:SCIPtimGetNStages, libscip), Cint, (Ptr{SCIP},), scip)
end

function SCIPtimGetStageName(scip, stagenum)
    ccall((:SCIPtimGetStageName, libscip), Ptr{Cchar}, (Ptr{SCIP}, Cint), scip, stagenum)
end

function SCIPtimConsGetStageName(scip, consname)
    ccall((:SCIPtimConsGetStageName, libscip), Ptr{Cchar}, (Ptr{SCIP}, Ptr{Cchar}), scip, consname)
end

function SCIPtimFindStage(scip, stage)
    ccall((:SCIPtimFindStage, libscip), Cint, (Ptr{SCIP}, Ptr{Cchar}), scip, stage)
end

function SCIPtimGetStageVars(scip, stagenum)
    ccall((:SCIPtimGetStageVars, libscip), Ptr{Ptr{SCIP_VAR}}, (Ptr{SCIP}, Cint), scip, stagenum)
end

function SCIPtimGetStageConss(scip, stagenum)
    ccall((:SCIPtimGetStageConss, libscip), Ptr{Ptr{SCIP_CONS}}, (Ptr{SCIP}, Cint), scip, stagenum)
end

function SCIPtimGetStageNVars(scip, stagenum)
    ccall((:SCIPtimGetStageNVars, libscip), Cint, (Ptr{SCIP}, Cint), scip, stagenum)
end

function SCIPtimGetStageNConss(scip, stagenum)
    ccall((:SCIPtimGetStageNConss, libscip), Cint, (Ptr{SCIP}, Cint), scip, stagenum)
end

function SCIPincludeReaderWbo(scip)
    ccall((:SCIPincludeReaderWbo, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeReaderZpl(scip)
    ccall((:SCIPincludeReaderZpl, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeSepaEccuts(scip)
    ccall((:SCIPincludeSepaEccuts, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeSepaCGMIP(scip)
    ccall((:SCIPincludeSepaCGMIP, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeSepaClique(scip)
    ccall((:SCIPincludeSepaClique, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeSepaClosecuts(scip)
    ccall((:SCIPincludeSepaClosecuts, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPsetBasePointClosecuts(scip, sol)
    ccall((:SCIPsetBasePointClosecuts, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{SCIP_SOL}), scip, sol)
end

function SCIPincludeSepaAggregation(scip)
    ccall((:SCIPincludeSepaAggregation, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeSepaConvexproj(scip)
    ccall((:SCIPincludeSepaConvexproj, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeSepaDisjunctive(scip)
    ccall((:SCIPincludeSepaDisjunctive, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeSepaGauge(scip)
    ccall((:SCIPincludeSepaGauge, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeSepaGomory(scip)
    ccall((:SCIPincludeSepaGomory, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeSepaImpliedbounds(scip)
    ccall((:SCIPincludeSepaImpliedbounds, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeSepaIntobj(scip)
    ccall((:SCIPincludeSepaIntobj, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeSepaMcf(scip)
    ccall((:SCIPincludeSepaMcf, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeSepaOddcycle(scip)
    ccall((:SCIPincludeSepaOddcycle, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeSepaRapidlearning(scip)
    ccall((:SCIPincludeSepaRapidlearning, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeSepaStrongcg(scip)
    ccall((:SCIPincludeSepaStrongcg, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeSepaZerohalf(scip)
    ccall((:SCIPincludeSepaZerohalf, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPprocessShellArguments(scip, argc, argv, defaultsetname)
    ccall((:SCIPprocessShellArguments, libscip), SCIP_RETCODE, (Ptr{SCIP}, Cint, Ptr{Ptr{Cchar}}, Ptr{Cchar}), scip, argc, argv, defaultsetname)
end

function SCIPrunShell(argc, argv, defaultsetname)
    ccall((:SCIPrunShell, libscip), SCIP_RETCODE, (Cint, Ptr{Ptr{Cchar}}, Ptr{Cchar}), argc, argv, defaultsetname)
end

function SCIPincludeTableDefault(scip)
    ccall((:SCIPincludeTableDefault, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeConcurrentScipSolvers(scip)
    ccall((:SCIPincludeConcurrentScipSolvers, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPincludeBendersDefault(scip)
    ccall((:SCIPincludeBendersDefault, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function SCIPcreateBendersDefault(scip, subproblems, nsubproblems)
    ccall((:SCIPcreateBendersDefault, libscip), SCIP_RETCODE, (Ptr{SCIP}, Ptr{Ptr{SCIP}}, Cint), scip, subproblems, nsubproblems)
end

function SCIPcreateNlpSolverIpopt(blkmem, nlpi)
    ccall((:SCIPcreateNlpSolverIpopt, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_NLPI}}), blkmem, nlpi)
end

function SCIPgetSolverNameIpopt()
    ccall((:SCIPgetSolverNameIpopt, libscip), Ptr{Cchar}, ())
end

function SCIPgetSolverDescIpopt()
    ccall((:SCIPgetSolverDescIpopt, libscip), Ptr{Cchar}, ())
end

function SCIPisIpoptAvailableIpopt()
    ccall((:SCIPisIpoptAvailableIpopt, libscip), Cuint, ())
end

function SCIPgetIpoptApplicationPointerIpopt(nlpiproblem)
    ccall((:SCIPgetIpoptApplicationPointerIpopt, libscip), Ptr{Cvoid}, (Ptr{SCIP_NLPIPROBLEM},), nlpiproblem)
end

function SCIPgetNlpiOracleIpopt(nlpiproblem)
    ccall((:SCIPgetNlpiOracleIpopt, libscip), Ptr{Cvoid}, (Ptr{SCIP_NLPIPROBLEM},), nlpiproblem)
end

function SCIPsetModifiedDefaultSettingsIpopt(nlpi, optionsstring, append)
    ccall((:SCIPsetModifiedDefaultSettingsIpopt, libscip), Cvoid, (Ptr{SCIP_NLPI}, Ptr{Cchar}, Cuint), nlpi, optionsstring, append)
end

function LapackDsyev(computeeigenvectors, N, a, w)
    ccall((:LapackDsyev, libscip), SCIP_RETCODE, (Cuint, Cint, Ptr{Cdouble}, Ptr{Cdouble}), computeeigenvectors, N, a, w)
end

function SCIPsolveLinearProb(N, A, b, x, success)
    ccall((:SCIPsolveLinearProb, libscip), SCIP_RETCODE, (Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}), N, A, b, x, success)
end

function SCIPcreateNlpSolverFilterSQP(blkmem, nlpi)
    ccall((:SCIPcreateNlpSolverFilterSQP, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_NLPI}}), blkmem, nlpi)
end

function SCIPgetSolverNameFilterSQP()
    ccall((:SCIPgetSolverNameFilterSQP, libscip), Ptr{Cchar}, ())
end

function SCIPgetSolverDescFilterSQP()
    ccall((:SCIPgetSolverDescFilterSQP, libscip), Ptr{Cchar}, ())
end

function SCIPisFilterSQPAvailableFilterSQP()
    ccall((:SCIPisFilterSQPAvailableFilterSQP, libscip), Cuint, ())
end

function SCIPcreateNlpSolverWorhp(blkmem, nlpi, useip)
    ccall((:SCIPcreateNlpSolverWorhp, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_NLPI}}, Cuint), blkmem, nlpi, useip)
end

function SCIPgetSolverNameWorhp()
    ccall((:SCIPgetSolverNameWorhp, libscip), Ptr{Cchar}, ())
end

function SCIPgetSolverDescWorhp()
    ccall((:SCIPgetSolverDescWorhp, libscip), Ptr{Cchar}, ())
end

function SCIPisWorhpAvailableWorhp()
    ccall((:SCIPisWorhpAvailableWorhp, libscip), Cuint, ())
end

function SCIPcreateNlpSolverAll(blkmem, nlpi, nlpis, nnlpis)
    ccall((:SCIPcreateNlpSolverAll, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_NLPI}}, Ptr{Ptr{SCIP_NLPI}}, Cint), blkmem, nlpi, nlpis, nnlpis)
end

function SCIPincludeDefaultPlugins(scip)
    ccall((:SCIPincludeDefaultPlugins, libscip), SCIP_RETCODE, (Ptr{SCIP},), scip)
end

function BMSallocClearMemory_call(num, typesize, filename, line)
    ccall((:BMSallocClearMemory_call, libscip), Ptr{Cvoid}, (Csize_t, Csize_t, Ptr{Cchar}, Cint), num, typesize, filename, line)
end

function BMSallocMemory_call(size, filename, line)
    ccall((:BMSallocMemory_call, libscip), Ptr{Cvoid}, (Csize_t, Ptr{Cchar}, Cint), size, filename, line)
end

function BMSallocMemoryArray_call(num, typesize, filename, line)
    ccall((:BMSallocMemoryArray_call, libscip), Ptr{Cvoid}, (Csize_t, Csize_t, Ptr{Cchar}, Cint), num, typesize, filename, line)
end

function BMSreallocMemory_call(ptr, size, filename, line)
    ccall((:BMSreallocMemory_call, libscip), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t, Ptr{Cchar}, Cint), ptr, size, filename, line)
end

function BMSreallocMemoryArray_call(ptr, num, typesize, filename, line)
    ccall((:BMSreallocMemoryArray_call, libscip), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t, Csize_t, Ptr{Cchar}, Cint), ptr, num, typesize, filename, line)
end

function BMSclearMemory_call(ptr, size)
    ccall((:BMSclearMemory_call, libscip), Cvoid, (Ptr{Cvoid}, Csize_t), ptr, size)
end

function BMScopyMemory_call(ptr, source, size)
    ccall((:BMScopyMemory_call, libscip), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}, Csize_t), ptr, source, size)
end

function BMSmoveMemory_call(ptr, source, size)
    ccall((:BMSmoveMemory_call, libscip), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}, Csize_t), ptr, source, size)
end

function BMSduplicateMemory_call(source, size, filename, line)
    ccall((:BMSduplicateMemory_call, libscip), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t, Ptr{Cchar}, Cint), source, size, filename, line)
end

function BMSduplicateMemoryArray_call(source, num, typesize, filename, line)
    ccall((:BMSduplicateMemoryArray_call, libscip), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t, Csize_t, Ptr{Cchar}, Cint), source, num, typesize, filename, line)
end

function BMSfreeMemory_call(ptr, filename, line)
    ccall((:BMSfreeMemory_call, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cchar}, Cint), ptr, filename, line)
end

function BMSfreeMemoryNull_call(ptr, filename, line)
    ccall((:BMSfreeMemoryNull_call, libscip), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{Cchar}, Cint), ptr, filename, line)
end

function BMSgetPointerSize_call(ptr)
    ccall((:BMSgetPointerSize_call, libscip), Csize_t, (Ptr{Cvoid},), ptr)
end

function BMSdisplayMemory_call()
    ccall((:BMSdisplayMemory_call, libscip), Cvoid, ())
end

function BMScheckEmptyMemory_call()
    ccall((:BMScheckEmptyMemory_call, libscip), Cvoid, ())
end

function BMSgetMemoryUsed_call()
    ccall((:BMSgetMemoryUsed_call, libscip), Clonglong, ())
end

const BMS_ChkMem = Cvoid

const BMS_CHKMEM = BMS_ChkMem

function BMSalignMemsize(size)
    ccall((:BMSalignMemsize, libscip), Cvoid, (Ptr{Csize_t},), size)
end

function BMSisAligned(size)
    ccall((:BMSisAligned, libscip), Cint, (Csize_t,), size)
end

function BMScreateChunkMemory_call(size, initchunksize, garbagefactor, filename, line)
    ccall((:BMScreateChunkMemory_call, libscip), Ptr{BMS_CHKMEM}, (Csize_t, Cint, Cint, Ptr{Cchar}, Cint), size, initchunksize, garbagefactor, filename, line)
end

function BMSclearChunkMemory_call(chkmem, filename, line)
    ccall((:BMSclearChunkMemory_call, libscip), Cvoid, (Ptr{BMS_CHKMEM}, Ptr{Cchar}, Cint), chkmem, filename, line)
end

function BMSdestroyChunkMemory_call(chkmem, filename, line)
    ccall((:BMSdestroyChunkMemory_call, libscip), Cvoid, (Ptr{Ptr{BMS_CHKMEM}}, Ptr{Cchar}, Cint), chkmem, filename, line)
end

function BMSallocChunkMemory_call(chkmem, size, filename, line)
    ccall((:BMSallocChunkMemory_call, libscip), Ptr{Cvoid}, (Ptr{BMS_CHKMEM}, Csize_t, Ptr{Cchar}, Cint), chkmem, size, filename, line)
end

function BMSduplicateChunkMemory_call(chkmem, source, size, filename, line)
    ccall((:BMSduplicateChunkMemory_call, libscip), Ptr{Cvoid}, (Ptr{BMS_CHKMEM}, Ptr{Cvoid}, Csize_t, Ptr{Cchar}, Cint), chkmem, source, size, filename, line)
end

function BMSfreeChunkMemory_call(chkmem, ptr, size, filename, line)
    ccall((:BMSfreeChunkMemory_call, libscip), Cvoid, (Ptr{BMS_CHKMEM}, Ptr{Ptr{Cvoid}}, Csize_t, Ptr{Cchar}, Cint), chkmem, ptr, size, filename, line)
end

function BMSfreeChunkMemoryNull_call(chkmem, ptr, size, filename, line)
    ccall((:BMSfreeChunkMemoryNull_call, libscip), Cvoid, (Ptr{BMS_CHKMEM}, Ptr{Ptr{Cvoid}}, Csize_t, Ptr{Cchar}, Cint), chkmem, ptr, size, filename, line)
end

function BMSgarbagecollectChunkMemory_call(chkmem)
    ccall((:BMSgarbagecollectChunkMemory_call, libscip), Cvoid, (Ptr{BMS_CHKMEM},), chkmem)
end

function BMSgetChunkMemoryUsed_call(chkmem)
    ccall((:BMSgetChunkMemoryUsed_call, libscip), Clonglong, (Ptr{BMS_CHKMEM},), chkmem)
end

function BMScreateBlockMemory_call(initchunksize, garbagefactor, filename, line)
    ccall((:BMScreateBlockMemory_call, libscip), Ptr{BMS_BLKMEM}, (Cint, Cint, Ptr{Cchar}, Cint), initchunksize, garbagefactor, filename, line)
end

function BMSclearBlockMemory_call(blkmem, filename, line)
    ccall((:BMSclearBlockMemory_call, libscip), Cvoid, (Ptr{BMS_BLKMEM}, Ptr{Cchar}, Cint), blkmem, filename, line)
end

function BMSdestroyBlockMemory_call(blkmem, filename, line)
    ccall((:BMSdestroyBlockMemory_call, libscip), Cvoid, (Ptr{Ptr{BMS_BLKMEM}}, Ptr{Cchar}, Cint), blkmem, filename, line)
end

function BMSallocBlockMemory_call(blkmem, size, filename, line)
    ccall((:BMSallocBlockMemory_call, libscip), Ptr{Cvoid}, (Ptr{BMS_BLKMEM}, Csize_t, Ptr{Cchar}, Cint), blkmem, size, filename, line)
end

function BMSallocBlockMemoryArray_call(blkmem, num, typesize, filename, line)
    ccall((:BMSallocBlockMemoryArray_call, libscip), Ptr{Cvoid}, (Ptr{BMS_BLKMEM}, Csize_t, Csize_t, Ptr{Cchar}, Cint), blkmem, num, typesize, filename, line)
end

function BMSallocClearBlockMemoryArray_call(blkmem, num, typesize, filename, line)
    ccall((:BMSallocClearBlockMemoryArray_call, libscip), Ptr{Cvoid}, (Ptr{BMS_BLKMEM}, Csize_t, Csize_t, Ptr{Cchar}, Cint), blkmem, num, typesize, filename, line)
end

function BMSreallocBlockMemory_call(blkmem, ptr, oldsize, newsize, filename, line)
    ccall((:BMSreallocBlockMemory_call, libscip), Ptr{Cvoid}, (Ptr{BMS_BLKMEM}, Ptr{Cvoid}, Csize_t, Csize_t, Ptr{Cchar}, Cint), blkmem, ptr, oldsize, newsize, filename, line)
end

function BMSreallocBlockMemoryArray_call(blkmem, ptr, oldnum, newnum, typesize, filename, line)
    ccall((:BMSreallocBlockMemoryArray_call, libscip), Ptr{Cvoid}, (Ptr{BMS_BLKMEM}, Ptr{Cvoid}, Csize_t, Csize_t, Csize_t, Ptr{Cchar}, Cint), blkmem, ptr, oldnum, newnum, typesize, filename, line)
end

function BMSduplicateBlockMemory_call(blkmem, source, size, filename, line)
    ccall((:BMSduplicateBlockMemory_call, libscip), Ptr{Cvoid}, (Ptr{BMS_BLKMEM}, Ptr{Cvoid}, Csize_t, Ptr{Cchar}, Cint), blkmem, source, size, filename, line)
end

function BMSduplicateBlockMemoryArray_call(blkmem, source, num, typesize, filename, line)
    ccall((:BMSduplicateBlockMemoryArray_call, libscip), Ptr{Cvoid}, (Ptr{BMS_BLKMEM}, Ptr{Cvoid}, Csize_t, Csize_t, Ptr{Cchar}, Cint), blkmem, source, num, typesize, filename, line)
end

function BMSfreeBlockMemory_call(blkmem, ptr, size, filename, line)
    ccall((:BMSfreeBlockMemory_call, libscip), Cvoid, (Ptr{BMS_BLKMEM}, Ptr{Ptr{Cvoid}}, Csize_t, Ptr{Cchar}, Cint), blkmem, ptr, size, filename, line)
end

function BMSfreeBlockMemoryNull_call(blkmem, ptr, size, filename, line)
    ccall((:BMSfreeBlockMemoryNull_call, libscip), Cvoid, (Ptr{BMS_BLKMEM}, Ptr{Ptr{Cvoid}}, Csize_t, Ptr{Cchar}, Cint), blkmem, ptr, size, filename, line)
end

function BMSgarbagecollectBlockMemory_call(blkmem)
    ccall((:BMSgarbagecollectBlockMemory_call, libscip), Cvoid, (Ptr{BMS_BLKMEM},), blkmem)
end

function BMSgetBlockMemoryAllocated_call(blkmem)
    ccall((:BMSgetBlockMemoryAllocated_call, libscip), Clonglong, (Ptr{BMS_BLKMEM},), blkmem)
end

function BMSgetBlockMemoryUsed_call(blkmem)
    ccall((:BMSgetBlockMemoryUsed_call, libscip), Clonglong, (Ptr{BMS_BLKMEM},), blkmem)
end

function BMSgetBlockMemoryUnused_call(blkmem)
    ccall((:BMSgetBlockMemoryUnused_call, libscip), Clonglong, (Ptr{BMS_BLKMEM},), blkmem)
end

function BMSgetBlockMemoryUsedMax_call(blkmem)
    ccall((:BMSgetBlockMemoryUsedMax_call, libscip), Clonglong, (Ptr{BMS_BLKMEM},), blkmem)
end

function BMSgetBlockMemoryUnusedMax_call(blkmem)
    ccall((:BMSgetBlockMemoryUnusedMax_call, libscip), Clonglong, (Ptr{BMS_BLKMEM},), blkmem)
end

function BMSgetBlockMemoryAllocatedMax_call(blkmem)
    ccall((:BMSgetBlockMemoryAllocatedMax_call, libscip), Clonglong, (Ptr{BMS_BLKMEM},), blkmem)
end

function BMSgetBlockPointerSize_call(blkmem, ptr)
    ccall((:BMSgetBlockPointerSize_call, libscip), Csize_t, (Ptr{BMS_BLKMEM}, Ptr{Cvoid}), blkmem, ptr)
end

function BMSdisplayBlockMemory_call(blkmem)
    ccall((:BMSdisplayBlockMemory_call, libscip), Cvoid, (Ptr{BMS_BLKMEM},), blkmem)
end

function BMScheckEmptyBlockMemory_call(blkmem)
    ccall((:BMScheckEmptyBlockMemory_call, libscip), Clonglong, (Ptr{BMS_BLKMEM},), blkmem)
end

function BMScreateBufferMemory_call(arraygrowfac, arraygrowinit, clean, filename, line)
    ccall((:BMScreateBufferMemory_call, libscip), Ptr{BMS_BUFMEM}, (Cdouble, Cint, Cuint, Ptr{Cchar}, Cint), arraygrowfac, arraygrowinit, clean, filename, line)
end

function BMSdestroyBufferMemory_call(buffer, filename, line)
    ccall((:BMSdestroyBufferMemory_call, libscip), Cvoid, (Ptr{Ptr{BMS_BUFMEM}}, Ptr{Cchar}, Cint), buffer, filename, line)
end

function BMSsetBufferMemoryArraygrowfac(buffer, arraygrowfac)
    ccall((:BMSsetBufferMemoryArraygrowfac, libscip), Cvoid, (Ptr{BMS_BUFMEM}, Cdouble), buffer, arraygrowfac)
end

function BMSsetBufferMemoryArraygrowinit(buffer, arraygrowinit)
    ccall((:BMSsetBufferMemoryArraygrowinit, libscip), Cvoid, (Ptr{BMS_BUFMEM}, Cint), buffer, arraygrowinit)
end

function BMSallocBufferMemory_call(buffer, size, filename, line)
    ccall((:BMSallocBufferMemory_call, libscip), Ptr{Cvoid}, (Ptr{BMS_BUFMEM}, Csize_t, Ptr{Cchar}, Cint), buffer, size, filename, line)
end

function BMSallocBufferMemoryArray_call(buffer, num, typesize, filename, line)
    ccall((:BMSallocBufferMemoryArray_call, libscip), Ptr{Cvoid}, (Ptr{BMS_BUFMEM}, Csize_t, Csize_t, Ptr{Cchar}, Cint), buffer, num, typesize, filename, line)
end

function BMSallocClearBufferMemoryArray_call(buffer, num, typesize, filename, line)
    ccall((:BMSallocClearBufferMemoryArray_call, libscip), Ptr{Cvoid}, (Ptr{BMS_BUFMEM}, Csize_t, Csize_t, Ptr{Cchar}, Cint), buffer, num, typesize, filename, line)
end

function BMSreallocBufferMemory_call(buffer, ptr, size, filename, line)
    ccall((:BMSreallocBufferMemory_call, libscip), Ptr{Cvoid}, (Ptr{BMS_BUFMEM}, Ptr{Cvoid}, Csize_t, Ptr{Cchar}, Cint), buffer, ptr, size, filename, line)
end

function BMSreallocBufferMemoryArray_call(buffer, ptr, num, typesize, filename, line)
    ccall((:BMSreallocBufferMemoryArray_call, libscip), Ptr{Cvoid}, (Ptr{BMS_BUFMEM}, Ptr{Cvoid}, Csize_t, Csize_t, Ptr{Cchar}, Cint), buffer, ptr, num, typesize, filename, line)
end

function BMSduplicateBufferMemory_call(buffer, source, size, filename, line)
    ccall((:BMSduplicateBufferMemory_call, libscip), Ptr{Cvoid}, (Ptr{BMS_BUFMEM}, Ptr{Cvoid}, Csize_t, Ptr{Cchar}, Cint), buffer, source, size, filename, line)
end

function BMSduplicateBufferMemoryArray_call(buffer, source, num, typesize, filename, line)
    ccall((:BMSduplicateBufferMemoryArray_call, libscip), Ptr{Cvoid}, (Ptr{BMS_BUFMEM}, Ptr{Cvoid}, Csize_t, Csize_t, Ptr{Cchar}, Cint), buffer, source, num, typesize, filename, line)
end

function BMSfreeBufferMemory_call(buffer, ptr, filename, line)
    ccall((:BMSfreeBufferMemory_call, libscip), Cvoid, (Ptr{BMS_BUFMEM}, Ptr{Ptr{Cvoid}}, Ptr{Cchar}, Cint), buffer, ptr, filename, line)
end

function BMSfreeBufferMemoryNull_call(buffer, ptr, filename, line)
    ccall((:BMSfreeBufferMemoryNull_call, libscip), Cvoid, (Ptr{BMS_BUFMEM}, Ptr{Ptr{Cvoid}}, Ptr{Cchar}, Cint), buffer, ptr, filename, line)
end

function BMSgetNUsedBufferMemory(buffer)
    ccall((:BMSgetNUsedBufferMemory, libscip), Csize_t, (Ptr{BMS_BUFMEM},), buffer)
end

function BMSgetBufferMemoryUsed(bufmem)
    ccall((:BMSgetBufferMemoryUsed, libscip), Clonglong, (Ptr{BMS_BUFMEM},), bufmem)
end

function BMSprintBufferMemory(buffer)
    ccall((:BMSprintBufferMemory, libscip), Cvoid, (Ptr{BMS_BUFMEM},), buffer)
end

@enum SCIP_Pricing::UInt32 begin
    SCIP_PRICING_LPIDEFAULT = 0
    SCIP_PRICING_AUTO = 1
    SCIP_PRICING_FULL = 2
    SCIP_PRICING_PARTIAL = 3
    SCIP_PRICING_STEEP = 4
    SCIP_PRICING_STEEPQSTART = 5
    SCIP_PRICING_DEVEX = 6
end

const SCIP_PRICING = SCIP_Pricing

@enum SCIP_ExprOp::UInt32 begin
    SCIP_EXPR_VARIDX = 1
    SCIP_EXPR_CONST = 2
    SCIP_EXPR_PARAM = 3
    SCIP_EXPR_PLUS = 8
    SCIP_EXPR_MINUS = 9
    SCIP_EXPR_MUL = 10
    SCIP_EXPR_DIV = 11
    SCIP_EXPR_SQUARE = 12
    SCIP_EXPR_SQRT = 13
    SCIP_EXPR_REALPOWER = 14
    SCIP_EXPR_INTPOWER = 15
    SCIP_EXPR_SIGNPOWER = 16
    SCIP_EXPR_EXP = 17
    SCIP_EXPR_LOG = 18
    SCIP_EXPR_SIN = 19
    SCIP_EXPR_COS = 20
    SCIP_EXPR_TAN = 21
    SCIP_EXPR_MIN = 24
    SCIP_EXPR_MAX = 25
    SCIP_EXPR_ABS = 26
    SCIP_EXPR_SIGN = 27
    SCIP_EXPR_SUM = 64
    SCIP_EXPR_PRODUCT = 65
    SCIP_EXPR_LINEAR = 66
    SCIP_EXPR_QUADRATIC = 67
    SCIP_EXPR_POLYNOMIAL = 68
    SCIP_EXPR_USER = 69
    SCIP_EXPR_LAST = 70
end

const SCIP_EXPROP = SCIP_ExprOp

const SCIP_ExprOpData = Cvoid

const SCIP_EXPROPDATA = SCIP_ExprOpData

const SCIP_Expr = Cvoid

const SCIP_EXPR = SCIP_Expr

const SCIP_ExprData_Quadratic = Cvoid

const SCIP_EXPRDATA_QUADRATIC = SCIP_ExprData_Quadratic

const SCIP_ExprData_Monomial = Cvoid

const SCIP_EXPRDATA_MONOMIAL = SCIP_ExprData_Monomial

const SCIP_ExprData_Polynomial = Cvoid

const SCIP_EXPRDATA_POLYNOMIAL = SCIP_ExprData_Polynomial

const SCIP_ExprData_User = Cvoid

const SCIP_EXPRDATA_USER = SCIP_ExprData_User

const SCIP_EXPRBOUNDSTATUS = Cchar

const SCIP_UserExprData = Cvoid

const SCIP_USEREXPRDATA = SCIP_UserExprData

const SCIP_NlpiData = Cvoid

const SCIP_NLPIDATA = SCIP_NlpiData

function SCIPexprcurvAdd(curv1, curv2)
    ccall((:SCIPexprcurvAdd, libscip), SCIP_EXPRCURV, (SCIP_EXPRCURV, SCIP_EXPRCURV), curv1, curv2)
end

function SCIPexprcurvNegate(curvature)
    ccall((:SCIPexprcurvNegate, libscip), SCIP_EXPRCURV, (SCIP_EXPRCURV,), curvature)
end

function SCIPexprcurvMultiply(factor, curvature)
    ccall((:SCIPexprcurvMultiply, libscip), SCIP_EXPRCURV, (Cdouble, SCIP_EXPRCURV), factor, curvature)
end

function SCIPexprcurvPower(basebounds, basecurv, exponent)
    ccall((:SCIPexprcurvPower, libscip), SCIP_EXPRCURV, (SCIP_INTERVAL, SCIP_EXPRCURV, Cdouble), basebounds, basecurv, exponent)
end

function SCIPexprcurvMonomial(nfactors, exponents, factoridxs, factorcurv, factorbounds)
    ccall((:SCIPexprcurvMonomial, libscip), SCIP_EXPRCURV, (Cint, Ptr{Cdouble}, Ptr{Cint}, Ptr{SCIP_EXPRCURV}, Ptr{SCIP_INTERVAL}), nfactors, exponents, factoridxs, factorcurv, factorbounds)
end

function SCIPexprcurvGetName(curv)
    ccall((:SCIPexprcurvGetName, libscip), Ptr{Cchar}, (SCIP_EXPRCURV,), curv)
end

function SCIPexpropGetName(op)
    ccall((:SCIPexpropGetName, libscip), Ptr{Cchar}, (SCIP_EXPROP,), op)
end

function SCIPexpropGetNChildren(op)
    ccall((:SCIPexpropGetNChildren, libscip), Cint, (SCIP_EXPROP,), op)
end

function SCIPexprGetOperator(expr)
    ccall((:SCIPexprGetOperator, libscip), SCIP_EXPROP, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetNChildren(expr)
    ccall((:SCIPexprGetNChildren, libscip), Cint, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetChildren(expr)
    ccall((:SCIPexprGetChildren, libscip), Ptr{Ptr{SCIP_EXPR}}, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetOpIndex(expr)
    ccall((:SCIPexprGetOpIndex, libscip), Cint, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetOpReal(expr)
    ccall((:SCIPexprGetOpReal, libscip), Cdouble, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetOpData(expr)
    ccall((:SCIPexprGetOpData, libscip), Ptr{Cvoid}, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetRealPowerExponent(expr)
    ccall((:SCIPexprGetRealPowerExponent, libscip), Cdouble, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetIntPowerExponent(expr)
    ccall((:SCIPexprGetIntPowerExponent, libscip), Cint, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetSignPowerExponent(expr)
    ccall((:SCIPexprGetSignPowerExponent, libscip), Cdouble, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetLinearCoefs(expr)
    ccall((:SCIPexprGetLinearCoefs, libscip), Ptr{Cdouble}, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetLinearConstant(expr)
    ccall((:SCIPexprGetLinearConstant, libscip), Cdouble, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetQuadElements(expr)
    ccall((:SCIPexprGetQuadElements, libscip), Ptr{SCIP_QUADELEM}, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetQuadConstant(expr)
    ccall((:SCIPexprGetQuadConstant, libscip), Cdouble, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetQuadLinearCoefs(expr)
    ccall((:SCIPexprGetQuadLinearCoefs, libscip), Ptr{Cdouble}, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetNQuadElements(expr)
    ccall((:SCIPexprGetNQuadElements, libscip), Cint, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetMonomials(expr)
    ccall((:SCIPexprGetMonomials, libscip), Ptr{Ptr{SCIP_EXPRDATA_MONOMIAL}}, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetNMonomials(expr)
    ccall((:SCIPexprGetNMonomials, libscip), Cint, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetPolynomialConstant(expr)
    ccall((:SCIPexprGetPolynomialConstant, libscip), Cdouble, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetMonomialCoef(monomial)
    ccall((:SCIPexprGetMonomialCoef, libscip), Cdouble, (Ptr{SCIP_EXPRDATA_MONOMIAL},), monomial)
end

function SCIPexprGetMonomialNFactors(monomial)
    ccall((:SCIPexprGetMonomialNFactors, libscip), Cint, (Ptr{SCIP_EXPRDATA_MONOMIAL},), monomial)
end

function SCIPexprGetMonomialChildIndices(monomial)
    ccall((:SCIPexprGetMonomialChildIndices, libscip), Ptr{Cint}, (Ptr{SCIP_EXPRDATA_MONOMIAL},), monomial)
end

function SCIPexprGetMonomialExponents(monomial)
    ccall((:SCIPexprGetMonomialExponents, libscip), Ptr{Cdouble}, (Ptr{SCIP_EXPRDATA_MONOMIAL},), monomial)
end

function SCIPexprGetUserData(expr)
    ccall((:SCIPexprGetUserData, libscip), Ptr{SCIP_USEREXPRDATA}, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprHasUserEstimator(expr)
    ccall((:SCIPexprHasUserEstimator, libscip), Cuint, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetUserEvalCapability(expr)
    ccall((:SCIPexprGetUserEvalCapability, libscip), SCIP_EXPRINTCAPABILITY, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprCopyDeep(blkmem, targetexpr, sourceexpr)
    ccall((:SCIPexprCopyDeep, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, Ptr{SCIP_EXPR}), blkmem, targetexpr, sourceexpr)
end

function SCIPexprFreeDeep(blkmem, expr)
    ccall((:SCIPexprFreeDeep, libscip), Cvoid, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}), blkmem, expr)
end

function SCIPexprFreeShallow(blkmem, expr)
    ccall((:SCIPexprFreeShallow, libscip), Cvoid, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}), blkmem, expr)
end

function SCIPexprAdd(blkmem, expr, coef1, term1, coef2, term2, constant)
    ccall((:SCIPexprAdd, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, Cdouble, Ptr{SCIP_EXPR}, Cdouble, Ptr{SCIP_EXPR}, Cdouble), blkmem, expr, coef1, term1, coef2, term2, constant)
end

function SCIPexprMulConstant(blkmem, expr, term, factor)
    ccall((:SCIPexprMulConstant, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, Ptr{SCIP_EXPR}, Cdouble), blkmem, expr, term, factor)
end

function SCIPexprCreateLinear(blkmem, expr, nchildren, children, coefs, constant)
    ccall((:SCIPexprCreateLinear, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, Cint, Ptr{Ptr{SCIP_EXPR}}, Ptr{Cdouble}, Cdouble), blkmem, expr, nchildren, children, coefs, constant)
end

function SCIPexprAddToLinear(blkmem, expr, nchildren, coefs, children, constant)
    ccall((:SCIPexprAddToLinear, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPR}, Cint, Ptr{Cdouble}, Ptr{Ptr{SCIP_EXPR}}, Cdouble), blkmem, expr, nchildren, coefs, children, constant)
end

function SCIPexprCreateQuadratic(blkmem, expr, nchildren, children, constant, lincoefs, nquadelems, quadelems)
    ccall((:SCIPexprCreateQuadratic, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, Cint, Ptr{Ptr{SCIP_EXPR}}, Cdouble, Ptr{Cdouble}, Cint, Ptr{SCIP_QUADELEM}), blkmem, expr, nchildren, children, constant, lincoefs, nquadelems, quadelems)
end

function SCIPexprSortQuadElems(expr)
    ccall((:SCIPexprSortQuadElems, libscip), Cvoid, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprCreatePolynomial(blkmem, expr, nchildren, children, nmonomials, monomials, constant, copymonomials)
    ccall((:SCIPexprCreatePolynomial, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, Cint, Ptr{Ptr{SCIP_EXPR}}, Cint, Ptr{Ptr{SCIP_EXPRDATA_MONOMIAL}}, Cdouble, Cuint), blkmem, expr, nchildren, children, nmonomials, monomials, constant, copymonomials)
end

function SCIPexprAddMonomials(blkmem, expr, nmonomials, monomials, copymonomials)
    ccall((:SCIPexprAddMonomials, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPR}, Cint, Ptr{Ptr{SCIP_EXPRDATA_MONOMIAL}}, Cuint), blkmem, expr, nmonomials, monomials, copymonomials)
end

function SCIPexprChgPolynomialConstant(expr, constant)
    ccall((:SCIPexprChgPolynomialConstant, libscip), Cvoid, (Ptr{SCIP_EXPR}, Cdouble), expr, constant)
end

function SCIPexprMultiplyPolynomialByConstant(blkmem, expr, factor)
    ccall((:SCIPexprMultiplyPolynomialByConstant, libscip), Cvoid, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPR}, Cdouble), blkmem, expr, factor)
end

function SCIPexprMultiplyPolynomialByMonomial(blkmem, expr, factor, childmap)
    ccall((:SCIPexprMultiplyPolynomialByMonomial, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPR}, Ptr{SCIP_EXPRDATA_MONOMIAL}, Ptr{Cint}), blkmem, expr, factor, childmap)
end

function SCIPexprMultiplyPolynomialByPolynomial(blkmem, expr, factor, childmap)
    ccall((:SCIPexprMultiplyPolynomialByPolynomial, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPR}, Ptr{SCIP_EXPR}, Ptr{Cint}), blkmem, expr, factor, childmap)
end

function SCIPexprPolynomialPower(blkmem, expr, exponent)
    ccall((:SCIPexprPolynomialPower, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPR}, Cint), blkmem, expr, exponent)
end

function SCIPexprMergeMonomials(blkmem, expr, eps, mergefactors)
    ccall((:SCIPexprMergeMonomials, libscip), Cvoid, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPR}, Cdouble, Cuint), blkmem, expr, eps, mergefactors)
end

function SCIPexprCreateMonomial(blkmem, monomial, coef, nfactors, childidxs, exponents)
    ccall((:SCIPexprCreateMonomial, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRDATA_MONOMIAL}}, Cdouble, Cint, Ptr{Cint}, Ptr{Cdouble}), blkmem, monomial, coef, nfactors, childidxs, exponents)
end

function SCIPexprFreeMonomial(blkmem, monomial)
    ccall((:SCIPexprFreeMonomial, libscip), Cvoid, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRDATA_MONOMIAL}}), blkmem, monomial)
end

function SCIPexprSortMonomialFactors(monomial)
    ccall((:SCIPexprSortMonomialFactors, libscip), Cvoid, (Ptr{SCIP_EXPRDATA_MONOMIAL},), monomial)
end

function SCIPexprFindMonomialFactor(monomial, childidx, pos)
    ccall((:SCIPexprFindMonomialFactor, libscip), Cuint, (Ptr{SCIP_EXPRDATA_MONOMIAL}, Cint, Ptr{Cint}), monomial, childidx, pos)
end

function SCIPexprAreMonomialsEqual(monomial1, monomial2, eps)
    ccall((:SCIPexprAreMonomialsEqual, libscip), Cuint, (Ptr{SCIP_EXPRDATA_MONOMIAL}, Ptr{SCIP_EXPRDATA_MONOMIAL}, Cdouble), monomial1, monomial2, eps)
end

function SCIPexprAddMonomialFactors(blkmem, monomial, nfactors, childidxs, exponents)
    ccall((:SCIPexprAddMonomialFactors, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPRDATA_MONOMIAL}, Cint, Ptr{Cint}, Ptr{Cdouble}), blkmem, monomial, nfactors, childidxs, exponents)
end

function SCIPexprChgMonomialCoef(monomial, newcoef)
    ccall((:SCIPexprChgMonomialCoef, libscip), Cvoid, (Ptr{SCIP_EXPRDATA_MONOMIAL}, Cdouble), monomial, newcoef)
end

function SCIPexprMultiplyMonomialByMonomial(blkmem, monomial, factor, childmap)
    ccall((:SCIPexprMultiplyMonomialByMonomial, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPRDATA_MONOMIAL}, Ptr{SCIP_EXPRDATA_MONOMIAL}, Ptr{Cint}), blkmem, monomial, factor, childmap)
end

function SCIPexprMonomialPower(monomial, exponent)
    ccall((:SCIPexprMonomialPower, libscip), Cvoid, (Ptr{SCIP_EXPRDATA_MONOMIAL}, Cint), monomial, exponent)
end

function SCIPexprMergeMonomialFactors(monomial, eps)
    ccall((:SCIPexprMergeMonomialFactors, libscip), Cvoid, (Ptr{SCIP_EXPRDATA_MONOMIAL}, Cdouble), monomial, eps)
end

function SCIPexprSortMonomials(expr)
    ccall((:SCIPexprSortMonomials, libscip), Cvoid, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprCreateUser(blkmem, expr, nchildren, children, data, evalcapability, eval, inteval, curv, prop, estimate, copydata, freedata, print)
    ccall((:SCIPexprCreateUser, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPR}}, Cint, Ptr{Ptr{SCIP_EXPR}}, Ptr{SCIP_USEREXPRDATA}, SCIP_EXPRINTCAPABILITY, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), blkmem, expr, nchildren, children, data, evalcapability, eval, inteval, curv, prop, estimate, copydata, freedata, print)
end

function SCIPexprHasParam(expr)
    ccall((:SCIPexprHasParam, libscip), Cuint, (Ptr{SCIP_EXPR},), expr)
end

function SCIPexprGetMaxDegree(expr, maxdegree)
    ccall((:SCIPexprGetMaxDegree, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPR}, Ptr{Cint}), expr, maxdegree)
end

function SCIPexprGetVarsUsage(expr, varsusage)
    ccall((:SCIPexprGetVarsUsage, libscip), Cvoid, (Ptr{SCIP_EXPR}, Ptr{Cint}), expr, varsusage)
end

function SCIPexprAreEqual(expr1, expr2, eps)
    ccall((:SCIPexprAreEqual, libscip), Cuint, (Ptr{SCIP_EXPR}, Ptr{SCIP_EXPR}, Cdouble), expr1, expr2, eps)
end

function SCIPexprSimplify(blkmem, messagehdlr, expr, eps, maxexpansionexponent, nvars, nlinvars, linidxs, lincoefs)
    ccall((:SCIPexprSimplify, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_MESSAGEHDLR}, Ptr{SCIP_EXPR}, Cdouble, Cint, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}), blkmem, messagehdlr, expr, eps, maxexpansionexponent, nvars, nlinvars, linidxs, lincoefs)
end

function SCIPexprEvalShallow(expr, argvals, varvals, param, val)
    ccall((:SCIPexprEvalShallow, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPR}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), expr, argvals, varvals, param, val)
end

function SCIPexprEval(expr, varvals, param, val)
    ccall((:SCIPexprEval, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPR}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), expr, varvals, param, val)
end

function SCIPexprEvalIntShallow(expr, infinity, argvals, varvals, param, val)
    ccall((:SCIPexprEvalIntShallow, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPR}, Cdouble, Ptr{SCIP_INTERVAL}, Ptr{SCIP_INTERVAL}, Ptr{Cdouble}, Ptr{SCIP_INTERVAL}), expr, infinity, argvals, varvals, param, val)
end

function SCIPexprEvalInt(expr, infinity, varvals, param, val)
    ccall((:SCIPexprEvalInt, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPR}, Cdouble, Ptr{SCIP_INTERVAL}, Ptr{Cdouble}, Ptr{SCIP_INTERVAL}), expr, infinity, varvals, param, val)
end

function SCIPexprEvalUser(expr, argvals, val, gradient, hessian)
    ccall((:SCIPexprEvalUser, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPR}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), expr, argvals, val, gradient, hessian)
end

function SCIPexprEvalIntUser(expr, infinity, argvals, val, gradient, hessian)
    ccall((:SCIPexprEvalIntUser, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPR}, Cdouble, Ptr{SCIP_INTERVAL}, Ptr{SCIP_INTERVAL}, Ptr{SCIP_INTERVAL}, Ptr{SCIP_INTERVAL}), expr, infinity, argvals, val, gradient, hessian)
end

function SCIPexprCheckCurvature(expr, infinity, varbounds, param, curv, bounds)
    ccall((:SCIPexprCheckCurvature, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPR}, Cdouble, Ptr{SCIP_INTERVAL}, Ptr{Cdouble}, Ptr{SCIP_EXPRCURV}, Ptr{SCIP_INTERVAL}), expr, infinity, varbounds, param, curv, bounds)
end

function SCIPexprEstimateUser(expr, infinity, argvals, argbounds, overestimate, coeffs, constant, success)
    ccall((:SCIPexprEstimateUser, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPR}, Cdouble, Ptr{Cdouble}, Ptr{SCIP_INTERVAL}, Cuint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cuint}), expr, infinity, argvals, argbounds, overestimate, coeffs, constant, success)
end

function SCIPexprSubstituteVars(blkmem, expr, substexprs)
    ccall((:SCIPexprSubstituteVars, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPR}, Ptr{Ptr{SCIP_EXPR}}), blkmem, expr, substexprs)
end

function SCIPexprReindexVars(expr, newindices)
    ccall((:SCIPexprReindexVars, libscip), Cvoid, (Ptr{SCIP_EXPR}, Ptr{Cint}), expr, newindices)
end

function SCIPexprReindexParams(expr, newindices)
    ccall((:SCIPexprReindexParams, libscip), Cvoid, (Ptr{SCIP_EXPR}, Ptr{Cint}), expr, newindices)
end

function SCIPexprPrint(expr, messagehdlr, file, varnames, paramnames, paramvals)
    ccall((:SCIPexprPrint, libscip), Cvoid, (Ptr{SCIP_EXPR}, Ptr{SCIP_MESSAGEHDLR}, Ptr{Libc.FILE}, Ptr{Ptr{Cchar}}, Ptr{Ptr{Cchar}}, Ptr{Cdouble}), expr, messagehdlr, file, varnames, paramnames, paramvals)
end

function SCIPexprParse(blkmem, messagehdlr, expr, str, lastchar, nvars, varnames, varnameslength)
    ccall((:SCIPexprParse, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_MESSAGEHDLR}, Ptr{Ptr{SCIP_EXPR}}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cint}, Ptr{Cint}, Cint), blkmem, messagehdlr, expr, str, lastchar, nvars, varnames, varnameslength)
end

function SCIPexprtreeGetRoot(tree)
    ccall((:SCIPexprtreeGetRoot, libscip), Ptr{SCIP_EXPR}, (Ptr{SCIP_EXPRTREE},), tree)
end

function SCIPexprtreeGetNVars(tree)
    ccall((:SCIPexprtreeGetNVars, libscip), Cint, (Ptr{SCIP_EXPRTREE},), tree)
end

function SCIPexprtreeGetNParams(tree)
    ccall((:SCIPexprtreeGetNParams, libscip), Cint, (Ptr{SCIP_EXPRTREE},), tree)
end

function SCIPexprtreeGetParamVals(tree)
    ccall((:SCIPexprtreeGetParamVals, libscip), Ptr{Cdouble}, (Ptr{SCIP_EXPRTREE},), tree)
end

function SCIPexprtreeSetParamVal(tree, paramidx, paramval)
    ccall((:SCIPexprtreeSetParamVal, libscip), Cvoid, (Ptr{SCIP_EXPRTREE}, Cint, Cdouble), tree, paramidx, paramval)
end

function SCIPexprtreeGetInterpreterData(tree)
    ccall((:SCIPexprtreeGetInterpreterData, libscip), Ptr{SCIP_EXPRINTDATA}, (Ptr{SCIP_EXPRTREE},), tree)
end

function SCIPexprtreeSetInterpreterData(tree, interpreterdata)
    ccall((:SCIPexprtreeSetInterpreterData, libscip), Cvoid, (Ptr{SCIP_EXPRTREE}, Ptr{SCIP_EXPRINTDATA}), tree, interpreterdata)
end

function SCIPexprtreeFreeInterpreterData(tree)
    ccall((:SCIPexprtreeFreeInterpreterData, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE},), tree)
end

function SCIPexprtreeHasParam(tree)
    ccall((:SCIPexprtreeHasParam, libscip), Cuint, (Ptr{SCIP_EXPRTREE},), tree)
end

function SCIPexprtreeGetMaxDegree(tree, maxdegree)
    ccall((:SCIPexprtreeGetMaxDegree, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Ptr{Cint}), tree, maxdegree)
end

function SCIPexprtreeEval(tree, varvals, val)
    ccall((:SCIPexprtreeEval, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Ptr{Cdouble}, Ptr{Cdouble}), tree, varvals, val)
end

function SCIPexprtreeEvalInt(tree, infinity, varvals, val)
    ccall((:SCIPexprtreeEvalInt, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Cdouble, Ptr{SCIP_INTERVAL}, Ptr{SCIP_INTERVAL}), tree, infinity, varvals, val)
end

function SCIPexprtreePrint(tree, messagehdlr, file, varnames, paramnames)
    ccall((:SCIPexprtreePrint, libscip), Cvoid, (Ptr{SCIP_EXPRTREE}, Ptr{SCIP_MESSAGEHDLR}, Ptr{Libc.FILE}, Ptr{Ptr{Cchar}}, Ptr{Ptr{Cchar}}), tree, messagehdlr, file, varnames, paramnames)
end

function SCIPexprtreeCreate(blkmem, tree, root, nvars, nparams, params)
    ccall((:SCIPexprtreeCreate, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRTREE}}, Ptr{SCIP_EXPR}, Cint, Cint, Ptr{Cdouble}), blkmem, tree, root, nvars, nparams, params)
end

function SCIPexprtreeCopy(blkmem, targettree, sourcetree)
    ccall((:SCIPexprtreeCopy, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRTREE}}, Ptr{SCIP_EXPRTREE}), blkmem, targettree, sourcetree)
end

function SCIPexprtreeFree(tree)
    ccall((:SCIPexprtreeFree, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_EXPRTREE}},), tree)
end

function SCIPexprtreeSetParams(tree, nparams, paramvals)
    ccall((:SCIPexprtreeSetParams, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Cint, Ptr{Cdouble}), tree, nparams, paramvals)
end

function SCIPexprtreeGetVarsUsage(tree, varsusage)
    ccall((:SCIPexprtreeGetVarsUsage, libscip), Cvoid, (Ptr{SCIP_EXPRTREE}, Ptr{Cint}), tree, varsusage)
end

function SCIPexprtreeSimplify(tree, messagehdlr, eps, maxexpansionexponent, nlinvars, linidxs, lincoefs)
    ccall((:SCIPexprtreeSimplify, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Ptr{SCIP_MESSAGEHDLR}, Cdouble, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}), tree, messagehdlr, eps, maxexpansionexponent, nlinvars, linidxs, lincoefs)
end

function SCIPexprtreeAddExpr(tree, expr, copyexpr)
    ccall((:SCIPexprtreeAddExpr, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Ptr{SCIP_EXPR}, Cuint), tree, expr, copyexpr)
end

function SCIPexprtreeCheckCurvature(tree, infinity, varbounds, curv, bounds)
    ccall((:SCIPexprtreeCheckCurvature, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Cdouble, Ptr{SCIP_INTERVAL}, Ptr{SCIP_EXPRCURV}, Ptr{SCIP_INTERVAL}), tree, infinity, varbounds, curv, bounds)
end

function SCIPexprtreeSubstituteVars(tree, substexprs)
    ccall((:SCIPexprtreeSubstituteVars, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRTREE}, Ptr{Ptr{SCIP_EXPR}}), tree, substexprs)
end

function SCIPquadelemSort(quadelems, nquadelems)
    ccall((:SCIPquadelemSort, libscip), Cvoid, (Ptr{SCIP_QUADELEM}, Cint), quadelems, nquadelems)
end

function SCIPquadelemSortedFind(quadelems, idx1, idx2, nquadelems, pos)
    ccall((:SCIPquadelemSortedFind, libscip), Cuint, (Ptr{SCIP_QUADELEM}, Cint, Cint, Cint, Ptr{Cint}), quadelems, idx1, idx2, nquadelems, pos)
end

function SCIPquadelemSqueeze(quadelems, nquadelems, nquadelemsnew)
    ccall((:SCIPquadelemSqueeze, libscip), Cvoid, (Ptr{SCIP_QUADELEM}, Cint, Ptr{Cint}), quadelems, nquadelems, nquadelemsnew)
end

function SCIPexprgraphCaptureNode(node)
    ccall((:SCIPexprgraphCaptureNode, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphIsNodeEnabled(node)
    ccall((:SCIPexprgraphIsNodeEnabled, libscip), Cuint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeNChildren(node)
    ccall((:SCIPexprgraphGetNodeNChildren, libscip), Cint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeChildren(node)
    ccall((:SCIPexprgraphGetNodeChildren, libscip), Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeNParents(node)
    ccall((:SCIPexprgraphGetNodeNParents, libscip), Cint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeParents(node)
    ccall((:SCIPexprgraphGetNodeParents, libscip), Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeDepth(node)
    ccall((:SCIPexprgraphGetNodeDepth, libscip), Cint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodePosition(node)
    ccall((:SCIPexprgraphGetNodePosition, libscip), Cint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeOperator(node)
    ccall((:SCIPexprgraphGetNodeOperator, libscip), SCIP_EXPROP, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeOperatorIndex(node)
    ccall((:SCIPexprgraphGetNodeOperatorIndex, libscip), Cint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeOperatorReal(node)
    ccall((:SCIPexprgraphGetNodeOperatorReal, libscip), Cdouble, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeVar(exprgraph, node)
    ccall((:SCIPexprgraphGetNodeVar, libscip), Ptr{Cvoid}, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}), exprgraph, node)
end

function SCIPexprgraphGetNodeRealPowerExponent(node)
    ccall((:SCIPexprgraphGetNodeRealPowerExponent, libscip), Cdouble, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeIntPowerExponent(node)
    ccall((:SCIPexprgraphGetNodeIntPowerExponent, libscip), Cint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeSignPowerExponent(node)
    ccall((:SCIPexprgraphGetNodeSignPowerExponent, libscip), Cdouble, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeLinearCoefs(node)
    ccall((:SCIPexprgraphGetNodeLinearCoefs, libscip), Ptr{Cdouble}, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeLinearConstant(node)
    ccall((:SCIPexprgraphGetNodeLinearConstant, libscip), Cdouble, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeQuadraticConstant(node)
    ccall((:SCIPexprgraphGetNodeQuadraticConstant, libscip), Cdouble, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeQuadraticLinearCoefs(node)
    ccall((:SCIPexprgraphGetNodeQuadraticLinearCoefs, libscip), Ptr{Cdouble}, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeQuadraticQuadElements(node)
    ccall((:SCIPexprgraphGetNodeQuadraticQuadElements, libscip), Ptr{SCIP_QUADELEM}, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeQuadraticNQuadElements(node)
    ccall((:SCIPexprgraphGetNodeQuadraticNQuadElements, libscip), Cint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodePolynomialMonomials(node)
    ccall((:SCIPexprgraphGetNodePolynomialMonomials, libscip), Ptr{Ptr{SCIP_EXPRDATA_MONOMIAL}}, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodePolynomialNMonomials(node)
    ccall((:SCIPexprgraphGetNodePolynomialNMonomials, libscip), Cint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodePolynomialConstant(node)
    ccall((:SCIPexprgraphGetNodePolynomialConstant, libscip), Cdouble, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodePolynomialMonomialCurvature(node, monomialidx, infinity, curv)
    ccall((:SCIPexprgraphGetNodePolynomialMonomialCurvature, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPHNODE}, Cint, Cdouble, Ptr{SCIP_EXPRCURV}), node, monomialidx, infinity, curv)
end

function SCIPexprgraphGetNodeUserData(node)
    ccall((:SCIPexprgraphGetNodeUserData, libscip), Ptr{SCIP_USEREXPRDATA}, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphHasNodeUserEstimator(node)
    ccall((:SCIPexprgraphHasNodeUserEstimator, libscip), Cuint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeBounds(node)
    ccall((:SCIPexprgraphGetNodeBounds, libscip), SCIP_INTERVAL, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeVal(node)
    ccall((:SCIPexprgraphGetNodeVal, libscip), Cdouble, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetNodeCurvature(node)
    ccall((:SCIPexprgraphGetNodeCurvature, libscip), SCIP_EXPRCURV, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphCreateNodeLinear(blkmem, node, ncoefs, coefs, constant)
    ccall((:SCIPexprgraphCreateNodeLinear, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, Cint, Ptr{Cdouble}, Cdouble), blkmem, node, ncoefs, coefs, constant)
end

function SCIPexprgraphCreateNodeQuadratic(blkmem, node, nchildren, lincoefs, nquadelems, quadelems, constant)
    ccall((:SCIPexprgraphCreateNodeQuadratic, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, Cint, Ptr{Cdouble}, Cint, Ptr{SCIP_QUADELEM}, Cdouble), blkmem, node, nchildren, lincoefs, nquadelems, quadelems, constant)
end

function SCIPexprgraphCreateNodePolynomial(blkmem, node, nmonomials, monomials, constant, copymonomials)
    ccall((:SCIPexprgraphCreateNodePolynomial, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, Cint, Ptr{Ptr{SCIP_EXPRDATA_MONOMIAL}}, Cdouble, Cuint), blkmem, node, nmonomials, monomials, constant, copymonomials)
end

function SCIPexprgraphNodePolynomialAddMonomials(blkmem, node, nmonomials, monomials, copymonomials)
    ccall((:SCIPexprgraphNodePolynomialAddMonomials, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{SCIP_EXPRGRAPHNODE}, Cint, Ptr{Ptr{SCIP_EXPRDATA_MONOMIAL}}, Cuint), blkmem, node, nmonomials, monomials, copymonomials)
end

function SCIPexprgraphCreateNodeUser(blkmem, node, data, evalcapability, eval, inteval, curv, prop, estimate, copydata, freedata, print)
    ccall((:SCIPexprgraphCreateNodeUser, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, Ptr{SCIP_USEREXPRDATA}, SCIP_EXPRINTCAPABILITY, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), blkmem, node, data, evalcapability, eval, inteval, curv, prop, estimate, copydata, freedata, print)
end

function SCIPexprgraphNodeSplitOffLinear(exprgraph, node, linvarssize, nlinvars, linvars, lincoefs, constant)
    ccall((:SCIPexprgraphNodeSplitOffLinear, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, Cint, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{Cdouble}, Ptr{Cdouble}), exprgraph, node, linvarssize, nlinvars, linvars, lincoefs, constant)
end

function SCIPexprgraphMoveNodeParents(exprgraph, srcnode, targetnode)
    ccall((:SCIPexprgraphMoveNodeParents, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, Ptr{SCIP_EXPRGRAPHNODE}), exprgraph, srcnode, targetnode)
end

function SCIPexprgraphReleaseNode(exprgraph, node)
    ccall((:SCIPexprgraphReleaseNode, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}), exprgraph, node)
end

function SCIPexprgraphFreeNode(blkmem, node)
    ccall((:SCIPexprgraphFreeNode, libscip), Cvoid, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}), blkmem, node)
end

function SCIPexprgraphEnableNode(exprgraph, node)
    ccall((:SCIPexprgraphEnableNode, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}), exprgraph, node)
end

function SCIPexprgraphDisableNode(exprgraph, node)
    ccall((:SCIPexprgraphDisableNode, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}), exprgraph, node)
end

function SCIPexprgraphHasNodeSibling(node)
    ccall((:SCIPexprgraphHasNodeSibling, libscip), Cuint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphAreAllNodeChildrenVars(node)
    ccall((:SCIPexprgraphAreAllNodeChildrenVars, libscip), Cuint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphHasNodeNonlinearAncestor(node)
    ccall((:SCIPexprgraphHasNodeNonlinearAncestor, libscip), Cuint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphPrintNode(node, messagehdlr, file)
    ccall((:SCIPexprgraphPrintNode, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPHNODE}, Ptr{SCIP_MESSAGEHDLR}, Ptr{Libc.FILE}), node, messagehdlr, file)
end

function SCIPexprgraphTightenNodeBounds(exprgraph, node, nodebounds, minstrength, infinity, cutoff)
    ccall((:SCIPexprgraphTightenNodeBounds, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}, SCIP_INTERVAL, Cdouble, Cdouble, Ptr{Cuint}), exprgraph, node, nodebounds, minstrength, infinity, cutoff)
end

function SCIPexprgraphUpdateNodeBoundsCurvature(node, infinity, minstrength, clearreverseprop)
    ccall((:SCIPexprgraphUpdateNodeBoundsCurvature, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPHNODE}, Cdouble, Cdouble, Cuint), node, infinity, minstrength, clearreverseprop)
end

function SCIPexprgraphGetDepth(exprgraph)
    ccall((:SCIPexprgraphGetDepth, libscip), Cint, (Ptr{SCIP_EXPRGRAPH},), exprgraph)
end

function SCIPexprgraphGetNNodes(exprgraph)
    ccall((:SCIPexprgraphGetNNodes, libscip), Ptr{Cint}, (Ptr{SCIP_EXPRGRAPH},), exprgraph)
end

function SCIPexprgraphGetNodes(exprgraph)
    ccall((:SCIPexprgraphGetNodes, libscip), Ptr{Ptr{Ptr{SCIP_EXPRGRAPHNODE}}}, (Ptr{SCIP_EXPRGRAPH},), exprgraph)
end

function SCIPexprgraphGetNVars(exprgraph)
    ccall((:SCIPexprgraphGetNVars, libscip), Cint, (Ptr{SCIP_EXPRGRAPH},), exprgraph)
end

function SCIPexprgraphGetVars(exprgraph)
    ccall((:SCIPexprgraphGetVars, libscip), Ptr{Ptr{Cvoid}}, (Ptr{SCIP_EXPRGRAPH},), exprgraph)
end

function SCIPexprgraphGetVarNodes(exprgraph)
    ccall((:SCIPexprgraphGetVarNodes, libscip), Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, (Ptr{SCIP_EXPRGRAPH},), exprgraph)
end

function SCIPexprgraphSetVarNodeValue(varnode, value)
    ccall((:SCIPexprgraphSetVarNodeValue, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPHNODE}, Cdouble), varnode, value)
end

function SCIPexprgraphSetVarsBounds(exprgraph, varbounds)
    ccall((:SCIPexprgraphSetVarsBounds, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_INTERVAL}), exprgraph, varbounds)
end

function SCIPexprgraphSetVarBounds(exprgraph, var, varbounds)
    ccall((:SCIPexprgraphSetVarBounds, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Ptr{Cvoid}, SCIP_INTERVAL), exprgraph, var, varbounds)
end

function SCIPexprgraphSetVarNodeBounds(exprgraph, varnode, varbounds)
    ccall((:SCIPexprgraphSetVarNodeBounds, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}, SCIP_INTERVAL), exprgraph, varnode, varbounds)
end

function SCIPexprgraphSetVarNodeLb(exprgraph, varnode, lb)
    ccall((:SCIPexprgraphSetVarNodeLb, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}, Cdouble), exprgraph, varnode, lb)
end

function SCIPexprgraphSetVarNodeUb(exprgraph, varnode, ub)
    ccall((:SCIPexprgraphSetVarNodeUb, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}, Cdouble), exprgraph, varnode, ub)
end

function SCIPexprgraphGetVarsBounds(exprgraph)
    ccall((:SCIPexprgraphGetVarsBounds, libscip), Ptr{SCIP_INTERVAL}, (Ptr{SCIP_EXPRGRAPH},), exprgraph)
end

function SCIPexprgraphCreate(blkmem, exprgraph, varssizeinit, depthinit, exprgraphvaradded, exprgraphvarremove, exprgraphvarchgidx, userdata)
    ccall((:SCIPexprgraphCreate, libscip), SCIP_RETCODE, (Ptr{BMS_BLKMEM}, Ptr{Ptr{SCIP_EXPRGRAPH}}, Cint, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), blkmem, exprgraph, varssizeinit, depthinit, exprgraphvaradded, exprgraphvarremove, exprgraphvarchgidx, userdata)
end

function SCIPexprgraphFree(exprgraph)
    ccall((:SCIPexprgraphFree, libscip), SCIP_RETCODE, (Ptr{Ptr{SCIP_EXPRGRAPH}},), exprgraph)
end

function SCIPexprgraphAddNode(exprgraph, node, mindepth, nchildren, children)
    ccall((:SCIPexprgraphAddNode, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}, Cint, Cint, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}), exprgraph, node, mindepth, nchildren, children)
end

function SCIPexprgraphAddVars(exprgraph, nvars, vars, varnodes)
    ccall((:SCIPexprgraphAddVars, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Cint, Ptr{Ptr{Cvoid}}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}), exprgraph, nvars, vars, varnodes)
end

function SCIPexprgraphAddConst(exprgraph, constant, constnode)
    ccall((:SCIPexprgraphAddConst, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Cdouble, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}), exprgraph, constant, constnode)
end

function SCIPexprgraphAddExprtreeSum(exprgraph, nexprtrees, exprtrees, coefs, rootnode, rootnodeisnew)
    ccall((:SCIPexprgraphAddExprtreeSum, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Cint, Ptr{Ptr{SCIP_EXPRTREE}}, Ptr{Cdouble}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}, Ptr{Cuint}), exprgraph, nexprtrees, exprtrees, coefs, rootnode, rootnodeisnew)
end

function SCIPexprgraphReplaceVarByLinearSum(exprgraph, var, ncoefs, coefs, vars, constant)
    ccall((:SCIPexprgraphReplaceVarByLinearSum, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{Cvoid}, Cint, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Cdouble), exprgraph, var, ncoefs, coefs, vars, constant)
end

function SCIPexprgraphFindVarNode(exprgraph, var, varnode)
    ccall((:SCIPexprgraphFindVarNode, libscip), Cuint, (Ptr{SCIP_EXPRGRAPH}, Ptr{Cvoid}, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}), exprgraph, var, varnode)
end

function SCIPexprgraphFindConstNode(exprgraph, constant, constnode)
    ccall((:SCIPexprgraphFindConstNode, libscip), Cuint, (Ptr{SCIP_EXPRGRAPH}, Cdouble, Ptr{Ptr{SCIP_EXPRGRAPHNODE}}), exprgraph, constant, constnode)
end

function SCIPexprgraphPrintDot(exprgraph, messagehdlr, file, varnames)
    ccall((:SCIPexprgraphPrintDot, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_MESSAGEHDLR}, Ptr{Libc.FILE}, Ptr{Ptr{Cchar}}), exprgraph, messagehdlr, file, varnames)
end

function SCIPexprgraphEval(exprgraph, varvals)
    ccall((:SCIPexprgraphEval, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{Cdouble}), exprgraph, varvals)
end

function SCIPexprgraphPropagateVarBounds(exprgraph, infinity, clearreverseprop, domainerror)
    ccall((:SCIPexprgraphPropagateVarBounds, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Cdouble, Cuint, Ptr{Cuint}), exprgraph, infinity, clearreverseprop, domainerror)
end

function SCIPexprgraphPropagateNodeBounds(exprgraph, infinity, minstrength, cutoff)
    ccall((:SCIPexprgraphPropagateNodeBounds, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Cdouble, Cdouble, Ptr{Cuint}), exprgraph, infinity, minstrength, cutoff)
end

function SCIPexprgraphCheckCurvature(exprgraph, infinity, clearreverseprop)
    ccall((:SCIPexprgraphCheckCurvature, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Cdouble, Cuint), exprgraph, infinity, clearreverseprop)
end

function SCIPexprgraphSimplify(exprgraph, messagehdlr, eps, maxexpansionexponent, havechange, domainerror)
    ccall((:SCIPexprgraphSimplify, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_MESSAGEHDLR}, Cdouble, Cint, Ptr{Cuint}, Ptr{Cuint}), exprgraph, messagehdlr, eps, maxexpansionexponent, havechange, domainerror)
end

function SCIPexprgraphGetTree(exprgraph, rootnode, exprtree)
    ccall((:SCIPexprgraphGetTree, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}, Ptr{Ptr{SCIP_EXPRTREE}}), exprgraph, rootnode, exprtree)
end

function SCIPexprgraphGetSeparableTrees(exprgraph, node, exprtreessize, nexprtrees, exprtrees, exprtreecoefs)
    ccall((:SCIPexprgraphGetSeparableTrees, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}, Cint, Ptr{Cint}, Ptr{Ptr{SCIP_EXPRTREE}}, Ptr{Cdouble}), exprgraph, node, exprtreessize, nexprtrees, exprtrees, exprtreecoefs)
end

function SCIPexprgraphGetSubtreeVarsUsage(exprgraph, node, varsusage)
    ccall((:SCIPexprgraphGetSubtreeVarsUsage, libscip), Cvoid, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}, Ptr{Cint}), exprgraph, node, varsusage)
end

function SCIPexprgraphGetSumTreesNSummands(node)
    ccall((:SCIPexprgraphGetSumTreesNSummands, libscip), Cint, (Ptr{SCIP_EXPRGRAPHNODE},), node)
end

function SCIPexprgraphGetSumTrees(exprgraph, node, exprtreessize, nexprtrees, exprtrees, exprtreecoefs)
    ccall((:SCIPexprgraphGetSumTrees, libscip), SCIP_RETCODE, (Ptr{SCIP_EXPRGRAPH}, Ptr{SCIP_EXPRGRAPHNODE}, Cint, Ptr{Cint}, Ptr{Ptr{SCIP_EXPRTREE}}, Ptr{Cdouble}), exprgraph, node, exprtreessize, nexprtrees, exprtrees, exprtreecoefs)
end

const CMAKE_BUILD_TYPE = "Release"

const SCIP_VERSION_MAJOR = 7

const SCIP_VERSION_MINOR = 0

const SCIP_VERSION_PATCH = 2

const SCIP_VERSION_SUB = 0

const SCIP_VERSION_API = 68

# Skipping MacroDefinition: SCIP_EXPORT __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: SCIP_NO_EXPORT __attribute__ ( ( visibility ( "hidden" ) ) )

# Skipping MacroDefinition: SCIP_DEPRECATED __attribute__ ( ( __deprecated__ ) )

const SCIP_HAVE_VARIADIC_MACROS = 1

const SCIP_Bool = Cuint

const TRUE = 1

const FALSE = 0

const SCIP_Shortbool = uint8_t

# Skipping MacroDefinition: SCIPdebugMessage while ( FALSE ) /*lint -e{530}*/ printf

# Skipping MacroDefinition: SCIPdebugPrintf while ( FALSE ) /*lint -e{530}*/ printf

# Skipping MacroDefinition: SCIPstatisticMessage while ( FALSE ) /*lint -e{530}*/ printf

# Skipping MacroDefinition: SCIPstatisticPrintf while ( FALSE ) /*lint -e{530}*/ printf

const SCIP_VERSION = 702

const SCIP_SUBVERSION = 0

const SCIP_APIVERSION = 68

const SCIP_COPYRIGHT = "Copyright (C) 2002-2020 Konrad-Zuse-Zentrum fuer Informationstechnik Berlin (ZIB)"

const SCIP_VARTYPE_BINARY_CHAR = Cchar('B')

const SCIP_VARTYPE_INTEGER_CHAR = Cchar('I')

const SCIP_VARTYPE_IMPLINT_CHAR = Cchar('M')

const SCIP_VARTYPE_CONTINUOUS_CHAR = Cchar('C')

const SCIP_Longint = Clonglong

const SCIP_LONGINT_MAX = LLONG_MAX

const SCIP_LONGINT_MIN = LLONG_MIN

const SCIP_LONGINT_FORMAT = "lld"

const SCIP_Real = Float64

const SCIP_REAL_MAX = SCIP_Real(DBL_MAX)

const SCIP_REAL_MIN = -(SCIP_Real(DBL_MAX))

const SCIP_REAL_FORMAT = "lf"

const SCIP_DEFAULT_INFINITY = 1.0e20

const SCIP_DEFAULT_EPSILON = 1.0e-9

const SCIP_DEFAULT_SUMEPSILON = 1.0e-6

const SCIP_DEFAULT_FEASTOL = 1.0e-6

const SCIP_DEFAULT_CHECKFEASTOLFAC = 1.0

const SCIP_DEFAULT_LPFEASTOLFACTOR = 1.0

const SCIP_DEFAULT_DUALFEASTOL = 1.0e-7

const SCIP_DEFAULT_BARRIERCONVTOL = 1.0e-10

const SCIP_DEFAULT_BOUNDSTREPS = 0.05

const SCIP_DEFAULT_PSEUDOCOSTEPS = 0.1

const SCIP_DEFAULT_PSEUDOCOSTDELTA = 0.0001

const SCIP_DEFAULT_RECOMPFAC = 1.0e7

const SCIP_DEFAULT_HUGEVAL = 1.0e15

const SCIP_MAXEPSILON = 0.001

const SCIP_MINEPSILON = 1.0e-20

const SCIP_INVALID = Float64(1.0e99)

const SCIP_UNKNOWN = Float64(1.0e98)

const COPYSIGN = copysign

const SCIP_MAXSTRLEN = 1024

const SCIP_MAXMEMSIZE = SIZE_MAX ÷ 2

const SCIP_HASHSIZE_PARAMS = 2048

const SCIP_HASHSIZE_NAMES = 500

const SCIP_HASHSIZE_CUTPOOLS = 500

const SCIP_HASHSIZE_CLIQUES = 500

const SCIP_HASHSIZE_NAMES_SMALL = 100

const SCIP_HASHSIZE_CUTPOOLS_SMALL = 100

const SCIP_HASHSIZE_CLIQUES_SMALL = 100

const SCIP_HASHSIZE_VBC = 500

const SCIP_DEFAULT_MEM_ARRAYGROWFAC = 1.2

const SCIP_DEFAULT_MEM_ARRAYGROWINIT = 4

const SCIP_MEM_NOLIMIT = SCIP_Longint(SCIP_LONGINT_MAX >> 20)

const SCIP_MAXTREEDEPTH = 65534

const SCIP_PROBINGSCORE_PENALTYRATIO = 2

const SCIP_PRESOLTIMING_NONE = Cuint(0x0002)

const SCIP_PRESOLTIMING_FAST = Cuint(0x0004)

const SCIP_PRESOLTIMING_MEDIUM = Cuint(0x0008)

const SCIP_PRESOLTIMING_EXHAUSTIVE = Cuint(0x0010)

const SCIP_PRESOLTIMING_FINAL = Cuint(0x0020)

const SCIP_PRESOLTIMING_ALWAYS = (SCIP_PRESOLTIMING_FAST | SCIP_PRESOLTIMING_MEDIUM) | SCIP_PRESOLTIMING_EXHAUSTIVE

const SCIP_PRESOLTIMING_MAX = ((SCIP_PRESOLTIMING_FAST | SCIP_PRESOLTIMING_MEDIUM) | SCIP_PRESOLTIMING_EXHAUSTIVE) | SCIP_PRESOLTIMING_FINAL

const SCIP_PROPTIMING_BEFORELP = Cuint(0x0001)

const SCIP_PROPTIMING_DURINGLPLOOP = Cuint(0x0002)

const SCIP_PROPTIMING_AFTERLPLOOP = Cuint(0x0004)

const SCIP_PROPTIMING_AFTERLPNODE = Cuint(0x0008)

const SCIP_PROPTIMING_ALWAYS = ((SCIP_PROPTIMING_BEFORELP | SCIP_PROPTIMING_DURINGLPLOOP) | SCIP_PROPTIMING_AFTERLPLOOP) | SCIP_PROPTIMING_AFTERLPNODE

const SCIP_HEURTIMING_BEFORENODE = Cuint(0x0001)

const SCIP_HEURTIMING_DURINGLPLOOP = Cuint(0x0002)

const SCIP_HEURTIMING_AFTERLPLOOP = Cuint(0x0004)

const SCIP_HEURTIMING_AFTERLPNODE = Cuint(0x0008)

const SCIP_HEURTIMING_AFTERPSEUDONODE = Cuint(0x0010)

const SCIP_HEURTIMING_AFTERLPPLUNGE = Cuint(0x0020)

const SCIP_HEURTIMING_AFTERPSEUDOPLUNGE = Cuint(0x0040)

const SCIP_HEURTIMING_DURINGPRICINGLOOP = Cuint(0x0080)

const SCIP_HEURTIMING_BEFOREPRESOL = Cuint(0x0100)

const SCIP_HEURTIMING_DURINGPRESOLLOOP = Cuint(0x0200)

const SCIP_HEURTIMING_AFTERPROPLOOP = Cuint(0x0400)

const SCIP_HEURTIMING_AFTERNODE = SCIP_HEURTIMING_AFTERLPNODE | SCIP_HEURTIMING_AFTERPSEUDONODE

const SCIP_HEURTIMING_AFTERPLUNGE = SCIP_HEURTIMING_AFTERLPPLUNGE | SCIP_HEURTIMING_AFTERPSEUDOPLUNGE

const SCIP_EVENTTYPE_DISABLED = UINT64_C(0x0000000000000000)

const SCIP_EVENTTYPE_VARADDED = UINT64_C(0x0000000000000001)

const SCIP_EVENTTYPE_VARDELETED = UINT64_C(0x0000000000000002)

const SCIP_EVENTTYPE_VARFIXED = UINT64_C(0x0000000000000004)

const SCIP_EVENTTYPE_VARUNLOCKED = UINT64_C(0x0000000000000008)

const SCIP_EVENTTYPE_OBJCHANGED = UINT64_C(0x0000000000000010)

const SCIP_EVENTTYPE_GLBCHANGED = UINT64_C(0x0000000000000020)

const SCIP_EVENTTYPE_GUBCHANGED = UINT64_C(0x0000000000000040)

const SCIP_EVENTTYPE_LBTIGHTENED = UINT64_C(0x0000000000000080)

const SCIP_EVENTTYPE_LBRELAXED = UINT64_C(0x0000000000000100)

const SCIP_EVENTTYPE_UBTIGHTENED = UINT64_C(0x0000000000000200)

const SCIP_EVENTTYPE_UBRELAXED = UINT64_C(0x0000000000000400)

const SCIP_EVENTTYPE_GHOLEADDED = UINT64_C(0x0000000000000800)

const SCIP_EVENTTYPE_GHOLEREMOVED = UINT64_C(0x0000000000001000)

const SCIP_EVENTTYPE_LHOLEADDED = UINT64_C(0x0000000000002000)

const SCIP_EVENTTYPE_LHOLEREMOVED = UINT64_C(0x0000000000004000)

const SCIP_EVENTTYPE_IMPLADDED = UINT64_C(0x0000000000008000)

const SCIP_EVENTTYPE_TYPECHANGED = UINT64_C(0x0000000000010000)

const SCIP_EVENTTYPE_PRESOLVEROUND = UINT64_C(0x0000000000020000)

const SCIP_EVENTTYPE_NODEFOCUSED = UINT64_C(0x0000000000040000)

const SCIP_EVENTTYPE_NODEFEASIBLE = UINT64_C(0x0000000000080000)

const SCIP_EVENTTYPE_NODEINFEASIBLE = UINT64_C(0x0000000000100000)

const SCIP_EVENTTYPE_NODEBRANCHED = UINT64_C(0x0000000000200000)

const SCIP_EVENTTYPE_NODEDELETE = UINT64_C(0x0000000000400000)

const SCIP_EVENTTYPE_FIRSTLPSOLVED = UINT64_C(0x0000000000800000)

const SCIP_EVENTTYPE_LPSOLVED = UINT64_C(0x0000000001000000)

const SCIP_EVENTTYPE_POORSOLFOUND = UINT64_C(0x0000000002000000)

const SCIP_EVENTTYPE_BESTSOLFOUND = UINT64_C(0x0000000004000000)

const SCIP_EVENTTYPE_ROWADDEDSEPA = UINT64_C(0x0000000008000000)

const SCIP_EVENTTYPE_ROWDELETEDSEPA = UINT64_C(0x0000000010000000)

const SCIP_EVENTTYPE_ROWADDEDLP = UINT64_C(0x0000000020000000)

const SCIP_EVENTTYPE_ROWDELETEDLP = UINT64_C(0x0000000040000000)

const SCIP_EVENTTYPE_ROWCOEFCHANGED = UINT64_C(0x0000000080000000)

const SCIP_EVENTTYPE_ROWCONSTCHANGED = UINT64_C(0x0000000100000000)

const SCIP_EVENTTYPE_ROWSIDECHANGED = UINT64_C(0x0000000200000000)

const SCIP_EVENTTYPE_SYNC = UINT64_C(0x0000000400000000)

const SCIP_EVENTTYPE_GBDCHANGED = SCIP_EVENTTYPE_GLBCHANGED | SCIP_EVENTTYPE_GUBCHANGED

const SCIP_EVENTTYPE_LBCHANGED = SCIP_EVENTTYPE_LBTIGHTENED | SCIP_EVENTTYPE_LBRELAXED

const SCIP_EVENTTYPE_UBCHANGED = SCIP_EVENTTYPE_UBTIGHTENED | SCIP_EVENTTYPE_UBRELAXED

const SCIP_EVENTTYPE_BOUNDTIGHTENED = SCIP_EVENTTYPE_LBTIGHTENED | SCIP_EVENTTYPE_UBTIGHTENED

const SCIP_EVENTTYPE_BOUNDRELAXED = SCIP_EVENTTYPE_LBRELAXED | SCIP_EVENTTYPE_UBRELAXED

const SCIP_EVENTTYPE_BOUNDCHANGED = SCIP_EVENTTYPE_LBCHANGED | SCIP_EVENTTYPE_UBCHANGED

const SCIP_EVENTTYPE_GHOLECHANGED = SCIP_EVENTTYPE_GHOLEADDED | SCIP_EVENTTYPE_GHOLEREMOVED

const SCIP_EVENTTYPE_LHOLECHANGED = SCIP_EVENTTYPE_LHOLEADDED | SCIP_EVENTTYPE_LHOLEREMOVED

const SCIP_EVENTTYPE_HOLECHANGED = SCIP_EVENTTYPE_GHOLECHANGED | SCIP_EVENTTYPE_LHOLECHANGED

const SCIP_EVENTTYPE_DOMCHANGED = SCIP_EVENTTYPE_BOUNDCHANGED | SCIP_EVENTTYPE_HOLECHANGED

const SCIP_EVENTTYPE_VARCHANGED = ((((((SCIP_EVENTTYPE_VARFIXED | SCIP_EVENTTYPE_VARUNLOCKED) | SCIP_EVENTTYPE_OBJCHANGED) | SCIP_EVENTTYPE_GBDCHANGED) | SCIP_EVENTTYPE_DOMCHANGED) | SCIP_EVENTTYPE_IMPLADDED) | SCIP_EVENTTYPE_VARDELETED) | SCIP_EVENTTYPE_TYPECHANGED

const SCIP_EVENTTYPE_VAREVENT = (SCIP_EVENTTYPE_VARADDED | SCIP_EVENTTYPE_VARCHANGED) | SCIP_EVENTTYPE_TYPECHANGED

const SCIP_EVENTTYPE_NODESOLVED = (SCIP_EVENTTYPE_NODEFEASIBLE | SCIP_EVENTTYPE_NODEINFEASIBLE) | SCIP_EVENTTYPE_NODEBRANCHED

const SCIP_EVENTTYPE_NODEEVENT = SCIP_EVENTTYPE_NODEFOCUSED | SCIP_EVENTTYPE_NODESOLVED

const SCIP_EVENTTYPE_LPEVENT = SCIP_EVENTTYPE_FIRSTLPSOLVED | SCIP_EVENTTYPE_LPSOLVED

const SCIP_EVENTTYPE_SOLFOUND = SCIP_EVENTTYPE_POORSOLFOUND | SCIP_EVENTTYPE_BESTSOLFOUND

const SCIP_EVENTTYPE_SOLEVENT = SCIP_EVENTTYPE_SOLFOUND

const SCIP_EVENTTYPE_ROWCHANGED = (SCIP_EVENTTYPE_ROWCOEFCHANGED | SCIP_EVENTTYPE_ROWCONSTCHANGED) | SCIP_EVENTTYPE_ROWSIDECHANGED

const SCIP_EVENTTYPE_ROWEVENT = (((SCIP_EVENTTYPE_ROWADDEDSEPA | SCIP_EVENTTYPE_ROWDELETEDSEPA) | SCIP_EVENTTYPE_ROWADDEDLP) | SCIP_EVENTTYPE_ROWDELETEDLP) | SCIP_EVENTTYPE_ROWCHANGED

const SCIP_EVENTTYPE_FORMAT = PRIx64

const NLOCKTYPES = 2

const SCIP_DIVETYPE_NONE = Cuint(0x0000)

const SCIP_DIVETYPE_INTEGRALITY = Cuint(0x0001)

const SCIP_DIVETYPE_SOS1VARIABLE = Cuint(0x0002)

const SCIP_HEURDISPCHAR_LNS = Cchar('L')

const SCIP_HEURDISPCHAR_DIVING = Cchar('d')

const SCIP_HEURDISPCHAR_ITERATIVE = Cchar('i')

const SCIP_HEURDISPCHAR_OBJDIVING = Cchar('o')

const SCIP_HEURDISPCHAR_PROP = Cchar('p')

const SCIP_HEURDISPCHAR_ROUNDING = Cchar('r')

const SCIP_HEURDISPCHAR_TRIVIAL = Cchar('t')

const SCIP_NLINCONSTYPES = Cint(SCIP_LINCONSTYPE_GENERAL) + 1

const SCIP_DECOMP_LINKVAR = -1

const SCIP_DECOMP_LINKCONS = -2

const SCIPisFinite = isfinite

const SCIP_EXPRINTCAPABILITY_NONE = 0x00000000

const SCIP_EXPRINTCAPABILITY_FUNCVALUE = 0x00000001

const SCIP_EXPRINTCAPABILITY_INTFUNCVALUE = 0x00000002

const SCIP_EXPRINTCAPABILITY_GRADIENT = 0x00000010

const SCIP_EXPRINTCAPABILITY_INTGRADIENT = 0x00000020

const SCIP_EXPRINTCAPABILITY_HESSIAN = 0x00000100

const SCIP_EXPRINTCAPABILITY_INTHESSIAN = 0x00000200

const SCIP_EXPRINTCAPABILITY_ALL = ((((SCIP_EXPRINTCAPABILITY_FUNCVALUE | SCIP_EXPRINTCAPABILITY_INTFUNCVALUE) | SCIP_EXPRINTCAPABILITY_GRADIENT) | SCIP_EXPRINTCAPABILITY_INTGRADIENT) | SCIP_EXPRINTCAPABILITY_HESSIAN) | SCIP_EXPRINTCAPABILITY_INTHESSIAN

const QUAD_EPSILON = 1.0e-12

const ARTIFICIALVARNAMEPREFIX = "andresultant_"

const SYM_SPEC_INTEGER = UINT32_C(0x00000001)

const SYM_SPEC_BINARY = UINT32_C(0x00000002)

const SYM_SPEC_REAL = UINT32_C(0x00000004)

const SYM_HANDLETYPE_NONE = UINT32_C(0x00000000)

const SYM_HANDLETYPE_SYMBREAK = UINT32_C(0x00000001)

const SYM_HANDLETYPE_ORBITALFIXING = UINT32_C(0x00000002)

const SCIP_EXPR_DEGREEINFINITY = 65535

const SCIP_EXPRBOUNDSTATUS_VALID = 0x00

const SCIP_EXPRBOUNDSTATUS_CHILDTIGHTENED = 0x01

const SCIP_EXPRBOUNDSTATUS_CHILDRELAXED = 0x02

const SCIP_EXPRBOUNDSTATUS_TIGHTENEDBYPARENT = 0x04

const SCIP_EXPRBOUNDSTATUS_TIGHTENEDBYPARENTRECENT = 0x08 | SCIP_EXPRBOUNDSTATUS_TIGHTENEDBYPARENT

const SCIP_EXPRBOUNDSTATUS_TIGHTENEDBYPARENTFORCE = 0x10 | SCIP_EXPRBOUNDSTATUS_TIGHTENEDBYPARENTRECENT

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


# exports
const PREFIXES = ["SCIP_", "SCIP", "BMS_"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
