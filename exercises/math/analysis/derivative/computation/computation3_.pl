extends = /model/math/expr.pl

before ==
var('x')
from sympy import sinh, cosh, tanh, asin, acos, atan

def generate(i, j):

    a = 2
    a2 = 1
    a3 = 2
    b = 1
    b3 = 1


    lst_g =[x,
    x**2,
    x**3,
    a*x,
    a2*x**2,
    a*x**3,
    a*x+b,
    a3*x**2+b3,
    a*x**3+b,
    a*x**2+b*x,
    a*x**3+b*x,
    a*x**3+b*x**2]

    c = 2
    n = randint(4,8)
    r = choice([-1,1])*choice([1/2,3/2,5/2,2/3,4/3,1/4,3/4,5/4,1/5,2/5,3/5])

    lst_f=[x**n,
    1/x**n,
    x**(-n),
    sqrt(x),
    1/sqrt(x),
    x**r,
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

    gx = lst_g[i]
    f = lst_f[j]

    return f.subs(x, gx)

def generate2():
    var('f1 f2')
    
    lst_expr=[f1 +choice([-1, 1])*f2,
    f1 +choice([-1, 1])*f2,
    f1*f2,
    f1*f2,
    f1/f2,
    f1/f2,
    1/f2,
    1/f2]

sol = 0
f = generate(3, 2)
==

question ==
$! \displaystyle {{ f|latex }} !$
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