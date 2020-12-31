@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/builderlib.py
@ /utils/sandboxio.py

before ==

# Script Python de génération des données

==


title = "Premier exercice"

text ==

Texte de l'énoncé

==

entree1 =: Input
entree1.type = "number"
entree2 =: Input
entree2.type = "number"


form ==
Valeur en X : <br/>
{{entree1|component}}
{{entree2|component}}
==

evaluator ==

# Script Python d'évaluation de la réponse

==