extends= /model/basic/checkbox_rw.pl

title = Etude de fonction
 
question==
Soit $!f!$ la fonction définie par $!f(x)=\ln(x^2+1)!$
Quelles phrases sont vraies ? 
==
 

nbitems=4
minright = 2
maxright = 2

right==
L’image de $!1!$ par $!f!$ est $!\ln(2)!$
$!e!$ a deux antécédents par $!f!$
==

wrong==
$!f!$ coupe l’axe des abscisses à deux reprises
$!f!$ change de variations deux fois.
==

scoring = CorrectItems

reroll = False
 
 