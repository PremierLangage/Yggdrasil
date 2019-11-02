extends = /Mathematics/template/mathinput.pl

title = Image d'une application

lang = fr

before ==
lst=list(range(5))
lstrow1=[]
lstrow2=[]
for x in lst:
    lstrow1.append("<td> %d </td>" % x)
for x in [3,5,8,0,1]:
    lstrow2.append("<td> %d </td>" % x)

table=r"<table style=''><tr> %s </tr><tr> %s </tr></table>" % ("".join(lstrow1),"".join(lstrow2))
==

text ==
<table style="width:100%">
  <tr>
    <th>Jill</th>
    <td>Smith</td>
    <td>50</td>
  </tr>
  <tr>
    <th>Eve</th>
    <td>Jackson</td>
    <td>94</td>
  </tr>
  <tr>
    <th>John</th>
    <td>Doe</td>
    <td>80</td>
  </tr>
</table>
==

evaluator==
score,_,feedback=ans_struct_expr(input.value,fA,"composite")
==

