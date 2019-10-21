@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title=Irregular verbs

inputbox =: Input
inputbox.type = number
inputbox.placeholder = Answer
inputbox.maxlength = 2
inputbox.appearance = outline

countdown % { "cid": "countdown", "selector": "c-countdown" }
countdown.time % 10
countdown.hidden % false

autoSubmit== #|js|
const btn = document.querySelector('.action-submit');
btn.click()
==

before== #|python|
countdown.actions = [
    { "time": 0, "action": autoSubmit }
]
counter = 0
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


form ==
 {{ countdown|component }}
==

evaluator== #|python|
remaining = countdown.time
# reset timer
for e in countdown.actions:
    e['consumed'] = False

countdown.time = 10
counter += 1
grade = (100, f'<h3>remaining: {remaining}, counter: {counter}</h3>')

==
