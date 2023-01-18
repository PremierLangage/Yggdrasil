


@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/bbefore.py [builder.py]

radio =: RadioGroup
horizontal % false
choices==
=jaune #Bonne réponse, bravo !
~rouge #Mauvaise réponse, c'est jaune.
~bleu #Mauvaise réponse, c'est jaune.
==


title = PLEASE OVERRIDE THE TITLE OF THE EXERCISE
text  = PLEASE OVERRIDE THE TEXT OF THE EXERCISE
form  = {{ radio|component }}

beforeA== #|python|
import uuid
import re

lines = choices.split('\n')
choices = []
radio.items = []
pattern = re.compile(r'(?P<type>\=|\~)(?P<content>(?:(?:\\\#)|[^\#])+)(?:\#(?P<feedback>.*))?')
for line in lines:
    match = pattern.match(line)
    if not match:
        continue
    id = str(uuid.uuid4())
    choice = {
        "id": id,
        "feedback": match.group('feedback') or '',
        "right": match.group('type') == '='
    }
    choices.append(choice)
    radio.items.append({
        "id": id,
        "content": match.group('content')
    })

text= "Did the beforeA"
==

evaluator== #|python|
score = 0
feedback = ''
selectedId = radio.selection
for index, item in enumerate(radio.items):
    item['css'] = ''
    choice = choices[index]
    if choice['right']:
        item['css'] = 'success-border anim-pulse'
    if choice["id"] == selectedId:
        if choice['feedback']:
            feedback =  choice["feedback"] + "<br/>"
        item["css"] = "error-border"
        if choice["right"]:
            score = 100
            item["css"] = "success-border"
feedback += general_feedback
grade = (score, f"<p>{feedback}</p>")
==






