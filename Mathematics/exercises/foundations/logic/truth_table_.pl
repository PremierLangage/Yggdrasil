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
n=4
drop=[]
for i in range(n):
    globals()[f"drop{i}"] = DragDrop(id=f"drop{i}",droppable=False)
    drop.append(globals()[f"drop{i}"])

row=list(range(1,n+1))
==

text ==
<table>
<tr>
<th> $! P !$ </th>
<th> $! Q !$ </th>
<th> $! P et Q !$ </th>
</tr>
{% for item in drop %}
<tr>
<td> {{row.loop}} </td>
<td> {{row.loop0}} </td>
<td> {{ item | component }} </td>
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


