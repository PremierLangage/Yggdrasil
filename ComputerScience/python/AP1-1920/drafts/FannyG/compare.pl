
# permet d'évaluer deux réponses (textuelle ou autre) de deux élèves par qqun d'autre par le biais d'une grille critériée 
# -paramètres : 
#     -les réponses des deux élèves : balise data
#     -les critère d'evaluation: balise criteria
# -retourne : le gagnant (0 ou 1) et la valeur pour chaque critère et un commentaire (ou un commentaire par critère ?)


# author=Fanny Garnevault

@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]


title = Comparaison de deux copies

text = 



before==#|python|
# paramètre data contenant la question et la réponse de l'élève
data = {"question": "Quel âge avez-vous ?", "answer1": "J'ai 20 ans.", "answer2": "g 20 ten"}

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

radio = []
for value in criteria :
    tmp = RadioGroup(cid=str(value["id"]))
    tmp.description = value["description"]
    tmp.items = [
                    {"id": "0", "content": "A"},
                    {"id": "1", "content": "B"}
                ]
    globals()[str(value["id"])] = tmp
    radio.append(vars(tmp))
tmp = RadioGroup(cid="best_copy")
tmp.description = "Selon vous, quelle est la meilleure copie ?"
tmp.items = [
                {"id": "0", "content": "A"},
                {"id": "1", "content": "B"}
            ]
globals()["best_copy"] = tmp
radio.append(vars(tmp))
==


form ==#|html|
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
    {% for rg in radio %} 
        <br/>
        <span style="padding-left:30px;font-size:18px;">
                <b>{{rg.description}}</b>
        </span>
        <br/>
        {{ rg|component }}
        <br/>
    {% endfor %}
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
        feedback += response[str(value['id'])] + ", "
    feedback += response['best_copy'] + ", " + response['commentaire'] + "."
    note = 100
except:
    feedback = "Répondez à toutes les questions"
    note = 0
grade = (note, feedback)

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
if error:
    grade = (0, "Répondez à toutes les questions")
else:
    feedback += "<br/>note = "+str(response['note'])
    grade = (100, feedback)
==










