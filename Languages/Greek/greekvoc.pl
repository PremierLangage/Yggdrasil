extends = /model/basic/inputselect.pl

@ grec_voc_1.csv

title = Vocabulaire grec

jinja_keys = []
eval_scripts = ["next"]

before ==
from csv import DictReader
with open('grec_voc_1.csv', newline='') as f:
    data = list(DictReader(f, delimiter=";"))

nbwords = len(data)
history = nbwords * [0]
active = True
state = 'intro'
step = 1
==

intro ==
Série
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

next ==
from plcsv import csv_choice, csv_col
if state == 'intro':
    state = 'active'
    step = 1
    i = randint(nbwords)
    article = data[i]['article']
    mot = data[i]['mot']
    sol = data[i]['traductions']
    history[i] += 1
elif state == 'active':
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
    if step == 5:
        state = 'last'
    else:
        state = 'inactive'
elif state == 'inactive':
    with open('grec_voc_1.csv', newline='') as f:
        row = csv_choice(f, delimiter=";")
    article = row['article']
    mot = row['mot']
    sol = row['traductions']
    idword = items.index(sol)
    history[idword] += 1
    input.disabled = False
    input.suffix = " "
    input.value = ""
    step +=1
    state = 'active'
elif state == 'last':
    state = 'intro'
==