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

title=Structure et modélisation

author=Nicolas Borie

tag=C|modélisation|type|structure|énumération|union

text==

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

match.nodes.append({"id": "s1", "content": "Fiche pour un livre dans une bibliothèque <br>(titre, auteur, année, éditeur, etc...) ", "source": True})

match.nodes.append({"id": "s2", "content": "Les différents états d'une tache de développement <br>(new, assigned, work in progress, need review, merged, closed) ", "source": True})

match.nodes.append({"id": "s3", "content": "Les verbes de la langue française <br>(verbes en ER, verbes en IR (issant) et troisième groupe) ", "source": True})


match.nodes.append({"id": "t1", "content": " type **struct**", "target": True})
match.nodes.append({"id": "t2", "content": " type **enum**", "target": True})
match.nodes.append({"id": "t3", "content": " type **union**", "target": True})

expected.append({ "source": "s1", "target": "t1" })
expected.append({ "source": "s2", "target": "t2" })
expected.append({ "source": "s3", "target": "t3" })

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



