## Linear difference equations
## wontdo: nonlinear
## wontdo: Stochastic difference equations
Let $u_t$ be a random variable. Then so will be x:
$$
x_t = a x_{t-1} + u_t
$$
$$
\mathbf x_{t} = \mathbf A \mathbf x_{t-1} + \mathbf B \mathbf u_{t}
$$
with x is K by 1, A K by K, u is M by 1, B K by M.
> TODO: clean up theoretical results

# Break until 14:38

## Markov chains
## Dynamic programming with Markov chains
## ... and difference equations
## Application 1: Diamond-Mortensen-Pissarides search model
## Application 2: A GE technology adoption problem (Julia vs Matlab)

# Markov chains
Suppose $x_t\in \{1, 2, ..., K\}$. discrete or categorical variables, with K different "states".

To make it stochastic, assume random variable, give it a **probability mass function**:
$$
\pi_{tk} = \Pr(x_t = k)
$$
Suppose K=2 and 1=employment, 2=unemployment. Then $\pi_{t1}$ is the prob of being employed in period t, $\pi_{t2} = 1-\pi_{t1}$.

> ### PMFs
> Because pmfs have
> $$
1\ge \pi_k
 \ge 0
 $$
 and
 $$
 \sum_{k=1}^K \pi_k = 1.
 $$
 
 
 How do we transition from employment to unemployment? Suppose $x_1 = 1$. What is the probability that $x_2 = 1$? This will be characterized by a PMF.
### Markov property 
My forecast, that is, my PMF can only depend on the current value of $x$. Then I will have K PMFs, each of length K.

For every $i$, collect PMF into a row vector of probs:
$$
\Pr(x_2 = k| x_1=i) = \pi_{ik}
$$

So let's arrange them in a square matrix, KxK:
$$
\mathbf P = 
\begin{bmatrix}
\pi_{11} & \pi_{12}\\
\pi_{21} & \pi_{22}
\end{bmatrix}
$$
But we know that
$$
1 \ge \mathbf P \ge 0\tag{*}
$$
and
$$
\sum_k \pi_{ik}
 = 1 \text{ for all } i$$
 in matrix notation:
 $$
 \mathbf P \mathbf 1 = \mathbf 1 \tag{**}
 $$
 P is called a **transition matrix**. Square matrices satisfying (*) and (**) are **stohastic matrices**.
$$
\mathbf P = 
\begin{bmatrix}
0.95 & 0.05\\
0.12 & 0.88
\end{bmatrix}
$$