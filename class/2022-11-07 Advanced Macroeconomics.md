## Assignments
1. Shorter take-home during classes
2. Longer take-home after we are done

Both will have theory and coding components (about 50-50).

## Dynamic systems
### Difference equations
$$
y_t = F(y_{t-1})
$$
start with
#### Linear difference equations
$$
y_t = a y_{t-1} +b_t
$$
or with constant $b_t = b$
$$
y_t - Cb = a[y_{t-1}-Cb]
$$
$$
y_t = Cb - aCb +ay_{t-1}
$$
$C(1-a) = 1$ so $C=1/(1-a)$  whenever $1\neq a$
$$
y_t - \frac {b}{1-a} =
a\left[
y_{t-1} - \frac b{1-a}
\right]
$$
or with $\tilde y_t := y_t-b/(1-a)$
$$
\tilde y_t = a \tilde y_{t-1}
$$
Start from $y_0$,
$$
y_t = a^t y_0.
$$
Converging to 0 if $|a|<1$. Explosive if $|a|>1$.
#### Second-order linear difference equation
(forget about $b$)
$$
y_t = a_1 y_{t-1} + a_2 y_{t-2}
$$
Why???
### Lag operator
$$
L y_t := y_{t-1} \,\forall t
$$
is a linear operator:
$$
L(a + by_t) = a+bLy_t \, \forall t
$$
$$
a + by_{t-1} = a+by_{t-1}
$$

$$
a_1 y_{t-1} + a_2 y_{t-2} = 
a_1 L y_t + a_2 L(L y_t) = 
a_1 L y_t + a_2 L^2 y_t
$$
Our difference equation
$$
y_t - a_1 L y_t - a_2 L^2 y_t = 0
$$
$$
y_t(1 - a_1 L - a_2 L^2 ) = 0
$$
contrast this with
$$
y_t(1-aL) = 0.
$$
We want to write
$$
y_t (1 - m_1L)(1-m_2L) = 0.
$$
If $y_t$ is a solution to AR(1) with $m_1$, $y_t(1-m_1L) = 0$ for all $t$, then it is also a solution to AR(2)!