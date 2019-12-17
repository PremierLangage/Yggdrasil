extends = /Mathematics/template/mathinput.pl

title = Calcul de primitive (élément simple)

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="functions"
input.config = keyboards_JSON

var('x')
a=randint(-5,5,[0])
b,c=list_randint_norep(2,-5,5,[0])

f=simplify(a/(b*x+c)**2)
latexf=latex(f)
sol=integrate(f,x)
sol_tex=latex(sol)
==

text ==
Calculer une primitive de la fonction
$$ f : x \mapsto {{latexf}} .$$
==

evaluator==
var('x')
score,_,feedback=ans_antiderivative(input.value,sol,x)
==

solution ==
Les primitives de cette fonction sont les fonctions de la forme $$ x \mapsto {{sol_tex}} + k $$
où $! k !$ est une constante réelle.
==


