extends= /model/basic/checkbox_rw.pl

title = Equation différentielle d'ordre 2.

question==
Quelles fonctions sont solutions de l'équation suivantes $!y''-5y'+6y=0!$?
==
 
nbitems=4
minright = 2
maxright = 2

right==
$!e^{2x}!$
$!e^{2x}-e^{3x}!$
==

wrong==
$!5xe^{2x}-e^{2x}!$
$!10e^{-2x}+e^{-3x}!$
==

scoring = CorrectItems

reroll = False