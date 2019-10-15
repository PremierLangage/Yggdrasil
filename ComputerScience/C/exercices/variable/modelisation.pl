@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title=Variables et modélisation


author=Nicolas Borie

text==
Tentez d'associer, pour chaque type de variable, ce qu'il pourrait modéliser 
dans la vie réelle de manière naturelle.
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

match.nodes.append({"id": "s1", "content": "un tableau de file", "source": True})
match.nodes.append({"id": "t1", "content": "un péage autoroutier avec plusieurs guichets", "target": True})
expected.append({ "source": "s1", "target": "t1" })

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


