extends = /Mathematics/template/mathinput.pl

title = Table de vérité

extracss==
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
table {
    margin: auto;
}
th, td {
  padding: 0.5em;
  text-align:center;
}
</style>
==


before ==
drop=[]
for i in range(4):
    globals()[f"drop{i}"] = DragDrop(id=f"drop{i}",droppable=False)
    drop.append(globals()[f"drop{i}"])

P=[True,True,False,False]
Q=[True,False,True,False]

R = [P[i] and not Q[i] for i in range(4)]

row1 = ["V" if P[i] else "F" for i in range(4)]
row2 = ["V" if Q[i] else "F" for i in range(4)]

==

text ==
{{R}}

<table>
<tr>
<th> $! P !$ </th>
<th> $! Q !$ </th>
<th> $! P et Q !$ </th>
</tr>
{% for i in range(4) %}
<tr>
<td> {{row1[i]}} </td>
<td> {{row2[i]}} </td>
<td> {{ drop[i] | component }} </td>
</tr>
{% endfor %}
</table>
==

evaluator==
score,_,feedback=ans_struct_expr(input.value,imA,"composite")
==

solution ==
La solution est $! {{imA_tex}} !$
==


