
# THIS EXAMPLE IS DEPRECATED SINCE THE COMPONENT WILL BE RENAMED SOON

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py


selectable =: Text
selectable.text = The quick brown fox jumps over the lazy dog.
selectable.mode = word



state % 0

title==
Outil de création d'un exercice de selection de texte.

==

before==
selectable.separator=' '
if state == 0 :
    text = "saissisez le text à selectionner" 
    form = "{{ input|component }}"
elif state == 1 :
    text = "Sélectionnez les mots valides " 
    form="{{ selectable|component}}"

==

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Answer
inputbox.maxlength = 3
inputbox.appearance = outline

form=


text==
Select the words containing **o**
==




evaluator==
state = 1 
if state == 0 :
    text = "saissisez le text à selectionner" 
    form = "{{ input|component}}"
elif state == 1 :
    text = "Sélectionnez les mots valides " 
    form="{{ selectable|component}}"


score = 100
indices = [2, 3, 5, 8]
for e in selectable.selections:
    e['css'] = "error-state"
    if e['index'] in indices:
        e['css'] = "success-state"
        indices = [i for i in indices if i != e['index']]
    else:
        indices.append(e['css'])

if len(indices) == 0:
    score = 100
    msg = '<span class="success-state animated pulse infinite">Good answer<span>'
else:
    score = 0
    msg = '<span class="error-state animated pulse infinite">Bad answer</span>'
grade = (score, msg)
==


