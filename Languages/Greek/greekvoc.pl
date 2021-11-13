extends = /model/basic/inputselect.pl

@ grec_voc_1.csv

title = Vocabulaire grec

jinja_keys = []
eval_scripts % ["next"]

before ==
with open('grec_voc_1.csv', newline='') as f:
    row = csv_choice(f, delimiter=";")
    f.seek(0)
    items = csv_col(f, "traductions", delimiter=";")
article = row['article']
mot = row['mot']
sol = row['traductions']
i = items.index(sol)
active = True
evalcnt = 0
==

tplpage =@ tplvoc.html

question ==
{{ evalcnt }}
Que signifie le mot suivant ?
<div style="text-align:center;font-size: x-large;font-family:'GFSPorsonRegular';">
{{article}} {{mot}}
</div>
==

style.greek ==
<link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/gfs-porson" type="text/css"/> 
==

next ==
from plcsv import csv_choice, csv_col
evalcnt += 1
if active:
    ans = input.value
    if ans == sol:
        score = 100
    else:
        score = 0

    if score == 100:
        input.suffix = r'<i class="fas fa-check" style="color: green"></i>'
    elif score >= 0:
        input.suffix = r'<i class="fas fa-times" style="color: crimson"></i></i>'
    input.disabled = True

    active = False
else:
    with open('grec_voc_1.csv', newline='') as f:
        row = csv_choice(f, delimiter=";")
    article = row['article']
    mot = row['mot']
    sol = row['traductions']
    input.disabled = False
    input.suffix = " "
    active = True
==