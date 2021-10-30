#*****************************************************************************
#  Copyright (C) 2019 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title==
Stratégie d'allocation
==

author=Nicolas Borie

text==
Tentez d'associer, pour chaque type de donnéee C, comment ces dernières doivent être allouées.
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

match.nodes.append({"id": "s1", "content": "Une chaine (char[64]) de moins de 63 caractères", "source": True})
match.nodes.append({"id": "t1", "content": "aucun malloc", "target": True})
expected.append({ "source": "s1", "target": "t1" })

match.nodes.append({"id": "s2", "content": "Une cellule de liste chaînée de floatant", "source": True})
match.nodes.append({"id": "t2", "content": "un malloc", "target": True})
expected.append({ "source": "s2", "target": "t2" })

match.nodes.append({"id": "s3", "content": "trois champs nom(char\*), prénom(char\*) et age(int)", "source": True})
match.nodes.append({"id": "t3", "content": "deux mallocs", "target": True})
expected.append({ "source": "s3", "target": "t3" })

match.nodes.append({"id": "s4", "content": "Un noeud d'arbre de personnes (char\* nom et char\* prénom)", "source": True})
match.nodes.append({"id": "t4", "content": "trois mallocs", "target": True})
expected.append({ "source": "s4", "target": "t4" })

random.shuffle(match.nodes)
==

# STEP 3
form==
{{ match|component }}
==

# STEP 4
evaluator== #|python|
form+="""

<style>
.error-state{
   padding: 10px;
}
.success-state{
   padding: 10px;
}
</style>
"""

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
    feedback = '<span class="success-state">Bravo, ça devrait en effet bien fonctionner ainsi!</span>'
    grade = (100, feedback)
else:
    feedback = '<span class="error-state">Tout n\'est pas correct, il y a %d mauvaises associations.</span>' % error
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



