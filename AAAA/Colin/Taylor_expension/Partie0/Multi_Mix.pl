# Auteur : Colin Petitjean
# Sujet : développements limités - Manipuler les petits o
# Maj : 10/06/2022

extends = /model/math/multimathinput.pl

title = Opérations sur les petits "o" : Mix.

before == #|python|
e = 3
inputs = [MathInput(type="expr") for _ in range(e)]
prefixes = []

for i in range(e):
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
    s = x**min(n+m,l,k)
    xn = latex(Xn)
    xm = latex(Xm)
    prefixes.append(f"$! {a} o({xn}) \cdot {xm} + x^{k} {b} o(x^{l})= o( !$")
    inputs[i].sol = s
    inputs[i].set_embed(r"#) \quad [x \rightarrow 0]")
==


question == 
Simplifier les expressions ci-dessous (pour $!x!$ qui tend vers $! 0 !$) en les écrivant sous la forme
 $! o(x^n) !$ avec $! n \in \mathbb N !$ le plus grand possible.
==

solution ==
$$ o({{X1|latex}}) + o({{X2|latex}}) = o({{ s|latex }})  .$$

En effet, il faut appliquer ici la règle suivante : Si $! n \leq m!$ alors $! o(x^n) + o(x^m) = o(x^n) !$.
$$ o({{Y1|latex}}) - o({{Y1|latex}}) = o({{ ss|latex }})  .$$

Il faut appliquer ici la règle suivante : $! o(x^n) - o(x^n) = o(x^n) !$.
En effet, la différence de deux petits "o" d'une même puissance n'est bien souvent pas égale à 0. Par exemple :
$$2{{Y2|latex}} = o({{Y1|latex}}), \quad {{Y2|latex}} = o({{Y1|latex}}), \quad \text{et } \quad 2{{Y2|latex}} - {{Y2|latex}} = {{Y2|latex}} \neq 0.$$
==

solution ==
$! {{a|latex}}  {{Xn|latex}} \times o({{Xm|latex}}) + x^{ {{k|latex}} }  {{b|latex}} o(x^{{l|latex}}) = o(x^{ {{S|latex}} }) + x^{ {{k|latex}} } + o(x^{{l|latex}}) = o({{ sol|latex }})  !$.
==


latexsettings.order = 'ilex'
