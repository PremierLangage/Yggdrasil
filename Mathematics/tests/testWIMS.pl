extends = /model/mathinput.pl

title = Simplification d'une fraction 1

before ==
from fractions import Fraction
f = rd.choice(['2', '3', '4', '5', '6', '7', '8', '9', '3/2', '4/3'])
f = rd.choice([Fraction(f), 1/Fraction(f)])
a = f.numerator
b = f.denominator
c = rd.choice([5, 6, 7, 8, 9, 11, 12, 14, 15])
aa = a * c
bb = c * b
==

inputbox =: MathInput

text ==
On considère la fraction $! \displaystyle A= \frac{ {{aa}} }{ {{bb}} }. !$ <br class="spacer" /> 
Simplifier cette fraction en la mettant sous la forme d'un entier ou d'une fraction irréductible.<br class="spacer" />
$! A= !$ 
{{a}} et {{b}}
==

form ==
{{inputbox|component}} 
==

evaluator ==
if inputbox.value == a/b:
    score = 100
else:
    score = 0
==


