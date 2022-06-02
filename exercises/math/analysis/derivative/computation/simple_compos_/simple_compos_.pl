# D. Doyen
# derivation, composition
# Calculer la dérivée d'une fonction (composition de fonctions de références avec des fonctions polynomiales).
# 1/6/2022

extends = /model/math/multimathinput.pl

title = Calculer la dérivée d'une fonction

param.functions = [[[7, 8], [0, 1]], [[10, 11], [0, 1]]]

paramdoc == #|json|
{
    "keys": {
        "functions": {
            "type": "list[list[list[int]]]",
            "default": "[[[7, 8], [0, 1]], [[10, 11], [0, 1]]]",
            "description": "Fonctions à dériver. Les fonctions générées sont de la forme f o g. Chaque sous-liste correspond à une fonction à générer. Chaque sous-liste contient deux listes : la liste des functions pour f et la liste des functions pour g."
        }
    }
}
==

paramnotes ==     
Types de fonctions pour f
0: constant
1: x^n (n <= 3)
2: x^n (n > 3)
3: 1/x
4: 1/x^n (n > 1)
5: x^r
6: sqrt(x)
7: exp(x)
8: ln(x)
9: a^x
10: sin(x)
11: cos(x)
12: tan(x)
13: sinh(x)
14: cosh(x)
15: tanh(x)
16: asin(x)
17: acos(x)
18: atan(x)

Types de fonctions pour g
0: x
1: x^2
2: x^3
3: ax
4: ax^2
5: ax^3
6: ax+b
7: ax^2+b
8: ax^3+b
9: ax^2+bx
10: ax^3+bx
==

before ==
n = len(param['functions'])
inputs = [MathInput(type="expr") for _ in range(n)]

var('x')
from sympy import sinh, cosh, tanh, asin, acos, atan, evaluate
from sympy import S, EmptySet
from sympy.calculus.util import continuous_domain

def generate_fog(i, j):

    r = choice([-1,1])*sympify(choice(["1/2","3/2","5/2","2/3","4/3","1/4","3/4","5/4","1/5","2/5","3/5"]))
    a = randint(1, 3)
    b = randint(1, 3)

    lst_f=[Integer(randint(-3, 3, [0])),
    x**randint(1, 3),
    x**randint(4, 8),
    1/x,
    x**-randint(3, 4),
    x**r,
    sqrt(x),
    exp(x),
    ln(x),
    randint(2, 5)**x,
    sin(x),
    cos(x),
    tan(x),
    sinh(x),
    cosh(x),
    tanh(x),
    asin(x),
    acos(x),
    atan(x)]

    f = lst_f[i]

    a0 = randint(2, 3)
    a = randint(1, 3)
    b = randint(1, 3)

    lst_g =[x,
    x**2,
    x**3,
    a0*x,
    a0*x**2,
    a0*x**3,
    [a*x+b, a*x-b, b - a*x],
    [a*x**2+b, a*x**2-b, b - a*x**2],
    [a*x**3+b, a*x**3-b, b - a*x**3],
    [a*x**2+b*x, a*x**2-b*x, b*x - a*x**2],
    [a*x**3+b*x, a*x**3-b*x, b*x - a*x**3]]

    if isinstance(lst_g[j], list):
        g = choice(lst_g[j])
    else:
        g = lst_g[j]

    return f.subs(x, g)


def generate_f(par):
    if len(par) == 2:
        par.append(True)
    if par[2]:
        coeff = choice([-1, 1]) * choice([1, 1, 2, 3, Rational(1,2), Rational(1,3)])
    else:
        coeff = 1

    while True:
        f = coeff*generate_fog(par[0], par[1])
        sol = diff(f, x).factor()
        try:
            domain = continuous_domain(f, x, S.Reals)
            domain = continuous_domain(sol, x, domain)
            if domain == EmptySet:
                okdomain = False
            else:
                okdomain = True
        except:
            okdomain = True

        if okdomain:
            break
    return f

expr = []
for i in range(n):
    par = param['functions'][i]
    for j in range(len(par)):
        if isinstance(par[j], list):
            par[j]= choice(par[j])
    f = generate_f(par)
    inputs[i].sol = diff(f, x)
    expr.append(latex(f))

==

question ==
Calculer les dérivées des fonctions suivantes.
==

inputblock ==
{% for i in range(n) %}
{{i+1}}. $!\displaystyle f_{{i+1}}(x) =  {{ expr[i] }} !$ <br><br>
<div style="display: block; margin-bottom: 1em;">
 $! f_{{i+1}}'(x)  =  !$ {{ inputs[i]|html }}
</div>
{% endfor %}
==

solution ==
{% for i in range(n) %}
<div style="display: block; margin-bottom: 0.5em;margin-top: 0.5em;">
$! \displaystyle f_{{i+1}}'(x)  = {{ inputs[i].sol|latex }} !$
</div>
{% endfor %}
==