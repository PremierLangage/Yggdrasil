extends= /model/basic/checkbox_rw.pl

title = Monotonie de suites

question==
Lesquelles de ces suites sont monotones?
==
 

nbitems=4
minright = 3
maxright = 3

right== 
$!3n+1!$ 
$!\frac{1}{2^n}!$
$!\sin(\frac{1}{n})!$
==

wrong==
$!\frac{(-1)^n}{2^n}!$
==

scoring = CorrectItems

reroll = False