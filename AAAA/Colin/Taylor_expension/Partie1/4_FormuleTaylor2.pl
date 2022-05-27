# Auteur : Colin Petitjean
# Sujet : Développements Limités - Manipuler la formule de Taylor-Young 2

title = DL - Formule de Taylor-Young 1
extends = /model/math/expr.pl

before ==
from sympy import Symbol, factorial, S
var('x')
n = 4
m=randint(0,n)

L=[]
for i in range(n+1) :
    a=randint(-10,10)
    b=a/factorial(i)
    L.append(b)
sol = 0
==

question ==
Soit $! f !$ une fonction de classe $!\mathcal C^{{n|latex}} !$ sur $!\mathbb R!$ ayant pour développement limité en 0 et à l'ordre 4 :
$$ f(x) = {{L[0]|latex}} + {{L[1]|latex}}  x + {{L[2]|latex}}  x**2 + {{L[3]|latex}}  x**3 + {{L[4]|latex}}  x**4 + o(x^4)$$
Retrouver à partir de la formule de Taylor-Youngla vameur de  $! f^{ {{m|latex}}}  !$.
==

embed ==
# + o({{ x }}^{{ n }}) \quad [x \rightarrow 0]
==

prefix ==
$! f(x) = !$
==

solution ==
$! {{ sol|latex }} + o({{ x }}^{{ n }})  \quad [x \rightarrow 0]!$.
==

latexsettings.order = 'ilex'
