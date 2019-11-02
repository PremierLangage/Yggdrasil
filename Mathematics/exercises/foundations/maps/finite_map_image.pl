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
<table style=''><tr> <td> 0 </td><td> 1 </td><td> 2 </td><td> 3 </td><td> 4 </td> </tr><tr> <td> 3 </td><td> 5 </td><td> 8 </td><td> 0 </td><td> 1 </td> </tr></table>
==

evaluator==
score,_,feedback=ans_struct_expr(input.value,fA,"composite")
==

