#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

@ /utils/sandboxio.py
@ /ComputerScience/OperatingSystem/templates/utils_bash.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

author=Nicolas Borie

title=Les réflexes salutaires en terminal

tag=réflexes|bonnes pratiques|terminal|unix

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==#|python|
import random

group.items = []

group.items.append({"id": "g1", "content": "Utiliser au maximum la tab-completion pour éviter les fautes de frappe."})
group.items.append({"id": "g2", "content": "Rappeler les commandes avec les flèches plutôt que de les retaper."})
group.items.append({"id": "g3", "content": "Se souvenir que le résultat de certaines commandes dépendent de la taille de la fenêtre du terminal."})
group.items.append({"id": "g4", "content": "Remplir plutôt son `.bashrc` que saturer sa mémoire."})
group.items.append({"id": "g5", "content": "Ne pas démarrer de terminal en mode `root`, utilisez plutôt `sudo` ponctuellement."})
group.items.append({"id": "g6", "content": "Les touches `q` et `escape` sont les plus courantes pour quitter une application unix."})
group.items.append({"id": "g7", "content": "Le manuel `man`, les options `-help` et `--help` donnent très souvent de l'aide."})

group.items.append({"id": "b1", "content": "Penser à gratter les puces informatiques entre chaque reboot."})
group.items.append({"id": "b2", "content": "Faire toujours bruler un peu d'encens mais pas juste à coté de l'ordinateur."})

random.shuffle(group.items)
==


text==
Sélectionnez les réflexes qui sauvent l'utilisateur dans un terminal unix...
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==#|python|
from utils_bash import display_as_shell_this, frame_message

right = 0
total = 0
for item in group.items:
    checked = item['checked']
    total += 1
    if ('g' in item['id'] and checked):
        item['css'] = 'success-border'
        right += 1
    elif ('b' in item['id'] and not checked):
        right += 1
    else:
        if checked :
            item['css'] = 'error-border'
        else:
            item['css'] = 'success-border animated pulse infinite'

if total == right:
    grade = (100, frame_message("C'est une question de survie ces réflexes!", "ok"))
else:
    feedb = "Vous avez fait "+str(total-right)
    if total-right > 1 :
        feedb += " erreurs."
    else:
        feedb += " erreur."
    grade = ((right*100 // total), frame_message(feedb, "error"))
==

