# author = Anthony Labarre
#
# Génération de noms de variables aléatoires. L'étudiant doit cocher les noms
# de variables qui sont valides.
#
# Il existe un PL ressemblant à ceci mais statique:
#
# Yggdrasil/ComputerScience/python/AP1-1920/chapters/1-bases-imperatif/Nommage_variable.pl
#
# Je ne le réutilise pas car je n'arrive pas à initialiser good et bad de manière
# dynamique.
# 
# PROBLEMES / TODO:
# - trouver des noms de variables plus naturels (pour l'instant, on génère des 
#   mots aléatoires)
# 
# Ressources utiles: 
# - la doc de checkbox: https://pl.u-pem.fr/components/checkbox-group
#
# Imports ---------------------------------------------------------------------
@ /utils/sandboxio.py
@ ressources_exercices.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

before== #|python|
from keyword import kwlist  # 35 mots-clés
from random import randint, sample, shuffle
from ressources_exercices import chaine_nombres_aleatoire, mot_aleatoire

# initialisation des "bases de données" de noms corrects et incorrects
corrects = {  # mots aléatoires
    mot_aleatoire(randint(4, 10)) for _ in range(15)
} | {  # mots aléatoires avec des chiffres à la fin
    mot_aleatoire(randint(4, 10)) + chaine_nombres_aleatoire(randint(1, 5))
    for _ in range(15)
} | {  # mots aléatoires séparés par des "_"
    mot_aleatoire(randint(4, 10)) +  "_" + mot_aleatoire(randint(4, 10)) 
    for _ in range(15)
}
incorrects = set(
    kwlist  # les mots-clés de Python
) | {  # mots aléatoires avec des chiffres au début
    chaine_nombres_aleatoire(randint(1, 5)) + mot_aleatoire(randint(4, 10))
    for _ in range(15)
}

# construction de l'énoncé: on pioche un nombre aléatoire de noms corrects et
# incorrects, dont le total est le nombre de questions
nb_questions = 10
nb_corrects = randint(2, nb_questions - 2)
enonce = sample(corrects, nb_corrects) + sample(incorrects, nb_questions - nb_corrects)
shuffle(enonce)

# stockage des résultats
res = [nom in corrects for nom in enonce]

# préparation du formatage de l'énoncé
# associer une checkbox à chaque variable
group.items = []
for i in range(nb_questions):
    group.items.append({
        "id": str(i),
        "content": enonce[i]
    })
==

evaluator== #|python|

# calcul de la note = somme du nombre de checkbox cochées dont la valeur est 
# correcte
# une bordure verte indique un résultat correct: (nom correct ET coché) OU
# (nom incorrect ET non coché)
note = 0
faux = list()
for item in group.items:
    checked = item['checked']
    content = item['content']
    if (checked and content in corrects) or (not checked and content in incorrects):
        note += 1
        item['css'] = 'success-border animated pulse'
    else:
        item['css'] = 'error-border'
        faux.append(str(int(item['id']) + 1 ))

# affichage du feedback
feedback = '<p style="color:green">Bravo!<p>' 
if note != nb_questions:
    if len(faux) > 1:
        feedback = '<p style="color:red">Les réponses ' + ", ".join(faux) + " sont fausses.</p>"
    else:
        feedback = '<p style="color:red">La réponse ' + ", ".join(faux) + " est fausse.</p>"
grade = (note, feedback)
==

title = Nommage de variables

text==
Cochez les noms de variables corrects ci-dessous:
==

form==
{{ group|component }}
==


