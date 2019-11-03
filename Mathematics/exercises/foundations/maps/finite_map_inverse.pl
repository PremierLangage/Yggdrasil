extends = finite_map_composition.pl

title = Application réciproque

before ==
n=randint(4,5)
drag=[]
for i in range(1,n+1):
    name="drag"+str(i)
    globals()[name] = DragDrop()
    globals()[name].content = str(i)
    drag.append(globals()[name])

drop=[]
for i in range(1,n+1):
    name="drop"+str(i)
    globals()[name] = DragDrop()
    globals()[name].droppable = True
    drop.append(globals()[name])


from jinja2 import Template

row1=list(range(1,n+1))
row2=list_randint_norep(n,1,n)
table = Template(tpltable).render(row1=row1,row2=row2,f="f")
sol=n*[0]
for i in range(n):
    sol[row2[i]-1]=i+1
==

text ==
On considère l'application bijective $! f:\\{1,\ldots,{{n}} \\}\rightarrow \\{1,\ldots,{{n}} \\} !$ définie par le tableau ci-dessous.
<br>
{{table|safe}}
<br>
Déterminer l'application réciproque $! f^{-1} !$.
==

form ==
<table>
<tr>
<th> $! x !$ </th>
{% for item in row1 %}
<td> {{item|safe}} </td>
{% endfor %}
</tr>
<tr>
<th> $! f^{-1}(x) !$ </th>
{% for e in drop %}
<td> {{e|component}} </td>
{% endfor %}
</tr>
</table>

{% for e in drag -%}
{{ e|component }}
{%- endfor %}
==

evaluator==
drop=[]
for i in range(1,n+1):
    name="drop"+str(i)
    drop.append(locals()[name])

feedback=""
score=100
for i in range(n):
    if drop[i].content==str(sol[i]):
        drop[i].css = "success-state"
    else:
        score=0
        drop[i].css = "error-state" 
==


