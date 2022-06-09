# Auteur : Colin Petitjean
# Sujet : Développements Limités - Manipuler la formule de Taylor-Young 1
# Maj : 9/06/2022

title = DL - Formule de Taylor-Young 1

extends = /model/math/expr.pl

before ==
from sympy import Symbol, factorial, S
var('x')
n = 4

L=[]
P=0
for i in range(n+1) :
    a=randint(-10,10)
    b=a/factorial(i)
    L.append(a)
    P=P+b*x**i

sol=P
==

question ==
Soit $! f !$ une fonction de classe $!\mathcal C^{{n|latex}} !$ sur $!\mathbb R!$ telle que 
$$ f(0) = {{L[0]|latex}}, \quad f^{'}(0) = {{L[1]|latex}}, \quad f^{''}(0) = {{L[2]|latex}}, \quad f^{(3)}(0) = {{L[3]|latex}}, \quad f^{(4)}(0) = {{L[4]|latex}}.$$ 
A l'aide de la formule de Taylor-Young, donner le développement limité de $! f !$ en 0 et à l'ordre $! {{ n|latex }} !$.
==

embed ==
# + o(x^{{ n|latex }}) \quad [x \rightarrow 0]
==

prefix ==
$! f(x) = !$
==

solution ==
$$ f(x) = {{ sol|latex }} + o(x^{{ n|latex }})  \quad [x \rightarrow 0].$$
En effet, rappelons la formule de Taylor-Young à l'ordre $! n !$ en 0 :
$$f(x) = f(0)+\frac{f'(0)}{1!}x+ \frac{f''(0)}{2!}x^2+\cdots+\frac{f^{(n)}(0)}{n!}x^n+ o(x^n).$$
==

latexsettings.order = 'ilex'
