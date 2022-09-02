extends= /model/basic/checkbox_rw.pl

title = Matrice d'une application linéaire
 
question==
L'application linéaire $!\begin{array}{ll}
\varphi : &\mathbb{R}^3\longrightarrow \mathbb{R}^3 \\\\
   &(x,y,z) \mapsto (x+y,y+2z,z)
\end{array}!$ a pour matrice dans la base canonique : 
==
 
nbitems=4
minright = 1
maxright = 1

right==
$!\begin{pmatrix}    1&1&0\\\\0&1&2\\\\0&0&1    \end{pmatrix}!$ 
==

wrong==
$!\begin{pmatrix}   1&1&0\\\\0&1&0\\\\0&2&1 \end{pmatrix}!$
$!\begin{pmatrix}    2&2&1\\\\0&2&1\\\\0&0&2    \end{pmatrix}!$
$!\begin{pmatrix}    -1&1&1\\\\1&2&1\\\\4&5&6    \end{pmatrix}!$
==

scoring = AllOrNothing

reroll = False
 