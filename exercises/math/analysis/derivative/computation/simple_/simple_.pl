extends = /model/math/multimathinput.pl

title = Calculer la dérivée d'une fonction

param.types = [[[3, 2], [0]], [[0, 1, 2, 5, 6, 7, 9, 10], [0]], [[0, 1, 2, 5, 6, 7, 9, 10], [0]]]

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

before ==
n = len(param['types'])
inputs = [MathInput(type="expr") for _ in range(n)]

var('x')
from sympy import sinh, cosh, tanh, asin, acos, atan, evaluate
from sympy import S, EmptySet
from sympy.calculus.util import continuous_domain

def generate_fi(i):

    r = choice([-1,1])*sympify(choice(["1/2","3/2","5/2","2/3","4/3","1/4","3/4","5/4","1/5","2/5","3/5"])
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

    return = lst_f[i]

def generate_f(par):
    nbterms, jj, kk = par
    jjj = sample(jj, nbterms)
    kkk = [choice(kk) for _ in range(nbterms)]


    while True:
        f = 0
        coeff = [1, 1, 2, 3, Rational(1,2), Rational(1,3)]
        shuffle(coeff)
        for i in range(len(par)):
            f += choice([-1, 1])*coeff[i]*generate_fi(par[i])

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

prefixes = []
expr = []
for i in range(n):
    par = param['types'][i]
    for j in range(len(par)):
        if isinstance(par[j], list):
            par[j]= choice(par[j])
    f = generate_f(par)
    inputs[i].sol = diff(f, x).factor()
    prefixes.append(rf"$! {latex(f)} !$")
    expr.append(latex(f))

==

question ==
Calculer les dérivées des fonctions suivantes.
==

inputblock ==
{% for i in range(3) %}
{{i+1}}. $! f_{{i+1}}(x) =  {{ expr[i] }} !$ <br><br>
<div style="display: block; margin-bottom: 1em;">
 $! f_{{i+1}}'(x)  =  !$ {{ inputs[i]|html }}
</div>
{% endfor %}
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

\answer{}{\rep}{type=function}{option=noanalyzeprint}
\text{delta=maxima(print(ratsimp(trigreduce(trigsimp(\dux-(\rep)))));)}
\condition{Bonne réponse}{\delta=0}

% Correction

\text{rrep=texmath(\rep)}
\feedback{\delta<>0}{<br/>Votre réponse est \(\rrep\).<br/>
La bonne réponse est \(\ddux\).}
==