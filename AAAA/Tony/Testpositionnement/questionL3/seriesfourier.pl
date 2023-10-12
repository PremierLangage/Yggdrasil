extends= /model/basic/checkbox_rw.pl

title = Séries de Fourier 
question==
Que vaut le coefficient de Fourier $!C_n(f)!$ pour $!n!$ non nul pour $!f!$ la fonction $!2\pi-!$périodique  qui vaut $!1!$ sur $![0,\pi[!$ et $!-1!$ sur $![-\pi,0[!$? 
==
 

nbitems=4
minright = 1
maxright = 1

right==
$!\frac{i((-1)^n-1)}{n\pi}!$
==

wrong==  
$!\frac{((-1)^n-1)}{n\pi}!$
$!\frac{i(-1)^n}{n\pi}!$
$!\frac{i}{n^2\pi}!$
==

scoring = AllOrNothing 

reroll = False