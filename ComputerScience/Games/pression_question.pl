@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py


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
    { "content": "**Hint 1**" },
    { "content": "**Hint 2**"  },
    { "content": "**Hint 3**", "css": "warning-state"  }
]
==



before== #|python|
countdown.actions = [
    { "time": 0, "action": autoSubmit }
]
counter = 0
==

title = Question sous pression
text ==

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

countdown.time = 10
counter += 1
grade = (100, f'<h3>remaining: {remaining}, counter: {counter}</h3>')

==


