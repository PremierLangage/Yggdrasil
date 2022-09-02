extends= /model/basic/checkbox_rw.pl

title = Linéarité
 
question==
Lesquelles de ces applications sont linéaires ?
==
 
nbitems=4
minright = 3
maxright = 3

right==
$!\begin{array}{ll}\varphi : &\mathbb{R}_2[X]\longrightarrow \mathbb{R}_2[X] \\\\&P \mapsto P'+P\end{array}!$
$!\begin{array}{ll}\varphi : &C^0([0,1])\longrightarrow \mathbb{R} \\\\&f \mapsto \int_0^1f(t)dt\end{array}!$
$!\begin{array}{ll}\varphi : &\mathbb{R}^3\longrightarrow \mathbb{R} \\\\&(x,y,z) \mapsto x-2y+3z\end{array}!$
==

wrong==
$!\begin{array}{ll}\varphi : &\mathbb{R}^2\longrightarrow \mathbb{R} \\\\&(x,y) \mapsto x+y+1\end{array}!$ 
==

scoring = CorrectItems 

reroll = False