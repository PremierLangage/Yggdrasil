# D. Doyen
# derivation
# Calculer la dérivée d'une fonction (produit ou quotient de fonctions de références).
# 1/6/2022

extends = /model/math/expr.pl

title = Calculer la dérivée d'une fonction

param.operation = "mul"
param.functions = [[0], [0], [5, 6, 8, 9], [0]]

paramdoc == #|json|
{
    "keys": {
        "operation": {
            "type": "('mul','div')",
            "default": "'mul'",
            "description": "Type d'opération."
        },
        "functions": {
            "type": "list[list[list[int]]]",
            "default": "[[[7, 8], [0, 1]], [[10, 11], [0, 1]]]",
            "description": "Fonctions utilisées pour le produit/quotient.Les quatre sous-listes contiennent respectivement : les types de fonction pour f1, g1, f2 et g2."
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
var('x')
from sympy import sinh, cosh, tanh, asin, acos, atan, evaluate
from sympy import S, EmptySet
from sympy.calculus.util import continuous_domain
def generate_fog(i, j):

    c = 2
    n = randint(4,8)
    r = choice([-1,1])*choice([1/2,3/2,5/2,2/3,4/3,1/4,3/4,5/4,1/5,2/5,3/5])

    a = randint(1, 3)
    b = randint(1, 3)

    lst_poly1 = [[a*x+b, a*x-b, b - a*x],
    [a*x**2+b, a*x**2-b, b - a*x**2],
    [a*x**3+b, a*x**3-b, b - a*x**3],
    [a*x**2+b*x, a*x**2-b*x, b*x - a*x**2],
    [a*x**3+b*x, a*x**3-b*x, b*x - a*x**3]]

    poly1 = choice(choice(lst_poly1))

    lst_f=[poly1,
    x**randint(1, 3),
    x**randint(4, 8),
    x**(-n),
    x**r,
    sqrt(x),
    exp(x),
    ln(x),
    c**x,
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

    lst_gx =[x,
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

    if isinstance(lst_gx[j], list):
        gx = choice(lst_gx[j])
    else:
        gx = lst_gx[j]

    return f.subs(x, gx)


if len(param['functions']) == 4:
    ii, jj, kk, ll = param['functions']
    j1, j2 = choice(ii), choice(jj)
    k1, k2 = choice(kk), choice(ll)
else:
    ii, jj = param['functions']
    j1, k1 = sample(ii, 2)
    j2, k2 = choice(jj), choice(jj)



while True:
    f1 = generate_fog(j1, j2)
    f2 = generate_fog(k1, k2)
    if param['operation'] == "mul":
        f = f1*f2
    else:
        with evaluate(False):
            f = choice([f1/f2, f2/f1])

    sol = diff(f, x).factor()
    try:
        domain = continuous_domain(f, x, S.Reals)
        domain = continuous_domain(sol, x, domain)
        if domain == S.Reals:
            domain = "R"
        elif domain == EmptySet:
            domain = "empty"
        else:
            domain = "I"
    except:
        domain = "I"

    if domain != "empty":
        break

sol = diff(f, x).factor()

if domain == "I":
    phrase = r"un certain ensemble $! I !$."
else:
    phrase = r"sur $! \mathbb{R} !$."
==

question ==
On considère la fonction
$$ f  : x \mapsto {{ f|latex }}.$$
Cette fonction est définie et dérivable sur {{ phrase }}
Calculer sa dérivée.
==

prefix ==
$! f'(x) = !$
==

wims ==

\text{fx=\mf[\typef;1]}

\text{lf=wims(append item \fx to \lf)}

}

\integer{a=randitem(-1,1)*randint(1..4)}
\integer{b=randitem(-1,1)*randint(1..4)}
\text{s=randitem(+,-)}

\matrix{mu=\lf[1] \s \lf[2]
\a*\lf[1]+\b*\lf[2]
\lf[1] * \lf[2]
\a*\lf[1]*\lf[2]
\lf[1]/ (\lf[2])
\a*\lf[1]/(\b*\lf[2])
1/ (\lf[2])
\a/(\b*\lf[2])}

\text{ux=\mu[\typeu;1]}
\text{uux=texmath(\ux)}

\text{ndef=0}
\for{i=-20 to 20}{
\text{def=maxima(floatnump(ev(\ux,float,\x=\i*0.5)))}
\if{\def=true}{\integer{ndef=\ndef+1}}
}

% Phrase précisant le domaine de définition et de dérivabilité

\text{domR=1,7,10,11,13,14,18}
\if{(\typeu<=4) and (\ltypef[1] isitemof \dom) and (\ltypef[2] isitemof \dom)}{
\text{domaine=qui est définie et dérivable sur \({\mathbb{R}}\) tout entier}
\text{I=\mathbb{R}}
}{
\text{domaine=sur un domaine \(I\) où elle est définie et dérivable}
\text{I=I}
}


% Calcul de la dérivée

\text{dux=maxima(trigsimp(diff(\ux,\x)))}
\text{ddux=texmath(\dux)}
\text{ddux=wims(replace internal log by ln in \ddux)}
\text{ddux=wims(replace internal arctg by arctan in \ddux)}

% Enoncé

\statement{\typeu \ltypef \ltypeg On considère la fonction 
<div class="wimscenter">\(f:\x \mapsto \uux\)</div><br/>
\domaine. Calculer la dérivée de \(f\).<br class="spacer"/>
\(\forall \x \in \I,\, f'(x)=\)\embed{reply1,50}\ndef \ux
}

% Analyse de la réponse

\answer{}{\rep}{type=functions}{option=noanalyzeprint}
\text{delta=maxima(print(ratsimp(trigreduce(trigsimp(\dux-(\rep)))));)}
\condition{Bonne réponse}{\delta=0}

% Correction

\text{rrep=texmath(\rep)}
\feedback{\delta<>0}{<br/>Votre réponse est \(\rrep\).<br/>
La bonne réponse est \(\ddux\).}
==