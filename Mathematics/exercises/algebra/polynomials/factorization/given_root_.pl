# Author: D. Doyen
# Tags: polynomials
# 19/8/2020

extends = /model/math/poly.pl

param.degree % 2
param.roots = int
param.givenroot = int

before ==
from sympy import factor
var('x')

q,r,s=1,1,1

q=choice([-1,1])*q
r=choice([-1,1])*r
s=choice([-1,1])*s
[a,b],[c,d],[e,f]=sample([[1,2],[3,2],[5,2],[1,3],[2,3],[4,3],[5,3],[1,4],[3,4],[5,4],[1,5],[2,5],[3,5],[4,5],[1,6],[5,6],[1,7],[2,7],[3,7],[4,7]], k=3)
a=choice([-1,1])*a
c=choice([-1,1])*c
e=choice([-1,1])*e

if param['degree']==2:
    if param['roots']=="int":
        P=(x-q)*(x-r)
    elif param['roots']=="intrat":
        P=(x-q)*(a*x-b)
    elif param['roots']=="rat":
        P=(a*x-b)*(c*x-d)
    P=choice([-1,1])*choice([1,2])*P
    if param['givenroot']=="int":
        x1=q
    elif param['givenroot']=="rat":
        x1=Rational(b,a)

sol = factor(P)
expr = P.expand()
==

question ==
Factoriser le polynôme
$$P(x)= {{ expr|latex }}$$
en remarquant que $% P( {{ x1 |latex }} )=0 %$.
==


solution ==
Une factorisation de cette expression est $! {{ sol|latex }} !$.
==


wims ==
target= deg2ent1 deg2rat1 deg3ent2 deg3rat2 deg2noent deg2noentrat deg2norat
#if defined TARGET_deg2ent1
 \title{Polynôme de degré 2 (1 racine entière donnée)}
#endif
#if defined TARGET_deg3ent2
 \title{Polynôme de degré 3 (2 racines entières données)}
#endif
#if defined TARGET_deg2rat1
 \title{Polynôme de degré 2 (1 racine rationnelle donnée)}
#endif
#if defined TARGET_deg3rat2
 \title{Polynôme de degré 3 (2 racines rationnelles données)}
#endif
#if defined TARGET_deg2noent
 \title{Polynôme de degré 2 (pas de racine donnée) 1}
#endif
#if defined TARGET_deg2noentrat
 \title{Polynôme de degré 2 (pas de racine donnée) 2}
#endif
#if defined TARGET_deg2norat
 \title{Polynôme de degré 2 (pas de racine donnée) 3}
#endif
\language{fr}
\author{David Doyen}
\email{david.doyen@u-pem.fr}

\text{x=x}

#if defined TARGET_deg2ent1

#endif
#if defined TARGET_deg2rat1
\text{s=shuffle(1/2,3/2,5/2,1/3,2/3,4/3,5/3,1/4,3/4,5/4,1/5,2/5,3/5,4/5,1/6,5/6,1/7,2/7,3/7,4/7)}
\rational{x1=choice(-1,1)*\s[1]}
\rational{x2=choice(-1,1)*\s[2]}
\text{b1=pari(denominator(\x1))}
\text{b2=pari(denominator(\x2))}
\text{poly=simplify(choice(-1,1)*randint(1..2)*(\b1*\x-\b1*\x1)*(\b2*\x-\b2*\x2))}
\text{Frbis=(\x-\x1)}
\text{Fr=(simplify(\b1*\x-\b1*\x1))}
#endif
#if defined TARGET_deg2noent
\text{s=shuffle(7)}
\integer{x1=choice(-1,1)*\s[1]}
\integer{x2=choice(-1,1)*\s[2]}
\text{poly=simplify(choice(-1,1)*randint(1..3)*(\x-\x1)*(\x-\x2))}
\text{Fr=(simplify(\x-\x1))*(simplify(\x-\x2))}
#endif
#if defined TARGET_deg2noentrat
\integer{x1=choice(-1,1)*randint(1..7)}
\rational{x2=choice(-1,1)*choice(1/2,3/2,5/2,1/3,2/3,4/3,5/3,1/4,3/4,5/4,1/5,2/5,3/5,4/5)}
\text{b2=pari(denominator(\x2))}
\text{poly=simplify(choice(-1,1)*randint(1..3)*(\x-\x1)*(\b2*\x-\b2*\x2))}
\text{Frbis=(\x-\x1)(\x-\x2)}
\text{Fr=(simplify(\x-\x1))*(simplify(\b2*\x-\b2*\x2))}
#endif
#if defined TARGET_deg2norat
\text{s=shuffle(1/2,3/2,5/2,1/3,2/3,4/3,5/3,1/4,3/4,5/4,1/5,2/5,3/5,4/5)}
\rational{x1=choice(-1,1)*\s[1]}
\rational{x2=choice(-1,1)*\s[2]}
\text{b1=pari(denominator(\x1))}
\text{b2=pari(denominator(\x2))}
\text{poly=simplify(choice(-1,1)*randint(1..3)*(\b1*\x-\b1*\x1)*(\b2*\x-\b2*\x2))}
\text{Frbis=(\x-\x1)(\x-\x2)}
\text{Fr=(simplify(\b1*\x-\b1*\x1))*(simplify(\b2*\x-\b2*\x2))}
#endif
#if defined TARGET_deg3ent2
\text{s=shuffle(5)}
\integer{x1=choice(-1,1)*\s[1]}
\integer{x2=choice(-1,1)*\s[2]}
\rational{x3=choice(-1,1)*choice(1/2,3/2,5/2,1/3,2/3,4/3,5/3,1/4,3/4,5/4,1/5,2/5,3/5,4/5,1/6,5/6,1/7,2/7,3/7,4/7)}
\text{b3=pari(denominator(\x3))}
\text{poly=simplify(choice(-1,1)*(\x-\x1)*(\x-\x2)*(\b3*\x+\b3*\x3))}
\text{Fr=(simplify(\x-\x1))*(simplify(\x-\x2))}
#endif
#if defined TARGET_deg3rat2
\text{s=shuffle(1/2,3/2,5/2,1/3,2/3,4/3,5/3,1/4,3/4,5/4,1/5,2/5,3/5,4/5)}
\rational{x1=choice(-1,1)*\s[1]}
\rational{x2=choice(-1,1)*\s[2]}
\rational{x3=choice(-1,1)*\s[3]}
\text{b1=pari(denominator(\x1))}
\text{b2=pari(denominator(\x2))}
\text{b3=pari(denominator(\x3))}
\text{poly=simplify(choice(-1,1)*(\b1*\x-\b1*\x1)*(\b2*\x-\b2*\x2)*(\b3*\x-\b3*\x3))}
\text{Frbis=(\x-\x1)(\x-\x2)}
\text{Fr=(simplify(\b1*\x-\b1*\x1))*(simplify(\b2*\x-\b2*\x2))}
#endif


\text{Q=pari((\poly)/(\Fr))}
\text{poly=maxima(expand(\poly))}
\text{poly=pari(\poly)}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enoncé de l'exercice
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\statement{
#if defined TARGET_deg2ent1 || TARGET_deg2rat1
Factoriser le polynôme \(P(x)=\poly\) en remarquant que \(P(\x1)=0\).<br class="spacer"/>
#endif
#if defined TARGET_deg3ent2 || TARGET_deg3rat2
Factoriser le polynôme \(P(x)=\poly\) en remarquant que \(P(\x1)=0\) et \(P(\x2)=0\).<br class="spacer"/>
#endif
#if defined TARGET_deg2noent || TARGET_deg2noentrat || TARGET_deg2norat
Factoriser le polynôme \(P(x)=\poly\).<br class="spacer"/>
#endif
\(P(\x) =\)\embed{reply 1,30}
}


\answer{}{\polyrep}{type=raw}{option=noanalyzeprint}
\text{polyrep=wims(rawmath \polyrep)}
==








