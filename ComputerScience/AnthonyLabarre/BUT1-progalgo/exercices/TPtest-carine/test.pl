# coding: utf-8

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py

# Script d'évaluatino 
evaluator== #|python|
import random
random.seed(seed)


a = random.randint(1,10)
b = random.randint(1,10)

try:
    exec(response['answer'])
except Exception as e:
    grade=(0,""" Votre code ne compile pas""")
else:
    if somme == a+b :
        grade = (100,'<span class="success-state">Bonne réponse</span>')
    else:
        grade = (0,"""booo""")
==

title== #|html|
Somme de variables
==


text== #|html|
Initialisez la variable **somme** avec la somme des variables **a** et **b**.
==

form=@ /form/text_editor.html









