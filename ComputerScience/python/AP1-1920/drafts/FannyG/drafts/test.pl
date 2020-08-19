


extends = /model/basic.pl

radio =: RadioGroup

before ==
choices = []
radio.items = []

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

radio.setitems(['ok','ol','om'])
radio.setsol_from_index(0)
radio.shuffle()
==

title ==
Radio groupe
==

text ==
Quelle est la capitale ?
==

form ==
{{ radio|component }}
=

evaluator ==
selectedId = radio.selection

for index, item in enumerate(radio.items):
    item['css'] = ''
    choice = choices[index]

    if choice['right']: # the good anwser
        if choice['id'] == selectedId : # student anwsered correctly 
            score = 100
            item['css'] = "success-border"
        else:
            item['css'] = 'success-border anim-pulse'
    else:
         if choice['id'] == selectedId :
            item['css'] = "error-border"
    if choice['id'] == selectedId and choice['feedback']:
                feedback =  choice["feedback"] + "<br/>"

score = radio.eval()
==




