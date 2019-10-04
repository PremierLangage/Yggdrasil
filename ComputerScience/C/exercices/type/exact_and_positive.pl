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
match.nodes.append({"id": "pos", "content": "type entier positif", "target": True,})
expected.append({ "source": "uli", "target": "pos" })

match.nodes.append({"id": "d", "content": "double", "source": True,})
match.nodes.append({"id": "dou", "content": "type flottant double présision", "target": True,})
expected.append({ "source": "d", "target": "dou" })

match.nodes.append({"id": "f", "content": "float", "source": True,})
match.nodes.append({"id": "flo", "content": "type flottant simple présision", "target": True,})
expected.append({ "source": "f", "target": "flo" })

random.shuffle(match.nodes)
==

title==
Caractéristiques des types de bases C
==

text==
Reliez les types C à gauche avec les caractéristiques de type à droite. Attention, 
un même type peut avoir plusieurs caractéristiques.
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

