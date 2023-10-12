extends= /model/basic/checkbox_rw.pl

title = Résolution de système linéaire
question==
Lesquels de ces systèmes linéaires ont une seule solution 
==
 

nbitems=4
minright = 2
maxright = 2

right==
$!\left \\{\begin{array}{rcl}x+y&=&1 \\\\ x+2y&=&2\end{array}\right.!$
$!\left \\{\begin{array}{rcl}x+y-z&=&0 \\\\ y+z&=&0\\\\ 2z&=&0\end{array}\right.!$

==

wrong==
$!\left \\{\begin{array}{rcl}x+y&=&1 \\\\ 2x+2y&=&4\end{array}\right.!$
$!\left \\{\begin{array}{rcl}x+y+z&=&1 \\\\ x+y-z&=&2\end{array}\right.!$ 
==

scoring = CorrectItems

reroll = False