extends = /Mathematics/template/mathinput.pl

title = Définition d'un ensemble en compréhension

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="sets"
input.config = keyboards_JSON

S=randitem([r"\mathbb{N}",r"\mathbb{Z}"])
cond="square"

if S==r"\mathbb{N}":
    lstS=list(range(20))
elif S==r"\mathbb{Z}":
    lstS=list(range(-20,20))

if cond=="square":
    globals()['d']=randint(5,7)
    lstA=[x for x in lstS if x**2 < d]
    cond=r"n^2 \leq %d" % d
elif cond=="cube":
    globals()['d']=randint(5,7)
    lstA=[x for x in lstS if x**3 < d]
    cond=r"n^3 \leq %d" % d 



sol=FiniteSet(*lstA)
sol_tex=latex(sol)
==

text == 
Ecrire en extension l'ensemble $!\\left \\{ n \in {{S}} \:|\: {{cond}} \\right \\}!$.
==

evaluator ==
score,_,feedback=ans_struct_expr(input.value,sol,"set")
==

solution ==
La solution est $! { {{sol_tex}} } !$.
==



