extends= /model/basic/checkbox_rw.pl

 
question==
Lesquels de ces vecteurs sont solutions du système $!\left \{
\begin{array}{rcl}
x+y-z&=&0 \\
y+z&=&0\
\end{array}
\right.!$?
==
 

nbitems=4
minright = 2
maxright = 2

right==
$!(0,0,0)!$
$!(2,1,-1)!$
==

wrong==
$!(1,1,2)!$
$!(0,1,0)!$
==

scoring = RightMinusWrong

 