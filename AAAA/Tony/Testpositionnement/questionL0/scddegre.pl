extends= /model/basic/checkbox_rw.pl

title = Equations du second degré

question==
Lesquelles de ces expressions se factorisent sous la forme $!a(x-c)(x-b)!$ avec $a,b,c$ des réels?
==
 

nbitems=4
minright = 3
maxright = 3

right== 
$!x^2-4x+3!$
$!x^2-12!$
$!2x+2-4x(x+1)!$ 
==

wrong==
$!2x+2-3(4x-3)!$
==

scoring = CorrectItems

reroll = False