Let $\lambda_1$ and $\lambda_2$ denote the roots of the characteristic equation,
$$
(1 - a_1L - a_2L^2)x_t = 0,
$$
and $\mu_1$ and $\mu_2$ the eigenvalues of
$$
\mathbf A = \begin{bmatrix}
a_1 & a_2\\
1 & 0
\end{bmatrix}.
$$
To find the eigenvalues, note
$$
\text{det}(\mathbf A - \mu_i \mathbf I)=0,
$$
so 
$$
-(a_1-\mu_i)\mu_i - a_2 = 0,
$$
$$
\mu_i^2 - a_1 \mu_i - a_2 = 0.
$$
$$
\mu_i = \frac12 a_1\pm \sqrt{\frac14 a_1^2+a_2}
$$
The sum of the two eigenvalues
$$
\mu_1 + \mu_2 =
a_1.
$$
The product of the two eigenvalues
$$
\mu_1 \mu_2 = 
\frac14 a_1^2 - \frac14 a_1^2 - a_2 =
-a_2.
$$
The $\lambda$s have the exact same properties.