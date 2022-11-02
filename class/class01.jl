### A Pluto.jl notebook ###
# v0.19.14

using Markdown
using InteractiveUtils

# ╔═╡ 52dc7049-3ec8-4a31-9b3c-8324966550c7


# ╔═╡ 99bcd276-5aa8-11ed-3eed-5561dcddd73b
md"""Last login: Wed Nov  2 13:55:12 on ttys009
Welcome to fish, the friendly interactive shell
Type help for instructions on how to use fish
koren@Lindsay-Ewart ~> julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.6.7 (2022-07-19)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia> 2 + 2
4

julia> b = [1, 2, 3]
3-element Vector{Int64}:
 1
 2
 3

julia> b
3-element Vector{Int64}:
 1
 2
 3

julia> c = [1, 2, 3, 4]
4-element Vector{Int64}:
 1
 2
 3
 4

julia> typeof(b)
Vector{Int64} (alias for Array{Int64, 1})

julia> b + c
ERROR: DimensionMismatch("dimensions must match: a has dims (Base.OneTo(3),), b has dims (Base.OneTo(4),), mismatch at 1")
Stacktrace:
 [1] promote_shape
   @ ./indices.jl:178 [inlined]
 [2] promote_shape
   @ ./indices.jl:169 [inlined]
 [3] +(A::Vector{Int64}, Bs::Vector{Int64})
   @ Base ./arraymath.jl:45
 [4] top-level scope
   @ REPL[6]:1

julia> c = [1.0, 2.0, 3.0]
3-element Vector{Float64}:
 1.0
 2.0
 3.0

julia> c = [1.0, 2, 3.0]
3-element Vector{Float64}:
 1.0
 2.0
 3.0

julia> 1 / 2
0.5

julia> 1 + 2
3

julia> 1 + 2.0
3.0

julia> typeof('abd')
ERROR: syntax: character literal contains multiple characters
Stacktrace:
 [1] top-level scope
   @ none:1

julia> typeof("abd")
String

julia> A = [1 2 3; 4 5 6]
2×3 Matrix{Int64}:
 1  2  3
 4  5  6

julia> typeof(A)
Matrix{Int64} (alias for Array{Int64, 2})

julia> b
3-element Vector{Int64}:
 1
 2
 3

julia> A * b
2-element Vector{Int64}:
 14
 32

julia> c
3-element Vector{Float64}:
 1.0
 2.0
 3.0

julia> c = [1, 2, 3, 4]
4-element Vector{Int64}:
 1
 2
 3
 4

julia> A * c
ERROR: DimensionMismatch("matrix A has dimensions (2,3), vector B has length 4")
Stacktrace:
 [1] generic_matvecmul!(C::Vector{Int64}, tA::Char, A::Matrix{Int64}, B::Vector{Int64}, _add::LinearAlgebra.MulAddMul{true, true, Bool, Bool})
   @ LinearAlgebra /Users/julia/buildbot/worker/package_macos64/build/usr/share/julia/stdlib/v1.6/LinearAlgebra/src/matmul.jl:713
 [2] mul!
   @ /Users/julia/buildbot/worker/package_macos64/build/usr/share/julia/stdlib/v1.6/LinearAlgebra/src/matmul.jl:81 [inlined]
 [3] mul!
   @ /Users/julia/buildbot/worker/package_macos64/build/usr/share/julia/stdlib/v1.6/LinearAlgebra/src/matmul.jl:275 [inlined]
 [4] *(A::Matrix{Int64}, x::Vector{Int64})
   @ LinearAlgebra /Users/julia/buildbot/worker/package_macos64/build/usr/share/julia/stdlib/v1.6/LinearAlgebra/src/matmul.jl:51
 [5] top-level scope
   @ REPL[19]:1

julia> X = [1; 2; 3]
3-element Vector{Int64}:
 1
 2
 3

julia> X = [ 1 2 3]
1×3 Matrix{Int64}:
 1  2  3

julia> typeof(X)
Matrix{Int64} (alias for Array{Int64, 2})

julia> A
2×3 Matrix{Int64}:
 1  2  3
 4  5  6

julia> z = [7, 8]
2-element Vector{Int64}:
 7
 8

julia> z * A
ERROR: DimensionMismatch("matrix A has dimensions (2,1), matrix B has dimensions (2,3)")
Stacktrace:
 [1] _generic_matmatmul!(C::Matrix{Int64}, tA::Char, tB::Char, A::Matrix{Int64}, B::Matrix{Int64}, _add::LinearAlgebra.MulAddMul{true, true, Bool, Bool})
   @ LinearAlgebra /Users/julia/buildbot/worker/package_macos64/build/usr/share/julia/stdlib/v1.6/LinearAlgebra/src/matmul.jl:814
 [2] generic_matmatmul!(C::Matrix{Int64}, tA::Char, tB::Char, A::Matrix{Int64}, B::Matrix{Int64}, _add::LinearAlgebra.MulAddMul{true, true, Bool, Bool})
   @ LinearAlgebra /Users/julia/buildbot/worker/package_macos64/build/usr/share/julia/stdlib/v1.6/LinearAlgebra/src/matmul.jl:802
 [3] mul!
   @ /Users/julia/buildbot/worker/package_macos64/build/usr/share/julia/stdlib/v1.6/LinearAlgebra/src/matmul.jl:302 [inlined]
 [4] mul!
   @ /Users/julia/buildbot/worker/package_macos64/build/usr/share/julia/stdlib/v1.6/LinearAlgebra/src/matmul.jl:275 [inlined]
 [5] *
   @ /Users/julia/buildbot/worker/package_macos64/build/usr/share/julia/stdlib/v1.6/LinearAlgebra/src/matmul.jl:153 [inlined]
 [6] *(a::Vector{Int64}, B::Matrix{Int64})
   @ LinearAlgebra /Users/julia/buildbot/worker/package_macos64/build/usr/share/julia/stdlib/v1.6/LinearAlgebra/src/matmul.jl:63
 [7] top-level scope
   @ REPL[25]:1

julia> typeof(X)
Matrix{Int64} (alias for Array{Int64, 2})

julia> M = zeros(2, 3)
2×3 Matrix{Float64}:
 0.0  0.0  0.0
 0.0  0.0  0.0

julia> m = zeros(2)
2-element Vector{Float64}:
 0.0
 0.0

julia> m = zeros(2, 1)
2×1 Matrix{Float64}:
 0.0
 0.0

julia> M = zeros(2, 3, 4)
2×3×4 Array{Float64, 3}:
[:, :, 1] =
 0.0  0.0  0.0
 0.0  0.0  0.0

[:, :, 2] =
 0.0  0.0  0.0
 0.0  0.0  0.0

[:, :, 3] =
 0.0  0.0  0.0
 0.0  0.0  0.0

[:, :, 4] =
 0.0  0.0  0.0
 0.0  0.0  0.0

julia> M = ones(2, 3, 4)
2×3×4 Array{Float64, 3}:
[:, :, 1] =
 1.0  1.0  1.0
 1.0  1.0  1.0

[:, :, 2] =
 1.0  1.0  1.0
 1.0  1.0  1.0

[:, :, 3] =
 1.0  1.0  1.0
 1.0  1.0  1.0

[:, :, 4] =
 1.0  1.0  1.0
 1.0  1.0  1.0

julia> # note

julia> # note: 1: country, 2: time, 3: firm

julia> Austria_firm1_1991 = M[1, 1, 1]
1.0

julia> Austria_firm1_1991_1992 = M[1:2, 1, 1]
2-element Vector{Float64}:
 1.0
 1.0

julia> Austria_firm1_1991_1992 = M[1:end, 1, 1]
2-element Vector{Float64}:
 1.0
 1.0

julia> ## NOO!!!!

julia> Austria_firm1_1991_1992 = M[1, 1:2, 1]
2-element Vector{Float64}:
 1.0
 1.0

julia> Austria_firm1_1991_1992 = M[1, 1:end, 1]
3-element Vector{Float64}:
 1.0
 1.0
 1.0

julia> Austria_firm1_1991_1993 = M[1, 1:end, 1]
3-element Vector{Float64}:
 1.0
 1.0
 1.0

julia> help(sum)
ERROR: UndefVarError: help not defined
Stacktrace:
 [1] top-level scope
   @ REPL[41]:1

julia> help sum
ERROR: syntax: extra token "sum" after end of expression
Stacktrace:
 [1] top-level scope
   @ none:1

julia> help
ERROR: UndefVarError: help not defined

help?> sum
search: sum sum! summary cumsum cumsum! isnumeric VersionNumber issubnormal get_zero_subnormals

  sum(f, itr; [init])

  Sum the results of calling function f on each element of itr.

  The return type is Int for signed integers of less than system word size, and UInt for
  unsigned integers of less than system word size. For all other arguments, a common return type
  is found to which all arguments are promoted.

  The value returned for empty itr can be specified by init. It must be the additive identity
  (i.e. zero) as it is unspecified whether init is used for non-empty collections.

  │ Julia 1.6
  │
  │  Keyword argument init requires Julia 1.6 or later.

  Examples
  ≡≡≡≡≡≡≡≡≡≡

  julia> sum(abs2, [2; 3; 4])
  29

  Note the important difference between sum(A) and reduce(+, A) for arrays with small integer
  eltype:

  julia> sum(Int8[100, 28])
  128
  
  julia> reduce(+, Int8[100, 28])
  -128

  In the former case, the integers are widened to system word size and therefore the result is
  128. In the latter case, no such widening happens and integer overflow results in -128.

  ──────────────────────────────────────────────────────────────────────────────────────────────

  sum(itr; [init])

  Returns the sum of all elements in a collection.

  The return type is Int for signed integers of less than system word size, and UInt for
  unsigned integers of less than system word size. For all other arguments, a common return type
  is found to which all arguments are promoted.

  The value returned for empty itr can be specified by init. It must be the additive identity
  (i.e. zero) as it is unspecified whether init is used for non-empty collections.

  │ Julia 1.6
  │
  │  Keyword argument init requires Julia 1.6 or later.

  Examples
  ≡≡≡≡≡≡≡≡≡≡

  julia> sum(1:20)
  210
  
  julia> sum(1:20; init = 0.0)
  210.0

  ──────────────────────────────────────────────────────────────────────────────────────────────

  sum(A::AbstractArray; dims)

  Sum elements of an array over the given dimensions.

  Examples
  ≡≡≡≡≡≡≡≡≡≡

  julia> A = [1 2; 3 4]
  2×2 Matrix{Int64}:
   1  2
   3  4
  
  julia> sum(A, dims=1)
  1×2 Matrix{Int64}:
   4  6
  
  julia> sum(A, dims=2)
  2×1 Matrix{Int64}:
   3
   7

  ──────────────────────────────────────────────────────────────────────────────────────────────

  sum(f, A::AbstractArray; dims)

  Sum the results of calling function f on each element of an array over the given dimensions.

  Examples
  ≡≡≡≡≡≡≡≡≡≡

  julia> A = [1 2; 3 4]
  2×2 Matrix{Int64}:
   1  2
   3  4
  
  julia> sum(abs2, A, dims=1)
  1×2 Matrix{Int64}:
   10  20
  
  julia> sum(abs2, A, dims=2)
  2×1 Matrix{Int64}:
    5
   25

help?> sum
search: sum sum! summary cumsum cumsum! isnumeric VersionNumber issubnormal get_zero_subnormals

  sum(f, itr; [init])

  Sum the results of calling function f on each element of itr.

  The return type is Int for signed integers of less than system word size, and UInt for
  unsigned integers of less than system word size. For all other arguments, a common return type
  is found to which all arguments are promoted.

  The value returned for empty itr can be specified by init. It must be the additive identity
  (i.e. zero) as it is unspecified whether init is used for non-empty collections.

  │ Julia 1.6
  │
  │  Keyword argument init requires Julia 1.6 or later.

  Examples
  ≡≡≡≡≡≡≡≡≡≡

  julia> sum(abs2, [2; 3; 4])
  29

  Note the important difference between sum(A) and reduce(+, A) for arrays with small integer
  eltype:

  julia> sum(Int8[100, 28])
  128
  
  julia> reduce(+, Int8[100, 28])
  -128

  In the former case, the integers are widened to system word size and therefore the result is
  128. In the latter case, no such widening happens and integer overflow results in -128.

  ──────────────────────────────────────────────────────────────────────────────────────────────

  sum(itr; [init])

  Returns the sum of all elements in a collection.

  The return type is Int for signed integers of less than system word size, and UInt for
  unsigned integers of less than system word size. For all other arguments, a common return type
  is found to which all arguments are promoted.

  The value returned for empty itr can be specified by init. It must be the additive identity
  (i.e. zero) as it is unspecified whether init is used for non-empty collections.

  │ Julia 1.6
  │
  │  Keyword argument init requires Julia 1.6 or later.

  Examples
  ≡≡≡≡≡≡≡≡≡≡

  julia> sum(1:20)
  210
  
  julia> sum(1:20; init = 0.0)
  210.0

  ──────────────────────────────────────────────────────────────────────────────────────────────

  sum(A::AbstractArray; dims)

  Sum elements of an array over the given dimensions.

  Examples
  ≡≡≡≡≡≡≡≡≡≡

  julia> A = [1 2; 3 4]
  2×2 Matrix{Int64}:
   1  2
   3  4
  
  julia> sum(A, dims=1)
  1×2 Matrix{Int64}:
   4  6
  
  julia> sum(A, dims=2)
  2×1 Matrix{Int64}:
   3
   7

  ──────────────────────────────────────────────────────────────────────────────────────────────

  sum(f, A::AbstractArray; dims)

  Sum the results of calling function f on each element of an array over the given dimensions.

  Examples
  ≡≡≡≡≡≡≡≡≡≡

  julia> A = [1 2; 3 4]
  2×2 Matrix{Int64}:
   1  2
   3  4
  
  julia> sum(abs2, A, dims=1)
  1×2 Matrix{Int64}:
   10  20
  
  julia> sum(abs2, A, dims=2)
  2×1 Matrix{Int64}:
    5
   25

julia> A
2×3 Matrix{Int64}:
 1  2  3
 4  5  6

julia> sum(A)
21

julia> sum(A, dims=1)
1×3 Matrix{Int64}:
 5  7  9

julia> mean(A, dims=1)
ERROR: UndefVarError: mean not defined
Stacktrace:
 [1] top-level scope
   @ REPL[48]:1

julia> GDP_Austria = sum(M, dims=3)
2×3×1 Array{Float64, 3}:
[:, :, 1] =
 4.0  4.0  4.0
 4.0  4.0  4.0

julia> GDP_Austria = sum(M, dims=3)[1, :, :]
3×1 Matrix{Float64}:
 4.0
 4.0
 4.0

julia> X = ones(2, 10)
2×10 Matrix{Float64}:
 1.0  1.0  1.0  1.0  1.0  1.0  1.0  1.0  1.0  1.0
 1.0  1.0  1.0  1.0  1.0  1.0  1.0  1.0  1.0  1.0

help?> random
search:

Couldn't find random
Perhaps you meant rand, randn, range, tand or rad2deg
  No documentation found.

  Binding random does not exist.

julia> rand
rand (generic function with 69 methods)

help?> rand
search: rand randn transcode macroexpand @macroexpand @macroexpand1 CartesianIndex

  rand([rng=GLOBAL_RNG], [S], [dims...])

  Pick a random element or array of random elements from the set of values specified by S; S can
  be

    •  an indexable collection (for example 1:9 or ('x', "y", :z)),

    •  an AbstractDict or AbstractSet object,

    •  a string (considered as a collection of characters), or

    •  a type: the set of values to pick from is then equivalent to typemin(S):typemax(S)
       for integers (this is not applicable to BigInt), to [0, 1) for floating point
       numbers and to [0, 1)+i[0, 1) for complex floating point numbers;

  S defaults to Float64. When only one argument is passed besides the optional rng and is a
  Tuple, it is interpreted as a collection of values (S) and not as dims.

  │ Julia 1.1
  │
  │  Support for S as a tuple requires at least Julia 1.1.

  Examples
  ≡≡≡≡≡≡≡≡≡≡

  julia> rand(Int, 2)
  2-element Array{Int64,1}:
   1339893410598768192
   1575814717733606317
  
  julia> using Random
  
  julia> rand(MersenneTwister(0), Dict(1=>2, 3=>4))
  1=>2
  
  julia> rand((2, 3))
  3
  
  julia> rand(Float64, (2, 3))
  2×3 Array{Float64,2}:
   0.999717  0.0143835  0.540787
   0.696556  0.783855   0.938235

  │ Note
  │
  │  The complexity of rand(rng, s::Union{AbstractDict,AbstractSet}) is linear in the
  │  length of s, unless an optimized method with constant complexity is available, which
  │  is the case for Dict, Set and BitSet. For more than a few calls, use rand(rng,
  │  collect(s)) instead, or either rand(rng, Dict(s)) or rand(rng, Set(s)) as
  │  appropriate.

julia> X = rand(2, 10)
2×10 Matrix{Float64}:
 0.326123  0.571218  0.750512  0.86498   0.104669  …  0.9418   0.690666  0.608937   0.258915
 0.129555  0.095085  0.731112  0.233746  0.830775     0.57235  0.630611  0.0329765  0.550496

julia> sum(X, dims=1)
1×10 Matrix{Float64}:
 0.455678  0.666303  1.48162  1.09873  0.935444  0.846699  1.51415  1.32128  0.641913  0.809411

julia> X ./ sum(X, dims=1)
2×10 Matrix{Float64}:
 0.715687  0.857295  0.506547  0.787257  0.111893  …  0.621999  0.522726  0.948628   0.319881
 0.284313  0.142705  0.493453  0.212743  0.888107     0.378001  0.477274  0.0513722  0.680119

julia> using Plots
ERROR: ArgumentError: Package Plots not found in current path:
- Run `import Pkg; Pkg.add("Plots")` to install the Plots package.

Stacktrace:
 [1] require(into::Module, mod::Symbol)
   @ Base ./loading.jl:893

julia> using LinearAlgebra

help?> eig
search: eigen eigmin eigmax eigen! Eigen eigvecs eigvals eigvals! leading_ones leading_zeros

Couldn't find eig
Perhaps you meant big, eigen, ceil, reim, edit, exit, eof, eps, esc, exp, end, diag, cis or div
  No documentation found.

  Binding eig does not exist.

help?> eigen
search: eigen eigen! Eigen GeneralizedEigen eigvecs leading_zeros leading_ones

  eigen(A; permute::Bool=true, scale::Bool=true, sortby) -> Eigen

  Computes the eigenvalue decomposition of A, returning an Eigen factorization object F which
  contains the eigenvalues in F.values and the eigenvectors in the columns of the matrix
  F.vectors. (The kth eigenvector can be obtained from the slice F.vectors[:, k].)

  Iterating the decomposition produces the components F.values and F.vectors.

  The following functions are available for Eigen objects: inv, det, and isposdef.

  For general nonsymmetric matrices it is possible to specify how the matrix is balanced before
  the eigenvector calculation. The option permute=true permutes the matrix to become closer to
  upper triangular, and scale=true scales the matrix by its diagonal elements to make rows and
  columns more equal in norm. The default is true for both options.

  By default, the eigenvalues and vectors are sorted lexicographically by (real(λ),imag(λ)). A
  different comparison function by(λ) can be passed to sortby, or you can pass sortby=nothing to
  leave the eigenvalues in an arbitrary order. Some special matrix types (e.g. Diagonal or
  SymTridiagonal) may implement their own sorting convention and not accept a sortby keyword.

  Examples
  ≡≡≡≡≡≡≡≡≡≡

  julia> F = eigen([1.0 0.0 0.0; 0.0 3.0 0.0; 0.0 0.0 18.0])
  Eigen{Float64, Float64, Matrix{Float64}, Vector{Float64}}
  values:
  3-element Vector{Float64}:
    1.0
    3.0
   18.0
  vectors:
  3×3 Matrix{Float64}:
   1.0  0.0  0.0
   0.0  1.0  0.0
   0.0  0.0  1.0
  
  julia> F.values
  3-element Vector{Float64}:
    1.0
    3.0
   18.0
  
  julia> F.vectors
  3×3 Matrix{Float64}:
   1.0  0.0  0.0
   0.0  1.0  0.0
   0.0  0.0  1.0
  
  julia> vals, vecs = F; # destructuring via iteration
  
  julia> vals == F.values && vecs == F.vectors
  true

  ──────────────────────────────────────────────────────────────────────────────────────────────

  eigen(A, B) -> GeneralizedEigen

  Computes the generalized eigenvalue decomposition of A and B, returning a GeneralizedEigen
  factorization object F which contains the generalized eigenvalues in F.values and the
  generalized eigenvectors in the columns of the matrix F.vectors. (The kth generalized
  eigenvector can be obtained from the slice F.vectors[:, k].)

  Iterating the decomposition produces the components F.values and F.vectors.

  Any keyword arguments passed to eigen are passed through to the lower-level eigen! function.

  Examples
  ≡≡≡≡≡≡≡≡≡≡

  julia> A = [1 0; 0 -1]
  2×2 Matrix{Int64}:
   1   0
   0  -1
  
  julia> B = [0 1; 1 0]
  2×2 Matrix{Int64}:
   0  1
   1  0
  
  julia> F = eigen(A, B);
  
  julia> F.values
  2-element Vector{ComplexF64}:
   0.0 - 1.0im
   0.0 + 1.0im
  
  julia> F.vectors
  2×2 Matrix{ComplexF64}:
    0.0+1.0im   0.0-1.0im
   -1.0+0.0im  -1.0-0.0im
  
  julia> vals, vecs = F; # destructuring via iteration
  
  julia> vals == F.values && vecs == F.vectors
  true

  ──────────────────────────────────────────────────────────────────────────────────────────────

  eigen(A::Union{SymTridiagonal, Hermitian, Symmetric}, irange::UnitRange) -> Eigen

  Computes the eigenvalue decomposition of A, returning an Eigen factorization object F which
  contains the eigenvalues in F.values and the eigenvectors in the columns of the matrix
  F.vectors. (The kth eigenvector can be obtained from the slice F.vectors[:, k].)

  Iterating the decomposition produces the components F.values and F.vectors.

  The following functions are available for Eigen objects: inv, det, and isposdef.

  The UnitRange irange specifies indices of the sorted eigenvalues to search for.

  │ Note
  │
  │  If irange is not 1:n, where n is the dimension of A, then the returned factorization
  │  will be a truncated factorization.

  ──────────────────────────────────────────────────────────────────────────────────────────────

  eigen(A::Union{SymTridiagonal, Hermitian, Symmetric}, vl::Real, vu::Real) -> Eigen

  Computes the eigenvalue decomposition of A, returning an Eigen factorization object F which
  contains the eigenvalues in F.values and the eigenvectors in the columns of the matrix
  F.vectors. (The kth eigenvector can be obtained from the slice F.vectors[:, k].)

  Iterating the decomposition produces the components F.values and F.vectors.

  The following functions are available for Eigen objects: inv, det, and isposdef.

  vl is the lower bound of the window of eigenvalues to search for, and vu is the upper bound.

  │ Note
  │
  │  If [vl, vu] does not contain all eigenvalues of A, then the returned factorization
  │  will be a truncated factorization.

julia> using Statistics

help?> mean
search: mean mean! median median! SegmentationFault macroexpand @macroexpand @macroexpand1 Meta

  mean(itr)

  Compute the mean of all elements in a collection.

  │ Note
  │
  │  If itr contains NaN or missing values, the result is also NaN or missing (missing
  │  takes precedence if array contains both). Use the skipmissing function to omit
  │  missing entries and compute the mean of non-missing values.

  Examples
  ≡≡≡≡≡≡≡≡≡≡

  julia> using Statistics
  
  julia> mean(1:20)
  10.5
  
  julia> mean([1, missing, 3])
  missing
  
  julia> mean(skipmissing([1, missing, 3]))
  2.0

  ──────────────────────────────────────────────────────────────────────────────────────────────

  mean(f::Function, itr)

  Apply the function f to each element of collection itr and take the mean.

  julia> using Statistics
  
  julia> mean(√, [1, 2, 3])
  1.3820881233139908
  
  julia> mean([√1, √2, √3])
  1.3820881233139908

  ──────────────────────────────────────────────────────────────────────────────────────────────

  mean(f::Function, A::AbstractArray; dims)

  Apply the function f to each element of array A and take the mean over dimensions dims.

  │ Julia 1.3
  │
  │  This method requires at least Julia 1.3.

  julia> using Statistics
  
  julia> mean(√, [1, 2, 3])
  1.3820881233139908
  
  julia> mean([√1, √2, √3])
  1.3820881233139908
  
  julia> mean(√, [1 2 3; 4 5 6], dims=2)
  2×1 Matrix{Float64}:
   1.3820881233139908
   2.2285192400943226

  ──────────────────────────────────────────────────────────────────────────────────────────────

  mean(A::AbstractArray; dims)

  Compute the mean of an array over the given dimensions.

  │ Julia 1.1
  │
  │  mean for empty arrays requires at least Julia 1.1.

  Examples
  ≡≡≡≡≡≡≡≡≡≡

  julia> using Statistics
  
  julia> A = [1 2; 3 4]
  2×2 Matrix{Int64}:
   1  2
   3  4
  
  julia> mean(A, dims=1)
  1×2 Matrix{Float64}:
   2.0  3.0
  
  julia> mean(A, dims=2)
  2×1 Matrix{Float64}:
   1.5
   3.5

julia> mean(A, dims=1)
1×3 Matrix{Float64}:
 2.5  3.5  4.5

julia> using Plots
ERROR: ArgumentError: Package Plots not found in current path:
- Run `import Pkg; Pkg.add("Plots")` to install the Plots package.

Stacktrace:
 [1] require(into::Module, mod::Symbol)
   @ Base ./loading.jl:893

julia> # look for this key "]"

julia> # to get out press "backspace"

(@v1.6) pkg> add Pluto
    Updating registry at `~/.julia/registries/General`
   Resolving package versions...
    Updating `~/.julia/environments/v1.6/Project.toml`
  [c3e4b0f8] + Pluto v0.19.14
    Updating `~/.julia/environments/v1.6/Manifest.toml`
  [d1d4a3ce] + BitFlags v0.1.5
  [944b1d66] + CodecZlib v0.7.0
  [5218b696] + Configurations v0.17.4
  [9a962f9c] + DataAPI v1.12.0
  [e2d170a0] + DataValueInterfaces v1.0.0
  [55351af7] + ExproniconLite v0.7.1
  [fb4132e2] + FuzzyCompletions v0.5.1
  [cd3eb016] + HTTP v1.5.1
  [ac1192a8] + HypertextLiteral v0.9.4
  [83e8ac13] + IniFile v0.5.1
  [82899510] + IteratorInterfaceExtensions v1.0.0
  [692b3bcd] + JLLWrappers v1.4.1
  [0e77f7df] + LazilyInitializedFields v1.2.0
  [e6f89c97] + LoggingExtras v0.4.9
  [6c6e2e6c] + MIMEs v0.1.4
  [739be429] + MbedTLS v1.1.7
  [99f44e22] + MsgPack v1.1.0
  [4d8831e6] + OpenSSL v1.3.0
  [bac558e1] + OrderedCollections v1.4.1
  [c3e4b0f8] + Pluto v0.19.14
  [91cefc8d] + PrecompileSignatures v3.0.3
  [21216c6a] + Preferences v1.3.0
  [2792f1a3] + RegistryInstances v0.1.0
  [05181044] + RelocatableFolders v0.3.0
  [6c6a2e73] + Scratch v1.1.1
  [777ac1f9] + SimpleBufferStream v1.1.0
  [3783bdb8] + TableTraits v1.0.1
  [bd369af6] + Tables v1.10.0
  [3bb67fe8] + TranscodingStreams v0.9.9
  [410a4b4d] + Tricks v0.1.6
  [5c2747f8] + URIs v1.4.0
  [458c3c95] + OpenSSL_jll v1.1.17+0
  [0dad84c5] + ArgTools
  [56f22d72] + Artifacts
  [2a0f44e3] + Base64
  [ade2ca70] + Dates
  [8ba89e20] + Distributed
  [f43a241f] + Downloads
  [7b1f6079] + FileWatching
  [b77e0a4c] + InteractiveUtils
  [b27032c2] + LibCURL
  [76f85450] + LibGit2
  [8f399da3] + Libdl
  [37e2e46d] + LinearAlgebra
  [56ddb016] + Logging
  [d6f4376e] + Markdown
  [ca575930] + NetworkOptions
  [44cfe95a] + Pkg
  [de0858da] + Printf
  [3fa0cd96] + REPL
  [9a3f8284] + Random
  [ea8e919c] + SHA
  [9e88b42a] + Serialization
  [6462fe0b] + Sockets
  [fa267f1f] + TOML
  [a4e569a6] + Tar
  [8dfed614] + Test
  [cf7118a7] + UUIDs
  [4ec0a83e] + Unicode
  [deac9b47] + LibCURL_jll
  [29816b5a] + LibSSH2_jll
  [c8ffd9c3] + MbedTLS_jll
  [14a3606d] + MozillaCACerts_jll
  [83775a58] + Zlib_jll
  [8e850ede] + nghttp2_jll
  [3f19e933] + p7zip_jll

julia> """

# ╔═╡ Cell order:
# ╠═52dc7049-3ec8-4a31-9b3c-8324966550c7
# ╟─99bcd276-5aa8-11ed-3eed-5561dcddd73b
