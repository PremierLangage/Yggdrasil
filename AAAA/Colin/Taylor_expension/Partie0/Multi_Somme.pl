# Auteur : Colin Petitjean
# Sujet : développements limités - Manipuler les petits o
# Maj : 10/06/2022

extends = /model/math/multimathinput.pl

title = Opérations sur les petits "o" : Somme et Différence.

before == #|python|
e = 2
inputs = [MathInput(type="expr") for _ in range(e)]
prefixes = []

for i in range(e):
    if i==0 :
        var('x')
        n = randint(1, 10)
        m = randint(1,10)
        X1 = x**n
        X11 = latex(X1)
        X2 = x**m
        X22 = latex(X2)
        s = x**min(n,m)
        prefixes.append(f"$! o({X11}) + o({X22}) = o( !$")
        inputs[i].sol = s
        inputs[i].set_embed(r"#) \quad [x \rightarrow 0]")
    else :
        var('x')
        n = randint(1, 10)
        m=n+1
        Y1 = x**n
        Y11=latex(Y1)
        Y2 = x**m
        Y22=latex(Y2)
        ss = x**n
        prefixes.append(f"$! o({Y11}) - o({Y11}) = o( !$")
        inputs[i].sol = ss
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

latexsettings.order = 'ilex'