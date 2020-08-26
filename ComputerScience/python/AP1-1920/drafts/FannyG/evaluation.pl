

# /!\data et criteria à supprimer après les tests (dans la balise before)

# permet de faire évaluer une réponse (textuelle ou autre) d'un élève par qqun d'autre par le biais d'une grille critériée 
# -paramètres : 
#     -data : la réponse de l'élève
#     -criteria : les critère d'evaluation
# -balise :
#     -comment_by_criteria, type -> string, par défault False : option pour avoir un commentaire par critère
# -retourne : un dico avec la valeur pour chaque critère (et potentiel commentaire respectif), un commentaire et une note.

#author=Fanny Garnevault


@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]

title = Evaluation question
text  = 

# balise comment_by_criteria : option pour avoir un commentaire par critère
comment_by_criteria = True


before == #|python|
# paramètre data contenant la question et la réponse de l'élève
#data = {"question": "Quel âge avez-vous ?", "answer": "J'ai 20 ans."}

# paramètre criteria contenant la grille critériée
criteria =[
    {
        "id":0,
        "description":"Age donné",
        "levels":[
            {"id":0, "description":"Inférieur à 20 ans", "points":0},
            {"id":1, "description":"20 ans", "points":1},
            {"id":2, "description":"Supérieur à 20 ans", "points":2}
        ]
   },
   {
        "id":1,
        "description":"Orthographe",
        "levels":[
            {"id":0, "description":"Plusieurs fautes", "points":0},
            {"id":1, "description":"1 faute", "points":1},
            {"id":2, "description":"Aucune faute", "points":2}
        ]
   },
   {
        "id":2,
        "description":"Syntaxe",
        "levels":[
            {"id":0, "description":"La phrase ne possède ni une majuscule, ni un point.", "points":0},
            {"id":1, "description":"La phrase possède soit une majuscule, soit un point.", "points":1},
            {"id":2, "description":"La phrase possède une majuscule et un point.", "points":2}
      ] 
   }
]

note_max = 0
for crit in criteria:
    note_intermediaire = crit['levels'][0]['points']
    for niv in crit['levels']:
        if note_intermediaire < niv['points']:
            note_intermediaire = niv['points']
    note_max += note_intermediaire

radio = []
for value in criteria :
    tmp = RadioGroup(cid=str(value["id"]))
    tmp.description = value["description"]
    tmp.items = []
    for elem in value["levels"] :
        tmp.items.append({"id": str(elem["id"]), "content": elem["description"]})
    globals()[str(value["id"])] = tmp
    radio.append(vars(tmp))
==


form  == #|html|
<b style="color: red;">Remplissez tous les champs de l'évaluation</b>
<br/><br/>
Enoncé de la question :  
<p style="color: rgb(50, 100, 250);">{{data.question}}<p>
<br/>
Réponse de l'élève :  
<p style="color: rgb(50, 100, 250);">{{data.answer}}<p>
<br/>

{% for rg in radio %} 
    <br/>
    <span style="padding-left:30px;font-size:18px;">
            <b>{{rg.description}}</b>
    </span>
    <br/>
    {{ rg|component }}
    {% if comment_by_criteria != "False" %}
        <p>Justificatif :</p>
        <textarea id="form_commentaire_{{rg.cid}}" name="justificatif" cols=30% rows="2"></textarea>
    {% endif %}
    <br/><br/>
{% endfor %}

<br/>
<p>Explication et commentaire général :</p>
<textarea id="form_commentaire" name="Commentaire" cols=100% rows="5"></textarea>
==


evaluator == #|python|
from math import ceil

error = 0
note_student = 0

# vérifie que le correcteur a répondu à toutes les réponses radio
# en même temps on calcule les points de la copie évaluée en fonction des réponses cliquées
feedback = "Réponses : "
for crit in criteria:
    num = str(crit["id"])
    tmpId = response[num]['selection']
    if tmpId == '':
        error = 1
        break
    else:
        for i, e in enumerate(response[num]['items']):
            if e['id'] == tmpId:
                feedback += "<br/>" + e['content']
                break
        # calcul des points de la copie
        for niv in crit['levels']:
            if response[num]['items'][i]['content'] == niv['description']:
                note_student += niv['points']
                break

# vérifie que le correcteur a répondu à toutes les réponses textarea des radio
if comment_by_criteria != "False" and not error:
    for crit in criteria:
        num = str(crit["id"])
        if response["commentaire_"+num] == "":
            error = 1
            break
        else:
            feedback += "<br/>justificatif " +num+ " : " + response["commentaire_"+num]

# vérifie que le correcteur a répondu à la dernière textarea du commentaire général
if not error:
    if response["commentaire"] == "":
        error = 1
    else:
        feedback += "<br/>commentaire : " + response['commentaire']

# règle de trois pour le calcul de la note de la copie sur 100 (entre 0 et 100)
if note_student <= 0:
    response['note'] = 0
else:
    response['note'] = ceil((note_student*100)/note_max)

if error:
    grade = (0, "Répondez à toutes les questions")
else:
    feedback += "<br/>note = "+str(response['note'])
    grade = (100, feedback)
==



