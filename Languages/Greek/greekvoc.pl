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
answered = False
==

tplpage =@ tplvoc.html

question ==
{{ answered }}
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

if not answered:
    if ans == sol:
        score = 100
        answered = True
    elif ans not in input.autocomplete:
        feedback = "La réponse doit faire partie des propositions."
        score = -1
        answered = False
    else:
        score = 0
        answered = True
    if score == 100:
        input.suffix = r'<i class="fas fa-check" style="color: green"></i>'
    elif score >= 0:
        input.suffix = r'<i class="fas fa-times" style="color: crimson"></i></i>'
    if score != -1:
        input.disabled = True
        newword = True
else:
    if newword:
        with open('grec_voc_1.csv', newline='') as f:
            row = csv_choice(f, delimiter=";")
            f.seek(0)
            items = csv_col(f, "traductions", delimiter=";")
        article = row['article']
        mot = row['mot']
        sol = row['traductions']
        input.suffix = ""
        input.disabled = False
        newword = False
        answered = False
    else:
        newword = True
==

evalprocess ==

==