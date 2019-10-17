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
Conjuguer le verbe manger au présent pour le pronom donné ci-dessous.
==

input =: Input
input.type = text



form ==
<div style="display:flex;align-items:center;">
<div>{{pronom}} &nbsp;</div> {{input|component}}
</div>
==

evaluator ==
if input.value==conj:
    score=100
else:
    score=0
==

