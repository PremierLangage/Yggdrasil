extends = /Mathematics/template/mathinput.pl
extends = finite_map_.pl

title = Table de vérité

tpltable ==
<table>
<tr>
<th> $! P !$ </th>
<th> $! Q !$ </th>
<th> $! P et Q !$ </th>
</tr>
{% for item in row1 %}
<tr>
<td> {{item}} </td>
<td> {{item}} </td>
<td> {{item}} </td>
</tr>
{% endfor %}
</table>
==


before ==
from jinja2 import Template

keyboards_JSON['virtualKeyboards']="sets"
input.config = keyboards_JSON

n=randint(5,9)
m=randint(5,9)
row1=list(range(1,n+1))
row2=list_randint(n,1,m)
A=FiniteSet(*list_randint_norep(randint(3,4),1,9))
A_tex=latex(A)
imA=FiniteSet(*[x+1 for x in range(n) if row2[x] in A])

table= Template(tpltable).render(row1=row1,row2=row2)
==

text ==
On considère l'application $! f:\\{1,\ldots,{{n}} \\}\rightarrow \mathbb{N} !$ définie par le tableau ci-dessous.

<br>
{{table|safe}}
<br>

Déterminer l'image réciproque de l'ensemble $!\\{ {{A_tex}} \\}!$ par $! f !$.
==

evaluator==
score,_,feedback=ans_struct_expr(input.value,imA,"composite")
==

solution ==
La solution est $! {{imA_tex}} !$
==


