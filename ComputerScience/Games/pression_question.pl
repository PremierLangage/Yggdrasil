@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Réponse
inputbox.appearance = outline


countdown % { "cid": "countdown", "selector": "c-countdown" }
countdown.time % 10
countdown.hidden % false

autoSubmit== #|js|
const btn = document.querySelector('.action-submit');
btn.click()
==


hints % { "cid": "hints", "selector": "c-hint" }
hints.shouldConfirm % false
hints.items %=
[
    { "content": "Présente dans de nombreux langage de programmation, cette classe de stokage qualifie souvent des variables." },
    { "content": "Plop"  },
    { "content": "Plop"},
    { "content": "Plop"}
]
==


before== #|python|
countdown.actions = [
    { "time": 0, "action": autoSubmit }
]

==

title = Question sous pression
text ==
Nous cherchons une classe de stockage.
==

form ==
 {{ hints|component }}

 {{ countdown|component }}

 {{ inputbox|component }}
==

evaluator== #|python|
remaining = countdown.time
# reset timer
for e in countdown.actions:
    e['consumed'] = False

countdown.hidden % true
grade = (100, f'<h3>remaining: {remaining}')

==


