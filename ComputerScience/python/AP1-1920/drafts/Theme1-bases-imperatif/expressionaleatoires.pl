
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

before== #|python|
import random
try=0
N = 3
op1 = [str(random.randint(1, 10)) for n in range(N)]
op2 = [str(random.randint(1, 10)) for n in range(N)]
ope = [random.choice(['+','*','-','/','//','%','**']) for n in range(N)]
res = [ eval(op1[n]+ope[n]+ op2[n]) for n in range(N)]

inputs = []
for i in range(N):
    inp = Input()
    globals()[f"input{i}"] = inp
    inputs.append(inp)
==

evaluator== #|python|
try+=1
cpt = 0
for i in range(N):
    box = globals()[f"input{i}"]
    if box.value == str(res[i]):
        cpt += 1

score = int(cpt / N * 100)
feedback = 'Bravo' if score == 100 else 'Corriger les erreurs'

if score <100:
    eval(before)
grade = (score, feedback)
==

title = Expressions aléatoires
# y a pas besoin d'énoncé 
text=

form== #|html|
<ul>
{% for input in inputs %}
<li> $% {{op1[loop.index0]}} %$ {{ope[loop.index0]}} $% {{op2[loop.index0]}}  %$  = {{ input|component }}  </li>
{% endfor %}
</ul>
==
