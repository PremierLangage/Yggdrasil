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
# 3 : x^n
# 4 : x^n
# 5 : 1/x
# 6 : 1/x^2
# 7 : 1/x^n
# 8 : sqrt(x)
# 9 : 1/sqrt(x)
# 10 : x^r

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
    exp(choice([-1, 1])*choice(lst_a)*x),
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

    sample_indices = []
    for n, indices in terms:
        sample_indices.extend(sample(indices, n))
    sample_terms = [generate_term(i) for i in sample_indices]
    return sum([choice([-1, 1])*coeff[i]*sample_terms[i] for i in range(len(sample_terms))])

f = generate_f(param['terms'])

fdomain = continuous_domain(f, x, S.Reals)
if isinstance(fdomain, Union):
    fdomain = fdomain.args[-1]

sol = integrate(f, x).doit().expand()
==
