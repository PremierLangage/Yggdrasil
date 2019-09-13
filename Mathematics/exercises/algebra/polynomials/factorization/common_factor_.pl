extends = /Mathematics/template/mathexpr.pl

title = Facteur commun

lang = fr

before ==#|python|
keyboards_JSON['virtualKeyboards']="elementary"
input1.config = keyboards_JSON

nterms=int(param['nterms'])
type_comfac=int(param['comfactor'])
type_terms=eval(param['terms'])

var('x')

def rand_factor(type):
    a,b=list_randint(2,-5,5,[0])
    if a<0 and b<0:
        a,b=-a,-b
    if type==1:
        return a*x+b,2*a*x+2*b,3*a*x+3*b
    elif type==2:
        return (a*x+b)**2,(2*a*x+2*b)**2,(3*a*x+3*b)**2
    elif type==3:
        return a*x**2+b*x,2*a*x**2+2*b*x,3*a*x**2+3*b*x

def rand_term(Q,type):
    a,b=list_randint(2,-5,5,[0])
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

comfac=rand_factor(type_comfac)
type=list_randitem_norep(nterms,type_terms)

if param['obvious']=="yes":
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
Factoriser l'expression suivante :
$${{expr}}.$$
==


evaluator==
var('x')
score,_,feedback=ans_poly_factor(input1.value,sol,x)
==

solution ==
Une factorisation de cette expression est $! {{sol_tex}} !$.
==





