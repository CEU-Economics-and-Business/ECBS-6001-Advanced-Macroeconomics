Remember, for first-order difference equation
$$
x_t = a x_{t-1}
$$
Solution
$$
x_t = c a^t
$$
with $c$ pinned down by the boundary condition.

Stable when
$$
|a| < 1.
$$

## Lag operator
$$
Lx_t \equiv x_{t-1} 
$$
is linear
$$
L(a x_t + b z_t) = aL x_t + b L z_t 
$$
$$
L(Lx_t) = Lx_{t-1} = x_{t-2}
$$
so that
$$
L^px_t = x_{t-p}
$$

$$
x_t = a_1 L x_{t} + a_2 L^2 x_{t}
$$
$$
(1 - a_1L - a_2 L^2) x_t = 0
$$
Recall for AR1:
$$
(1- aL)x_t = 0
$$
had the solution $x_t = c a^t$. If $x_{t1}$ is a solution to AR1 with $\lambda_1$, then $(1-\lambda_1 L)x_{t1} = 0$ for all $t$. Btw, $x_{t1} = c_1 \lambda_1^t$.

Suppose we have $\lambda_1$ and $\lambda_2$ such that:
$$
(1 - \lambda_1L)(1 - \lambda_2 L)x_t = 0.
$$
Then $x_{t1}$ and $x_{t2}$ are both solutions to AR2. The generic solution is
$$
x_t = c_1 \lambda_1^t + c_2 \lambda_2 ^t.
$$
To find $\lambda$,
$$
-a_2  = \lambda_1 \lambda_2 
$$
$$
a_1 = \lambda_1 +\lambda_2
$$

## Matrices
$$
x_t = a_1 x_{t-1} + a_2 x_{t-2}
$$
with $\mathbf x_t=(x_t, x_{t-1})'$
$$
\mathbf x_t =
\begin{bmatrix}
a_1 & a_2 \\
1 & 0 
\end{bmatrix} \mathbf x_{t-1}
$$