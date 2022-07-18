extends = /model/math/multimathinput.pl

title = Calculer la dérivée d'une fonction

param.types = [[[7, 8], [3, 4, 6, 7]], [[10, 11], [3, 4, 6, 7]], [[3, 6], [6, 7]], [[2, 4], [6, 7]]]

# Paramètres
# 0 : constant
# 1 : x^n (n <= 3)
# 2 : x^n (n > 3)
# 3 : 1/x
# 4 : 1/x^n (n > 1)
# 5 : x**r
# 6 : sqrt(x)
# 7 : exp(x)
# 8 : ln(x)
# 9 : a^x
# 10 : sin(x)
# 11 : cos(x)
# 12 : tan(x)
# 13 : sinh(x)
# 14 : cosh(x)
# 15 : tanh(x)
# 16 : asin(x)
# 17 : acos(x)
# 18 : atan(x)


# 0: x,
# 1: x**2,
# 2: x**3,
# 3: a0*x,
# 4: a0*x**2,
# 5: a0*x**3,
# 6: a*x+b, a*x-b, b - a*x],
# 7: [a*x**2+b, a*x**2-b, b - a*x**2],
# 8: [a*x**3+b, a*x**3-b, b - a*x**3],
# 9: [a*x**2+b*x, a*x**2-b*x, b*x - a*x**2],
# 10: [a*x**3+b*x, a*x**3-b*x, b*x - a*x**3]]

before ==
n = len(param['types'])
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
    while True:
        coeff = [1, 1, 2, 3, Rational(1,2), Rational(1,3)]
        f = choice([-1, 1])*coeff[i]*generate_fog(par[0], par[1])
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
    par = param['types'][i]
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