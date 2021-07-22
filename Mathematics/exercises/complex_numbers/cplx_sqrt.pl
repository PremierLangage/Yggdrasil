extends = /model/mathinput.pl


before ==
a=randint(1,6)
b=randint(-6,6,[0])
z=((a+b*I)**2).expand()
z_tex=latex(z)
sol=[a+b*I,-a-b*I]
sol0_tex=latex(sol[0])
sol1_tex=latex(sol[1])
==

text ==
Calculer les racines carrées de $! {{z_tex}} !$ (sous forme algèbrique).  Séparer les deux racines par une virgule.
==

input.virtualKeyboards = complex

evaluator==
score, error = eval_set_complex(input.value, sol,wobracket=True)
feedback = message[error]
==

solution ==
Les racines carrées sont $! {{sol0_tex}} !$ et $! {{sol1_tex}} !$.
==











