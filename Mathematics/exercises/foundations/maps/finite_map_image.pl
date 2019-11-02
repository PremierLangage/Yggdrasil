extends = /Mathematics/template/mathinput.pl

title = Image d'une application

lang = fr

before ==
row1=list(range(5))
row2=[3,5,8,0,1]
==

extracss==
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 15px;
}
</style>
==

text ==
<table>
<tr>
{% for item in row1 %}
<td> {{item}} </td>
{% endfor %}
</tr>
<tr>
{% for item in row2 %}
<td> {{item}} </td>
{% endfor %}
</tr>
</table>
==

evaluator==
score,_,feedback=ans_struct_expr(input.value,fA,"composite")
==

