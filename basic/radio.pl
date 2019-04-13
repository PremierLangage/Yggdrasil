@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /input/radio/process.py [radio_process.py]
@ /input/radio/template.html [radio_template.html]
@ /input/radio/head.html [radio_head.html]

title = Champ de réponse radio

lang = fr

text ==
Quelle est la capitale de la Lettonie ?
==

form ==
{{input_1}}
==

input.1.type = checkbox

input.1.shuffle = no

input.1.choices ==
["Tallin",
"Riga",
"Vilnius",
"Kaunas"]
==

input.1.numsol = [1]

evaluator ==
if answer['1']['eval']==True:
    score=100
else:
    score=0
==



