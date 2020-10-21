# Pour calmer la gosse de mon frère qui me casse les bonbons avec ses additions

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

inputbox =: Input
inputbox.type = number
inputbox.placeholder = Answer
inputbox.maxlength = 4
inputbox.appearance = outline

before==
import random

a = random.randint(1, 80)
b = random.randint(1, 100-a)
r = a + b
==

title==
Addition
==

text==
Quel est le résultat de l'addition ** {{ a }} + {{ b }} ** ?
==

form==
{{ inputbox|component}}
==

evaluator==#|python|
if r == inputbox.value:
    grade = (100, """<span class="success-state">Bravo, c'est bien ça !</span>""")
else:
    grade = (0, """<span class="error-state">Non, ce n'est pas le bon résultat...</span>""")
==

