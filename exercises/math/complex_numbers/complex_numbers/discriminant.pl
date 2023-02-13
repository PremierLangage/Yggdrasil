extends = /model/mathinput.pl

title = Discriminant d'une équation quadratique

lang = fr

before ==

a=rand_complex_int(3)
b=rand_complex_int(3)
c=rand_complex_int(4)
var('x')
latexP=latex(poly(a*x**2+b*x+c,x))

sol=(b*b-4*a*c).expand()
sol_tex=latex(sol)
==

text ==
Calculer le discriminant de l'équation $! {{latexP}} = 0 !$.
==

input.virtualKeyboards = complex

evaluator==
score, error = eval_set_complex(input.value, sol,wobracket=True)
feedback = message[error]
==

solution ==
Le discriminant est $! {{sol_tex}} !$.
==


