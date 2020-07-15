# permet de faire évaluer une réponse (textuelle ou autre) d'un élève par qqun d'autre par le biais d'une grille critériée 
# -paramètres : 
#     -la réponse de l'élève : balise data
#     -les critère d'evaluation: balise criteria
#     -option pour avoir un commentaire par critère : comment_by_criteria, type -> boolean, par défault false
# -retourne : un dico avec la valeur pour chaque critère et un commentaire.

# qrevuz : json sous quelle forme (dict ou str ?)

# author=Fanny Garnevault

@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]


# balise comment_by_criteria : option pour avoir un commentaire par critère
comment_by_criteria==#|python|
False
==

before==#|python|
#import json
#data = json.loads(data)
#criteria = json.loads(criteria)

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

note_max = 0
for crit in criteria.values():
    note_intermediaire = crit['levels'][0]['points']
    for niv in crit['levels']:
        if note_intermediaire < niv['points']:
            note_intermediaire = niv['points']
    note_max += note_intermediaire

cbc = comment_by_criteria
tcbc = type(comment_by_criteria)
==


title = Evaluation question


text  ==
{{cbc}}
{{tcbc}}
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

from math import ceil

error = 0
note_student = 0

# vérifie que le correcteur a répondu à toutes les réponses radio
# en même temps on calcule les points de la copie évaluée en fonction des réponses cliquées
try:
    feedback = "Réponses : "
    for num in criteria.keys():
        feedback += response[num] + ", "
        # calcul des points de la copie
        for niv in criteria[num]['levels']:
            if response[num] == niv['description']:
                note_student += niv['points']
                break
except:
    error = 1

# vérifie que le correcteur a répondu à toutes les réponses textarea des radio
if comment_by_criteria and not error:
    for num in criteria.keys():
        if response["commentaire_"+num] == "":
            error = 1
            break
        else:
            feedback += response["commentaire_"+num] + ", "

# vérifie que le correcteur a répondu à la dernière textarea du commentaire général
if not error:
    if response["commentaire"] == "":
        error = 1
    else:
        feedback += response['commentaire'] + "."

# règle de trois pour le calcul de la note de la copie sur 100 (entre 0 et 100)
if note_student <= 0:
    response['note'] = 0
else:
    response['note'] = ceil((note_student*100)/note_max)

if error:
    grade = (0, "Répondez à toutes les questions")
else:
    grade = (100, feedback+" note = "+str(response['note']))
==




