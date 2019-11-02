extends = /Mathematics/template/mathinput.pl

title = Image d'une application

lang = fr

before ==
n=randint(5,9)
m=randint(5,9)
row1=list(range(1,n+1))
row2=list_randint(n+1,1,m)
A=list_randint_norep(randint(3,4),row2)
==

extracss==
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 0.5em;
  text-align:center;
}
</style>
==

text ==
On considère l'application $! f:\{1,\ldots,{{n}} \}\rightarrow \{1,\ldots,{{m}}\}!$ définie par le tableau ci-dessous.
<table>
<tr>
<th> $! x !$ </th>
{% for item in row1 %}
<td> {{item}} </td>
{% endfor %}
</tr>
<tr>
<th> $! f(x) !$ </th>
{% for item in row2 %}
<td> {{item}} </td>
{% endfor %}
</tr>
</table>
Déterminer l'image directe de l'ensemble $!\{ {{A_tex}} \}!$\ par $! f !$.
==

evaluator==
score,_,feedback=ans_struct_expr(input.value,fA,"composite")
==

