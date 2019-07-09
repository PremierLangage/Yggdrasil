extends = /Mathematics/template/mathexpr.pl

title = Factorisation

lang = fr

before ==
var('x')

def rand_factor(type):
    a,b=list_randint(2,-5,5,[0])
    if type==1:
        return a*x+b
    elif type==2:
        return (a*x+b)**2
    elif type==3:
        return a*x**2+b*x

ComFac=rand_factor(1)

def rand_term(Q,type):
    a,b=list_randint(2,-5,5,[0])
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
            return c*Q
    elif type==6:
            return (Q)**2
    elif type==7:
            return c*(Q)**2

P=0
nterms=3
type=list_randitem_norep(nterms,[1,3,7])
terms=[]
for i in range(nterms):
    term0=rand_term(ComFac,type[i])
    if not (term0 in terms):
        terms.append(term0)

s=list_randitem(nterms,[-1,1])
for i in range(nterms):
    if s[i]==-1:
        terms[i]=-terms[i]

with evaluate(False):
    P=Add(*terms)

sol=factor(P)
sol_tex=latex(sol)
expr=latex(P)
==

text ==
{{sol_tex}}
Factoriser l'expression suivante :
$${{expr}}.$$
==

evaluator==
var('x')
score,numerror,feedback=ans_poly_factor(answer['1'],sol,x)
==

solution ==
{{sol_text}}
==

