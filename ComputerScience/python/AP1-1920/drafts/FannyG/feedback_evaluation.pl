

# /!\evals à supprimer après les tests (dans la balise before)

# récupère toutes les éval d'une copie et donne un retour



@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]



enonce = Quel âge avez-vous ?
title = Feedback evaluation de la question "{{enonce}}"
text  = 


before ==#|python|
from math import ceil

evals =[
    {"note": 82, "commentaire": "Bien", "justificatifs": []},
    {"note": 25, "commentaire": "Moyen", "justificatifs": []},
    {"note": 14, "commentaire": "Pas bien", "justificatifs": []},
]

nb_note = 0
tmp = 0
for e in evals:
    tmp += e['note']
    nb_note += 1
note_final = ceil(tmp/nb_note)
==


form  == #|html|
Votre copie a reçu {{nb_note}} d'évaluations.
Note moyenne : {{note_final}}/100
==


evaluator ==#|python|
grade = (100, " ")
==


