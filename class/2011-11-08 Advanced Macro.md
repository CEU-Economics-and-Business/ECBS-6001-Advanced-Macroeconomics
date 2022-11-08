$$
x_t = a_1 x_{t-1} + a_2 x_{t-2} 
$$
$$
x_t(1-a_1 L - a_2 L^2) = 0
$$
we want to get
$$
x_t(1-m_1L)(1 - m_2 L) = 0
$$
we need
$$
(1-a_1L - a_2 L^2) = (1-m_1L)(1-m_2L)
= 1-m_1L - m_2 L+m_1m_2 L^2
$$
collect terms by $L$, $L^2$
$$
1 =1
$$
$$
a_1=m_1 + m_2
$$
$$
-a_2 = m_1m_2
$$
watch out, $m_1$ and $m_2$ can be complex!

We already know
$$
x_t(1-mL) = 0
$$
has a generic solution $x_t = c m^t$ for some $c$. 

> $$c m^t(1-mL) = cm^t - cm^{t-1}m = 0$$
> for all $t$, all $c$ and all $m$.

But then the second-order difference equation has two generic solutions,
$$
x_{t1} = c_1 m_1^t
$$
is also a solution and so is
$$
x_{t2} = c_2 m_2^t
$$
and so is
$$
a c_1 m_1^t + b c_2 m_2^t.
$$
To pin down constants, you need two boundary conditions. For example,
$$
x_1 = X_1
$$
$$
x_2 = X_2
$$
alternatively, 
$$
x_1 = X_1
$$
$$
\lim_{t\to\infty} b_tx_t = 0.
$$

## What if ms are complex?
Suppose $a$s are real.
> $$a_1 = m_1 + m_2$$
> $$a_2 = -m_1m_2$$

we need both sum and product to be real: "complex conjugates"
$$
m_1 = R + ki
$$
$$
m_2 = R - ki
$$
$$
a_1 = 2R 
$$
$$
a_2 = -(R+ki)(R-ki) = -R^2+k^2 i^2 = -R^2 - k^2
$$
We can also write complex conjugates as
$$
m_1 = Me^{i\theta}
$$
$$
m_2 = Me^{-i\theta}
$$
with this polar coordinate notation
$$
a_2 = -M^2
$$
What is the generic solution
$$
x_t := c_1M^t e^{i\theta t} + c_2 M^te^{-i\theta t}
= M^t\left[
c_1 e^{i\theta t} + c_2 e^{-i\theta t}
\right]
$$
for $x_t$ to be real for all $t$, we need either $c_1=c_2$ or $c_1 = -c_2$. In these cases, the solutions are trigonometric functions cosine and sine. In the first case, the term in bracket is $c_1 2\cos(\theta t)$.