@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /input/select/head.html [select_head.html]
@ /input/select/template.html [select_template.html]
@ /input/select/process.py [select_process.py]


title = Champ de réponse select

lang = fr

before ==
import random
n=random.randint(1,101)*random.choice([-1,1])
numsol1=1
numsol2=1
==

text =

form ==
Le nombre {{ n }} est {{input_1}} et {{input_2}}.
==

input.1.type = select
input.1.shuffle = no
input.1.choices == 
["positif",
"négatif"]
==
input.1.numsol = {{numsol1}}

input.2.type = select
input.2.shuffle = no
input.2.choices == 
["pair",
"impair"]
==
input.2.numsol = {{numsol2}}

evaluator ==
if answer['1']=='1':
    score=100
else:
    score=0
feeedback=answer
==


