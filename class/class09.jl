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
		
		V1[k] = maximum(log.(possible_consumptions) + β * V[k .- possible_consumptions])
		
	end
	return V1
end

# ╔═╡ 3048a4c1-c688-4db4-b3a0-1bbabdf6c553
log.(1:10)

# ╔═╡ 952e6449-eecd-4ef6-b5e5-e8389b850141
v1 = iterate_cake_value(zeros(30))

# ╔═╡ 898cad98-e2c6-482d-adbc-f04668a12e81
v2 = iterate_cake_value(v1)

# ╔═╡ 9f7d607b-4538-432c-a065-ffcfcab8a73f
v3 = iterate_cake_value(v2)

# ╔═╡ b5eb91d8-83b9-4def-8230-8e0e17b19809
plot(v3)

# ╔═╡ 7ad14498-70af-43fd-93c4-6455bbfda2c7
md"# DP with Markov chains"

# ╔═╡ 87daaac1-ac21-4eae-918a-c734a0586953
md"""## Composite types
I promised some intro to composite types. The next few functions work much better with this. There is no need for copy-pasting parameter values, which is very prone to errors. So I rewrote all our functions for a user-defined type.
"""

# ╔═╡ 93439833-7d13-4050-99e7-3a3aa1f46902
struct MarkovChainProblem
	u::Vector{Float64}
	P::Matrix{Float64}
	β::Float64
end

# ╔═╡ 7f87c02c-9d3b-4835-b79b-552fd88c5a85
function iterate_value_mc(v::Vector{Float64}, mcp::MarkovChainProblem)::Vector{Float64}
	# you can refer to the components of a composite type like mcp.u
	# here we are using unpacking to assign three values at the same time
	# this is only to keep our actual formula clean
	u, P, β = mcp.u, mcp.P, mcp.β
	return u + β*P*v
end

# ╔═╡ 8fbff738-d1d9-419b-9431-7d239bc8b7ba
P = [ 	0.9 0.1;
		0.6 0.4]

# ╔═╡ 24297218-8dfa-4452-bca0-bcd3cfcca81a
utils = [1.0, 0.6]
# unemployment benefit has replacement rate of 0.6

# ╔═╡ fb3e59b4-2fe6-4e17-9368-74150c05c2d9
job_search_problem = MarkovChainProblem(utils, P, 0.95)

# ╔═╡ 43d59b55-8f02-440a-a3c8-d41b02960f1f
iterate_value_mc(job_search_problem.u / (1-job_search_problem.β), job_search_problem)

# ╔═╡ db61f6f7-d80a-4181-b688-5342511f934b
begin
	K = 300
	values = ones(2, K) * 20
	for k=2:K
		values[:, k] = iterate_value_mc(values[:, k-1], job_search_problem)
	end
	plot(values')
end

# ╔═╡ 897e60a4-a490-4ff6-9bc6-6e444a54459f
md"See, there is no need to ever type the invidual parameters again."

# ╔═╡ f3ec84c7-a8ee-485b-8ad3-505d2f1bec7e
inv(I - job_search_problem.β * job_search_problem.P) * job_search_problem.u

# ╔═╡ 85f62f1f-e1dd-4caf-9a38-9d74839784c5
md"# Reflections on the Python-R-Stata debate"

# ╔═╡ c5fa4f78-5754-40b3-bbb3-532353d97e4f
debate_data = [14 1 2; 6 13 2; 5 1 12]

# ╔═╡ 838873e2-2f05-4073-9dff-150878294357
transition_matrix = debate_data ./ sum(debate_data, dims=2)

# ╔═╡ 1246d57c-e4c2-4e49-b780-2b4c172a2298
eigen(transition_matrix')

# ╔═╡ 7f8f937d-c385-493e-9c47-e7b0137ca3e5
steady_state = eigen(transition_matrix').vectors[:, 3] ./ sum(eigen(transition_matrix').vectors[:, 3])

# ╔═╡ 2ffb4a19-8afc-433c-88c5-40d33da4dd59
function solve_bellman_for_mc(mcp::MarkovChainProblem)::Vector{Float64}
	u, P, β = mcp.u, mcp.P, mcp.β
	return inv(I - β * P) * u
end

# ╔═╡ 9dcc5ecc-f179-4405-8d13-d3695febd5ef
md"## Endogenous search"

# ╔═╡ e9b2b135-c87e-4941-acac-50f353b24d00
struct EndogenousSearchProblem
	u::Vector{Float64}
	λ::Float64
	δ::Float64
	β::Float64
end

# ╔═╡ 578ab4ba-7fab-40ba-ad4c-48d04e8f432a
endogenous_search = EndogenousSearchProblem(utils, 3.0, 0.1, 0.95)

# ╔═╡ 0c271a97-e90c-41c1-bfbb-49b2582dc705
function solve_optimal_search(v::Vector{Float64}, es::EndogenousSearchProblem)::Float64
	β, λ = es.β, es.λ
	prob_unemployed = sqrt(1/(β*λ*(v[1] - v[2])))
	if prob_unemployed < 0.0001
		prob_unemployed = 0.0001
	elseif prob_unemployed > 1
		prob_unemployed = 1
	end
	return (1/prob_unemployed - 1)/λ
end

# ╔═╡ 3e1d90e6-ddd4-4ea8-bbbd-ef3013741022
function iterate_value_for_search(v::Vector{Float64}, es::EndogenousSearchProblem)::Vector{Float64}
	u, β, λ, δ = es.u, es.β, es.λ, es.δ
	# given optimal solution, what is transition matrix?
	c = solve_optimal_search(v, es)
	Λ = λ * c / (1 + λ * c)
	P = [1-δ δ; Λ 1-Λ]
	return u + β * P * v
end

# ╔═╡ ce36dfe0-0bb1-49c7-902c-1c5ef5f71995
iterate_value_for_search(ones(2), endogenous_search)

# ╔═╡ 659f446f-42d6-4c4d-8024-b2a82551fb9d
begin
	K2 = 300
	v = zeros(K2, 2)
	for k = 2:K2
		v[k, :] = iterate_value_for_search(v[k-1, :], endogenous_search)
	end
	plot(v)
end

# ╔═╡ a1fd0480-497a-466e-910a-96a63c78d357
v

# ╔═╡ 179e5955-1cd6-49a9-8e47-3dcc2944de4c
sqrt(1/(0.95*3*(v[300, 1] - v[300, 2])))

# ╔═╡ 6b73c137-ad76-4bcf-88f5-34714c5ffe3a
function iterate_policy_for_search(c::Float64, es::EndogenousSearchProblem)::Float64
	u, β, λ, δ = es.u, es.β, es.λ, es.δ
	Λ = λ*c / (1 + λ*c)
	P = [1-δ δ; Λ 1-Λ]
	# because solve_bellman_for_mc now takes a MarkovChainProblem, we have to create one that we can pass on
	mcp = MarkovChainProblem(u, P, β)
	v = solve_bellman_for_mc(mcp)
	return solve_optimal_search(v, es)
end

# ╔═╡ 16aa6f4a-3e95-4713-8cc9-6a6e9784d5cf
iterate_policy_for_search(0.0, endogenous_search)

# ╔═╡ 5736d5b1-7157-4460-b5fd-c91a06e335dc
iterate_policy_for_search(0.6, endogenous_search)

# ╔═╡ 8faafcf2-8114-4f67-9d77-94957dcb3ff3
begin
	K3 = 300
	c = zeros(K3)
	for k = 2:K3
		c[k] = iterate_policy_for_search(c[k-1], endogenous_search)
	end
	plot(c)
end

# ╔═╡ e235fd07-7d3e-47f5-9f91-ef1f77f027aa


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
# ╟─7ad14498-70af-43fd-93c4-6455bbfda2c7
# ╟─87daaac1-ac21-4eae-918a-c734a0586953
# ╠═93439833-7d13-4050-99e7-3a3aa1f46902
# ╠═fb3e59b4-2fe6-4e17-9368-74150c05c2d9
# ╠═7f87c02c-9d3b-4835-b79b-552fd88c5a85
# ╠═8fbff738-d1d9-419b-9431-7d239bc8b7ba
# ╠═24297218-8dfa-4452-bca0-bcd3cfcca81a
# ╠═43d59b55-8f02-440a-a3c8-d41b02960f1f
# ╠═db61f6f7-d80a-4181-b688-5342511f934b
# ╟─897e60a4-a490-4ff6-9bc6-6e444a54459f
# ╠═f3ec84c7-a8ee-485b-8ad3-505d2f1bec7e
# ╠═85f62f1f-e1dd-4caf-9a38-9d74839784c5
# ╠═c5fa4f78-5754-40b3-bbb3-532353d97e4f
# ╠═838873e2-2f05-4073-9dff-150878294357
# ╠═1246d57c-e4c2-4e49-b780-2b4c172a2298
# ╠═7f8f937d-c385-493e-9c47-e7b0137ca3e5
# ╠═2ffb4a19-8afc-433c-88c5-40d33da4dd59
# ╟─9dcc5ecc-f179-4405-8d13-d3695febd5ef
# ╠═e9b2b135-c87e-4941-acac-50f353b24d00
# ╠═578ab4ba-7fab-40ba-ad4c-48d04e8f432a
# ╠═0c271a97-e90c-41c1-bfbb-49b2582dc705
# ╠═3e1d90e6-ddd4-4ea8-bbbd-ef3013741022
# ╠═ce36dfe0-0bb1-49c7-902c-1c5ef5f71995
# ╠═659f446f-42d6-4c4d-8024-b2a82551fb9d
# ╠═a1fd0480-497a-466e-910a-96a63c78d357
# ╠═179e5955-1cd6-49a9-8e47-3dcc2944de4c
# ╠═6b73c137-ad76-4bcf-88f5-34714c5ffe3a
# ╠═16aa6f4a-3e95-4713-8cc9-6a6e9784d5cf
# ╠═5736d5b1-7157-4460-b5fd-c91a06e335dc
# ╠═8faafcf2-8114-4f67-9d77-94957dcb3ff3
# ╠═e235fd07-7d3e-47f5-9f91-ef1f77f027aa
