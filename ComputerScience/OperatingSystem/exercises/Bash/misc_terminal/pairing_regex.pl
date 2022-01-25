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

pairs==
`^[a-z]*$`§lignes composées que de lettres minuscules
`[1-9][0-9][0-9]`§lignes contenants un nombre compris entre 100 à 999
`[A-H][1-8]`§lignes contenant l'index d'une case d'échiquier
`^[aeiouy]*$`§lignes composées que de voyelles
`^[^0-9]*$`§lignes sans aucun chiffre
==



@ /utils/sandboxio.py
@ /ComputerScience/OperatingSystem/templates/utils_bash.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

author=Nicolas Borie

title=Recherches à l'intérieur des fichiers

tag=grep|regex|expression régulière|terminal|unix

# STEP 1
match =: MatchList

before==#|python|
import random
match.nodes = []
expected = []

match.nodes.append({"id": "sminus", "content": "`^[a-z]*$`", "source": True,})
match.nodes.append({"id": "tminus", "content": "lignes composées que de lettres minuscules", "target": True,})
expected.append({ "source": "sminus", "target": "tminus" })

match.nodes.append({"id": "snumber", "content": "`[1-9][0-9][0-9]`", "source": True,})
match.nodes.append({"id": "tnumber", "content": "lignes contenants un nombre compris entre 100 à 999", "target": True,})
expected.append({ "source": "snumber", "target": "tnumber" })

match.nodes.append({"id": "sechec", "content": "`[A-H][1-8]`", "source": True,})
match.nodes.append({"id": "techec", "content": "lignes contenant l'index d'une case d'échiquier", "target": True,})
expected.append({ "source": "sechec", "target": "techec" })

match.nodes.append({"id": "scont", "content": "`^[aeiouy]*$`", "source": True,})
match.nodes.append({"id": "tcont", "content": "lignes composées que de voyelles", "target": True,})
expected.append({ "source": "scont", "target": "tcont" })

match.nodes.append({"id": "smin3", "content": "`^[^0-9]*$`", "source": True,})
match.nodes.append({"id": "tmin3", "content": "lignes sans aucun chiffre", "target": True,})
expected.append({ "source": "smin3", "target": "tmin3" })

random.shuffle(match.nodes)
==

text==#|markdown|
Relier les expressions régulières à droite avec ce que pourrait obtenir un 
utilisateur en terminal unix en les branchant correctement dans un bon appel 
à **grep**.

<br>

Attention, comme dans la théorie des langages, l'étoile signifie maintenant 
toutes répétitions (possiblement vide) du pattern qui la précède. L'étoile des 
méta-caractères n'est pas la même que l'étoile des expressions régulières.
==


form==#|markdown|
{{ match|component }}
==

evaluator== #|python|
from utils_bash import display_as_shell_this, frame_message

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
    grade = (100, frame_message("C'est pafait comme &ccedil;a!", "ok"))
else:
    score = 100*(8 - error) // 8
    grade = (score, frame_message("Il y a des éléments non correctement reliés...", "error"))
==
