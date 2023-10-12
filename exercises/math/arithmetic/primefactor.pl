extends = /model/math/input.pl

title = Décomposition en facteurs premiers

question ==
Décomposer $! {{ n }} !$ en produit de facteurs premiers.
==

before ==
from sympy import factorint
while True:
    n = randint(10, 150)
    if sum(factorint(n).values()) > 2:
        break
sol = 0
==

evaluator ==
import sympy as sp
from latex2sympy import latex2sympy

def dict_factors_exponent(expr):
    dict = {}
    if type(expr) == sp.Mul:
        args = expr.args
    else:
        args = [expr]
    for factor in args:
        if type(factor) == sp.Pow:
            p = factor.args[0]
            k = factor.args[1]
        else:
            p = factor
            k = 1
        if p in dict:
            dict[p] += k
        else:
            dict[p] = k      
    return dict

def eval(strans, sol):
    ans = latex2sympy(strans)
    dict_ans = dict_factors_exponent(ans)
    try:
        ans = latex2sympy(input.value)
        dict_ans = dict_factors_exponent(ans)
    except:
        return (-1, "La réponse doit être un produit de facteurs premiers.")
    if not all(sp.isprime(p) for p in dict_ans.keys()):
        return (-1, "La réponse doit être un produit de facteurs premiers.")
    if sp.simplify(ans-sol) != 0:
        return (0, "")
    return (100, "")

score, feedback = eval(input.value, n)
==
