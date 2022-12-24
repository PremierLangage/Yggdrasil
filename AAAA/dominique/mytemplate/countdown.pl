
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/bbefore.py

countdown % { "cid": "countdown", "selector": "c-countdown" }
countdown.time % 10
countdown.hidden % false

group =: CheckboxGroup



autoSubmit== #|js|
const btn = document.querySelector('.action-submit');
btn.click()
==

logOnConsole==#|js|
// you may open the browser console to see the message
console.log('hello world');
==

beforeA== #|python|
countdown.actions = [
    { "time": 5, "action": logOnConsole },
    { "time": 0, "action": autoSubmit }
]
counter = 0

import random
group.items = []
for i in range(4):
    group.items.append({
        "id": str(i),
        "content": str(random.randint(0, 100))
    })


==

title = Count Down Component
text =
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


# GENERATE A RANDOM QUESTION
before==

==

title = Checkbox Group Component

text==
Select even numbers.
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==
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


if total == 0:
    grade = (100, 'Right')
else:
    grade = ((right / total) * 100, f"{right} / {total}")
==
