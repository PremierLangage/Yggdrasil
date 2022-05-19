extends= /model/basic/checkbox_rw.pl

 
question==
Quelles fonctions sont solutions de l'équation suivantes $y''-5y'+6y=0$?
==
 
nbitems=4
minright = 2
maxright = 2

right==
$!e^{2x}!$
$!e^{2x}-e^{3x}!$
==

wrong==
$!5xe^{2x}-e^{2x}!$
$!10e^{-2x}+e^{-3x}!$
==

scoring = RightMinusWrong

L'application $ \begin{array}{ll}
\varphi : &\R_2[X]\longrightarrow \R_2[X] \\
   &P \mapsto P+P'
\end{array}$ a pour matrice dans la base canonique : 
  \begin{reponses}
    \bonne{$\begin{pmatrix}
    1&1&0\\0&1&2\\0&0&1
    \end{pmatrix}$}
    \mauvaise{$\begin{pmatrix}
    1&1&0\\0&1&0\\0&2&1
    \end{pmatrix}$}
    \mauvaise{$\begin{pmatrix}
    2&2&1\\0&2&1\\0&0&2
    \end{pmatrix}$}
    \mauvaise{$\begin{pmatrix}
    -1&1&1\\1&2&1\\4&5&6
    \end{pmatrix}$}
