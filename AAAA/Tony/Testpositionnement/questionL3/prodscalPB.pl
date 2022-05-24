extends= /model/basic/checkbox_rw.pl

 
question==
Lesquelles de ces applis sont des produits scalaires ?
==
 

nbitems=4
minright = 1
maxright = 1

right==
$!\begin{array}{ll}
\varphi : &C^0([0,1])\times C^0([0,1])\longrightarrow \mathbf{R} \\
&(f,g) \mapsto \int_0^1f(t)g(t)dt
\end{array}!$
==

wrong==  
$!\begin{array}{ll}
\varphi : &\mM_n(\mathbf{R})\times \mM_n(\mathbf{R}) \longrightarrow \mM_n(\mathbf{R}) \\
   &(A,B) \mapsto AB
\end{array}!$
$!\begin{array}{ll}
\varphi : &\mathbf{R}^2 \longrightarrow \mathbf{R} \\
   &(x,y) \mapsto x+x^2
\end{array}!$
$!\begin{array}{ll}
\varphi : &\mathbf{R}^2\times \mathbf{R}^2 \longrightarrow \mathbf{R} \\
   &((x_1,y_1),(x_2,y_2)) \mapsto x_1x_2+y_1
\end{array}!$
==

scoring = CorrectItems
