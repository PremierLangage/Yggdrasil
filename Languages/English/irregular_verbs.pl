@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title=Irregular verbs

inputbox =: Input
inputbox.type = text
inputbox.maxlength = 50
inputbox.appearance = outline

countdown % { "cid": "countdown", "selector": "c-countdown" }
countdown.time % 10
countdown.hidden % false

autoSubmit== #|js|
const btn = document.querySelector('.action-submit');
btn.click()
==

before== #|python|
import random

countdown.actions = [
    { "time": 0, "action": autoSubmit }
]
counter = 0

IR = [ ["begin", "began"], ["break", "broke"], ["lie", "lay"], ["run", "ran"], ["say", "said"], ]

index_verb  = random.randint(0, len(IR)-1)

verb = IR[index_verb][0]
preterit = IR[index_verb][1]
==



form==
{{ countdown|component }}

{{ inputbox |component}}
==

evaluator==



if r == inputbox.value:
    grade = (100, '<span class="success-state">Good 👏👏👏</span>')
else:
    grade = (0, '<span class="error-state">Bad answer 👎👎👎</span>')
==

text= Give the preterite of the verb {{ verb }}


evaluator== #|python|
remaining = countdown.time
# reset timer
for e in countdown.actions:
    e['consumed'] = False

countdown.time = 10
counter += 1
grade = (100, f'<h3>remaining: {remaining}, counter: {counter}</h3>')

==
