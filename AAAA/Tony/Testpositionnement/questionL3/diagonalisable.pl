extends= /model/basic/checkbox_rw.pl

title = Diagonalisabilité

question==
 Quelles matrices sont diagonalisables à valeurs propres réelles? 
==
 

nbitems=4
minright = 3
maxright = 3

right==
$!\begin{pmatrix}    1&0\\\\0&1    \end{pmatrix}!$
$!\begin{pmatrix}    1&2\\\\2&-4    \end{pmatrix}!$
$!\begin{pmatrix}    2&2\\\\ \frac{1}{2}&2    \end{pmatrix}!$
==

wrong== 
$!\begin{pmatrix}  1&2\\\\0&1\end{pmatrix}!$
==

scoring = CorrectItems

reroll = False