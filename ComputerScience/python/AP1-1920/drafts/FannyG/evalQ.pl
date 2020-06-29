# author=Fanny Garnevault

@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]
extends = /gift/templates/qselectset.pl

general_feedback = " Merci pour votre réponse." 
radio =: RadioGroup
horizontal % false

title = Evaluation question

text  ==
(mettre à vide après)  
Enoncé de la question  
Réponse de l'élève  
Question(s) à choix multiples (1 seule réponse sélectionnable)  
==

choices==
=Copie blanche
=Insuffisant
=Passable
=Bien
=Très bien
==

form==
{{ radio|component }}
<input type="text" id="form_pouet" name="fname">
</br></br>
<p>Explication de la note :</p>
<textarea id="form_pouet2" name="Explication" cols=100% rows="5">
</textarea>
==

before==

==

evaluator==#|python|
feedback = "J'ai bien lu votre formulaire " + response['pouet'] + " " + response['pouet2']
note = 100
grade = (note, feedback)
==






before== #|python|
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

