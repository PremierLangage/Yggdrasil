extends= /model/basic/checkbox_rw.pl

title = Signe d'intégrales
 
question==
Quelles fonctions ont leur intégrale positive sur $![0,1]!$? 
==
 

nbitems=4
minright = 3
maxright = 3

right==
$!\sin(t)!$ 
$!\exp(-t)!$
$!1!$
==

wrong==
$!\frac{1}{t-2}!$ 
==

scoring = CorrectItems

reroll = False
 