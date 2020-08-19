


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
score = radio.eval()
==




