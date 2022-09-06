extends= /model/basic/checkbox_rw.pl


title = Solutions de systèmes linéaires

question==
Lesquels de ces vecteurs sont solutions du système $!\left \\{
\begin{array}{rcl}
x+y-z&=&0 \\\\
y+z&=&0
\end{array}
\right.!$?
==
 

nbitems=4
minright = 1
maxright = 1

right==
$!(0,0,0)!$
==

wrong==
$!(2,1,-1)!$
$!(0,1,0)!$
$!(1,1,2)!$
==

scoring = CorrectItems


reroll = False

 