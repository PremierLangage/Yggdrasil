extends= /model/basic/checkbox_rw.pl

title = Convergence de suites 

question==
Lesquelles de ces suites convergent?
==
 

nbitems=4
minright = 3
maxright = 3

right== 
$!\frac{\ln(n)}{n^2}!$
$!\frac{\cos(n)}{n+1}!$
$!n\ln(1+\frac{2}{n})!$
==

wrong==
$!\left(\frac{1}{2}\right)^n+(-1)^n!$
==

scoring = CorrectItems

reroll = False