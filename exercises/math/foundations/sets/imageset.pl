extends = /Mathematics/template/mathexpr.pl

title = Image d'une application

lang = fr

before ==
var('n')
with evaluate(False):
    fn=randitem([n**2/2, (2*n+1)/2])
A=rand_finiteset(randint(3,4),list(range(8)))
sol=imageset(n,fn, A)
sol_tex=latex(sol)
A_tex=latex(A)
fn_tex=latex(fn)
==

text ==
On considère la fonction $$ f : \mathbb{N} \rightarrow \mathbb{Q} $$ telle que
$$f(n)={{fn_tex}}$$
Calculer $$ f({{A_tex}}) $$
==

evaluator==
score,numerror,feedback=ans_set_expr(answer['1'],sol)
#feedback=str2finiteset(answer['1'])
==

