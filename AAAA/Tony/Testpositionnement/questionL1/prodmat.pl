extends= /model/basic/checkbox_rw.pl

title = Produit matriciel
 
question==
Parmi les produits suivants, lesquels ont pour résultat une matrice dont la somme des coefficients est positive? 
==
 
nbitems=4
minright = 2
maxright = 2

 


right==
$!\begin{pmatrix}-1&2\\\\3&-2\end{pmatrix}\begin{pmatrix}1\\\\2\end{pmatrix}!$
$!\begin{pmatrix}-1&2\\\\3&-2\end{pmatrix}\begin{pmatrix}1&0\\\\2&3\end{pmatrix}!$
==

wrong== 
$!\begin{pmatrix}1\\\\1 \end{pmatrix}\begin{pmatrix} -1&2\\\\3&-2 \end{pmatrix}!$
$!\begin{pmatrix}-1&2\\\\3&-2\end{pmatrix}\begin{pmatrix}1&2&3\\\\2&2&1\\\\1&2&1\end{pmatrix}!$
==

scoring = CorrectItems

reroll = False