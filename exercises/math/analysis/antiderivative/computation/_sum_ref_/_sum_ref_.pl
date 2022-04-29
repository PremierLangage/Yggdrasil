# Author: D. Doyen
# Tags: antiderivative
# Déterminer une primitive d'une combinaison linéaire de fonctions de référence.
# 29/4/2022

extends = /model/math/expr.pl

title = Calcul de primitive

param.terms = [(2, [0, 1, 2]), (1, [6])]

# Paramètres
# 0 : e^x
# 1 : sin(x)
# 2 : cos(x)
# 3 : e^(ax)
# 4 : sin(ax)
# 5 : cos(ax)
# 6 : x^n
# 7 : 1/x
# 8 : 1/x^2
# 9 : 1/x^n
# 10 : sqrt(x)
# 11 : 1/sqrt(x)
# 12 : x^r

question ==
Déterminer une primitive $! F !$ de la fonction $! f : {{ fdomain|latex }} \rightarrow \mathbb{R} !$ définie par
$$ f (x) = {{ f|latex }}.$$
==

prefix ==
$! F(x) = !$
==
solution ==
Les primitives de cette fonction sont les fonctions de la forme $$ x \mapsto {{ sol|latex }} + k $$

où $ k $ est une constante réelle.
==

latexsettings.interv_rev_brack = False

equality = "UpToConstant"

message.NotEqualUpToConstant = La réponse n'est pas une primitive.

before == #|py|
from sympy import integrate, S, Union
from sympy.calculus.util import continuous_domain

x = symbols('x')
lst_a = [Rational(1,2), Rational(1,3), Rational(1,4), 2, 3, 4]
lst_r = ["3/2", "5/2", "5/3", "4/3", "7/3", "5/4"]

def generate_term(i):
    lst_vx = [exp(x),
    sin(x),
    cos(x),
    exp(choice(lst_a)*x),
    sin(choice(lst_a)*x),
    cos(choice(lst_a)*x),
    x**randint(0, 2),
    x**randint(3, 7),
    1/x,
    1/x**2,
    1/x**randint(3, 7),
    sqrt(x),
    1/sqrt(x),
    x**(choice([-1, 1])*Rational(choice(lst_r)))]
    return lst_vx[i]

def generate_f(terms):
    coeff = [1, 1, 2, 3, Rational(1,2), Rational(1,3)]
    shuffle(coeff)

    sample_indices = sum([sample(indices, n) for n, indices in terms], [])
    sample_terms = [generate_term(i) for i in sample_indices]
    return sum([choice([-1, 1])*coeff[i]*terms[i] for i in range(len(sample_terms))])

f = generate_f(param['terms'])

fdomain = continuous_domain(f, x, S.Reals)
if isinstance(fdomain, Union):
    fdomain = fdomain.args[-1]

sol = integrate(f, x).doit().expand()
==
