extends= /model/basic/checkbox_rw.pl

title = Convergence de suites

question==
Lesquelles de ces suites convergent?
==
 

nbitems=4
minright = 2
maxright = 2

right==
$!\frac{1}{n+1}!$ 
$!\left(\frac{1}{2}\right)^n!$
==

wrong==
$!2^n!$
$!2n+11!$ 
==

scoring = CorrectItems

reroll = False
 