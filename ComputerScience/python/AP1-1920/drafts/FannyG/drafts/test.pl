
@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]

title = Radio group
text  = Quelle est la capitale ?
form  == #|python|
{% for rg in radio %} 
    {{ rg|component }}
    <br/>
==


before == #|python|
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
radio = []
for Id in criteria.keys() :
    tmp =: RadioGroup
    for lvl in criteria[Id].levels :
        tmp.items.append({"id":Id, "content": lvl.["description"]})
    radio.append(tmp)
radio[0].items = [{"id": 1, "content": "ok"},{"id": 2, "content": "ol"},{"id": 3, "content": "om"}]
radio[1].items = [{"id": 1, "content": "ek"},{"id": 2, "content": "el"},{"id": 3, "content": "em"}]
==



evaluator == #|python|
feedback = ""
for d in radio.items : 
    if d["id"] == radio.selection :
        feedback = d["content"]
        break
grade = (100, feedback)
==




