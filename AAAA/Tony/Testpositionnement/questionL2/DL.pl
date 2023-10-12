extends= /model/basic/checkbox_rw.pl

title = Développements limités
question==
 Quels sont les trois premiers termes du DL en $!0!$ de $!\frac{\ln(1+2t)}{t}!$?
==
 

nbitems=4
minright = 1
maxright = 1

right== 
$!2-2t+\frac{8t^2}{3}!$
==

wrong==
$!2t-2t^2+\frac{8t^3}{3}!$
$!2+2t+\frac{8t^2}{3}!$
$!2-2t+\frac{8t^3}{3}!$
==

scoring = AllOrNothing

reroll = False