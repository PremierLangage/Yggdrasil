@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

author=Nicolas Borie

tag=C|caractéristique|cours

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==
import random

group.items = []

group.items.append({"id": "1", "content": "Langage compilé"})
group.items.append({"id": "4", "content": "Langage typé statiquement"})
group.items.append({"id": "7", "content": "Langage Impératif"})
group.items.append({"id": "9", "content": "Langage bas niveau"})

group.items.append({"id": "2", "content": "Langage interprété"})
group.items.append({"id": "3", "content": "Langage typé dynamiquement"})
group.items.append({"id": "5", "content": "Langage non typé"})
group.items.append({"id": "6", "content": "Langage Orienté objet"})
group.items.append({"id": "8", "content": "Langage haut niveau"})

random.shuffle(group.items)
==

title = Le langage C

text==#|markdown|
Sélectionnez les caractéristiques du Langage C.

<style>
.error-state{
   padding: 10px;
}
.success-state{
   padding: 10px;
}
</style>
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==#|python|
right = 0
error = 0
for item in group.items:
    checked = item['checked']
    id = int(item['id'])
    if id in [1, 4, 7, 9]:
        if checked:
            right += 1
            item['css'] = 'success-state'
        else:
            error += 1
            item['css'] = 'error-state'
    elif checked:
        item['css'] = 'error-state'
        error += 1
    else :
        item['css'] = 'normal'

nb_error = (4 - right) + error
note = 25*max([0, 4 - nb_error])

if (nb_error == 0):
    msg = '<span class="success-state">Bravo, cela caract&eacute;rise bien le langage C.</span>'
else:
    msg = '<span class="error-state">Vous avez fait %s erreurs.</span>' % error

grade = (note, msg)
==





