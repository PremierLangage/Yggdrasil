@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

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
import random

countdown.actions = [ { "time": 0, "action": autoSubmit } ]
counter = 0

def random_op():
    """
    We will return a random operation doable mentaly
    """
    a = random.randint(0,10)
    b = random.randint(0,10)
    op = ' \times '
    return (a, b, op)
==

title = Calcul mental

text ==
Quel est le réésultat de l'opéération : 
==

form ==
 {{ countdown|component }}

 {{ inputbox|component}}
==

evaluator== #|python|
remaining = countdown.time
# reset timer
for e in countdown.actions:
    e['consumed'] = False

if r == inputbox.value:

countdown.time = 10
counter += 1
grade = (100, f'<h3>remaining: {remaining}, counter: {counter}</h3>')

==


