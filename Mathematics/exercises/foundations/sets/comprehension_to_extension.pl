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
    d=randint(5,7)
    lstA=[x for x in lstS if (x**2 < 5)]
    cond=r"n^2 \leq %d" % d 

sol=FiniteSet(*lstA)
sol_tex=latex(sol)
==

text == 
Ecrire en extension l'ensemble $!\\{ n \in {{S}} \:|\: {{cond}} \\}!$.
==

evaluator ==
score,_,feedback=ans_struct_expr(input.value,sol,"set")
==

solution ==
La solution est $! { {{sol_tex}} } !$.
==



