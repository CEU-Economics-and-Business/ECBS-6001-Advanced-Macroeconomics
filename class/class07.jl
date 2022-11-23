### A Pluto.jl notebook ###
# v0.19.14

using Markdown
using InteractiveUtils

# ╔═╡ d5af859a-6998-11ed-0a0c-71651f6b38fe
begin
    import Pkg
    # activate the shared project environment
    Pkg.activate(".")
    # instantiate, i.e. make sure that all packages are downloaded
    Pkg.instantiate()
end

# ╔═╡ 600c06c9-c1b7-40d8-ad6d-5967849b265a
using Plots

# ╔═╡ b7a95ab0-2bf0-41da-aa27-9db0a00a99bc
using Distributions

# ╔═╡ 54e178a8-6f83-47dd-b4db-5c41960df1b0
using LinearAlgebra

# ╔═╡ a7ff8784-c6c4-43f6-8747-321e549d67c4
P = [0.9 0.1;
	0.2 0.8]

# ╔═╡ 7a000a47-3733-402e-a47e-1bf0ce4efc4c
function test_stochastic(P::Matrix{Float64})
	K, N = size(P)
	return (K==N) && all(sum(P, dims=2) .== 1) && all(P .>= 0) && all(P .<= 1)
end

# ╔═╡ d5da4ae1-b3ee-41ad-a16c-8546da7d5ffa
size(P)

# ╔═╡ fac6f85e-af5b-4554-ac0f-9a8e0898b36d
test_stochastic([1.0 2 3; 4 5 6])

# ╔═╡ 06c32e40-f207-4244-839a-1f0e27cb3f69
a = [true, false]

# ╔═╡ cdd6e967-dd3f-478f-9861-0f26ca74b180
typeof(a)

# ╔═╡ 59ef2df5-f8e3-4117-b6e9-efa1931bfb8b
b = [true, true]

# ╔═╡ 9e44d5ba-d2b1-4482-bcdb-b529ec1098a4
a .& b

# ╔═╡ fe72d34f-7590-43e5-98f9-5d0bd7a7c8f1
7 & 3

# ╔═╡ ae55c7f5-d819-46a4-9800-f83b0f275a82
t(x) = (println(x); true)

# ╔═╡ 27d3ec2c-1a00-42b0-aa0f-4f77b7082149
f(x) = (println(x); false)

# ╔═╡ 8efe8a0e-336f-4914-a2e1-50686447d0cc
t("i am here")

# ╔═╡ 4135e086-513f-4762-a355-a8f287529eb3
f("iam here")

# ╔═╡ 03aa0728-d01e-482b-a4b2-ac51ee217534
f("i am here") && t("and you are there")

# ╔═╡ e5fefd87-a4b1-4da7-9c0d-396df7981c18
md"In Julia, people often check for errors like this:"

# ╔═╡ b56b9018-4bfb-49c2-a115-6570ee7f2853
test_stochastic([0.9 0.1; 0.3 0.8]) || println("Error: non-stohastic matrix")

# ╔═╡ 0f0c2547-812e-4e65-b235-5de73638449a
test_stochastic(P)

# ╔═╡ 2d7a789a-3b0e-429c-8a04-2d28b5b0aa9a
π0 = [1.0, 0.0]

# ╔═╡ 10da4de1-36b5-4b8b-a6e4-aef1e5aa7230
function forecast_markov_chain(P::Matrix{Float64}, π0::Vector{Float64}, T=30)::Matrix{Float64}
	K, _ = size(P) 
	test_stochastic(P) || println("Error: P is not stochastic")
	K == length(π0) || println("Error: mismatch of P and pi")

	π = Matrix{Float64}(undef, K, T)
	π[:, 1] = π0
	for t = 2:T
		π[:, t] = P' * π[:, t-1]
	end
	return π
end

# ╔═╡ a5876d14-fd97-475f-a675-ce576da31de2
π = forecast_markov_chain(P, [1.0, 0])

# ╔═╡ 1f584de6-1a81-44e7-9fbd-e665b27d220f
plot(π')

# ╔═╡ 79a44c3e-9a08-46b6-9532-9d8eb8d555d3
plot(
	forecast_markov_chain(P, [0.0; 1.0])'
)

# ╔═╡ 821f9cc4-fb80-498a-95de-cf42972f8159
typeof([0.0; 1.0])

# ╔═╡ 3d9a1060-cc25-4337-84c8-59c759a78b46
begin
	@show ones(2,1)
	@show ones(2)
	ones(2,1) == ones(2)
end

# ╔═╡ 93fb61c6-ac48-435c-a7dd-463b50569f4a
P

# ╔═╡ 0b505769-71b8-4c65-b68d-a4a549d8dd2c
eigen(P) # NONONONO!

# ╔═╡ e803f987-67a4-461a-a715-2e738ecaa9a1
eigen(P')

# ╔═╡ 06d833b3-fa0c-41b8-b8d7-b40d714c6644
λ1 = eigen(P').values[2]

# ╔═╡ 33ce5a07-bf9a-4508-a1bb-0e9946a9ca68
v1 = eigen(P').vectors[:, 2]

# ╔═╡ 91ea97ca-9565-4be7-beb3-27882c3f21ef
P' * v1 == v1

# ╔═╡ 7765f180-3931-48d5-8a84-484371859801
md"But v1 is not a PMF!"

# ╔═╡ 6f0e619f-7851-4b28-98a6-ac2c1f2aaa0b
P' * π1 == π1

# ╔═╡ 7850e89c-da6f-41b5-8e5e-a1b67e535739
plot(
	forecast_markov_chain(P, π1)'
)

# ╔═╡ 92e652cb-bfd5-4d9b-b5ed-afc0e154317a
begin
	A3 = [1 2 3; 3 4 5; 1 2 9]
	@show eigen(A3).values
	@show eigen(A3').values
end

# ╔═╡ 45525bf0-afc1-4120-8c45-ecaca7b5803f
eigen([1.0 0; 0 1.0]).values

# ╔═╡ d85c5b1b-2f01-42f0-bfb6-29635da3d4cd
P

# ╔═╡ 7001226f-8d71-48dc-8d76-615f6f8b2d36
md"# Break until 14:38"

# ╔═╡ ec752aef-fa77-4582-9046-49be2a746816
P3 = [ 	0.9 0.1 0.0;
		0.4 0.5 0.1;
		0.4 0.2 0.4]

# ╔═╡ 4c16c1ae-f6fc-4806-bd0e-26c6314c5d87
test_stochastic(P3)

# ╔═╡ ee155d05-a5c6-4e11-a8ee-9d265516247e
eigen(P3')

# ╔═╡ a1c3c6eb-8942-4aa9-82fa-0930afed8f80
begin
	v3 = eigen(P3').vectors[:,3]
	π3 = v3 ./ sum(v3)
end

# ╔═╡ d5f8e653-b9e4-4e8e-a5c8-fdb1f21cfedf
1 // 2

# ╔═╡ 1acf02ee-ff02-40dd-b412-f52d533ea9d7
md"[I hate floating point arithmetic](https://0.30000000000000004.com/)! "

# ╔═╡ 782e02b9-8a2c-42fe-8f30-82aa7968a76c
0.1 + 0.2

# ╔═╡ 32ad72a8-3c5a-45f8-ae3a-64d9c4ef5057
float(1 // 10 + 2 // 10)

# ╔═╡ a934bf84-c9c1-488f-b395-c54a2b89d47c
0.1 + 0.2 ≈ 0.3

# ╔═╡ a70a05c8-6bb4-4569-a036-0a211c0b7c26
0.1 + 0.2 == 0.3

# ╔═╡ dd26bdcc-16e7-496a-820b-e4a0a79b4b58
[1.0 0; 1.0 0]

# ╔═╡ 541e0b93-1cd9-477e-888d-7a8726424f42
eigen([1.0 0; 1.0 0])

# ╔═╡ da279927-2ca1-40ac-999d-e807cce3c662
P1 = [1.0 0; 0 1.0]

# ╔═╡ 1abb1cd7-28e0-43e2-b143-95f3082681f2
plot(
	forecast_markov_chain(P1, [0.7, 0.3])'
)

# ╔═╡ f39492f9-ad54-47cb-b4b0-54c705890521
P

# ╔═╡ 491f5020-51d9-4b06-9e76-3f9027d9675e
λ2 = eigen(P').values[1]

# ╔═╡ f9d39d17-bfa6-4bc1-ab8b-fc97b017fdd9
P' * (π1 + 0.1 * π2)

# ╔═╡ 870e2479-5b72-446c-92ff-43b087e19267
begin
	@show π1 + 0.1 * λ2 * π2
	@show P' * (π1 + 0.1 * π2)
end

# ╔═╡ cfcb2afa-0d16-470c-9b0c-85aa8148222e
plot(
	forecast_markov_chain(P3, [1.0, 0.0, 0.0])'
)

# ╔═╡ 5dc20018-b030-45b1-8f27-80affe07d5f7


# ╔═╡ 3e330d92-9419-481d-8d04-beeb365a305e


# ╔═╡ 9a487dc6-0a91-461f-9643-fd255d9e7769
# ╠═╡ disabled = true
#=╠═╡
π1 = P' * π0
  ╠═╡ =#

# ╔═╡ 48ed4fe5-314d-4f87-bd15-b98b0e4cc237
# ╠═╡ disabled = true
#=╠═╡
π2 = P' * π1
  ╠═╡ =#

# ╔═╡ 3d4fc526-582f-4f3e-903e-e9baa08cefa3
π1 = v1 ./ sum(v1)

# ╔═╡ 885a3dfe-3646-4bd6-b65c-cfc77167a234
π2 = eigen(P').vectors[:,1]

# ╔═╡ Cell order:
# ╠═d5af859a-6998-11ed-0a0c-71651f6b38fe
# ╠═600c06c9-c1b7-40d8-ad6d-5967849b265a
# ╠═b7a95ab0-2bf0-41da-aa27-9db0a00a99bc
# ╠═a7ff8784-c6c4-43f6-8747-321e549d67c4
# ╠═7a000a47-3733-402e-a47e-1bf0ce4efc4c
# ╠═d5da4ae1-b3ee-41ad-a16c-8546da7d5ffa
# ╠═fac6f85e-af5b-4554-ac0f-9a8e0898b36d
# ╠═06c32e40-f207-4244-839a-1f0e27cb3f69
# ╠═cdd6e967-dd3f-478f-9861-0f26ca74b180
# ╠═59ef2df5-f8e3-4117-b6e9-efa1931bfb8b
# ╠═9e44d5ba-d2b1-4482-bcdb-b529ec1098a4
# ╠═fe72d34f-7590-43e5-98f9-5d0bd7a7c8f1
# ╠═ae55c7f5-d819-46a4-9800-f83b0f275a82
# ╠═27d3ec2c-1a00-42b0-aa0f-4f77b7082149
# ╠═8efe8a0e-336f-4914-a2e1-50686447d0cc
# ╠═4135e086-513f-4762-a355-a8f287529eb3
# ╠═03aa0728-d01e-482b-a4b2-ac51ee217534
# ╠═e5fefd87-a4b1-4da7-9c0d-396df7981c18
# ╠═b56b9018-4bfb-49c2-a115-6570ee7f2853
# ╠═0f0c2547-812e-4e65-b235-5de73638449a
# ╠═2d7a789a-3b0e-429c-8a04-2d28b5b0aa9a
# ╠═9a487dc6-0a91-461f-9643-fd255d9e7769
# ╠═48ed4fe5-314d-4f87-bd15-b98b0e4cc237
# ╠═10da4de1-36b5-4b8b-a6e4-aef1e5aa7230
# ╠═a5876d14-fd97-475f-a675-ce576da31de2
# ╠═1f584de6-1a81-44e7-9fbd-e665b27d220f
# ╠═79a44c3e-9a08-46b6-9532-9d8eb8d555d3
# ╠═821f9cc4-fb80-498a-95de-cf42972f8159
# ╠═3d9a1060-cc25-4337-84c8-59c759a78b46
# ╠═93fb61c6-ac48-435c-a7dd-463b50569f4a
# ╠═54e178a8-6f83-47dd-b4db-5c41960df1b0
# ╠═0b505769-71b8-4c65-b68d-a4a549d8dd2c
# ╠═e803f987-67a4-461a-a715-2e738ecaa9a1
# ╠═06d833b3-fa0c-41b8-b8d7-b40d714c6644
# ╠═33ce5a07-bf9a-4508-a1bb-0e9946a9ca68
# ╠═91ea97ca-9565-4be7-beb3-27882c3f21ef
# ╠═7765f180-3931-48d5-8a84-484371859801
# ╠═3d4fc526-582f-4f3e-903e-e9baa08cefa3
# ╠═6f0e619f-7851-4b28-98a6-ac2c1f2aaa0b
# ╠═7850e89c-da6f-41b5-8e5e-a1b67e535739
# ╠═92e652cb-bfd5-4d9b-b5ed-afc0e154317a
# ╠═45525bf0-afc1-4120-8c45-ecaca7b5803f
# ╠═d85c5b1b-2f01-42f0-bfb6-29635da3d4cd
# ╠═7001226f-8d71-48dc-8d76-615f6f8b2d36
# ╠═ec752aef-fa77-4582-9046-49be2a746816
# ╠═4c16c1ae-f6fc-4806-bd0e-26c6314c5d87
# ╠═ee155d05-a5c6-4e11-a8ee-9d265516247e
# ╠═a1c3c6eb-8942-4aa9-82fa-0930afed8f80
# ╠═d5f8e653-b9e4-4e8e-a5c8-fdb1f21cfedf
# ╠═1acf02ee-ff02-40dd-b412-f52d533ea9d7
# ╠═782e02b9-8a2c-42fe-8f30-82aa7968a76c
# ╠═32ad72a8-3c5a-45f8-ae3a-64d9c4ef5057
# ╠═a934bf84-c9c1-488f-b395-c54a2b89d47c
# ╠═a70a05c8-6bb4-4569-a036-0a211c0b7c26
# ╠═dd26bdcc-16e7-496a-820b-e4a0a79b4b58
# ╠═541e0b93-1cd9-477e-888d-7a8726424f42
# ╠═da279927-2ca1-40ac-999d-e807cce3c662
# ╠═1abb1cd7-28e0-43e2-b143-95f3082681f2
# ╠═f39492f9-ad54-47cb-b4b0-54c705890521
# ╠═491f5020-51d9-4b06-9e76-3f9027d9675e
# ╠═885a3dfe-3646-4bd6-b65c-cfc77167a234
# ╠═f9d39d17-bfa6-4bc1-ab8b-fc97b017fdd9
# ╠═870e2479-5b72-446c-92ff-43b087e19267
# ╠═cfcb2afa-0d16-470c-9b0c-85aa8148222e
# ╠═5dc20018-b030-45b1-8f27-80affe07d5f7
# ╠═3e330d92-9419-481d-8d04-beeb365a305e
