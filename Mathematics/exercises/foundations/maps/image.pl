extends = /Mathematics/template/mathexpr.pl

title = Image d'une application

lang = fr

before ==

n=randint(1,5)
sol=(Rational(n**2/2),2*n+1)
sol_tex=latex(sol)
==

text ==
On considère la fonction $$ f : \mathbb{N} \rightarrow \mathbb{N} \times \mathbb{N} $$ telle que
$$f(n)=\left(\frac{n^2}{2},2n+1\right)$$
Calculer $$ f({{n}}) $$
==

evaluator==
score,numerror,feedback=ans_tuple_expr(answer['1'],sol)
==



