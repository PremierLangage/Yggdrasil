
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/bbefore.py

countdown % { "cid": "countdown", "selector": "c-countdown" }
countdown.time % 30
countdown.hidden % false

group =: CheckboxGroup



autoSubmit== #|js|
const btn = document.querySelector('.action-submit');
btn.click()
==

logOnConsole==#|js|
// you may open the browser console to see the message
console.log('plus vite chauffeur');
==

beforeA== #|python|
countdown.actions = [
    { "time": 5, "action": logOnConsole },
    { "time": 120, "action": autoSubmit }
]
counter = 0

import random
group.items = []
for i in range(2):
    group.items.append({
        "id": str(i),
        "content": str(random.randint(0, 100)*2)
    })
    group.items.append({
        "id": str(i),
        "content": str(random.randint(0, 100)*2+1)
    })


==

title = Count Down Component

form ==
{{ countdown|component }}
{{ group|component }}
==

title = Checkbox Group Component plus countdown

text==
Select even numbers.
==



# EVALUATE THE STUDENT ANSWER
evaluator==

remaining = countdown.time
# reset timer
#for e in countdown.actions:
#    e['consumed'] = False

counter = -1

right = 0
total = 0
for item in group.items:
    checked = item['checked']
    content = int(item['content'])
    if content % 2 == 0:
        total += 1
        item['css'] = 'success-border animated pulse infinite'
        if checked:
            right += 1
            item['css'] = 'success-border'
    elif checked:
        item['css'] = 'error-border'


if total == right or total == 0:
    grade = (100, 'Right : 100')
else:
    grade = ((right / total) * 100, f" Voila : {right} / {total}")
==
