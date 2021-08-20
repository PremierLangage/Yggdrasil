# au 20/08/2021 : test OE ne fonctionne pas !!!!

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

nbechec%0

before== #|python|
import random
essai = 4
N = 4
op1 = [str(random.randint(1, 10)) for n in range(N)]
op2 = [str(random.randint(1, 10)) for n in range(N)]
op3 = [str(random.randint(1, 10)) for n in range(N)]
ope = [random.choice(list({'+','*','-','//'})) for n in range(N)]
ope2 = [random.choice(list({'+','*','-','//'}-{ope[n]})) for n in range(N)]

res = [ eval(op1[n]+ope[n]+op2[n]+ope2[n]+op3[n]) for n in range(N)]

beurk= op1+op2+ope+ope2+res

solved=[ False for n in range(N)]
isfloat = [ False for n in range(N)]
inputs = []
for i in range(N):
    inp = Input()
    globals()[f"input{i}"] = inp
    inputs.append(inp)
==

evaluator== #|python|

cpt = 0
for i in range(N):
    box = globals()[f"input{i}"]
    try:
        dummy= box.value
    except Exception as e:
        continue
    if solved[i]:
        cpt += 1
        continue
    if box.value == str(res[i]):
        cpt += 1
        solved[i]= True
    else:
        if type(res[i])==type(0.0):
            isfloat[i]= True

score = int(cpt / N * 100)
feedback = 'Bravo' if score == 100 else 'Corriger les erreurs'
essai -= 1 if score != 100 else 0
if score <100 and essai<1 :
    exec(before)
    nbechec += 1
    feedback ="essayez avec d'autres valeurs nombre d'echec= "+str(nbechec)
grade = (score, feedback)
==

title = Expressions aléatoires
tag= expressions|evaluation|operateurs|priorites
# y a pas besoin d'énoncé 
text==
Attention vous avez un nombre limité d'essai pour répondre a toutes les égalitées.

Sinon cela redémarre au début avec {{N}} égalités.

Oui heureusement il y en a des faciles...

**Attention il faut fournir une valeur numérique sur chaque ligne.**
==

form== #|html|
Nombre d'essais : {{essai}}
<!--{{beurk}}-->
<ul>
{% for input in inputs %}
{% if not solved[loop.index0]%}
<li>  {{op1[loop.index0]}} 
     {{ope[loop.index0]}}  {{op2[loop.index0]}} {{ope2[loop.index0]}}  {{op3[loop.index0]}}
      = {{ input|component }}
     {% if False %} Attention valeur réelle (float) {% endif %} </li>
{% endif %}
{% endfor %}
</ul>
==



