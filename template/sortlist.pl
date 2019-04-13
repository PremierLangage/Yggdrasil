@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /input/sortlist/process.py [sortlist_process.py]
@ /input/sortlist/template.html [sortlist_template.html]
@ /input/sortlist/head.html [sortlist_head.html]


title = Champ de réponse sortlist

lang = fr

before ==
import random
biglist=list(range(1,101))
choices=random.sample(biglist,4)
choices.sort()
==

text ==
Classer les nombres suivants par ordre croissant.
==

form ==
{{input_1}}
==

input.1.type = sortlist

input.1.choices = {{choices}}

evaluator ==
if answer['1']['eval']==True:
    score=100
else:
    score=0
==
