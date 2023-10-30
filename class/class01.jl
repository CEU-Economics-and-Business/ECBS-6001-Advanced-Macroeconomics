### A Pluto.jl notebook ###
# v0.19.30

using Markdown
using InteractiveUtils

# ╔═╡ 27db1ce4-7712-11ee-1db5-ddc090bf832a
2 + 4

# ╔═╡ b07af337-9249-4651-92ff-816b35d336e3


# ╔═╡ aed409aa-cf75-4187-8722-c23f541414c4
"Hello..... world!"

# ╔═╡ 1ae31910-14f9-4f67-b77c-54158c94d21f
x = 5

# ╔═╡ 6090a045-e335-4d65-859c-40ca04e22300
y = x + 2

# ╔═╡ 0e8ade61-8589-483b-97bf-8dc906d8ca7e
# ╠═╡ show_logs = false
if y == 7
	println("This is seven.")
end

# ╔═╡ 178e5dcd-9f17-4c9d-b86b-2f6dd42115ed
begin
	z = y - 1
	w = z * 2
	""
end

# ╔═╡ 0c4d6642-d39f-49c4-8406-e9c4bb075893
"This is a string."

# ╔═╡ f5368a4b-faa1-476f-8f4f-4023ff2d9a8d
md"# This is a header"

# ╔═╡ 264e014d-8312-4d83-8a03-ee1438d6ab93
"""This is a multiline
string."""

# ╔═╡ 4e349b5b-2daf-45a7-8d0c-671a060ba5e7


# ╔═╡ 30e41e6d-0ec4-4c74-911c-eafc46fd4acf
md"""Our working example:
Career choice: $d_t=1$ if entrepreneur at time $t$, $0$ if worker

$$\max_{\{d_t\}} \sum_{t=0}^\infty\beta^t E[d_t\pi_t + (1-d_t)w_t]$$

subject to constraints:

- $\pi_t$ and $w_t$ evolve according to some rules (sessions 1 and 2)
- there are restrictions on changing $d_t$ relative to $d_{t-1}$ (sessions 3-5)
- Remember those rules in session 1 and 2? They have to be true in equilibrium (session 9-11)

## Markov processes, difference equations
Take a first-order difference equation

$$\pi_t = F_1(\pi_{t-1}, w_{t-1})$$

$$w_t = F_2(\pi_{t-1}, w_{t-1})$$

- List **state variables**, that characterize future dynamics.
- Assume away aggregate uncertainty, so $F$ is deterministic.
- To predict the future, you only need to know the present. ($\approx$ Markov property)

$$\pi_{t+2} = F_1(\pi_{t+1}, w_{t+1}) = F_1[F_1(\pi_t, w_t), F_2(\pi_t, w_t)]$$

Switch to matrix-vector notation:

$$\mathbf x_t = F(\mathbf x_{t-1})$$

$$\mathbf x_t = \begin{pmatrix}
\pi_t\\
w_t
\end{pmatrix}$$
$F$ is a vector-valued function, for example, if linear:

$$F(\mathbf x_t) = \mathbf A \mathbf x_t + \mathbf b$$

with $\mathbf x$ and $\mathbf b$  2x1 vectors, and $\mathbf A$ a 2x2 matrix.  

## Julia
The key `]` opens up the package manager. `basckspace` gets you.
- [ ] `Error building GR` on Windows
- [ ] illustrate performance gains?

### Pluto
- command enter, shift enter
"""

# ╔═╡ b47f2233-e75d-4dc8-8fda-12d9c8d67d6b
A = [0.7 0.1; 0.2 -0.3]

# ╔═╡ 70f4f498-956a-4e5b-8df2-18760335bd11
typeof(A)

# ╔═╡ b758c9f6-0987-419f-bd5e-58795ffe1d29
b = [1, 2]

# ╔═╡ 9eb5adf2-286a-4b1f-88b9-819798cf0048
typeof(b)

# ╔═╡ 2c10dc8d-a6a1-4ff9-9461-54cb6fb942ae
typeof(y)

# ╔═╡ 4e749bdd-8f45-409d-ac16-5d96cafa0373
typeof(4.0)

# ╔═╡ eee7955c-ad1f-45d1-904d-0283bd9286bc
small_number = 0.0000000000000000000000000000000000000000000000000000000000000000000004

# ╔═╡ 762a48ff-9565-48c1-9959-f763927ec39e
large_number = 9999999999999999999999999999999999999999999999999999999999999999.9

# ╔═╡ 86dc54f4-0c15-4780-afba-3d207fe23489
0.1

# ╔═╡ 4da0352d-78e0-4024-a462-3c67906ca6c9
0.2

# ╔═╡ acf529d5-67e4-438b-96e8-d92c673951e3
0.1 + 0.2

# ╔═╡ f0ccb503-8b08-4d29-b6b4-3f2ba2355644
0.1 + 0.2 == 0.3

# ╔═╡ 37e57760-a00d-4a03-aa77-47dd9371ce64
1/10

# ╔═╡ ae912618-c0a9-4b25-b5f7-d2f34cd9b66f
1//10

# ╔═╡ 115a5584-e0ae-4424-93e0-da473dfc0ff1
typeof(1//10)

# ╔═╡ 9c6aa428-b3e6-4038-8189-434e763fbee0
1//10 + 2//10 == 3//10

# ╔═╡ 28d2169e-e5fa-4b8d-a163-a4ea49b654d7
0.1 + 0.2 ≈ 0.3

# ╔═╡ ece63a9b-055c-4cb2-8462-44fbbaa2b91e


# ╔═╡ Cell order:
# ╠═27db1ce4-7712-11ee-1db5-ddc090bf832a
# ╠═b07af337-9249-4651-92ff-816b35d336e3
# ╠═aed409aa-cf75-4187-8722-c23f541414c4
# ╠═1ae31910-14f9-4f67-b77c-54158c94d21f
# ╠═6090a045-e335-4d65-859c-40ca04e22300
# ╠═0e8ade61-8589-483b-97bf-8dc906d8ca7e
# ╟─178e5dcd-9f17-4c9d-b86b-2f6dd42115ed
# ╟─0c4d6642-d39f-49c4-8406-e9c4bb075893
# ╟─f5368a4b-faa1-476f-8f4f-4023ff2d9a8d
# ╠═264e014d-8312-4d83-8a03-ee1438d6ab93
# ╠═4e349b5b-2daf-45a7-8d0c-671a060ba5e7
# ╟─30e41e6d-0ec4-4c74-911c-eafc46fd4acf
# ╠═b47f2233-e75d-4dc8-8fda-12d9c8d67d6b
# ╠═70f4f498-956a-4e5b-8df2-18760335bd11
# ╠═b758c9f6-0987-419f-bd5e-58795ffe1d29
# ╠═9eb5adf2-286a-4b1f-88b9-819798cf0048
# ╠═2c10dc8d-a6a1-4ff9-9461-54cb6fb942ae
# ╠═4e749bdd-8f45-409d-ac16-5d96cafa0373
# ╠═eee7955c-ad1f-45d1-904d-0283bd9286bc
# ╠═762a48ff-9565-48c1-9959-f763927ec39e
# ╠═86dc54f4-0c15-4780-afba-3d207fe23489
# ╠═4da0352d-78e0-4024-a462-3c67906ca6c9
# ╠═acf529d5-67e4-438b-96e8-d92c673951e3
# ╠═f0ccb503-8b08-4d29-b6b4-3f2ba2355644
# ╠═37e57760-a00d-4a03-aa77-47dd9371ce64
# ╠═ae912618-c0a9-4b25-b5f7-d2f34cd9b66f
# ╠═115a5584-e0ae-4424-93e0-da473dfc0ff1
# ╠═9c6aa428-b3e6-4038-8189-434e763fbee0
# ╠═28d2169e-e5fa-4b8d-a163-a4ea49b654d7
# ╠═ece63a9b-055c-4cb2-8462-44fbbaa2b91e
