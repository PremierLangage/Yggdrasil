# Auteur : Colin Petitjean
# Sujet : développements limités - Manipuler les petits o
# Maj : 26/05/2022

extends = /model/math/expr.pl

title = Opérations sur les petits "o" : Mix.

before ==
var('x')
n = randint(1, 3)
Xn = x**n
m = randint(1,3)
Xm = x**m
S=n+m
a=randint(2,10)
b=randint(-10,-2)
l=randint(2,7)
k=randint(8,11)
sol = x**min(n+m,l)
==

question ==
Simplifier l'expression ci-dessous (pour $!x!$ qui tend vers $! 0 !$) en l'écrivant sous la forme
 $! o(x^n) !$ avec $! n \in \mathbb N !$ le plus grand possible.
==

embed ==
# ) \quad [x \rightarrow 0]
==

prefix ==
$! {{a|latex}}  {{Xn|latex}} \times o({{Xm|latex}}) + x^{ {{k|latex}} }  {{b|latex}} o(x^{{l|latex}}) = o( !$
==

solution ==
$! {{a|latex}}  {{Xn|latex}} \times o({{Xm|latex}}) + x^{ {{k|latex}} }  {{b|latex}} o(x^{{l|latex}}) = o(x^{ {{S|latex}} }) + x^{ {{k|latex}} } + o(x^{{l|latex}}) = o({{ sol|latex }})  !$.
==

latexsettings.order = 'ilex'


