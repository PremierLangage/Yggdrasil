extends= /model/basic/checkbox_rw.pl

title = Calcul d'intégrales
 
question==
Quelles intégrales valent $!\frac{2}{3}!$?
==
 

nbitems=4
minright = 1
maxright = 1

right== 
$!\int_{-1}^1 t^2+tdt!$
==

wrong==
$!\int_0^1 \frac{x}{\sqrt{x+1}}dx!$
$!\int_0^1 te^tdt!$
$!\int_0^1 x\cos(x^2)dx!$
==

scoring = CorrectItems

reroll = False
 