#Auteur  = inconnu, récupéré de la base commune, repris par Tony Février et Jeanne Parmentier
#Date = 22/07/2021
#Etat =Marche (mais le compteur tourne tjs après soumission de la réponse)
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

inputbox =: Input
inputbox.type = number
inputbox.placeholder = Answer
inputbox.maxlength = 2
inputbox.appearance = outline

countdown % { "cid": "countdown", "selector": "c-countdown" }
countdown.time % 60
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
    op = ' \\times '
    res = a*b
    return (a, b, op, res)

op1, op2, op, ans = random_op()
point = "point"
==

title = Autres : Calcul mental

text ==
Quel est le résultat de l'opération $% {{ op1 }} {{ op }} {{ op2 }} %$ ?
==

form ==
 {{ countdown|component }}

 {{ inputbox|component}}

 {{ counter }} {{ point }}.
==

evaluator== #|python|
import random

remaining = countdown.time
# reset timer
for e in countdown.actions:
    e['consumed'] = False

if ans == inputbox.value:
    counter += 1
    feedback = "<span class=\"success-state\">Bonne réponse : $%"+str(op1)+str(op)+str(op2)+" = "+str(ans)+"%$</span>"
    if counter >= 2:
        point = "points"
else:
    feedback = "<span class=\"error-state\">Désolé : $%"+str(op1)+str(op)+str(op2)+" = "+str(ans)+"%$</span>"

inputbox.value = ''


def random_op():
    """
    We will return a random operation doable mentaly
    """
    a = random.randint(0,10)
    b = random.randint(0,10)
    op = ' \\times '
    res = a*b
    return (a, b, op, res)

if remaining == 0:
    countdown.hidden = True
    # the 100 shloud be counter by it's needed to pass to next exercice
    grade = (100, "<center><span class=\"success-state\">Vous avez marqué "+str(counter)+" "+point+" </span></center>")
    form = ""
    text = ""
else:
    op1, op2, op, ans = random_op()

    grade = (-1, feedback)

==





