extends= /model/basic/checkbox_rw.pl

title = Calcul d'intégrales

question==
Quelles intégrales valent $!1!$?
==
 

nbitems=4
minright = 0
maxright = 0

right== 
$!1!$ 
==

wrong==
$!\int_0^1 \frac{x}{\sqrt{x+1}}dx!$
$!\int_0^1 te^tdt!$
$!\int_{-1}^1 t^2+tdt!$
$!\int_0^1 x\cos(x^2)dx!$
==

scoring = CorrectItems

reroll = False
 