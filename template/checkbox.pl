@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /input/checkbox/process.py [checkbox_process.py]
@ /input/checkbox/template.html [checkbox_template.html]
@ /input/checkbox/head.html [checkbox_head.html]

title = Champ de réponse checkbox

lang = fr

before ==
import random
odd=list(range(1,101,2))
even=list(range(2,101,2))
n=random.randint(1,3)
numsol=list(range(n))
choices=random.sample(odd,n)+random.sample(even,4-n)
==

text ==
Sélectionner les nombres impairs dans la liste suivante.
==

form ==
{{input_1}}
==

input.1.type = checkbox
input.1.shuffle = yes
input.1.choices = {{choices}}
input.1.numsol = {{numsol}}

evaluator ==
if answer['1']['eval']==True:
    score=100
else:
    score=0
==

