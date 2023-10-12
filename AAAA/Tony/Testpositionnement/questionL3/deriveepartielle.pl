extends= /model/basic/checkbox_rw.pl

title = Dérivée partielle
 
question==
Calculez la dérivée en $!x!$ de $!f(x,y)=\frac{xy}{x^2y+y^2}!$
==
 

nbitems=4
minright = 1
maxright = 1

right==
$!\frac{y^3-x^2y^2}{(x^2y+y^2)^2}!$
==

wrong==  
$!\frac{y^3+3x^2y^2}{(x^2y+y^2)^2}!$
$!-\frac{xy}{(x^2y+y^2)^2}!$
$!\frac{x^2y^2-y^3}{(x^2y+y^2)^2}!$ 
==

scoring = AllOrNothing

reroll = False