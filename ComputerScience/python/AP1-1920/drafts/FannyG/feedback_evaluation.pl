

# /!\evals à supprimer après les tests (dans la balise before)

# récupère toutes les éval d'une copie et donne un retour



@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]



enonce = Quel âge avez-vous ?
title = Feedback evaluation de la question "{{enonce}}"
text  = 


before ==#|python|
#a enlever : sert de test
evals =[
    {"note": 82, "commentaire": "Bien", "justificatifs": ["1","2"]},
    {"note": 25, "commentaire": "Moyen", "justificatifs": ["ergt","ydrvf"]},
    {"note": 14, "commentaire": "Pas bien", "justificatifs": ["1893","654"]},
]
nb_note = len(evals)
==


form  == #|html|
Votre copie a reçu {{nb_note}} d'évaluations.
<br/>
{% for rg in radio %} 
    <br/>
    <p>Note : {{rg.note}}. Commentaire general : {{rg.commentaire}}</p>
{% endfor %}


==


evaluator ==#|python|
grade = (100, " ")
==


