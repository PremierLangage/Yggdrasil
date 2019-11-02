extends = /Mathematics/template/mathinput.pl

title = Image d'une application

lang = fr

before ==
lst=list(range(5))
lstrow1=[]
for x in lst:
    lstrow1.append("<td> %d </td>" % x)
lstrow2=[]
for x in [3,5,8]:
    lstrow2.append("<td> %d </td>" % x) 
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

