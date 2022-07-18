# Author: D. Doyen
# Tags: polynomials
# 19/8/2020

extends = /model/math/poly.pl

title = Facteur commun

param.nterms % 2

param.comfactor % 1

param.terms % [1, 1]

param.obvious % true



before == #|python|
from sympy import Add, evaluate, factor
nterms = param['nterms']
type_comfac = param['comfactor']
type_terms = param['terms']

var('x')

def rand_factor(type):
    a = randint(-5, 5, [0])
    b = randint(-5, 5, [0])
    if a < 0 and b < 0:
        a, b= -a, -b
    if type == 1:
        return a*x+b, 2*a*x+2*b, 3*a*x+3*b
    elif type == 2:
        return (a*x+b)**2, (2*a*x+2*b)**2, (3*a*x+3*b)**2
    elif type == 3:
        return a*x**2+b*x ,2*a*x**2+2*b*x, 3*a*x**2+3*b*x

def rand_term(Q, type):
    a = randint(-5, 5, [0])
    b = randint(-5, 5, [0])
    if a<0 and b<0:
        a,b=-a,-b
    c=randint(2,5)
    if type==1:
        return Q*(a*x+b)
    elif type==2:
            return c*Q*(a*x+b)
    elif type==3:
            return c*x*Q
    elif type==4:
            return Q
    elif type==5:
            with evaluate(False):
                return c*Q
    elif type==6:
            return (Q)**2
    elif type==7:
            return c*(Q)**2

comfac = rand_factor(type_comfac)
type = sample(type_terms, k=nterms)

if param['obvious']:
    coeff=[0,0,0,0]
else:
    coeff=[0]+list_randitem_norep(nterms-1,[1,2])
    rd.shuffle(coeff)

terms=[]
for i in range(nterms):
    comfac0=comfac[coeff[i]]
    term0=rand_term(comfac0,type[i])
    while (term0 in terms):
        term0=rand_term(comfac0,type[i])
    terms.append(term0)

s = choices([-1,1], k=nterms)
for i in range(nterms):
    if s[i]==-1:
        terms[i]=-terms[i]

with evaluate(False):
    P=Add(*terms)

sol=factor(P)
==

question ==
Factoriser l'expression suivante :
$$ {{ P|latex }}.$$
==

solution ==
Une factorisation de cette expression est $! {{ sol|latex }} !$.
==