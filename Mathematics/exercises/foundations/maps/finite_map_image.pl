extends = /Mathematics/template/mathinput.pl

title = Image d'une application

lang = fr

before ==
n=randint(5,9)
m=randint(5,9)
row1=list(range(1,n+1))
row2=list_randint(n,1,m)
A=list_randitem_norep(randint(3,4),row1)
A_tex=latex(A)
fA=list(set([row2[x] for x in A]))
fA.sort()
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
{{fA}}
On considère l'application $! f:\\{1,\ldots,{{n}} \\}\rightarrow \\{1,\ldots,{{m}}\\}!$ définie par le tableau ci-dessous.
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
Déterminer l'image directe de l'ensemble $!\\{ {{A_tex}} \\}!$ par $! f !$.
==

evaluator==
score,code,feedback=ans_struct_expr(input.value,fA,"composite")
feedback=str(FiniteSet2struct(fA))+str(FiniteSet2struct(input.value))
==

