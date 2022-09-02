extends= /model/basic/checkbox_rw.pl

title = Domaine de définition

question==
La fonction $!f!$ définie par $!f(x)=\frac{x(x-3)}{e^x\ln(x)(x-1)(2+x)}!$ n'est pas définie en 
==
 

nbitems=4
minright = 3
maxright = 3

right==
$!x=-1!$  
$!x=-2!$
$!x=1!$    
==

wrong==
$!x=2!$  
==

scoring = CorrectItems

reroll = False