@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
radio_template =@ /input/radio/template.html
radio_process_config =@ /input/radio/process_config.py
radio_head =
radio_process_answer =@ /input/radio/process_answer.py

title = Champ de réponse radio

lang = fr

text ==
Quelle est la capitale de la Lettonie ?
==

form ==
{{input_1}}
==

input.1.type = radio

input.1.shuffle = no

input.1.choices ==
Tallin
Riga
Vilnius
==

input.1.numsol = 1

evaluator ==
if answer['1']==1:
    score=100
else:
    score=0
==
