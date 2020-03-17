extends = /model/basic.pl

@ /demo/basic/pays_europe.csv

title = Capitales européennes (Radio)

@ /utils/components/radio.py [customradio.py]


before ==
import random as rd
import csv
from customradio import CustomRadio

with open('pays_europe.csv', newline='') as file:
    all_rows = list(csv.DictReader(file, delimiter=','))

radios = []
du_pays = []
for i in range(5):
    radio = CustomRadio(id=f"radio{i}")

    sample_rows=rd.sample(all_rows, 4)

    pays = sample_rows[0]['pays']
    article = sample_rows[0]['article']

    radio.setitems([row['capitale'] for row in sample_rows])
    radio.setsol_from_index(0)
    radio.shuffle()
    globals()[f"radio{i}"] = radio

    radios.append({"cid": radio.cid, "selector": radio.selector})

    partitif = {"le": "du ", "la": "de la ", "les": "des ", "l": "de l'"}
    du_pays.append(partitif[article] + pays)

step = 0
score = [0]
==

text ==
Quelle est la capitale {{ du_pays[step] }} ?
==

form ==
{{ radios[step]|component }}
==

form2 ==
{% for radio in radios %}
{{ radio|component }}
{% endfor %}
==

evaluator ==
radio = globals()[f"radio{step}"]
scores.append(radio.eval())
score = 100
step +=1
if step>2
==



