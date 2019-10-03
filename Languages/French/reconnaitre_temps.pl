@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py


title==
Reconnaître les temps de conjugaison
==

text==
Associez chaque forme conjugée du verbe **voir** avec son temps de conjugaison.
==

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

match.nodes.append({"id": "v1", "content": "vous voyez", "source": True,})
match.nodes.append({"id": "t1", "content": "présent de l'indicatif", "target": True,})
expected.append({ "source": "v1", "target": "t1" })

match.nodes.append({"id": "v2", "content": "vous vîtes", "source": True,})
match.nodes.append({"id": "t2", "content": "passé simple de l'indicatif", "target": True,})
expected.append({ "source": "v2", "target": "t2" })

match.nodes.append({"id": "v3", "content": "vous auriez vu", "source": True,})
match.nodes.append({"id": "t3", "content": "passé du conditionnel", "target": True,})
expected.append({ "source": "v3", "target": "t3" })

match.nodes.append({"id": "v4", "content": "vous verrez", "source": True,})
match.nodes.append({"id": "t4", "content": "futur simple de l'indicatif", "target": True,})
expected.append({ "source": "v4", "target": "t4" })


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
    grade = (100, '<span class="success-state">Bravo, vous avez bien identifié tous les temps !</span>')
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
