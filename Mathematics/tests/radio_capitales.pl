@ /utils/sandboxio.py
@ /utils/components/scoring.py
@ /utils/components/checkbox.py [customcheckbox.py]
@ /utils/components/textselect.py [customtextselect.py]
@ /builder/beforestep.py [builder.py]
@ /grader/evaluatorstep.py [grader.py]

extracss ==
<style>
.icon-check-after p::after {
    font-family: "Font Awesome 5 Free";
    color: #155724;
    margin-left: 1em;
    content: "\f00c";
    vertical-align: middle;
    font-weight: 900;
}

.icon-times-after p::after {
    font-family: "Font Awesome 5 Free";
    color: #721c24;
    margin-left: 1em;
    content: "\f00d";
    vertical-align: middle;
    font-weight: 900;
}

.icon-check-before p::before {
    font-family: "Font Awesome 5 Free";
    color: #155724;
    margin-right: 1em;
    content: "\f00c";
    vertical-align: middle;
    font-weight: 900;
}

.icon-times-before p::before {
    font-family: "Font Awesome 5 Free";
    color: #721c24;
    margin-right: 1em;
    content: "\f00d";
    vertical-align: middle;
    font-weight: 900;
}



.error-text-unit {
    color: #721c24;
    text-decoration: line-through red;
}

.success-text-unit {
    color: #155724;
    text-decoration: underline green;
}
</style>
==

@ /demo/basic/pays_europe.csv

title = Capitales européennes (Radio)

@ /utils/components/radio.py [customradio.py]

nbstep % 3

before ==
import random as rd
import csv
from customradio import CustomRadio

with open('pays_europe.csv', newline='') as file:
    all_rows = list(csv.DictReader(file, delimiter=','))

radios = []
texts = []
forms = []
evaluators = []
for i in range(nbstep):
    globals()[f"radio{i}"] = CustomRadio()

    sample_rows=rd.sample(all_rows, 4)

    pays = sample_rows[0]['pays']
    article = sample_rows[0]['article']

    globals()[f"radio{i}"].setitems([row['capitale'] for row in sample_rows])
    globals()[f"radio{i}"].setsol_from_index(0)
    globals()[f"radio{i}"].shuffle()
    radios.append({"cid": globals()[f"radio{i}"].cid, "selector": globals()[f"radio{i}"].selector})

    partitif = {"le": "du ", "la": "de la ", "les": "des ", "l": "de l'"}
    texts.append(f"Quelle est la capitale {partitif[article]}  {pays} ?")
    forms.append("""{{ radios[step]|component }}""")
    evaluators.append("""globals()[f"radio{step}"].eval()""")
==

text =

form = 

intro ==
Ce quiz contient {{nbstep}} questions.
==

