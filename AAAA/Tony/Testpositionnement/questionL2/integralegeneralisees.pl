extends= /model/basic/checkbox_rw.pl

title = Intégrales généralisées
 
question==
 Lesquelles de ces integrales généralisées convergent?
==
 

nbitems=4
minright = 2
maxright = 2

right==
$!\int_0^{+\infty}\frac{\sqrt{t}+t^2}{2t^4+t}dt!$
$!\int_1^{+\infty}te^{-t}dt!$

==

wrong==
$!\int_1^{+\infty}\frac{2}{t^{\frac{2}{3}}}dt!$
$!\int_0^{1}\frac{\ln(1+t)}{t(\cos(t)-1)}dt!$ 
==

scoring = CorrectItems

reroll = False
   
