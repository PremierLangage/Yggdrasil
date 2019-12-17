extends = /Mathematics/template/mathinput.pl

title = Calcul de primitive (élément simple)

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="functions"
input.config = keyboards_JSON

var('x')
a=randint(-5,5,[0])
b,c=list_randint_norep(2,-5,5,[0])

s=randitem([-1,1])
b0=Rational(-c,b)
if (b>0 and s>0) or (b<0 and s<0):
    dom=r"\rbrack %s ,+\infty\lbrack" % latex(b0)
else:
    dom=r"\rbrack -\infty, %s \lbrack" % latex(b0)

if s>0:
    sol=Rational(a,b)*ln(b*x+c)
else:
    sol=-Rational(a,b)*ln(-b*x-c)

sol=simplify(sol)

f=simplify(a/(b*x+c))
latexf=latex(f)
sol_tex=latex(sol)
==

text ==
Calculer une primitive de la fonction
$$ f : x \mapsto {{latexf}} $$
sur l'intervalle $! {{dom}} !$.
==

evaluator==
var('x')
score,_,feedback=ans_antiderivative(input.value,sol,x)
==

solution ==
Les primitives de cette fonction sont les fonctions de la forme $$ x \mapsto {{sol_tex}} + k $$
où $! k !$ est une constante réelle.
==


