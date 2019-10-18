@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator2.py [grader.py]

title = Conjugaison

before ==
import random as rd
lst_prs={'1S':'1ère personne du singulier',
         '2S':'2e personne du singulier',
         '3S':'3e personne du singulier',
         '1P':'1ère personne du pluriel',
         '2P':'2e personne du pluriel',
         '3P':'3e personne du pluriel'}
lst_conj=['mange','manges','mange','mangeons','mangez','mangent']
i=rd.randint(0,5)
prs=lst_prs[i]
conj=lst_conj[i]
==

text ==
Conjuguer le verbe manger à la {{prs}} du présent.
==

input =: Input
input.type = text

form ==
{{input|component}}
==

evaluator ==
if input.value==conj:
    score=100
else:
    score=0
==


