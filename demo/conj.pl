@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Addition

before ==
import random as rd
lst_pronom=['je','tu','il/elle','nous','vous','ils/elles']
lst_conj=['mange','manges','mange','mangeons','mangez','mangent']
i=rd.randint(0,5)
pronom=lst_pronom[i]
conj=lst_conj[i]
==

text ==
Calculer {{a}} + {{b}}.
==

input =: Input
input.type = text

form ==
{{pronom}} = {{ input | component }}
==

evaluator ==
try:
    if int(input.value)==a+b:
        grade=(100,"Bravo "+str(a)+"+"+str(b)+"="+str(a+b)+"""<br>\n<p style="color:blue;font-size:18px;"> Ok d'accord c'est pas terrible comme exercice mais c'est pour la démo :)<br> Remarquez que l'énoncé a changé.</p>""")
    else:
        grade=(0,"Raté "+str(a)+"+"+str(b)+"="+str(a+b)+"""<br>\n<p style="color:red;font-size:18px;"> Ok d'accord c'est pas terrible comme exercice mais c'est pour la démo :)<br> Remarquez que l'énoncé a changé.</p>""")
    exec(before)
except:
    grade=(-1,"Votre réponse n'est pas un nombre entier.")
==

