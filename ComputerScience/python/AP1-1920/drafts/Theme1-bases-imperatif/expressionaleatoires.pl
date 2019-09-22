
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

nbechec%0

before== #|python|
import random
essai = 0
N = 3
op1 = [str(random.randint(1, 10)) for n in range(N)]
op2 = [str(random.randint(1, 10)) for n in range(N)]
ope = [random.choice(['+','*','-','/','//','%','**']) for n in range(N)]
res = [ eval(op1[n]+ope[n]+ op2[n]) for n in range(N)]
solved=[ False for n in range(N)]
inputs = []
for i in range(N):
    inp = Input()
    globals()[f"input{i}"] = inp
    inputs.append(inp)
==

evaluator== #|python|
essai+=1
cpt = 0
for i in range(N):
    box = globals()[f"input{i}"]
    if box.value == str(res[i]):
        cpt += 1

score = int(cpt / N * 100)
feedback = 'Bravo' if score == 100 else 'Corriger les erreurs'

if score <100 and essai>1 :
    exec(before)
    nbechec += 1
    feedback ="essayez avec d'autres valeurs nombre d'echec= "+str(nbechec)
grade = (score, feedback)
==

title = Expressions aléatoires
# y a pas besoin d'énoncé 
text=

form== #|html|
<ul>
{% for input in inputs %}
{% if not solved[loop.index0]%}
<li> $% {{op1[loop.index0]}} %$ {{ope[loop.index0]}} $% {{op2[loop.index0]}}  %$  = {{ input|component }}  </li>
{% endif %}
{% endfor %}
</ul>
==
