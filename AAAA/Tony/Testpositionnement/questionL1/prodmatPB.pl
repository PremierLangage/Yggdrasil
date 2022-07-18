extends= /model/basic/checkbox_rw.pl

 
question==
Parmi les produits suivants, lesquels ont pour résultat une matrice dont la somme des coefficients est positive? 
==
 
nbitems=4
minright = 2
maxright = 2


before ==
from sympy import Matrix
from sympy2latex import latex
A = Matrix([[-1,2],[3,-2]]) 
Atex = latex(A)
==


right==
$$\begin{pmatrix}-1&2\\3&-2\end{pmatrix}\begin{pmatrix}1\\2\end{pmatrix}$$
$!\begin{pmatrix}-1&2\\3&-2\end{pmatrix}\begin{pmatrix}1&0\\2&3\end{pmatrix}!$
==

wrong== 
$!\begin{pmatrix}1\\1 \end{pmatrix}\begin{pmatrix} -1&2\\3&-2 \end{pmatrix}!$
$!\begin{pmatrix}-1&2\\3&-2\end{pmatrix}\begin{pmatrix}1&2&3\\2&2&1\\1&2&1\end{pmatrix}!$
==

scoring = CorrectItems
