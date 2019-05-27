title=Calcul Mystere

extends=/ComputerScience/python/template/simpleeval.pl

text=
basetext==
Si la variable **a** est initialisée avec la valeur 2.

Alors quelle est la valeur de la variable **p** à la fin de la suite d'instructions suivante:

==

tag=operator_**|expression

before==

import random

random.seed(seed)

formula="<br/>    a = 2<br/>    p = a * a<br/>"
a=2
p=a*a
for x in range(0,random.randint(1,3)):
    r=random.randint(0,10)
    if r <7 :
        formula += "    p = p * a <br/>"
        p = p * a
    else:
        formula += "    p = p * p <br/>"
        p = p * p


text = basetext+"<code>\n"+ formula+"</code>\n"

res=p
==


# form=@ lib:/forms/simplenumeric.html
form==

<!-- Form numerique -->

<div class="input-group">
    <input id="form_answer" type="number" class="form-control" placeholder="" required>
</div>

==

evaluator==
if not response['answer']:
    grade= False," Repondez quelque chose !"
elif int(response['answer']) == res:
    grade = True,'<div class="btn-success"> Bien joué ! '+str(res)+'</div>'
else:
    grade = False,'<div class="btn-danger">  Raté : réessayez </div>'
==





