#*****************************************************************************
#  Copyright (C) 2023 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

url_proof_1 =$ /ComputerScience/logic/proof/visual_proof/preuve_visuelle1.png
url_proof_2 =$ /ComputerScience/logic/proof/visual_proof/preuve_visuelle2.png
url_proof_3 =$ /ComputerScience/logic/proof/visual_proof/preuve_visuelle3.png
url_proof_4 =$ /ComputerScience/logic/proof/visual_proof/preuve_visuelle4.png
url_proof_5 =$ /ComputerScience/logic/proof/visual_proof/preuve_visuelle5.png
url_proof_6 =$ /ComputerScience/logic/proof/visual_proof/preuve_visuelle6.png

group =: RadioGroup

# GENERATE A RANDOM QUESTION
before==#|python|
import random

targets = [url_proof_1, url_proof_2, url_proof_3, url_proof_4, url_proof_5, url_proof_6]
target = random.randint(0,5)
str_url = str(targets[target])
R = str(target)

contents = [
    "la formule $% 1^3 + 2^3 + 3^3 + 4^3 + 5^3 + \\dots = (1 + 2 + 3 + 4 + 5 + \\dots )^2%$",
    "",
    "",
    "",
    "",
    ""
]

group.items = []
for i in range(len(targets)):
    group.items.append({'id': str(i), 'content': contents[i]})

random.shuffle(group.items)
==

title=Preuve visuelle de résultat

text==#|markdown|
Voici un schéma qui est une preuve visuelle d'un résultat mathématique. Selectionner le 
phénomène justifié graphiquement par le dessin.

<img src="{{ str_url }}" alt="Une preuve sous forme d'un schéma" width="50%"/>
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==#|python|
S = group.selection
score = 0
feedback = '<span class="error-state animated pulse infinite" style="padding: 5px;">Mauvaise r&eacute;ponse</span>'

for item in group.items:
    item['css'] = ''
    if item['id'] == S:
        if S == R:
            item['css'] = 'success-border'
            score = 100
            feedback = '<span class="success-state animated pulse infinite" style="padding: 5px;">Bonne r&eacute;ponse</span>'
        else:
            item['css'] = 'error-border'
    elif item['id'] == quest:
        item['css'] = 'success-border animated pulse infinite'

grade = (score, feedback)
==