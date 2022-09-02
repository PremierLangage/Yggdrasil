extends= /model/basic/checkbox_rw.pl

title = Solution de système linéaire

question==
Lesquels de ces vecteurs sont solutions du système $!\left \\{
\begin{array}{rcl}
x+y+z&=&0 \\\\
y+z&=&0\\\\
2y+2z&=&0
\end{array}
\right.!$?
==
 

nbitems=4
minright = 2
maxright = 2

right==
$!(0,0,0)!$
$!(0,1,-1)!$
==

wrong==
$!(1,1,2)!$
$!(-1,0,2)!$
==

scoring = CorrectItems

reroll = False
