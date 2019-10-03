@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

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


random.shuffle(match.nodes)
==

title==
Quel prototype pour quelle fonctionnalité ?
==

text==
Tentez d'associer, pour chaque prototype abstrait de fonction C à gauche, une des fonctionnalité 
décrite sur la droite.
<br />
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
    grade = (100, 'Bravo, ça devrait en effet bien fonctionner ainsi!')
else:
    grade = (0, 'Tout n\'est pas correct, il y a %d mauvaises associations.' % error)
==

