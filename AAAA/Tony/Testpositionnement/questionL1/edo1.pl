extends= /model/basic/checkbox_rw.pl

title = Equation différentielle d'ordre 1

question==
Que vaut la solution de l'équation différentielle  $!y'+2xy=0!$ munie de la condition initiale $!y(0)=1!$ en $!x=2!$? 
==
 

nbitems=4
minright = 1
maxright = 1

right==
$!e^{-4}!$
==

wrong==
$!e^{4}!$
$!e^{-1}!$
$!e^{1}!$
==

scoring = AllOrNothing
 
reroll = False
 
 