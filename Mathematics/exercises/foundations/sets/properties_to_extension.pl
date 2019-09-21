extends = /Mathematics/template/mathinput.pl

title = Définition d'un ensemble en compréhension

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="sets"
input.config = keyboards_JSON

n="n"
cond=r"n \leq %d" % randint(5,25)
A=randitem([r"\NN","\ZZ"])

sol=""
sol_tex=latex(sol)
==

text == 
Ecrire en extension l'ensemble $!\\{ {{n}} \in {{A}} | {{cond}} \\} ) !$.
==

evaluator ==
score,_,feedback=ans_struct_expr(input.value,sol,"set")
==

solution ==
La solution est $! { {{sol_tex}} } !$.
==


