# au 17/08/2021 test OCE : ne fonctionne pas !

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

extends decl_inputs.pl


nbechec%0

before== #|python|
import random
essai = 4
N = 3

expr = []
res = []
cnt = 0

while cnt < N:
    op1gen = str(random.randint(1, 10))
    op2gen = str(random.randint(1, 10))
    opegen = random.choice(['+','*','-','//','/','%','**'])
    exprgen = op1gen + opegen + op2gen
    resgen = eval(exprgen)
    if len(str(resgen)) < 5: # Donc on ne fait pas calculer 9**8 !
        cnt += 1
        expr.append(exprgen)
        res.append(resgen)

#op1 = [str(random.randint(1, 10)) for n in range(N)]
#op2 = [str(random.randint(1, 10)) for n in range(N)]
#ope = [random.choice(['+','*','-','//','/','%','**']) for n in range(N)]
#res = [ eval(op1[n]+ope[n]+ op2[n]) for n in range(N)]

solved=[ False for n in range(N)]
isfloat = [ False for n in range(N)]
inputs = []
for i in range(N):
    inputs.append(globals()[f"input{i}"])
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
# y a pas besoin d'énoncé 

tag = arithmetique|operateurs

text==
Attention vous avez un nombre limité d'essais pour répondre à toutes les égalités.

Sinon cela redémarre au début avec {{N}} égalités.

Oui heureusement il y en a des faciles...

**Attention il faut fournir une valeur numérique sur chaque ligne.**
==

form== #|html|
Nombre d'essais : {{essai}}
<br><br>
<ul>
    {% for i in range(N) %}
        {{ expr[i] }}
        {{ inputs[i]|component }}
    {% endfor %}
</ul>
==







