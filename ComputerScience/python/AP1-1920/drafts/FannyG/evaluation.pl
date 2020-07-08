
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
#horizontal % false


before==#|python|
# paramètre data contenant la question et la réponse de l'élève
data = {"question": "Quel âge avez-vous ?", "answer": "J'ai 20 ans."}
question = data['question']
answer = data['answer']

# paramètre criteria contenant la grille critériée
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

==


title = Evaluation question


text  ==  
Enoncé de la question :  
{{question}}  
<br/>
Réponse de l'élève :  
{{answer}}  
{{criteria[0]['description']}}
==


form==
{{answer}}  
<p>Question(s) à choix multiples (1 seule réponse sélectionnable)</p>
<input type="radio" id="form_q1" name="f_evaluation" value="copie_blanche">
<label for="copie_blanche">Copie blanche</label><br/>
<input type="radio" id="form_q1" name="f_evaluation" value="insuffisant">
<label for="insuffisant">Insuffisant</label><br/>
<input type="radio" id="form_q1" name="f_evaluation" value="passable">
<label for="passable">Passable</label><br/>
<input type="radio" id="form_q1" name="f_evaluation" value="bien">
<label for="bien">Bien</label><br/>
<input type="radio" id="form_q1" name="f_evaluation" value="tres_bien">
<label for="tres_bien">Très bien</label><br/>

<br/>
<p>Explication et commentaire général :</p>
<textarea id="form_pouet" name="Explication" cols=100% rows="5">
</textarea>
==



evaluator==#|python|
feedback = "J'ai bien lu votre formulaire " + response['q1'] + " " + response['pouet']
note = 100
grade = (note, feedback)
==

