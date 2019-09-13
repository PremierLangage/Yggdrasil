extends = /Mathematics/template/mathexpr.pl

title = Inéquation produit/quotient

lang = fr

param.roots=int

before ==
keyboards_JSON['virtualKeyboards']="sets"
input1.config = keyboards_JSON

var('x')

ok=False
if param['bounds']=='int':
    b,d=list_randint_norep(2,-6,6,[0])
    P,Q=(x+b),(x+d)
if param['bounds']=='intrat':
    while not ok:
        b,d=list_randint(2,-6,6,[0])
        c=list_randint(2,-6,6,[0,1,-1])
        if b*c!=d: ok=True
    P,Q=(x+b),(c*x+d)
if param['bounds']=='rat':
    while not ok:
        b,d=list_randint(2,-6,6,[0])
        a,c=list_randint(2,-6,6,[0,1,-1])
        if b*c!=a*d: ok=True
    P,Q=(a*x+b),(c*x+d)

if param['type']=="product":
    expr=P*Q
elif param['type']=="quotient":
    expr=P/Q

ineq=randitem([expr>=0,expr>0,expr<=0,expr<0])
ineq_tex = latex(ineq)
sol=solveset(ineq,x,domain=S.Reals)
sol_tex = latex(sol)
==

text ==
Déterminer l'ensemble des réels $% x %$ tels que $$ {{ineq_tex}}. $$ Ecrire cet ensemble sous la forme d'un intervalle ou d'une réunion d'intervalles.
==

evaluator==
score,_,feedback=ans_rset(input1.value,sol)
==

solution ==
La solution est $% {{sol_tex}} %$.
==


