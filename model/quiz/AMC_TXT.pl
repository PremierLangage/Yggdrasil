extends = /model/quiz/basic.pl

@ /utils/format/AMC.py

start == #|python|
from AMC import parse_AMC_TXT
from steps import SingleInput
from basicinput import *
list_questions = parse_AMC_TXT(quiz)

if 'nbstep' in globals():
    list_questions = sample(list_questions, nbstep)
else:
    nbstep = len(list_questions)

sequence = []
for i, q in enumerate(list_questions):
    sequence.append(SingleInput())
    if q['type'] == "Radio":
        sequence[i].inputfield = Radio()
        sequence[i].inputfield.set_items(q['items'])
        sequence[i].inputfield.set_sol(q['index'])
    elif q['type'] == "Checkbox":
        sequence[i].inputfield = Checkbox()
        sequence[i].inputfield.set_items(q['items'])
        sequence[i].inputfield.set_sol(q['index'])
    sequence[i].question = q['text']
    if 'ordered' not in q['options']:
        sequence[i].inputfield.shuffle()
    sequence[i].inputblock = sequence[i].inputfield.render()
==

intro ==
Début du quiz
==



quiz ==
* Quelle est la capitale du Cameroun ?
+ Yaoundé
- Douala
- Kribi

** Parmi les nombres suivants, lesquels sont positifs ?
+ 2
- -2
+ 10

*[ordered] Combien font un plus un ?
- 0
- 1
+ 2
- 3
==

apidoc == #|json|
{
    "name": "AMC_TXT",
    "keys": {
        "title": {
            "type": "str",
            "default": "''",
            "description": "Titre du quiz."
        },
        "intro": {
            "type": "str",
            "default": "''",
            "description": "Texte d'introduction du quiz."
        },
        "quiz": {
            "type": "str",
            "default": "''",
            "description": "Questions du quiz au format AMC-TXT."
        }
    }
}
==