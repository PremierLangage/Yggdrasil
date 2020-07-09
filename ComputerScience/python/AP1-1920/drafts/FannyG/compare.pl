
# (2 copies) 1 critere -> copie A ou B la meilleure


# permet d'évaluer deux réponses (textuelle ou autre) de deux élèves par qqun d'autre par le biais d'une grille critériée 
# -paramètres : 
#     -les réponses des deux élèves : balise data
#     -les critère d'evaluation: balise criteria
# -retourne : le gagnant (0 ou 1) et la valeur pour chaque critère et un commentaire (ou un commentaire par critère ?)

# qrevuz : balise criteria : est ce qu'on affiche les niveaux ? (est ce qu'il y a des niveaux ?) ou pour une description de critere, on met juste un choix entre A et B

# author=Fanny Garnevault

@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]

general_feedback = " Merci pour votre réponse." 


before==#|python|
# paramètre data contenant la question et la réponse de l'élève
data = {"question": "Quel âge avez-vous ?", "answer1": "J'ai 20 ans.", "answer2": "g 20 ten (Adam)"}

# paramètre criteria contenant la grille critériée
criteria = dict()
criteria = {0: {"description": "Age donné", "levels": [
                        {"description": "Inférieur à 20 ans", "points": 0}, 
                        {"description": "20 ans", "points": 1},
                        {"description": "Supérieur à 20 ans", "points": 2}
                        ]
                },
            1: {"description": "Orthographe", "levels": [
                        {"description": "Plusieurs fautes", "points": 0}, 
                        {"description": "1 faute", "points": 1},
                        {"description": "Aucune faute", "points": 2}
                        ]
                },
            2: {"description": "Syntaxe", "levels": [
                        {"description": "La phrase ne possède ni une majuscule, ni un point.", "points": 0}, 
                        {"description": "La phrase possède soit une majuscule, soit un point.", "points": 1},
                        {"description": "La phrase possède une majuscule et un point.", "points": 2}
                        ]
                }
            }
test = {0: "0", 1: "1", 2: "2"}
#criteria = [[1,2],[3,4]]
==


title = Evaluation question


text  ==
Enoncé de la question :  
<p style="color: rgb(50, 100, 250);">{{data.question}}<p>
<br/>
Réponse de l'élève :  
<p style="color: rgb(50, 100, 250);">{{data.answer}}<p>
==


form==
{% for id in criteria.keys() %}
    <span style="padding-left:30px;">
            <b>{{criteria[id].description}}</b>
    </span>
    <br/>
    {% for niv in criteria[id].levels %}
        <input type="radio" id="form_{{id}}" name="f_evaluation{{id}}" value="{{niv.description}}">
        <label for="{{niv.description}}">{{niv.description}}</label><br/>
    {% endfor %}
    <br/>
{% endfor %}

<br/>
<p>Explication et commentaire général :</p>
<textarea id="form_commentaire" name="Commentaire" cols=100% rows="5">
</textarea>
==



evaluator==#|python|
# response est un dict : ex : {1: 'tres_bien', 'commentaire': 't'}
# le dict de retour reste response, les critères ayant des id, 
# feedback = "J'ai bien lu votre formulaire :<br/>-" + response['0'] + "<br/>-" + response['1'] + "<br/>-" + response['2'] + "<br/>-" + response['commentaire']
note = 100
# general_feedback
grade = (note, general_feedback)
==

