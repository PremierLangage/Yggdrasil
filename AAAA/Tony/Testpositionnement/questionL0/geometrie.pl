extends= /model/basic/checkbox_rw.pl

title = Equation de droite

question==
Parmi ces droites, lesquelles ont une pente strictement positive ? 
==
 

nbitems=4
minright = 2
maxright = 2

right==
la tangente à $!\exp!$ en $!0!$
la parallèle à $!y=3x+2!$ passant par $!(-12,5)!$
==

wrong==
la droite passant par les points $!(0,1)!$ et $!(1,0)!$
la droite passant par $!(1,2)!$ et d'ordonnée à l'origine $!3!$
==

scoring = CorrectItems

reroll = False
