


# Méthode 1 privilégiée maintenant 
@ /builder/simplebefore.py [builder.py]
@ /grader/simpleeval.py [grader.py]

evaluatorname=evaluator


# Méthode 2 version historique 
#grader  =@ /grader/evaluator.py
#builder =@ /builder/before.py


# les utils devraient être sur la sandbox 
# donc plus besoin de les inclures dans le context
@ /utils/sandboxio.py
@ /utils/components/checkbox.py [customcheckbox.py]
@ /utils/components/scoring.py


@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Votre réponce
inputbox.maxlength = 2
inputbox.appearance = outline

before==
import random

a = random.randint(1, 10)
b = random.randint(1, 10)
r = a + b
==

title==
Input Component
==

text==
Enter the result of ** {{ a }} + {{ b }} ** inside the input box.
==

form==
{{ inputbox|component}}
==

evaluator==
if r == inputbox.value:
    grade = (100, '<span class="success-state">Good 👏👏👏</span>')
else:
    grade = (0, '<span class="error-state">Bad answer 👎👎👎</span>')
==

