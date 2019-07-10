extends = /Mathematics/template/mathexpr.pl

title = Simplification de valeurs abolues

lang = fr

before ==
with evaluate(False):
    expr=sqrt(2)-1

test=list(expr.atoms(Pow))
test2=expr.has(Abs)
==

text ==
{{test}}
==


evaluator==
score,_,feedback=ans_list_frac(answer['1'],lstsol)
feedback=lstsol
==

