# Auteur : Colin Petitjean
# Sujet : développements limités - Manipuler les petits o

extends = /model/math/expr.pl

title = Opérations sur les petits "o" : Mix.

before ==
var('x')
n = randint(1, 3)
Xn = x**n
m = randint(1,3)
Xm = x**m
a=randint(1,10)
b=randint(-10,-1)
l=randint(2,8)
k=randint(7,10)
sol = x**min(n+m,l)
==

question ==
Simplifier l'expression ci-dessous (pour x qui tend vers $! 0 !$) en l'écrivant sous la forme
 $! o(x^n) !$ pour un $! n !$ bien choisi.
==

embed ==
# ) \quad [x \rightarrow 0]
==

prefix ==
$! {{a|latex}} \cdot {{Xn|latex}} \times o({{Xm|latex}}) + x^{ {{k|latex}} } + o(x^{{l|latex}}) = o( !$
==

solution ==
$! {{a|latex}} \cdot {{Xn|latex}} \times o({{Xm|latex}}) + x^{ {{k|latex}} } + o(x^{{l|latex}}) = o({{ sol|latex }})  !$.
==

latexsettings.order = 'ilex'


