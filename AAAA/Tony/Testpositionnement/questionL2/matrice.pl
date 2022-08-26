extends= /model/basic/checkbox_rw.pl

 
question==
L'application $!\begin{array}{ll}
\varphi : &\mathbb{R}_2[X]\longrightarrow \mathbb{R}_2[X] \\\\
   &P \mapsto P+P'
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

 