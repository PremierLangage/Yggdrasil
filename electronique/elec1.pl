
extends= /model/qcm/qcm.pl


nb % 4 # nombre de proposition 
nbtrues % 1 # une bonne réponse 

title=signaux

text==

On considère les signaux $%x(t)%$ et $%y(t)%$ définis par 

$%x(t)= 2cos(300t-\pi/4)%$  et 

$%y(t)= sin(300t)%$  

 *Cochez les affirmations correctes.*
==

good== # les bonnes réponses une par ligne 
La fréquence du signal est $%good%$ Hz
==

bad== # les mauvaises réponses une par ligne 
La fréquence du signal est $% bad %$ Hz
La fréquence du signal est $% worst %$ Hz
La fréquence du signal est $% nil %$ Hz
==
