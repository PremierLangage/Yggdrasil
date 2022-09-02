extends= /model/basic/checkbox_rw.pl

title = Intégrales à paramètres

question==
Calculer la limite quand $!n!$ tend vers $!+\infty!$ de $!\int_{0}^{+\infty}\frac{n\sin(\frac{t}{n})}{t(1+t^2)}dt!$?
==
 

nbitems=5
minright = 1
maxright = 1

right==
$!\frac{\pi}{2}!$
==

wrong==  
$!0!$
$!1!$
$!\pi!$
$!+\infty!$
==

scoring = AllOrNothing 

reroll = False