extends= /model/basic/checkbox_rw.pl

title = Primitives

question==
Quelles phrases sont vraies?
==
 

nbitems=4
minright = 3
maxright = 3

right==
$!\frac{\sin(3x)}{3}!$ est une primitive de $!\cos(3x)!$
$!e^x+1!$ est une primitive de $!e^x!$
$!\frac{x^2}{2}+2x!$ est une primitive de $!x+2!$
==

wrong==
$!\frac{1}{x}!$ est une primitive de $!\ln(x)!$
==

scoring = CorrectItems 


reroll = False