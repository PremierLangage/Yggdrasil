extends= /model/basic/checkbox_rw.pl

 
question==
Lesquels de ces systèmes linéaires ont une seule solution 
==
 

nbitems=4
minright = 2
maxright = 2

right==
$!\begin{System}
  2x + y = 6 \\
  3x + y = 7
\end{System}!$
#$!\begin{cases}x+y  &=2 \\ x-3y &=4\end{cases}!$
$!\left \{\begin{array}{rcl}x+y&=&1 \\ x+2y&=&2\end{array}\right.!$
#$!\left \{\begin{array}{rcl}x+y-z&=&0 \\ y+z&=&0\\ 2z&=&0\end{array}\right.!$

==

wrong==
$!\left \{\begin{array}{rcl}x+y&=&1 \\ 2x+2y&=&4\end{array}\right.!$
$!\left \{\begin{array}{rcl}x+y+z&=&1 \\ x+y-z&=&2\end{array}\right.!$ 
==

scoring = RightMinusWrong
 