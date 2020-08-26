
# récupère toutes les éval d'une copie et donne un retour


@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]


enonce = Quel âge avez-vous ?
title = Feedback evaluation {{enonce}}
text  = 


before ==#|python|
evals ={
    {
        "note": 50
    },
    {
        "note": 25
    },
    {
        "note": 75
    },
}
nb_note = 0
tmp = 0
for e in evals:
    tmp += e['note']
    nb_note += 1
note_final = tmp/nb_note
==


form  == #|html|

==


evaluator ==#|python|
grade = (100, "")
==
