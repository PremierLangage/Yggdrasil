
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
    "r0": { 
        "description": "Age donné",
        "levels": [
            {"description": "Inférieur à 20 ans", "points": 0}, 
            {"description": "20 ans", "points": 1},
            {"description": "Supérieur à 20 ans", "points": 2}
        ]
    },
    "r1": {
        "description": "Orthographe",
        "levels": [
            {"description": "Plusieurs fautes", "points": 0}, 
            {"description": "1 faute", "points": 1},
            {"description": "Aucune faute", "points": 2}
        ]
    },
    "r2": {
        "description": "Syntaxe",
        "levels": [
            {"description": "La phrase ne possède ni une majuscule, ni un point.", "points": 0}, 
            {"description": "La phrase possède soit une majuscule, soit un point.", "points": 1},
            {"description": "La phrase possède une majuscule et un point.", "points": 2}
        ]
    }
}

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
grade = (100,response)
==






