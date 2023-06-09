
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
Vanilla
Chocolat
Pistache
==

############################################

group1 =: RadioGroup
group2 =: RadioGroup
group3 =: RadioGroup

before==#|python|
vos_choix = ""

group1.items = []
group2.items = []
group3.items = []

for i, item in enumerate(items.splitlines()):
    group1.items.append({ "id": i, "content": item })
    group2.items.append({ "id": i, "content": item })
    group3.items.append({ "id": i, "content": item })
==

form==

{{ question1 }}

{{ group1|component }}

{{ question2 }}

{{ group2|component }}

{{ question3 }}

{{ group3|component }}

==

# EVALUATE THE STUDENT ANSWER
evaluator == #|py|
score = 100
feedback = '<span class="success-state">Réponse enregistrée</span>'

vos_choix = "<br /><br />"
vos_choix += "<b>Premier choix :</b> " + str(group1.items[group1.selection]['content']) + "<br />"
vos_choix += "<b>Second choix :</b> " + str(group2.items[group2.selection]['content']) + "<br />"
vos_choix += "<b>Troisième choix :</b> " + str(group3.items[group3.selection]['content']) + "<br />"

feedback += vos_choix

grade = (score, feedback)
==


