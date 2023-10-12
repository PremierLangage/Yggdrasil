extends= /model/basic/checkbox_rw.pl

title = Problème

question==
Un nageur plonge d'un pont et remonte le courant d’une rivière sur 1 km. Il croise à cet
endroit un bouchon emporté par le courant, et continue sa remontée de la rivière pendant une heure. Il fait alors demi-tour et descend la rivière jusqu'au pont dont il était parti, qu'il atteint
précisément au même instant que le bouchon. Parmi ces réponses, lesquelles sont vraies?
==
 

nbitems=4
minright = 2
maxright = 2

right==
La vitesse du courant est inférieure à 1 km/heure
Le nageur fait le retour en $!1h!$.
==

wrong== 
La vitesse du nageur est la même à l'aller et au retour.
La vitesse du courant est supérieure à 1 km/heure
==

scoring = CorrectItems

reroll = False