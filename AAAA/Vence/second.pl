@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/builderlib.py
@ /utils/sandboxio.py

before ==

# Script Python de génération des données
import random as rd
#u1 = round(rd.uniform(-5, 5),2)
u1 = rd.randint(-5, 5)
u2 = rd.randint(-5, 5)
u3 = rd.randint(-5, 5)
#v1 = round(rd.uniform(-5, 5),2)
v1 = rd.randint(-5, 5)
v2 = rd.randint(-5, 5)
v3 = rd.randint(-5, 5)

==


title==
Addition de deux vecteurs
==

text ==
Donner les coordonnées de l'addition des deux vecteurs suivant :
$! \vec{u} = \left( [{{u1}},{{u2}},{{u3}}] \right) !$

$! \vec{v} = \left( [{{v1}},{{v2}},{{v3}}] \right) !$
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
{{entree3|component}}
==

evaluator ==
score = 100
grade=(score,"plop")
==