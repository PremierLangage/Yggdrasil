
extends= /model/math/expr.pl

title=

text==

Soit les deux points suivants donner la fonction f(x) qui passe par les deux points
 {{(x1,y1) , (x2,y2)}}.

==

before==
x1, y1= [randint(-5,5)]*2
x2,y2= [randint(-5,5)]*2
var('x')
sol = x
==
