
extends= /model/math/expr.pl

title=

text==

Soit les deux points suivants donner la droite $! f(x)= ax+b !$ qui passe par les deux points
 {{ (x1,y1) , (x2,y2) }}.

==

before==
a=randint(1,8)
b=randint(1,8)
x1=randint(3,5)
y1=a*x1+b
x2=randint(-5,-3)
y2 =a*x2+b
var('x')
sol = a*x+b
==

input_prefix= $! f(x)= !$