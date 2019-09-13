extends = /Mathematics/template/mathexpr.pl

title = Equation avec logarithme

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="functions"
input1.config = keyboards_JSON

var('x')
a,b=list_randint(2,-8,8,[0])
lhs = ln(a*x+b)
rhs =randint(-8,8,[0])
sol=list(solveset(lhs-rhs,x,domain=S.Reals))[0]
lhs_tex=latex(lhs)
rhs_tex=latex(rhs)
sol_tex=latex(sol)
==

text ==
Déterminer la solution de l'équation $$ {{lhs_tex}} = {{rhs_tex}}.$$
==


evaluator==
score,_,feedback=ans_expr(input1.value,sol,{'e':sp.E},{sp.exp})
==

solution ==
La solution est $%{{sol_tex}}%$.
==

