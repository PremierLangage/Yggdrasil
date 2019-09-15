extends = /Mathematics/template/mathinput.pl

title = Image d'une application

lang = fr

before ==
n,m=list_randitem_norep(2,symbols("n,m,p,q,r"))

expr=n+m

expr_tex=latex(expr)
==

text ==
On considère la fonction $$ f : \mathbb{N} \rightarrow \mathbb{N} \times \mathbb{N} $$ telle que
$$f({{n}},{{m}})=\left( {{expr_tex}} \right)$$
Calculer $$ f({{n}}) $$
==

evaluator==
score,numerror,feedback=ans_tuple_expr(answer['1'],sol)
==




