# Dynamic Programming
## Sequence problem
$$
\max_{\{c_t\}} \sum_{t=0}^\infty \beta^t u(x_t, c_t) 
$$
subject to 
$$
x_{t+1} = F(x_t, c_t)
$$
Note assumptions that can be relaxed:
- infinite horizon
- time-invariant utility
- exponential discounting
- deterministic law of motion

The value of this problem
$$
V_0(x_0) = \max_{\{c_t\}} \sum_{t=0}^\infty \beta^t u(x_t, c_t). 
$$

## Bellman equation
**Recursive problem**:
$$
V(x_t) = \max_c u(x_t, c) + \beta V(x_{t+1})
$$
subject to law of motion $x_{t+1} = F(x_t, c)$.

Note:
1. This is a **functional equation**. It has to hold for *all* possible values of $x$.
2. Under some conditions, the equation has a unique, strictly concave solution.
3. Which is the solution to the sequence problem, $V(x)\equiv V_0(x)$.
## Three solution methods
### 1. Guess and verify
"Method of undetermined coefficients"
$$
LHS(x) = RHS(x)
$$
if both are linear, then
$$
a_1 + b_1x = a_2 +b_2 x 
$$
is true for all $x$ if and only if $a_1=a_2$ and $b_1=b_2$.

Additional step: there is a maximization step that also depends on the coefficients.
### 2. Value function iteration
### 3. Policy function iteration

## The cake-eating problem
## Linear-quadratic programming