@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title==
Quel prototype pour quelle fonctionnalité ?
==

author==
Nicolas Borie
==

text==
Tentez d'associer, pour chaque prototype abstrait de fonction C à gauche, une des fonctionnalité 
décrite sur la droite.

==

# STEP 1
match =: MatchList

# remove the comment of the next line to display the properties of the component
# in realtime inside the form.

# match.debug % true

# STEP 2
before== #|python|
import random
match.nodes = []
expected = []

# le carré d'un nombre entier
match.nodes.append({"id": "s1", "content": "int foo(int a);", "source": True})
match.nodes.append({"id": "t1", "content": "Calculer le carré d'un entier.", "target": True})
expected.append({ "source": "s1", "target": "t1" })

# la moyenne d'une liste de notes
match.nodes.append({"id": "s2", "content": "float foo(int* tab, int size);", "source": True})
match.nodes.append({"id": "t2", "content": "Calculer une moyenne d'un tableau de notes.", "target": True})
expected.append({ "source": "s2", "target": "t2" })

# afficher la date du jour
match.nodes.append({"id": "s3", "content": "void foo(void);", "source": True})
match.nodes.append({"id": "t3", "content": "Afficher la date du jour.", "target": True})
expected.append({ "source": "s3", "target": "t3" })

# calculer la somme de deux floattant
match.nodes.append({"id": "s4", "content": "float foo(float a, float b);", "source": True})
match.nodes.append({"id": "t4", "content": "Calculer la somme de deux floattants.", "target": True})
expected.append({ "source": "s4", "target": "t4" })

# Afficher un double en notation scientifique
match.nodes.append({"id": "s5", "content": "void foo(double a);", "source": True})
match.nodes.append({"id": "t5", "content": "Afficher un double en notation scientifique.", "target": True})
expected.append({ "source": "s5", "target": "t5" })

# Récupérer un entier donné au clavier par l'utilisateur
match.nodes.append({"id": "s6", "content": "int foo(void);", "source": True})
match.nodes.append({"id": "t6", "content": "Récupérer un entier donné au clavier par l'utilisateur.", "target": True})
expected.append({ "source": "s6", "target": "t6" })

random.shuffle(match.nodes)
==

# STEP 3
form==
{{ match|component }}
==

# STEP 4
evaluator== #|python|

def in_links(conn, links):
    for e in links:
        if e['source'] == conn["source"] and  e['target'] == conn["target"]:
            return True
    return False

error = 0
for e in expected:
    if not in_links(e, match.links):
        error = error + 1

for e in match.links:
    e['css'] = 'error-state anim-fade'
    if in_links(e, expected):
        e['css'] = 'success-state  anim-flip'

if error == 0:
    feedback = 'Bravo, ça devrait en effet bien fonctionner ainsi!'
    grade = (100, feedback)
else:
    feedback = 'Tout n\'est pas correct, il y a %d mauvaises associations.' % error
    grade = (0, feedback)
==



extracss==
<style>
.exercise__instructions, .exercise__feedback {
    margin-bottom: 16px;
}

.match-list-component svg path {
    stroke-width: 4px;
}
</style>

==
