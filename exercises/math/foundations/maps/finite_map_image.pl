extends = /model/math/expr.pl

title = Image directe d'une application

before ==
from jinja2 import Template


n=randint(5,9)
m=randint(5,9)
row1=list(range(1,n+1))
row2=list_randint(n,1,m)
A=FiniteSet(*list_randitem_norep(randint(3,4),row1))
A_tex=latex(A)
imA=FiniteSet(*[row2[x-1] for x in A])

table= Template(tpltable).render(row1=row1,row2=row2)
==

question ==
On considère l'application $! f:\\{1,\ldots,{{n}} \\}\rightarrow \mathbb{N} !$ définie par le tableau ci-dessous.

<br>
{{table|safe}}
<br>

Déterminer l'image directe de l'ensemble $!\\{ {{A_tex}} \\}!$ par $! f !$.
==

evaluator==
score,_,feedback=ans_struct_expr(input.value,imA,"composite")
==

solution ==
La solution est $! {{imA_tex}} !$
==
