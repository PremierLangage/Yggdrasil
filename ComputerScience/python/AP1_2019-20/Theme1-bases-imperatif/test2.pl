# Boris Jabot 10/09/2019 KO
#  Author: Coumes Quentin     Mail: qcoumes@etud.u-pem.fr




title= Addition Aléatoire

author = Quentin Coumes

text==
Combien <i>font</i> ***{{ op1 }} + {{ op2 }}*** ?
==

form==
<div class="input-group">
    <input id="form_answer" type="number" class="form-control" value="{{ answers__.answer }}" required/>
</div>
==

settings.allow_reroll=true
settigns.reroll_threshold=-1

evaluator==
import traceback
import sys
essai+=1
op1 = random.randint(1, 10*(good+1))
op2 = random.randint(1, 10*(good+1))
try: 
    if int(response['answer']) == op1 + op2:
        good += 1
        if good >5: 
            score=100
        else:
            score=10
        grade = (score, "Bonne réponse")
    else:
        grade = (0, "Mauvaise réponse")
except:
    print(traceback.format_exc(), file=sys.stderr)
    grade = (-1, "Merci de rentrer un entier")
==


before==
import random
random.seed(seed)
op1 = random.randint(1, 10)
op2 = random.randint(1, 10)
essai=0
good=0
==

@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ lib:/grader/evaluator.py [grader.py]






