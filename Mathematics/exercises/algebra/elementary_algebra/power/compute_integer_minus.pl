extends = /Mathematics/template/mathexpr.pl

title = Calcul puissance

lang = fr

before ==
a=randint(1,5)
b=randint(-3,-1)
c=randint(2,4)
with evaluate(False):
    expr=randitem([Pow(-a,b),Pow(-a,c),Pow(-a,b),Pow(-a,c),-Pow(-a,b),-Pow(-a,c),Pow(a,b)])
latexexpr=latex(expr)
sol=simplify(expr)
==

text ==
Calculer $${{latexexpr}}.$$
==


evaluator==
score,_,feedback=ans_frac(answer['1'],sol)
==


