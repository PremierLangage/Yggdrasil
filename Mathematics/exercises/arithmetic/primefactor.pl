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
    for factor in expr.args:
        if type(f) == sp.Pow:
            p = factor.args[0]
            k = factor.args[1]
        else:
            p = factor
            k = 1
        if p in dicfactors:
            dict[p] += k
        else:
            dict[p] = k      
    return dict

try:
    ans = latex2sympy(input.value)
except:
    if type(ans)==sp.Mul:
        dicfactors=list2dicfactors(ans.args)
    else:
        dicfactors=list2dicfactors([ans])
    if not all(isprime(p) for p in dicfactors.keys()):
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








