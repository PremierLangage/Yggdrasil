extends = /model/mathinput.pl

title = Décomposition en facteurs premiers

text ==
Décomposer $! {{n}} !$ en produit de facteurs premiers.
==

textError %=
{"1": "Votre réponse n'est pas un produit de facteurs entiers.",
"2": "Votre réponse n'est pas un produit de facteurs premiers.",
"3": "Votre réponse n'est pas égale à $% {number} %$"}
==

before ==
while True:
    n = randint(10, 150)
    if sum(factorint(n).values()) > 2:
        break
==

evaluator ==
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
    try:
        ans = dict_factors_exponent(latex2sympy(input.value))
    except:
        return (-1, "La réponse doit être un produit de facteurs premiers.")
    if not all(isprime(p) for p in ans.keys()):

score = -1
feedback = str(ans)
==

old ==
        score=0
        feedback=textError['2']
    elif not is_equal(ans,n):
        score=0
        feedback=textError['3'].format(number=n)
    else:
        score=100
        feedback=""

    score=-1
    feedback=textError['1']
==






