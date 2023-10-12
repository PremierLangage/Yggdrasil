
extends= bascule.pl



title= A swing

text==
The goal of this exercise is to have a line of code of the form:

     var = expression

such that the value of *var* passes successively from the value **{{val1}}** to the value **{{val2}}**
then from the value **{{val2}}** to the value **{{val1}}**, each time the line is executed.

Write the __expression__ that does this.
We assume that var is initialized to one of the two correct values.
==

streval1=f"<br/> going from {val1} to {val2} doesn't work ! {d['var']}"
streval2=f"<br/> le passage de {val2} à {val1} ne fonctionne pas ! {d['var']}"
streval3 = "<br/>Nice with out any if !"

evaluator==
from pltest_doc import PlRunner

pltest = """>>> True # le code compile 
True
"""
tester = PlRunner(component.value,pltest)
a, b = tester.runcompiletest(dic={'var':val1})
if not a :# erreur de compile
    grade=(0,b)
else:
    d={}
    d['var']=val1
    
    if eval(component.value,d) != val2 :
        grade = (0, streval1)
    else:
        d['var']=val2
        eval(component.value,d)
        if eval(component.value,d) != val1 :
            grade = (0, streval2)
        else:
            grade=(100,streval3)
==
