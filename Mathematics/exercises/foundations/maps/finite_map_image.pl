extends = /Mathematics/template/mathinput.pl

title = Image d'une application

lang = fr

before ==
lst=list(range(5))
lstrow1=[]
for x in lst:
    lstrow1.append("<td> %d </td>" % x)
row1="<tr> %s </tr>" % "".join(lstrow1)
lstrow2=[]
for x in [3,5,8]:
    lstrow2.append("<td> %d </td>" % x)
row2="<tr> %s </tr>" % "".join(lstrow2)
==

text ==
 <table style="width:100%">
{{row1}}
{{row2}}
</table> 
==

evaluator==
score,_,feedback=ans_struct_expr(input.value,fA,"composite")
==

