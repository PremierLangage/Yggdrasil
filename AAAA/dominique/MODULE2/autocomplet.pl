
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Answer
inputbox.maxlength = 20
inputbox.appearance = outline

before==
import random

countries = [
    ("France", "Paris"),
    ("Allemagne", "Berlin"),
    ("Danemark", "Copenhague"),
    ("Belgique", "Bruxelles"),
    ("Hongrie", "Budapest"),
    ("Pays-Bas", ",Amsterdam"),
    ("Portugal", "Lisbonne"),
    ("Slovaquie", "Bratislava"),
    ("Espagne", "Madrid"),
    ("Irlande", "Dublin"),
    ("Norvège", "Oslo"),
    ("Suède", "Stockholm"),
    ("Grèce", "Athènes"),
]

inputbox.autocomplete = []
for e in countries:
    inputbox.autocomplete.append(e[0])

answer = random.choice(countries)
==

title==
Input Component With Autocompletion
==

text==
Which country has ** {{ answer[1] }} ** as its capital ?
==

form==
{{ inputbox|component}}
==

evaluator==
if inputbox.value == answer[0]:
    grade = (0, '<span class="success-state">Good answer</span>')
else:
    grade = (0, '<span class="error-state">Bad answer</span>')

==
