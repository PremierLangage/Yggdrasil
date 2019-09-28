extends = /Mathematics/template/mathinput.pl

title = Racines carrées d'un nombre complexe

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="complexes"
input.config = keyboards_JSON

a=randint(1,6)
b=randint(-6,6,[0])
z=((a+b*I)**2).expand()
z_tex=latex(z)
sol=[a+b*I,a-b*I]
sol0_tex=latex(sol[0])
sol1_tex=latex(sol[1])
==

text ==
Calculer les racines carrées de $! {{z_tex}} !$ (sous forme cartésienne).
==


evaluator==
score,_,feedback=ans_struct_complex(input.value,sol,"setwobraces",form="cartesian")
==

solution ==
Les racines carrées sont $! {{sol0_tex}} !$ et $! {{sol1_tex}} !$.
==








