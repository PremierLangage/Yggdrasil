
# déclarer une var data (ou decorator) (dictionnaire de données pour les tests = réponses élèves)


# permet de faire évaluer une réponse (textuelle ou autre) d'un élève par qqun d'autre par le biais d'une grille critériée 
# -paramètres : 
#     -la réponse de l'élève : balise data
#     -les critère d'evaluation: balise criteria
#     -option pour avoir un commentaire par critère : comment_by_criteria, type -> boolean, par défault false
# -retourne : un dico avec la valeur pour chaque critère et un commentaire.

# qrevuz : comment faire si un élève ne sélectionne pas tous les champs ?
# qrevuz : comment calculer les points ? est ce que ça se fait dans cet exo ou alors dans l'atelier, quand on récupère toutes les exos évalués ?

#qrevuz : comment_by_criteria est ce qu'on peut lui donner une valeur par défault

# author=Fanny Garnevault

@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]

general_feedback = " Merci pour votre réponse." 


before==#|python|
import json
#data = json.loads(data)
#criteria = json.loads(criteria)

# paramètre comment_by_criteria : option pour avoir un commentaire par critère
comment_by_criteria = True

# paramètre data contenant la question et la réponse de l'élève
data = {"question": "Quel âge avez-vous ?", "answer": "J'ai 20 ans."}

# paramètre criteria contenant la grille critériée
criteria = {"0": {"description": "Age donné", "levels": [
                        {"description": "Inférieur à 20 ans", "points": 0}, 
                        {"description": "20 ans", "points": 1},
                        {"description": "Supérieur à 20 ans", "points": 2}
                        ]
                },
            "1": {"description": "Orthographe", "levels": [
                        {"description": "Plusieurs fautes", "points": 0}, 
                        {"description": "1 faute", "points": 1},
                        {"description": "Aucune faute", "points": 2}
                        ]
                },
            "2": {"description": "Syntaxe", "levels": [
                        {"description": "La phrase ne possède ni une majuscule, ni un point.", "points": 0}, 
                        {"description": "La phrase possède soit une majuscule, soit un point.", "points": 1},
                        {"description": "La phrase possède une majuscule et un point.", "points": 2}
                        ]
                }
            }
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
    {% if comment_by_criteria %}
        <p>Justificatif :</p>
        <textarea id="form_commentaire_{{id}}" name="justificatif" cols=30% rows="2"></textarea>
    {% endif %}
    <br/><br/>
{% endfor %}

<br/>
<p>Explication et commentaire général :</p>
<textarea id="form_commentaire" name="Commentaire" cols=100% rows="5"></textarea>
==



evaluator==#|python|
# response est un dict : ex : {1: 'tres_bien', 'commentaire': 't'}
try:
    feedback = "Réponses : "
    for num in criteria.keys():
        feedback += response[num] + ", "
        if comment_by_criteria:
            feedback += response["commentaire_"+num] + ", "
    feedback += response['commentaire'] + "."
    note = 100
except:
    for num in criteria.keys():
        if comment_by_criteria and response["commentaire_"+num] != "":
            feedback += response["commentaire_"+num] + ", "
    if comment_by_criteria and response["commentaire_"+num] != "":
        feedback += response['commentaire'] + "."
    feedback = "Répondez à toutes les questions"
    note = 0
grade = (note, feedback)
==




