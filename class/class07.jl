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

# ╔═╡ ea710c9a-3c43-41d8-a834-eee3214d8fae
Pkg.add("Distributions")

# ╔═╡ 600c06c9-c1b7-40d8-ad6d-5967849b265a
using Plots

# ╔═╡ b7a95ab0-2bf0-41da-aa27-9db0a00a99bc
using Distributions

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

# ╔═╡ 9a487dc6-0a91-461f-9643-fd255d9e7769
π1 = P' * π0

# ╔═╡ 48ed4fe5-314d-4f87-bd15-b98b0e4cc237
π2 = P' * π1

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


# ╔═╡ Cell order:
# ╠═d5af859a-6998-11ed-0a0c-71651f6b38fe
# ╠═600c06c9-c1b7-40d8-ad6d-5967849b265a
# ╠═b7a95ab0-2bf0-41da-aa27-9db0a00a99bc
# ╠═ea710c9a-3c43-41d8-a834-eee3214d8fae
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
