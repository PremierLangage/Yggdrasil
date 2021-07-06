# coding: utf-8

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py

# Script d'évaluatino 
evaluator== #|python|
import random
random.seed(seed)


a = random.randint(1,1000)
b = random.randint(1,1000)

try:
    exec(response['answer'])
except Exception as e:
    grade=(0,""" Votre code ne compile pas""")
else:
    try:
        if not (type(somme)  is int):
            grade = (0,'<span class="fail-state">la variable **somme** n\'a pas le bon type</span>')
    except Exception as e:
        grade=(0,'<span class="fail-state">la variable **somme** n\'existe pas</span>')
    if somme == a+b :
        grade = (100,'<span class="success-state">Correct !</span>')
    else:
        grade = (0,'<span class="fail-state">la variable **somme** n\'a pas la bonne valeur</span>')
==

title== #|html|
Somme de variables
==


text== #|html|
Initialisez la variable **somme** avec la somme des variables **a** et **b**.
==

form=@ /form/text_editor.html









