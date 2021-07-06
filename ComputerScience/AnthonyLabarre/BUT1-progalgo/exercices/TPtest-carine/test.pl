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
    if sum_a_and_b == a+b :
        grade = (100,'OK')
    else:
        grade = (0,"""booo""")
==

title== #|html|
Somme de variables
==


text== #|html|
...
==

form=@ /form/text_editor.html









