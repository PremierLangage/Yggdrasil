extends = /model/math/multimathinput.pl

title = Simplification de valeurs abolues

before ==
from sympy import floor, ceiling
n = 3
inputs = [MathInput(type="expr") for _ in range(n)]
lst = [choice([2*pi,pi]),choice([2*sqrt(2),sqrt(2)]),choice([sqrt(3),2*sqrt(3)])]
shuffle(lst)
items = []
for i in range(len(lst)):
    a = lst[i]
    b = choice([randint(1,floor(a)),randint(ceiling(a),ceiling(a)+2)])
    a,b = sample([a,b], 2)
    prefixes.append($! 
==

quesion ==
Ecrire les expressions suivantes sans valeur absolue.
==


