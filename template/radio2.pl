@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /input/radio/process.py [radio_process.py]
@ /input/radio/template.html [radio_template.html]
@ /input/radio/head.html [radio_head.html]

title = Champ de réponse radio

lang = fr

before ==
pass
==

text ==
Quelle équipe la France a-t-elle battue en demi-finale de la Coupe du Monde 2018 ?
==

form ==
{{input_1}}
==

input.1.type = radio

input.1.shuffle = yes

input.1.choices ==
["Belgique",
"Brésil",
"Argentine",
"Uruguay"]
==

input.1.numsol = 0

evaluator ==
if answer['1']['eval']==True:
    score=100
else:
    score=0
==

