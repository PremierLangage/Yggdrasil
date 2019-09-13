extends = /Mathematics/template/mathexpr.pl

title = Module d'un nombre complexe

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input1.config = keyboards_JSON

z=rand_complex_int(5)
z_tex=latex(z)
sol=abs(z)
sol_tex=latex(sol)
==

text = Déterminer le module du nombre complexe $% z= {{z_tex}} %$.

evaluator==
score,_,feedback=ans_expr(input1.value,sol)
==

solution==
Le module de $! z !$ est $% \displaystyle {{sol_tex}} %$.
==


