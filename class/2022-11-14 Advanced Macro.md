Linear first-order difference equation,
$$
x_t = a x_{t-1}.
$$
For multivariate difference equation
$$
\mathbf x_t = F(\mathbf x_{t-1})
$$
for now we focus on $F$ is linear
$$
\mathbf x_t = \mathbf A \mathbf x_{t-1}
$$
suppose $\mathbf x$ is K by 1. Then $\mathbf A$ needs to be K by K.

## No AR(p)
We will *not* generalize this to AR(p)! Because any K-dimensional AR(p) process can be turned into Kp-dimensional AR(1) process.

For $K=1$ and $p=2$:
$$
x_t = a_1 x_{t-1} + a_2 x_{t-2}
$$
introduce a 2-dim vector
$$
\mathbf x_t := 
\begin{pmatrix}
x_t \\
x_{t-1}
\end{pmatrix}
$$

> We want to get
> $$
\mathbf x_t = \mathbf A \mathbf x_{t-1}
$$

Take the 2x2 matrix
$$
\mathbf A :=
\begin{bmatrix}
a_1 & a_2\\
1 & 0
\end{bmatrix}
$$
and note that
$$\mathbf x_{t-1} := 
\begin{pmatrix}
x_{t-1} \\
x_{t-2}
\end{pmatrix}
$$
so that the second-order DE can be written as
$$
\mathbf x_t = \mathbf A \mathbf x_{t-1}.
$$
## General KxK case
Iterate forward
$$
\mathbf x_{t} = \mathbf A^t \mathbf x_{0}
$$
how can we characterize this given A?

Do an eigenvalue decomposition. If A is a square matrix, there exists Lambda and invertible Q such that
$$
\mathbf A = \mathbf Q \cdot \mathbf \Lambda\cdot \mathbf Q^{-1}, 
$$
with $\mathbf \Lambda$ a diagonal matrix. Introduce new vector
$$
\mathbf v_t = \mathbf Q^{-1} \mathbf x_{t}
$$
Then 
$$
\mathbf x_{t} = \mathbf Q \mathbf v_t.
$$
For this new vector,
$$
\mathbf Q \mathbf v_t = 
\mathbf Q \mathbf \Lambda \mathbf Q^{-1} 
\mathbf Q \mathbf v_{t-1} = \mathbf Q\mathbf \Lambda \mathbf v_{t-1}.
$$
Multiply by Q inverse,
$$
\mathbf v_t = \mathbf \Lambda \mathbf v_{t-1}
$$
and
$$
\mathbf v_{t} = \mathbf \Lambda^t \mathbf v_0,
$$
which is a diagonal matrix. The vector v is a set of independent AR(1) processes.
$$
\mathbf \Lambda^t =
\begin{bmatrix}\lambda_1^t & 0 & 0 & ...\\
0 & \lambda_2 ^t & 0 & ...\\
0 & 0 & \lambda_3^t & ...\\
...
\end{bmatrix}
$$
$\Lambda$ is unique up to reordering its elements.

## Eigenvalues
For an eigenvalue $\lambda_i$ and corresponding eigenvector $\mathbf v_i$, 
$$
\mathbf A \mathbf v_i = \lambda_i \mathbf v_i
$$
Every K by K matrix has K such vectors and values. finding them:
$$
(\mathbf A - \lambda_i \mathbf I)\mathbf v_i = \mathbf 0.
$$
For the matrix in () to be singular
$$
\det(\mathbf A - \lambda_i \mathbf I) = 0.
$$
This is a order k polynomial equation in $\lambda$ with k roots. These are the eigenvalues.
* the same lambda may appear multiple times
* lambda may be complex

### Properties
1. Lambdas are unique up to ordering and multiplicity.
2. If $\mathbf v$ is an eigenvector, then so is $2 \mathbf v$. they are only unique up to scaling.
3. $\det(A) = \prod \lambda_i$
4. ()

## Interpret A
$$\mathbf x_t = \mathbf A \mathbf x_{t-1} 
$$
Call $i$th row of A $\mathbf a_i$, a 1 by K vector.
$$
x_{ti} = \mathbf a_i \mathbf x_{t-1} \equiv
\sum_k a_{ik}x_{t-1,k}
$$
