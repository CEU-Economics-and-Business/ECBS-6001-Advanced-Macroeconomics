### A Pluto.jl notebook ###
# v0.19.14

using Markdown
using InteractiveUtils

# ╔═╡ 02dbf68a-6f1a-11ed-3415-93ae3f6181eb
begin
    import Pkg
    # activate the shared project environment
    Pkg.activate(".")
    # instantiate, i.e. make sure that all packages are downloaded
    Pkg.instantiate()
end

# ╔═╡ e7cf1910-0817-4a62-ad88-8ee858a64361
using LinearAlgebra

# ╔═╡ 636004ad-0804-4e4d-b908-c66183727479
using Plots

# ╔═╡ 913845fb-5281-4ccb-8044-a589601dc19b
using Distributions

# ╔═╡ be9677ea-12ca-4bc4-a8e3-f88eef990233
using Math

# ╔═╡ fa4945c1-b586-41d1-961b-0db262af4da8
eigen([1 0; 0 1])

# ╔═╡ 2e698b34-5088-4cca-9614-c01236b6085f
eigen([0 1; 1 0])

# ╔═╡ b51ad58a-d7f2-4d5e-af2e-99385ba2b90f
function simulate(P::Matrix{Float64}, x0::Int64, T=30)::Vector{Int64}
	x = Vector{Int64}(undef, T)
	x[1] = x0
	for t=2:T
		π = P[x[t-1], :]
		x[t] = rand(Categorical(π))
	end
	return x
end

# ╔═╡ 759ee4a4-e0de-43de-b69f-b23e44f4bdea
coin_flips = simulate([0.5 0.5; 0.5 0.5], 1, 300)

# ╔═╡ dca51138-3768-4af6-ab82-4aa4feefba49
mean(coin_flips)

# ╔═╡ 0e8ff03b-49c0-467e-958b-4db4dd0aa43c
plot(coin_flips)

# ╔═╡ 7598d7f2-9920-4514-bc9c-d23e1056984f
persistent_mc = simulate([0.9 0.1; 0.4 0.6], 1, 300)

# ╔═╡ 62cb8ec8-4a09-4a22-9e24-d6c6ceb04daf
plot(persistent_mc)

# ╔═╡ f231e642-ab40-43d7-a859-59f8bb5f190c
begin
	P3=[0.9 0.1 0; 
		0.15 0.7 0.15; 
		0.0 0 1.0]
	three_state_mc = simulate(P3, 1, 100)
end

# ╔═╡ 857765e4-60f4-4a53-b8e1-58007469f3cf
plot(three_state_mc)

# ╔═╡ 6ffbcc1d-8fc1-458e-bf0d-397696267816
eigen(P3').values

# ╔═╡ 8e6583e5-9d01-49d9-994a-bd91900cda82
eigen(P3').vectors

# ╔═╡ b5b9c867-43c3-4e53-8113-33bb75ee65de
P3'

# ╔═╡ 1aca0a03-dd40-4278-bfb5-be8bb1a6a97f
(P3')^2

# ╔═╡ 04c3a354-695d-41fc-b640-d9ec3675ec5a
(P3')^30

# ╔═╡ 10c56515-09ed-4726-8eb5-080396d09d66


# ╔═╡ 792a87b8-5c0b-46b9-95e6-75c171ffa216
coin_flip = Categorical([0.5, 0.5])

# ╔═╡ 905c8437-dff2-45e7-ad03-7dff69621f43
mean(coin_flip)

# ╔═╡ 6db7c20b-4b95-4708-833a-d08953901190
probs(coin_flip)

# ╔═╡ 6b5d58c0-a6b3-488e-ab7e-aa18e203e92f
mean(coin_flip)

# ╔═╡ 4719706d-6c80-4f72-8c3c-f217a757f3e4
rand(coin_flip)

# ╔═╡ 0efc83c4-8064-4b40-b8ed-a225424971e2
standard_normal = Normal(0.0, 1.0)

# ╔═╡ 3e1e0e9c-8846-4f0d-bee7-f7dcbbe1edc9
probs(standard_normal)

# ╔═╡ b3e54a06-bbd6-4663-bc06-364c9c85470b
mean(standard_normal)

# ╔═╡ 6b21fb20-982a-4d69-92ba-660ae5f216c2
rand(standard_normal)

# ╔═╡ 1c46de04-d7f7-41a4-a6ad-5a151115b49c
md"# Value function iteration"

# ╔═╡ 8b1960dc-328c-4ee2-8ce2-fdd37b849990
function iterate_cake_value(V::Vector{Float64}, β=0.95)::Vector{Float64}
	K = length(V)
	V1 = Vector{Float64}(undef, K)
	for k = 1:K
		possible_consumptions = 0:k-1
		
		V1[k] = maximum(log.(possible_consumptions) + β * V[K .- possible_consumptions])
		
	end
	return V1
end

# ╔═╡ 3048a4c1-c688-4db4-b3a0-1bbabdf6c553
log.(1:10)

# ╔═╡ 952e6449-eecd-4ef6-b5e5-e8389b850141
v1 = iterate_cake_value(ones(30))

# ╔═╡ 898cad98-e2c6-482d-adbc-f04668a12e81
v2 = iterate_cake_value(v1)

# ╔═╡ 9f7d607b-4538-432c-a065-ffcfcab8a73f
v3 = iterate_cake_value(v2)

# ╔═╡ b5eb91d8-83b9-4def-8230-8e0e17b19809
plot(v3)

# ╔═╡ 7ad14498-70af-43fd-93c4-6455bbfda2c7


# ╔═╡ f3ec84c7-a8ee-485b-8ad3-505d2f1bec7e


# ╔═╡ Cell order:
# ╠═02dbf68a-6f1a-11ed-3415-93ae3f6181eb
# ╠═e7cf1910-0817-4a62-ad88-8ee858a64361
# ╠═fa4945c1-b586-41d1-961b-0db262af4da8
# ╠═2e698b34-5088-4cca-9614-c01236b6085f
# ╠═b51ad58a-d7f2-4d5e-af2e-99385ba2b90f
# ╠═759ee4a4-e0de-43de-b69f-b23e44f4bdea
# ╠═dca51138-3768-4af6-ab82-4aa4feefba49
# ╠═905c8437-dff2-45e7-ad03-7dff69621f43
# ╠═636004ad-0804-4e4d-b908-c66183727479
# ╠═0e8ff03b-49c0-467e-958b-4db4dd0aa43c
# ╠═7598d7f2-9920-4514-bc9c-d23e1056984f
# ╠═62cb8ec8-4a09-4a22-9e24-d6c6ceb04daf
# ╠═f231e642-ab40-43d7-a859-59f8bb5f190c
# ╠═857765e4-60f4-4a53-b8e1-58007469f3cf
# ╠═6ffbcc1d-8fc1-458e-bf0d-397696267816
# ╠═8e6583e5-9d01-49d9-994a-bd91900cda82
# ╠═b5b9c867-43c3-4e53-8113-33bb75ee65de
# ╠═1aca0a03-dd40-4278-bfb5-be8bb1a6a97f
# ╠═04c3a354-695d-41fc-b640-d9ec3675ec5a
# ╠═10c56515-09ed-4726-8eb5-080396d09d66
# ╠═913845fb-5281-4ccb-8044-a589601dc19b
# ╠═792a87b8-5c0b-46b9-95e6-75c171ffa216
# ╠═6db7c20b-4b95-4708-833a-d08953901190
# ╠═6b5d58c0-a6b3-488e-ab7e-aa18e203e92f
# ╠═4719706d-6c80-4f72-8c3c-f217a757f3e4
# ╠═0efc83c4-8064-4b40-b8ed-a225424971e2
# ╠═3e1e0e9c-8846-4f0d-bee7-f7dcbbe1edc9
# ╠═b3e54a06-bbd6-4663-bc06-364c9c85470b
# ╠═6b21fb20-982a-4d69-92ba-660ae5f216c2
# ╟─1c46de04-d7f7-41a4-a6ad-5a151115b49c
# ╠═be9677ea-12ca-4bc4-a8e3-f88eef990233
# ╠═8b1960dc-328c-4ee2-8ce2-fdd37b849990
# ╠═3048a4c1-c688-4db4-b3a0-1bbabdf6c553
# ╠═952e6449-eecd-4ef6-b5e5-e8389b850141
# ╠═898cad98-e2c6-482d-adbc-f04668a12e81
# ╠═9f7d607b-4538-432c-a065-ffcfcab8a73f
# ╠═b5eb91d8-83b9-4def-8230-8e0e17b19809
# ╠═7ad14498-70af-43fd-93c4-6455bbfda2c7
# ╠═f3ec84c7-a8ee-485b-8ad3-505d2f1bec7e
