
# déclarer une var data (ou decorator) (dictionnaire de données pour les tests = réponses élèves)


# permet de faire évaluer une réponse (textuelle ou autre) d'un élève par qqun d'autre par le biais d'une grille critériée 
# -paramètres : 
#     -la réponse de l'élève : balise data
#     -les critère d'evaluation: balise criteria
# -retourne : un dico avec la valeur pour chaque critère et un commentaire.


# author=Fanny Garnevault

@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]

#general_feedback = " Merci pour votre réponse." 


before==#|python|
# paramètre data contenant la question et la réponse de l'élève
data = {"question": "Quel âge avez-vous ?", "answer": "J'ai 20 ans."}

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
{{data.question}}  
<br/>
Réponse de l'élève :  
{{data.answer}}  
==


form==
{% for id in criteria.keys() %}
    <span style="padding-left:30px;">
            {{criteria[id].description}}
    </span>
    <br/>
    {% for niv in criteria[id].levels %}
        <input type="radio" id="form_id{{id}}" name="f_evaluation{{id}}" value="{{niv.description}}">
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
feedback = "J'ai bien lu votre formulaire :<br/>*" + response['id0'] + "<br/>*" + response['id1'] + "<br/>*" + response['id2'] + "<br/>*" + response['commentaire']
note = 100
grade = (note, feedback)
==


