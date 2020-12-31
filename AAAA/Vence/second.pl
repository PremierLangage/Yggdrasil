@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/builderlib.py
@ /utils/sandboxio.py

before ==

# Script Python de génération des données
import random as rd
u1 = round(rd.uniform(-5, 5),2)
u2 = rd.randint(-5, 5)
u3 = rd.randint(-5, 5)
v1 = round(rd.uniform(-5, 5),2)
v2 = rd.randint(-5, 5)
v3 = rd.randint(-5, 5)

==


title="Addition de deux vecteurs"

text ==

Texte de l'énoncé

==

entree1 =: Input
entree1.type = "number"
entree2 =: Input
entree2.type = "number"
entree3 =: Input
entree3.type = "number"


form ==
Valeur en X : 
{{entree1|component}}
Valeur en Y :
{{entree2|component}}
Valeur en Z :
==

evaluator ==

# Script Python d'évaluation de la réponse

==