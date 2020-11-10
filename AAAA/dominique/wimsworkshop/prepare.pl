
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

inputbox =: Input
inputbox.type = number
inputbox.placeholder = Nombre de bonnes réponses (1) 
inputbox.maxlength = 2
inputbox.appearance = outline


inputbox2 =: Input
inputbox2.type = number
inputbox2.placeholder = Nombre de mauvaise réponses (3)
inputbox2.maxlength = 2
inputbox2.appearance = outline

inputbox3 =: Input
inputbox3.type = text
inputbox3.placeholder = Les bonnes réponses
inputbox3.maxlength = 3
inputbox3.appearance = outline

inputbox4 =: Input
inputbox4.type = multi
inputbox4.placeholder = les mauvaises réponses
inputbox4.maxlength = 4
inputbox4.appearance = outline


before==
import random

a = random.randint(1, 10)
b = random.randint(1, 10)
r = a + b
==

title==
Exercice préparé : CheckBox 
==

text==

==

form==
{{ inputbox|component}} {{ inputbox2|component}}
{{ inputbox3|component}}{{ inputbox4|component}}

==

evaluator==
if r == inputbox.value:
    grade = (100, '<span class="success-state">Good 👏👏👏</span>')
else:
    grade = (0, '<span class="error-state">Bad answer 👎👎👎</span>')
==


