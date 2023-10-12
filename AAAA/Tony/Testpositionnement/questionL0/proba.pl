extends= /model/basic/checkbox_rw.pl

title = Probabilités

question==
Quelles probas sont supérieures ou égales à $!0.5!$ ?
==
 

nbitems=4
minright = 2
maxright = 2

right== 
La probabilité de tirer pile à un lancer de pile ou face.
La probabilité d'avoir au moins un garçon lorsqu'on a deux enfants et autant de chances d'avoir un garçon qu'une fille pour chaque enfant.
==

wrong==
La probabilité de tomber sur un nombre supérieur à $!0.6!$ quand on tire un nombre au hasard entre $!0!$ et $!1!$.
La probabilité de tirer une carte figure (valet, dame, roi) dans un jeu de $!32!$ cartes.
==

scoring = CorrectItems

reroll = False