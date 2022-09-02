extends= /model/basic/checkbox_rw.pl

 
title = Séries entières

question==
Quelles séries sont de rayon de convergence $1$ ? 
==
 

nbitems=4
minright = 2
maxright = 2

right==
$!\sum \sin(n)x^n!$ 
$!\sum x^n+(\frac{x}{4})^n!$
==

wrong==  
$!\sum (2x)^n!$
$!\sum n!x^n!$
==

scoring = CorrectItems

reroll = False