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

n=randint(5,9)
row1=list(range(1,n+1))

table= Template(tpltable).render(row1=row1,row2=row2)
==

text ==
{{table|safe}}


Déterminer l'image réciproque de l'ensemble $!\\{ {{A_tex}} \\}!$ par $! f !$.
==

evaluator==
score,_,feedback=ans_struct_expr(input.value,imA,"composite")
==

solution ==
La solution est $! {{imA_tex}} !$
==


