extends = /Mathematics/template/mathinput.pl

title = Image d'une application

lang = fr

before ==
lst=list(range(5))
row1=[]
row2=[]
for x in lst:
    row1.append("<td> %d </td>" % x)
for x in [3,5,8,0,1]:
    row2.append("<td> %d </td>" % x)
==

text ==
<table>
<tr>
{% for item in row1 %}
<td> item </td>
{% endfor %}
<tr>
<tr>
{% for item in row2 %}
<td> item </td>
{% endfor %}
<tr>e>
==

evaluator==
score,_,feedback=ans_struct_expr(input.value,fA,"composite")
==

