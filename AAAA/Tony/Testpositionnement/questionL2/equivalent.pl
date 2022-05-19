extends= /model/basic/checkbox_rw.pl

 
question==
Quelles fonctions sont équivalentes en $!0!$ à $!t!$?
==
 

nbitems=4
minright = 1
maxright = 1

right== 
$!\frac{t^2+2t}{2+t^3}!$
$!e^t-1!$
==

wrong==
$!\sin(2t)!$
$!\ln(1+\frac{1}{t})!$

==

scoring = RightMinusWrong
