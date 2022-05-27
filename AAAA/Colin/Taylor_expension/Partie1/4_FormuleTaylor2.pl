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

f = L[0] + L[1]*x + L[2]*x**2 + L[3]*x**3 + L[4]*x**4
sol = L[m]*factorial(m)
==

question ==
Soit $! f !$ une fonction de classe $!\mathcal C^{{n|latex}} !$ sur $!\mathbb R!$ ayant pour développement limité en 0 et à l'ordre $! {{ n }} !$ :
$$ f(x) = {{f|latex}} + o(x^4).$$
Retrouver à partir de la formule de Taylor-Young la valeur de  $! f^{ ({{m|latex}}) }(0)  !$.
==


prefix ==
$! f^{ ({{m|latex}}) }(0) = !$
==

solution ==
$! f^{ ({{m|latex}}) }(0) = {{ sol|latex }} !$.
==

latexsettings.order = 'ilex'
