module NonlinearSolveFirstOrder

using ConcreteStructs: @concrete
using PrecompileTools: @compile_workload, @setup_workload
using Reexport: @reexport
using Setfield: @set!

using ADTypes: ADTypes
using ArrayInterface: ArrayInterface
using LinearAlgebra: LinearAlgebra, Diagonal, dot, diagind
using LineSearch: BackTracking
using StaticArraysCore: SArray

using CommonSolve: CommonSolve
using DiffEqBase: DiffEqBase    # Needed for `init` / `solve` dispatches
using LinearSolve: LinearSolve  # Trigger Linear Solve extension in NonlinearSolveBase
using MaybeInplace: @bb
using NonlinearSolveBase: NonlinearSolveBase, AbstractNonlinearSolveAlgorithm,
                          AbstractNonlinearSolveCache, AbstractDampingFunction,
                          AbstractDampingFunctionCache, AbstractTrustRegionMethod,
                          AbstractTrustRegionMethodCache,
                          Utils, InternalAPI, get_timer_output, @static_timeit,
                          update_trace!, L2_NORM, NonlinearSolvePolyAlgorithm,
                          NewtonDescent, DampedNewtonDescent, GeodesicAcceleration,
                          Dogleg, NonlinearSolveForwardDiffCache
using SciMLBase: SciMLBase, AbstractNonlinearProblem, NLStats, ReturnCode,
                 NonlinearFunction,
                 NonlinearLeastSquaresProblem, NonlinearProblem, NoSpecialize
using SciMLJacobianOperators: VecJacOperator, JacVecOperator, StatefulJacobianOperator

using FiniteDiff: FiniteDiff    # Default Finite Difference Method
using ForwardDiff: ForwardDiff, Dual  # Default Forward Mode AD

include("solve.jl")
include("raphson.jl")
include("gauss_newton.jl")
include("levenberg_marquardt.jl")
include("trust_region.jl")
include("pseudo_transient.jl")
include("poly_algs.jl")
include("forward_diff.jl")


@reexport using SciMLBase, NonlinearSolveBase

export NewtonRaphson, PseudoTransient
export GaussNewton, LevenbergMarquardt, TrustRegion

export RadiusUpdateSchemes

export GeneralizedFirstOrderAlgorithm

# Polyalgorithms
export RobustMultiNewton

end
