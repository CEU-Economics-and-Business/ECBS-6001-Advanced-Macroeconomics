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
end

# ╔═╡ 34643818-d2f3-4d6f-a5f3-81a49be0365b
md"Make graphs smaller"

# ╔═╡ cc5de351-c3c7-4e33-8ab1-e5293fa1fe5b


# ╔═╡ 01858f8a-1440-4d5b-8d12-5ed3fb71983d
md"# Start again at 14:38"

# ╔═╡ 710b4fca-5568-40eb-bb4c-cd6daf952376
sqrt(0.9 ^ 2 + 0.4 ^ 2)

# ╔═╡ ebf0d331-df3c-4658-b025-7d066ea2d4e7
	A = [0.9 0.4; 
		 -0.4 0.9]

# ╔═╡ 2a7d455e-8866-4c65-901c-27949f822045
A^3

# ╔═╡ 82fc0bb1-64da-473a-ae6a-d4a8556d2f8f
e = eigen(A)

# ╔═╡ 1a1dae71-1709-4e8b-ab8a-fc9da9412b6a
e.values

# ╔═╡ 216d872f-de63-4a40-a356-6e1bf69faaa9
md"Whenever $a_1$ and $a_2$ -> $m_1$ and $m_2$, then $m_1 = \lambda_1$ and $m_2 = \lambda_2$"

# ╔═╡ 2cfbcb5e-346b-440f-b4fc-7a400bd34a99
plot(
	forecast(A, x0)'
)

# ╔═╡ 524ed7e7-bfba-44fc-87ae-924cf8c1faa1
eigen(A')

# ╔═╡ 5eec58f8-12d9-4d62-b0d1-8f11a65cdab4
x = forecast(A, x0, 300)

# ╔═╡ 00754e2f-7ed4-4d1e-b4ae-1bc12557d483
sum(x, dims=1)

# ╔═╡ 786b2e77-7e86-41a0-962e-7aa034281b3d
plot(x[1,:], x[2, :])

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
# ╠═82fc0bb1-64da-473a-ae6a-d4a8556d2f8f
# ╠═1a1dae71-1709-4e8b-ab8a-fc9da9412b6a
# ╠═710b4fca-5568-40eb-bb4c-cd6daf952376
# ╠═ebf0d331-df3c-4658-b025-7d066ea2d4e7
# ╠═216d872f-de63-4a40-a356-6e1bf69faaa9
# ╠═2cfbcb5e-346b-440f-b4fc-7a400bd34a99
# ╠═524ed7e7-bfba-44fc-87ae-924cf8c1faa1
# ╠═5eec58f8-12d9-4d62-b0d1-8f11a65cdab4
# ╠═00754e2f-7ed4-4d1e-b4ae-1bc12557d483
# ╠═eaadf69d-c515-4eed-81dd-e7e9a577bbfa
# ╠═786b2e77-7e86-41a0-962e-7aa034281b3d
