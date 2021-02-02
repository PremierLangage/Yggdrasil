#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

author=Nicolas Borie

title=Patterns et recherches

# STEP 1
match =: MatchList

before==#|python|
import random
match.nodes = []
expected = []

match.nodes.append({"id": "spy", "content": "`*.py`", "source": True,})
match.nodes.append({"id": "tpy", "content": "Scripts Python", "target": True,})
expected.append({ "source": "spy", "target": "tpy" })

match.nodes.append({"id": "s3max", "content": "`? ?? ???`", "source": True,})
match.nodes.append({"id": "t3max", "content": "fichiers de nom d'au plus 3 lettres", "target": True,})
expected.append({ "source": "s3max", "target": "t3max" })

match.nodes.append({"id": "spref", "content": "`tree*`", "source": True,})
match.nodes.append({"id": "tpref", "content": "fichiers de nons préfixé par `tree`", "target": True,})
expected.append({ "source": "spref", "target": "tpref" })

random.shuffle(match.nodes)
==

text==#|markdown|
<u>Rappels:</u>

 * `*` méta-caractères se substituant à l'importe quel mot (y compris le mot vide).   
 * `?` méta-caractères se substituant à n'importe quel caractère.   

Joignez chaque pattern à gauche avec une description à droite des éléments recherchés.
==

form==#|markdown|
{{ match|component }}
==

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
    e['css'] = 'error-state animated fadeIn'
    if in_links(e, expected):
        e['css'] = 'success-state  animated rotateIn'

if error == 0:
    grade = (100, '<span class="success-state animated pulse infinite">Good answser</span>')
else:
    grade = (0, '<span class="error-state animated pulse infinite">Bad answer, you made %d mistakes</span>' % error)
==

