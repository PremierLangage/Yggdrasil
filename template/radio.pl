@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /input/radio/process.py [radio_process.py]
@ /input/radio/template.html [radio_template.html]
@ /input/radio/head.html [radio_head.html]

title = Champ de réponse radio

lang = fr

before ==
import random
biglist=list(range(1,101))
choices=random.sample(biglist,4)
choices.sort()
==

text ==
Quel est le plus petit nombre parmi la liste suivante ?
==

form ==
{{input_1}}
==

input.1.type = radio

input.1.shuffle = yes

input.1.choices = {{choices}}

input.1.numsol = 0

evaluator ==
if answer['1']['eval']==True:
    score=100
else:
    score=0
==




