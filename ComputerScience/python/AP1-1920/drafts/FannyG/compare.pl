# permet d'évaluer deux réponses (textuelle ou autre) de deux élèves par qqun d'autre par le biais d'une grille critériée 
# -paramètres : 
#     -les réponses des deux élèves : balise data
#     -les critère d'evaluation: balise criteria
# -retourne : le gagnant (0 ou 1) et la valeur pour chaque critère et un commentaire (ou un commentaire par critère ?)


# author=Fanny Garnevault

@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]



before==#|python|

# paramètre data contenant la question et la réponse de l'élève
data = {"question": "Quel âge avez-vous ?", "answer1": "J'ai 20 ans.", "answer2": "g 20 ten"}

# paramètre criteria contenant la grille critériée
criteria = [{"id": 0, "description": "Age donné", "levels": [
                        {"id": 0, "description": "Inférieur à 20 ans", "points": 0}, 
                        {"id": 1, "description": "20 ans", "points": 1},
                        {"id": 2, "description": "Supérieur à 20 ans", "points": 2}
                        ]
                },
            {"id": 1, "description": "Orthographe", "levels": [
                        {"id": 0, "description": "Plusieurs fautes", "points": 0}, 
                        {"id": 1, "description": "1 faute", "points": 1},
                        {"id": 2, "description": "Aucune faute", "points": 2}
                        ]
                },
            {"id": 2, "description": "Syntaxe", "levels": [
                        {"id": 0, "description": "La phrase ne possède ni une majuscule, ni un point.", "points": 0}, 
                        {"id": 1, "description": "La phrase possède soit une majuscule, soit un point.", "points": 1},
                        {"id": 2, "description": "La phrase possède une majuscule et un point.", "points": 2}
                        ]
                }
            ]
==


title = Comparaison de deux copies


text  ==
==


form==
<p>Pour chaque critère, choisissez la meilleure copie.</p>  
<br/>
<div style="text-align:center;">
    <p>Enoncé de la question :</p>
    <p style="color: rgb(50, 100, 250);">{{data.question}}<p>
</div>
<br/>
<div style="float:left; width:50%; text-align:center;">
    <p>Réponse de l'élève <b>A</b> :</p>
    <p style="color: rgb(50, 100, 250);">{{data.answer1}}<p>
</div>
<div style="float:left; width:50%; text-align:center;">
    <p>Réponse de l'élève <b>B</b> :</p>
    <p style="color: rgb(50, 100, 250);">{{data.answer2}}<p>
</div>
<br/><br/>

<div style="clear:both; text-align:center;">
    {% for value in criteria %}
        <span style="padding-left:30px;">
                <b>{{value.description}}</b>
        </span>
        <br/>
        <input type="radio" id="form_{{value.id}}" name="f_evaluation{{value.id}}" value="A">
        <label for="A">A</label><br/>
        <input type="radio" id="form_{{value.id}}" name="f_evaluation{{value.id}}" value="B">
        <label for="B">B</label><br/>
        <br/>
    {% endfor %}

    <span style="padding-left:30px;">
        <b>Selon vous, quelle est la meilleure copie ?</b>
    </span>
    <br/>
    <input type="radio" id="form_best_copy" name="f_evaluation_best_copy" value="A">
    <label for="A">A</label><br/>
    <input type="radio" id="form_best_copy" name="f_evaluation_best_copy" value="B">
    <label for="B">B</label><br/>
</div>

<br/>
<p>Explication et commentaire général :</p>
<textarea id="form_commentaire" name="Commentaire" cols=100% rows="5">
</textarea>
==



evaluator==#|python|
# response est un dict : ex : {"1": 'tres_bien', 'commentaire': 't'}
try:
    feedback = "Réponses : "
    for value in criteria:
        feedback += response[value[id]] + ", "
    feedback += response['best_copy'] + ", " + response['commentaire'] + "."
    note = 100
except:
    feedback = "Répondez à toutes les questions"
    note = 0
grade = (note, feedback)
==







