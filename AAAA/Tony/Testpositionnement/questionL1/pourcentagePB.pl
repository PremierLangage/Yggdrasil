extends= /model/basic/checkbox_rw.pl

 
question==
Un concombre est formé de $!99\%!$ d’eau (en volume). Pendant la nuit, il s’assèche légèrement,
et le lendemain il ne contient plus que $!98\%!$ d'eau. Quelles phrases sont vraies?

Que dire en pourcentage de la variation du volume total du concombre ?
==
 

nbitems=4
minright = 2
maxright = 2

right==
La variation du volume total du concombre est supérieure à $!40 \\%!$
La variation du volume d'eau du concombre est inférieure à $!10 \\%!$
==

wrong== 
La variation du volume total du concombre est inférieure à $!30 \\%!$
Le volume de la partie sans eau a changé.
==

scoring = CorrectItems
 
 
