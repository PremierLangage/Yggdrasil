# /!\data et criteria à supprimer après les tests (dans la balise before)

# permet de faire évaluer une réponse (textuelle ou autre) d'un élève par qqun d'autre par le biais d'une grille critériée 
# -paramètres : 
#     -data : la réponse de l'élève
#     -criteria : les critère d'evaluation
# -balise :
#     -comment_by_criteria, type -> string, par défault False : option pour avoir un commentaire par critère
# -retourne : un dico avec la valeur pour chaque critère (et potentiel commentaire respectif), un commentaire et une note.

#author=Fanny Garnevault

#import pour intéractions avec bdd
@database_utils.py

@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]

title = Evaluation question
text  = 

# balise comment_by_criteria : option pour avoir un commentaire par critère
comment_by_criteria = True

codeAnswer =: CodeEditor
codeAnswer.theme = light

before == #|python|

#Obtention d'un réponse aléatoire qui n'est pas la mienne et que je n'ai jamais corrigé
from database_utils import get_session, Base, Response, Evaluation
from sqlalchemy.sql import func

with get_session(table_class= Response, base=Base) as session:
    if not session.query(Response).filter(Response.student_id == 0).all() : 
        session.add(Response(student_id = 0, value = "Salut ! Comment ça va?"))
        session.commit()
    last_user_response = session.query(Response.student_id, Response.value).join(Evaluation, Response.id == Evaluation.response_id,isouter=True).where(Response.student_id != user__id and (Evaluation.student_id != user__id or Evaluation.student_id is None)).order_by(func.random())

codeAnswer.code = str(last_user_response)

# paramètre data contenant la question et la réponse de l'élève
data = {"question": "Quel âge avez-vous ?", "answer": last_user_response.value}

# paramètre criteria contenant la grille critériée
criteria =[
    {
        "id":0,
        "description":"Lisibilité du code",
        "levels":[
            {"id":0, "description":"Le code est illisible.", "points":0},
            {"id":1, "description":"Le code est assez lisible.", "points":1},
            {"id":2, "description":"Le code est très lisible.", "points":2}
        ]
   },
   {
        "id":1,
        "description":"Nommage des variables",
        "levels":[
            {"id":0, "description":"Aucun effort de nommage.", "points":0},
            {"id":1, "description":"Les noms de variable sont corrects mais peut mieux faire.", "points":1},
            {"id":2, "description":"Le nom de chaque est précisement choisi.", "points":2}
        ]
   },
   {
        "id":2,
        "description":"Présence de commentaires",
        "levels":[
            {"id":0, "description":"Le code n'est pas du tout commenté.", "points":0},
            {"id":1, "description":"Le code possède quelques commentaires mais est partiellement flou.", "points":1},
            {"id":2, "description":"Le code est très bien commenté, facilement compréhensible.", "points":2}
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
J'ai l'id : {{user__id}}
<br/><br/>
Enoncé de la question :  
<p style="color: rgb(50, 100, 250);">{{data.question}}<p>
<br/>
Réponse de l'élève :  {{last_user_response.student_id}}
{{ codeAnswer|component }}
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

