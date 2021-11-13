extends = /model/basic/inputselect.pl

@ grec_voc_1.csv

title = Vocabulaire grec

jinja_keys = []

before ==
with open('grec_voc_1.csv', newline='') as f:
    row = csv_choice(f, delimiter=";")
    f.seek(0)
    items = csv_col(f, "traductions", delimiter=";")
article = row['article']
mot = row['mot']
sol = row['traductions']
i = items.index(sol)

==

tplpage =@ tplvoc.html

question ==
{{ history }}
Que signifie le mot suivant ?
<div style="text-align:center;font-size: x-large;font-family:'GFSPorsonRegular';">
{{article}} {{mot}}
</div>
==

style.greek ==
<link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/gfs-porson" type="text/css"/> 
==

evaluator ==
from plcsv import csv_choice, csv_col

if ans == sol:
    score = 100
elif ans not in input.autocomplete:
    feedback = "La réponse doit faire partie des propositions."
    score = -1
else:
    score = 0

if score != -1:
    with open('grec_voc_1.csv', newline='') as f:
        row = csv_choice(f, delimiter=";")
        f.seek(0)
        items = csv_col(f, "traductions", delimiter=";")
    article = row['article']
    mot = row['mot']
    sol = row['traductions']
==