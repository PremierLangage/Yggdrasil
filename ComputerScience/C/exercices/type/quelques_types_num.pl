#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

# STEP 1
match =: MatchList

# remove the comment of the next line to display the properties of the component
# in realtime inside the form.

# match.debug % true

# STEP 2
before==
import random
match.nodes = []
expected = []

match.nodes.append({"id": "i", "content": "int", "source": True,})
match.nodes.append({"id": "int", "content": "type entier signé", "target": True,})
expected.append({ "source": "i", "target": "int" })

match.nodes.append({"id": "uli", "content": "unsigned long int", "source": True,})
match.nodes.append({"id": "posl", "content": "type entier positif de grande taille", "target": True,})
expected.append({ "source": "uli", "target": "posl" })

match.nodes.append({"id": "d", "content": "double", "source": True,})
match.nodes.append({"id": "dou", "content": "type flottant double présision", "target": True,})
expected.append({ "source": "d", "target": "dou" })

match.nodes.append({"id": "f", "content": "float", "source": True,})
match.nodes.append({"id": "flo", "content": "type flottant simple présision", "target": True,})
expected.append({ "source": "f", "target": "flo" })

match.nodes.append({"id": "ui", "content": "unsigned int", "source": True,})
match.nodes.append({"id": "pos", "content": "type entier positif", "target": True,})
expected.append({ "source": "ui", "target": "pos" })

match.nodes.append({"id": "s", "content": "short", "source": True,})
match.nodes.append({"id": "p", "content": "type entier signé de petite taille", "target": True,})
expected.append({ "source": "s", "target": "p" })


random.shuffle(match.nodes)
==

title==
Quelques types de bases C
==

text==
Reliez les types C à gauche avec les caractéristiques de type à droite.
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
    grade = (100, '<span class="success-state">Bravo les types C sont bien reliés.</span>')
else:
    grade = (0, '<span class="error-state">Il y a %d erreurs.</span>' % error)
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



