### A Pluto.jl notebook ###
# v0.19.14

using Markdown
using InteractiveUtils

# ╔═╡ 68247294-640f-11ed-3225-4d5fee319689
begin
    import Pkg
    # activate the shared project environment
    Pkg.activate(".")
    # instantiate, i.e. make sure that all packages are downloaded
    Pkg.instantiate()
end

# ╔═╡ 1f8fe45e-fe31-43b1-b3fe-e3f871764b68
using PlutoUI

# ╔═╡ 75ff6b01-b6ee-490b-9c08-50e13d329d71
using Plots

# ╔═╡ bff81797-e40e-4ba6-9052-6731ec3ae4dc
using LinearAlgebra

# ╔═╡ d4b1a0f1-8ff7-4f12-88b4-f3506dc9bf7f
html"""
<style>
  svg {
    width: 50%;
  }
</style>
"""

# ╔═╡ 0c2d0858-1d97-4257-8e08-cc9dbb4de6e0
function forecast(A::Matrix{Float64}, x0::Vector{Float64}, T=30)::Matrix{Float64}
	K = length(x0)
	# we will store the results in a KxT matrix
	x = Matrix{Float64}(undef, K, T)
	x[:, 1] = x0
	for t = 2:T
		x[:, t] = A * x[:, t-1]
	end
	return x
end

# ╔═╡ 5aa0f84f-db89-4488-b272-a894dc6d0c23
begin
	x0 = [1.0, 0]
	A = [0.9 0; 0.1 0.8]
end

# ╔═╡ 34643818-d2f3-4d6f-a5f3-81a49be0365b
md"Make graphs smaller"

# ╔═╡ cc5de351-c3c7-4e33-8ab1-e5293fa1fe5b
plot(
	forecast(A, x0)'
)

# ╔═╡ 01858f8a-1440-4d5b-8d12-5ed3fb71983d
md"# Start again at 14:38"

# ╔═╡ 2a7d455e-8866-4c65-901c-27949f822045
A^3

# ╔═╡ 1a1dae71-1709-4e8b-ab8a-fc9da9412b6a
eigen(A)

# ╔═╡ ebf0d331-df3c-4658-b025-7d066ea2d4e7


# ╔═╡ Cell order:
# ╠═68247294-640f-11ed-3225-4d5fee319689
# ╠═1f8fe45e-fe31-43b1-b3fe-e3f871764b68
# ╠═d4b1a0f1-8ff7-4f12-88b4-f3506dc9bf7f
# ╠═75ff6b01-b6ee-490b-9c08-50e13d329d71
# ╠═0c2d0858-1d97-4257-8e08-cc9dbb4de6e0
# ╠═5aa0f84f-db89-4488-b272-a894dc6d0c23
# ╟─34643818-d2f3-4d6f-a5f3-81a49be0365b
# ╠═cc5de351-c3c7-4e33-8ab1-e5293fa1fe5b
# ╟─01858f8a-1440-4d5b-8d12-5ed3fb71983d
# ╠═2a7d455e-8866-4c65-901c-27949f822045
# ╠═bff81797-e40e-4ba6-9052-6731ec3ae4dc
# ╠═1a1dae71-1709-4e8b-ab8a-fc9da9412b6a
# ╠═ebf0d331-df3c-4658-b025-7d066ea2d4e7
