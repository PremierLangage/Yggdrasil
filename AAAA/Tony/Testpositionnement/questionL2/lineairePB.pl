extends= /model/basic/checkbox_rw.pl

 
question==
Quelles fonctions sont solutions de l'équation suivantes $y''-5y'+6y=0$?
==
 
nbitems=4
minright = 3
maxright = 3

right==
$!\begin{array}{ll}
\varphi : &\R_2[X]\longrightarrow \R_2[X] \\
   &P \mapsto P'+P
\end{array}!$
$!\begin{array}{ll}
\varphi : &C^0([0,1])\longrightarrow \R \\
   &f \mapsto \int_0^1f(t)dt
\end{array}!$
$!\begin{array}{ll}
\varphi : &\R^3\longrightarrow \R \\
   &(x,y,z) \mapsto x-2y+3z
   \end{array}!$
==

wrong==
$!\begin{array}{ll}
\varphi : &\R^2\longrightarrow \R \\
   &(x,y) \mapsto x+y+1
   \end{array}!$ 
==

scoring = RightMinusWrong 