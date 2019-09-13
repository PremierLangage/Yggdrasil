extends = /Mathematics/template/mathexpr.pl

title = Equation trigonométrique

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input1.config = keyboards_JSON

var('x')
lhs = randitem([cos(x),sin(x)])
rhs =randitem(eval(param['rhs']))
a,b=randitem(eval(param['interval']))
interv=Interval(a,b)
sol=solveset(lhs-rhs,x,domain=S.Reals).intersect(interv)
lhs_tex=latex(lhs)
rhs_tex=latex(rhs)
interv_tex=latex(interv)
sol_tex=latex(sol)
==

text ==
Déterminer la ou les solutions de l'équation $$ {{lhs_tex}} = {{rhs_tex}} $$
sur l'intervalle $% {{interv_tex}} %$. Quand il y a plusieurs solutions, les séparer par des virgules.
==

evaluator==
score,_,feedback=ans_set_expr(input1.value,sol,formal=False)
==

solution ==
$${{sol_tex}}$$
==






