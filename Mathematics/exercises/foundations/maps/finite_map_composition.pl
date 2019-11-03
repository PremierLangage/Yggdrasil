extends = finite_map_.pl

title = Image réciproque d'une application

drop1 =: DragDrop
drop1.droppable = True

before ==
n=5
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
table= Template(tpltabledrop).render(row1=row1,row2=drop)
==

text ==
{% for e in drag -%}
{{ e|component }}
{%- endfor %}
==

evaluator==
score,_,feedback=ans_struct_expr(input.value,imA,"composite")
==

solution ==
La solution est $! {{imA_tex}} !$
==

