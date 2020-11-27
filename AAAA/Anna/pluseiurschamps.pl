
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.placeholder = L'énoncé
editor.language = python
editor.code ==
# write your code here
==

inputbox =: Input
inputbox.type = number
inputbox.placeholder = Titre
inputbox.maxlength = 2
inputbox.appearance = outline




before==
==

title = Code Editor Component

text==
Saisir votre exercice
==

form==
{{ inputbox|component}}
{{ editor|component }}
==

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

==

evaluator==

feedback = f"""
title={inputbox.value}
text==
{editor.code}
==

"""


if r == inputbox.value:
    grade = (100, feedback)
else:
    grade = (0, '<span class="error-state">Bad answer 👎👎👎</span>')
==


