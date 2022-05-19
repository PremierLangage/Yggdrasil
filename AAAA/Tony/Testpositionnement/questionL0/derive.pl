extends= /model/basic/checkbox_rw.pl

 
question==
Parmi ces fonctions, lesquelles ont leur dérivée qui vaut $!1!$ en $!0!$?
==
 

nbitems=4
minright = 2
maxright = 2

right== 
$!\frac{\exp(2x)}{2}!$
$!xe^x!$
$!\frac{\sin(x)}{x+1}!$
$!\ln(x+1)+1!$
==

wrong==
==

scoring = RightMinusWrong

 
 
 