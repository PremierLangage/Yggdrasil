extends= /model/basic/checkbox_rw.pl

title = Convergence de séries

question==
 Lesquelles de ces séries convergent?
==
 

nbitems=4
minright = 4
maxright = 4

right==
$!\sum \frac{1}{n^2+3n+1}!$
$!\sum \frac{(-1)^n}{n^2}!$
$!\sum \frac{5}{n^4}+(\frac{1}{4})^n!$
$!\sum \frac{\ln(n)}{5^n}!$
==

wrong==
$!1!$ 
==

scoring = CorrectItems

reroll = False