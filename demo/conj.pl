@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator2.py [grader.py]

title = Conjugaison

before ==
import random as rd
lst_pronom=['je','tu',rd.choice(['il','elle']),'nous','vous',rd.choice(['ils','elles'])]
lst_conj=['mange','manges','mange','mangeons','mangez','mangent']
i=rd.randint(0,5)
pronom=lst_pronom[i]
conj=lst_conj[i]
==

text ==
Conjuguer le verbe manger au présent
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

