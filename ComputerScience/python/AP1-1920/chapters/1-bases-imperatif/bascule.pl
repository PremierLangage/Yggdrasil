# DR 25/09/2019 OK
#  Author: DR

extends=../../templates/pltest.pl
extends=../../templates/simpleinput.pl

@ /builder/before.py [builder.py]

title== #|html|
Bascule
==

before== #|python|
import random
lval1=[True,False,1,0,67]
lval2=[False,True,0,2,0]
lexp=["not var","not var","1 - var","2-var","67-var"]
N=random.randint(0,4)
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

telque la valeur de var passe successivement de la valeur {{val1}} à la valeur {{val2}} 
puis de la valeur {{sval2}} à la valeur {{sval1}}, a chaque fois que l'on exécute la ligne.

Ecrivez l'expression qui permet de faire cela.

==



evaluator==
from pltest_doc import PlRunner

pltest = """>>> True # le code compile 
True
"""
tester = PlRunner(component.value,pltest)
a, b = tester.runpltest(1)
if not a :# erreur de compile
    grade=(0,b)
else:
    d={}
    d['var']=val1
    eval(component.value,d)
    if d['var'] != val2 :
        grade = (0, f" le passage de {val1} à {val2} ne fonctionne pas ")
    else:
        eval(component.value,d)
        if d['var'] != val1 :
            grade = (0, f" le passage de {val2} à {val1} ne fonctionne pas ")
        else:
            grade=(100," Bravo vous avez écrit une bascule sans conditionnelles !")
==

form==
   var = {{ component|component}}
==





