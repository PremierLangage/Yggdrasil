

# /!\evals à supprimer après les tests (dans la balise before)

# récupère toutes les éval d'une copie et donne un retour



@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]


#a enlever : sert de test
enonce = Quel âge avez-vous ?

title = Feedback evaluation de la question "{{enonce}}"
text  = 


before ==#|python|
#a enlever : sert de test
evals =[
    {"note": 82, "commentaire": "Bien", "justificatifs": []},
    {"note": 25, "commentaire": "Moyen", "justificatifs": ["ergt","ydrvf"]},
    {"note": 14, "commentaire": "Pas bien", "justificatifs": ["1893","654"]},
]
nb_note = len(evals)
==


form  == #|html|
Votre copie a reçu {{nb_note}} d'évaluations.
<br/>
{% for rg in evals %} 
    <br/>
    {% if rg.justificatifs != [] %}
        <p> Justificatifs :<br/>
        {% for justif in rg.justificatifs %}
            {{justif}}<br/>
        {% endfor %}
        </p>
    {% endif %}
    <p>Note : {{rg.note}} : {{rg.commentaire}}</p>
{% endfor %}
==


evaluator ==#|python|
grade = (100, " ")
==


