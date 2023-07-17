
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

################### Modifier ici ###########################
author=King Dodongo

title=Glace

text ==
Parfum de glace favori?
==

items==
+ Vanille
Chocolat
Pistache
==
############################################

group =: CheckboxGroup

before==#|python|
vos_choix = ""

group.items = []

for i, item in enumerate(items.splitlines()):
    group.items.append({ "id": i, "content": item })
==

form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator == #|py|
score = 100
feedback = '<span class="success-state">Réponse enregistrée</span>'

vos_choix = "<br /><br />"
vos_choix += "<b>Choix :</b> " + str(group.items[group.selection]['content']) + "<br />"

feedback += vos_choix

grade = (score, feedback)
==


