### 1. Simulate realizations of MC [X]
### Break until 14:28
### 2. More general results about convergence
Remember
$$
\pi_t = \mathbf P' \pi_{t-1} 
$$
Stability properties?

1. Steady state: start there, stay there. This always exists, because every stochastic P has the eigenvalue 1 at least once.
$$
\pi_* = \mathbf P' \pi_* 
$$
2. Convergence:
$$
\pi_\infty = \lim_{t\to \infty} (\mathbf P')^t \pi_0
$$
	- does this exist?
	- is it independent of $\pi_0$?
	- is it the same as $\pi_*$?
If so, we call it the ergodic distribution of $P$. **Not every MC is ergodic.**
> TODO: check exact definition of "ergodic"

Two sufficient (but not necessary) conditions for convergence to a unique steady state, $\pi_\infty = \pi_*$.
1. $P_{ij}>0$ for all $i,j$.
2. For some $T>1$, $[\mathbf P'^T]_{ij}>0$ for all $i,j$

### Counterexample:
The identity matrix is not ergodic, $\pi_\infty = \pi_0$.

### Eigenvalues
If all eigenvalues are $|\lambda_i| < 1$ for $i=2,...,K$ then the MC is ergodic and $\pi_\infty = \pi_*$.

### 3. Parametric MCs
Take $x_t$: number of emails in your inbox on day $t$. Given $x_t$, you may get a new email, or you may delete an email from your inbox with some probability.
$$
\Pr(x_t=j|x_{t-1} = i) = \begin{cases}
\lambda & \text{if }j = i + 1\\
\mu & \text{if }j= i - 1\\
1-\lambda-\mu & \text{if } j=i\\
0 & \text{otherwise}
\end{cases}
$$
(plus some lower bound if you don't have emails)
$$
\Pr(x_t=j| x_{t-1}=0) = \begin{cases}
\lambda & j=1\\
1-\lambda & j=0\\
0 & j>1
\end{cases}
$$

States: $k=0, 1, 2, ...$ Transition matrix
$$
\mathbf P = \begin{bmatrix}
1-\lambda & \lambda & 0 & 0 &...\\
\mu & 1-\lambda-\mu & \lambda & 0 & ...\\
0 & \mu & 1-\lambda - \mu & \lambda & ...\\
...
\end{bmatrix}
$$
What is the steady state of this process?
$$
\pi_*' = \pi_*'\mathbf P
$$
$$
\pi_{*0} = (1-\lambda)\pi_{*0} + \mu \pi_{*1}
$$
$$
\pi_{*1} = \lambda \pi_{*0} + (1-\lambda-\mu)\pi_{*1} + \mu \pi_{*2}
$$
resulting in a second-order difference equation for $\pi_{*n}$. I can solve for this recursively.

**Birth and death process**: this one with a fixed birth rate and death rate.

Steady state PMF is geometrically distributed. For convergence, we need $\lambda/\mu<1$. 

### 4. Start with dynamic programming
