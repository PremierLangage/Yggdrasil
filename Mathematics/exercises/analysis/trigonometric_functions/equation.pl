extends = /Mathematics/template/mathexpr.pl

title = Equation trigonométrique

lang = fr

before ==
var('x')
lhs = randitem([cos(x),sin(x)])
rhs =randitem([0,-1,1])
interv=Interval(-2*pi,2*pi)
sol=solveset(lhs-rhs,x,domain=S.Reals).intersect(interv)
lhs_tex=latex(lhs)
interv_tex=latex(interv)
sol_tex=latex(sol)
==

text ==
Déterminer les solutions de l'équation $$ {{lhs_tex}} = {{rhs}} $$
sur l'intervalle $% {{interv_tex}} %$.
==

evaluator==
score,_,feedback=ans_set_expr(answer['1'],sol,brace_enclosed=False)
==

solution ==
$${{sol_tex}}$$
==


