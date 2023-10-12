extends= /model/basic/checkbox_rw.pl

title =  Calcul d'intégrales

question==
 Quelles intégrales valent $!0!$?
==
 

nbitems=4
minright = 1
maxright = 1

right== 
$!\int_0^\pi \cos(2x)dx!$ 
==

wrong==
$!\int_0^\pi \sin(x)dx!$
$!\int_0^1 e^tdt!$
$!\int_{-1}^1 t^2+tdt!$
==

scoring = CorrectItems

reroll = False
  