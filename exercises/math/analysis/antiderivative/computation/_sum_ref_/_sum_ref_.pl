extends = /model/math/expr.pl

title = Calcul de primitive

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
Calculer une primitive de la fonction
$$ f : x \mapsto {{ f|latex }} .$$
==

solution ==
Les primitives de cette fonction sont les fonctions de la forme $$ x \mapsto {{ sol|latex }} + k $$

où $ k $ est une constante réelle.
==

equality = "UpToConstant"

message.NotEqualUpToConstant = La réponse n'est pas une primitive.

before == #|py|
from sympy import integrate
x = symbols('x', positive=True)
lst_a = [Rational(1,2), Rational(1,3), Rational(1,4), 2, 3, 4]
r = Rational(3, 2)

def generate_f(nbterms, indices, addmon=False):
    coeff = [1, 1, 2, 3, Rational(1,2), Rational(1,3)]
    shuffle(coeff)
    lst_vx = [exp(x),
    sin(x),
    cos(x),
    exp(choice(lst_a)*x),
    sin(choice(lst_a)*x),
    cos(choice(lst_a)*x),
    x**randint(3, 7),
    1/x,
    1/x**2,
    1/x**randint(3, 7),
    sqrt(x),
    1/sqrt(x),
    x**r]
    iterms = sample(indices, nbterms)
    terms = [lst_vx[i] for i in iterms]
    # intervalle de définition
    if addmon:
        terms.append(choice([1, x, x**2]))
    return sum([choice([-1, 1])*coeff[i]*terms[i] for i in range(len(terms))])

f = generate_f(2, [0, 1, 2], True)
sol = integrate(f, x).doit()
==
