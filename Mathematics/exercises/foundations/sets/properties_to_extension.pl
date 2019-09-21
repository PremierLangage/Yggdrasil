extends = /Mathematics/template/mathinput.pl

title = Définition d'un ensemble en compréhension

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="sets"
input.config = keyboards_JSON

n="n"
d=randint(5,7)
def fcond(x): return x < d
S=list(range(d))
lst=[x for x in S if x**2<d]
cond=r"n^2 \leq %d" % d 

A=randitem([r"\mathbb{N}",r"\mathbb{Z}"])

sol=""
sol_tex=latex(sol)
==

text == 
{{a}}
Ecrire en extension l'ensemble $!\\{ {{n}} \in {{A}} \:|\: {{cond}} \\}!$.
==

evaluator ==
score,_,feedback=ans_struct_expr(input.value,sol,"set")
==

solution ==
La solution est $! { {{sol_tex}} } !$.
==


