# DR 25/09/2019 OK
#  Author: DR
@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py] 
@ /builder/before.py [builder.py] 
@ /ComputerScience/python/template/pltest_doc.py
@ /ComputerScience/python/AP1-1920/templates/utils/feedback2.py
@ /ComputerScience/python/AP1-1920/templates/utils/template.html

component =: Input
component.type = text

#evaluator==
#grade = (100, component.value)
#==

title== #|html|
Bascule

==
tag= valeur|variable|bascule|expression

before== #|python|
import random
lval1=[True,False,1,0,67]
lval2=[False,True,0,2,0]
lexp=["not var","not var","1 - var","2-var","67-var"]
N= random.randint(0,4)
val1=lval1[N]
val2=lval2[N]
exp=lexp[N]
soluce="var = "+exp
sval1 = str(val1)
sval2 = str(val2)
==

text==
Le but de cet exercice est d'avoir une ligne de code de la forme :

    var = expression

telle que la valeur de *var*  passe successivement de la valeur **{{val1}}** à la valeur **{{val2}}** 
puis de la valeur **{{val2}}** à la valeur **{{val1}}**, a chaque fois que l'on exécute la ligne.

Ecrivez l'expression qui permet de faire cela.
On suppose que var est initialisé à 0.
==

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
    exec("var ="+component.value,d)
    if d['var'] != val2 :
        grade = (0, f"<br/> le passage de {val1} à {val2} ne fonctionne pas ! {d['var']}")
    else:
        exec("var ="+component.value,d)
        if d['var'] != val1 :
            grade = (0, f"<br/> le passage de {val2} à {val1} ne fonctionne pas ! {d['var']}")
        else:
            grade=(100,"<br/> Bravo vous avez écrit une bascule sans conditionnelles !")
==

form==
   var = {{ component|component}}
==
















