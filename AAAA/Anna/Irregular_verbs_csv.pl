extends= /Languages/English/irregular_verbs.pl

title=Irregular verbs

text== 
You need to validate 20 preterit form to win 

Give the preterite of the verb **to {{ verb }} **
==

@ /AAAA/Anna/Irregular_verbs.csv [data]
@ /AAAA/Anna/Irregular_verbs2.csv [data1]

before ==
import random as rd
import csv

countdown.actions = [
    { "time": 0, "action": autoSubmit }
]
counter = 0

if rd.randint(1,2) == 1 :
    filename= "data1"
else:
    filename= "data"

with open(filename, newline='') as file:
    all_rows = list(csv.DictReader(file, delimiter=','))

index_verb  = random.randint(0, len(IR)-1)
sample_rows = rd.sample(all_rows, 5)

good_total = 0
verb_total = 0
validated = []
verb = row['V']
preterit = row['V-ED']
==

form==
{{ countdown|component }}

{{ inputbox |component}}

{{ good_total }} / {{ verb_total }}
==

evaluator== #|python|
import random

verb_total += 1

if inputbox.value == preterit:
    good_total += 1
    validated.append(index_verb)
    grade = (0, '<span class="success-state">Good 👏👏👏</span>')
else:
    grade = (0, '<span class="error-state">No, it is <b>' + preterit + '</b>, Bad answer 👎👎👎</span>')

if good_total == 20:
    countdown.hidden = True
    score = 2000 // verb_total
    grade = (score, '<center><span class="success-state">Your final score '+ str(score) + '%</span></center>')
    form = ""
    text = "You validated 20 different irregular preterite forms !"
    countdown.actions = []
else:
    inputbox.value = ""
    countdown.time = 15

    index_verb  = random.randint(0, len(IR)-1)
    while index_verb in validated:
        index_verb  = random.randint(0, len(IR)-1)

    verb = IR[index_verb][0]
    preterit = IR[index_verb][1]

    countdown.actions = [ { "time": 0, "action": autoSubmit } ]
==
