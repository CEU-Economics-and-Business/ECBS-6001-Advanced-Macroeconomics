## Dynamic programming with Markov chain
### Sequence problem
$$
\max_{\{c_t\}} \sum_{t=0}^\infty \beta^t u(c_t)
$$
subject to
$$
W_0 = \sum_{t=0}^\infty \frac {c_t}
{(1+r)^t}
$$

### Recursive problem
$$
\max_c u(c) + \beta V_{t+1}[(W_t-c)(1+r)]
$$
where 
$$
V_{t+1} = \sum_{s=t+1}^\infty \beta^{s-t-1} u(c_{s}).
$$
Denote the solution to the RP problem $V_t$.

Key idea: $V_{t+1}$ is also a solution to the recursive problem and so on.

This is a divide and conquer type algorithm.

### Cake eating problem
$$
u(c) = \ln(c)
$$
and 
$$
r=0.
$$
Sequential Problem:
$$
\max_{\{c_t\}} \sum_{t=0}^\infty \beta^t\ln c_t
$$
s.t.
$$
W_0\ge \sum_{t=0}^\infty c_t.
$$
FOC:
$$
\beta^t \frac 1{c_t} = \Lambda\cdot 1.
$$
$$
c_t = \Lambda^{-1} \beta^t
$$
to pin down $\Lambda$,
$$
W_0 = \Lambda^{-1}\sum_{t=0}^\infty \beta^t = 
\frac 1
{\Lambda (1-\beta)}
$$
so that
$$
\Lambda = \frac 1
{W_0(1-\beta)}
$$
and
$$
c_t = W_0(1-\beta)\beta^t
$$
Recursive Problem: Find some value function $V()$ such that
$$
\tag{*}
V(W_t) = \max_c \ln c + \beta V(W_t - c)
$$
Note: 
1. eq (\*) is called the **Bellman equation**.
2. it is a **functional equation**: we are looking for a $V()$ function s.t. (\*) holds for every possible value of $W$. 
3. under some conditions, $V()$ is the same as the solution to the SP.

## Break until 14:29
(2) is a complication, but we use 3.5 strategies to overcome it.

### Guess and verify (method of undetermined coefficients)
One guess
$$
V(x) = a +b \ln x
$$
Suppose this is true, my maximization problem:
$$
\max_c \ln c + \beta[a+b\ln(W-c)]
$$
FOC:
$$
\frac1c + \beta b(-1)\frac1{W-c} = 0
$$
or $$
c =  (W-c) / (\beta b)
$$
$$
\frac{W-c}{c} = W/c-1 = \beta b
$$
$$
c = W\frac 1{1+\beta b}
$$
Substitute this in 
$$
\tag{*}
V(W_t) = \max_c \ln c + \beta V(W_t - c)
$$
to get
$$
a+b \ln W = [\ln W - \ln(1+\beta b)] + 
\beta[a+b\ln(W-c)]
$$
but $W-c = W(1-1/(1+\beta b))$ .
$$
\tag{**}
a+b \ln W = [\ln W - \ln(1+\beta b)] + 
\beta[a+b\ln W + b\ln(\beta b/(1+\beta b))]
$$
Do $a$ and $b$ exist such that (\*\*) is true for **every possible value** of W? I can ensure this if all "polynomial" terms of W are equal. For $\ln W$:
$$
b = 1 + \beta  b
$$
this holds iff
$$
b = 1/(1-\beta).
$$
For "constant terms," not depending on W,
$$
a = -\ln(1+\beta b) + \beta a + \beta b \ln(\beta b/(1+\beta b))
$$
Yes, we can solve this for $a$.



### Value function iteration
Take the Bellman as an operator, not an equation. EQ:
$$
\tag{*}
V(W_t) = \max_c \ln c + \beta V(W_t - c)
$$
operator:
$$
Tv := (Tv)(x) = \max _c \ln c+ \beta v(x-c)
$$
### Policy function iteration
### Parametric policy function iteration (1+3)
