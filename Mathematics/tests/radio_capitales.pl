extends = /model/basic.pl

@ /demo/basic/pays_europe.csv

title = Capitales européennes (Radio)

@ /utils/components/radio.py [customradio.py]

nbstep % 5

before ==
import random as rd
import csv
from customradio import CustomRadio

with open('pays_europe.csv', newline='') as file:
    all_rows = list(csv.DictReader(file, delimiter=','))

comp = []
texts = []
for i in range(nbstep):
    radio = CustomRadio(id=f"radio{i}")

    sample_rows=rd.sample(all_rows, 4)

    pays = sample_rows[0]['pays']
    article = sample_rows[0]['article']

    radio.setitems([row['capitale'] for row in sample_rows])
    radio.setsol_from_index(0)
    radio.shuffle()
    globals()[f"radio{i}"] = radio

    comp.append({"cid": radio.cid, "selector": radio.selector})

    partitif = {"le": "du ", "la": "de la ", "les": "des ", "l": "de l'"}
    texts.append("Quelle est la capitale " + partitif[article] + pays + " ?")

step = 0
scores = []
==

intro ==
Ce quiz contient 5 questions.
==

text ==
Question {{step}}
{{ texts[step]}}
==

form ==
{{ comp[step]|component }}
==

form2 ==
{% for e in comp %}
Question {{ loop.index }}
{{ texts[loop.index0]}}
{{ e|component }}
{% endfor %}
==

evaluator ==
score = -1
scores.append(globals()[f"radio{step}"].eval())
step +=1
if step >= nbstep-1:
    form = form2
    text = ""
==



