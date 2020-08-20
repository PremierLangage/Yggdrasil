
@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]

title = Radio group
text  = 

form  == #|html|
{% for rg in radio %} 
    <br/>
    <span style="padding-left:30px;font-size:18px;">
            <b>{{rg.description}}</b>
    </span>
    <br/>
    {{ rg|component }}
    <br/>
{% endfor %}
==


before == #|python|
criteria = {
    "0": { 
        "description": "Age donné",
        "levels": [
            {"description": "Inférieur à 20 ans", "points": 0}, 
            {"description": "20 ans", "points": 1},
            {"description": "Supérieur à 20 ans", "points": 2}
        ]
    },
    "1": {
        "description": "Orthographe",
        "levels": [
            {"description": "Plusieurs fautes", "points": 0}, 
            {"description": "1 faute", "points": 1},
            {"description": "Aucune faute", "points": 2}
        ]
    },
    "2": {
        "description": "Syntaxe",
        "levels": [
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

radio = []
for Id in criteria.keys() :
    # tmp = {"cid": Id, "selector": "c-radio-group"}

    # La classe RadioGroup est auto importée au début du builder donc
    # pas besoin de faire un from components import RadioGroup 
    tmp = RadioGroup(cid=Id)

    # tmp["description"] = criteria[Id]["description"]
    # tmp["items"] = []

    # tmp est l'instance d'une classe donc la notation dictionnaire [""] ne fonctionne pas
    tmp.description = criteria[Id]["description"]
    tmp.items = []
    for i, lvl in enumerate(criteria[Id]["levels"]) :
        # tmp["items"].append({"id": str(i), "content": lvl["description"]})
        tmp.items.append({"id": str(i), "content": lvl["description"]})
    # dans la version des components qui est sur la v0.7.4 les composants
    # dans les listes ne sont pas synchronisés il faut donc les ajoutés dans globals
    # c'est expliqué dans la section "create a component inside a builder" du lien suivant
    # https://pl.u-pem.fr/components/advanced-usage
    globals()[Id] = tmp
    # CETTE LIGNE EST UN HACK POUR CONTOURNER LE FAIT QUE LES CLASSES NE SONT PAS SERIALISES PAR LA SANDBOX
    radio.append(vars(tmp))
==


evaluator == #|python|

# ATTENTION ICI IL FAUT RECUPERER LES COMPOSANTS DANS GLOBALS ET NON DANS LA LISTE radio
# radio[0] <=> globals()[radio[0]["id"]]


#feedback = ""
#for d in radio.items : 
#    if d["id"] == radio.selection :
#        feedback = d["content"]
#        break
#grade = (100, feedback)


#----------------------------------------------------


#for d in response:
#    print(d)
#    print(response[d])
#grade = (100,"")


#----------------------------------------------------


from math import ceil

error = 0
note_student = 0

# vérifie que le correcteur a répondu à toutes les réponses radio
# en même temps on calcule les points de la copie évaluée en fonction des réponses cliquées
feedback = "Réponses : "
for num in criteria.keys():
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
        for niv in criteria[num]['levels']:
            if response[num]['items'][i]['content'] == niv['description']:
                note_student += niv['points']
                break

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






