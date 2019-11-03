extends = /Mathematics/template/mathbasic.pl
extends = finite_map_.pl


title = Composition d'applications

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
row2f=list_randint(n,1,n)
row2g=list_randint(n,1,n)
tablef = Template(tpltable).render(row1=row1,row2=row2f,f="f")
tableg = Template(tpltable).render(row1=row1,row2=row2g,f="g")

case=randitem([1,2])
sol=[]
if case==1:
    for i in range(n):
        sol.append(row2f[row2g[i]-1])
    h="f \circ g"
else:
    for i in range(n):
        sol.append(row2g[row2f[i]-1])
    h="g \circ f"
==

text ==
On considère les applications  $! f:\\{1,\ldots,{{n}} \\}\rightarrow \\{1,\ldots,{{n}} \\} !$ et $! g:\\{1,\ldots,{{n}} \\}\rightarrow \\{1,\ldots,{{n}} \\} !$ définies par les tableaux ci-dessous.
<br>
{{tablef|safe}}
<br>
{{tableg|safe}}
<br>
Déterminer l'application $! {{h}} !$.
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
<th> $! {{h}} (x) !$ </th>
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

