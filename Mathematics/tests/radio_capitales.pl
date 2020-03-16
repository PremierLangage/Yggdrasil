extends = /model/basic.pl
@ /builder/before.py [builder.py]
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

    radios.append(radio)

    partitif = {"le": "du ", "la": "de la ", "les": "des ", "l": "de l'"}
    du_pays.append(partitif[article] + pays)

step = 0

drops = []
for i in range(5):
    drop = DragDrop(
        id=f"drop{i}",
        droppable=True
    )
    drops.append(drop)

    # add the component to the global context
    # so it can be synced by the framework
    globals()[drop.id] = drop
==

text ==
Quelle est la capitale {{ du_pays[step] }} ?
==

form ==
{{ drops[1]|component }}
{{ radio2|component }}
{{ radio3|component }}
==

evaluator ==
score = radio.eval()
step +=1
==



