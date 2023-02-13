extends= /Languages/English/irregular_verbs.pl

title=Irregular verbs

text== 
You need to validate 20 preterit form to win 

Give the preterite of the verb **to {{ verb }} **
==

@ /AAAA/Anna/Irregular_verbs.csv [data]
@ /AAAA/Anna/Irregular_verbs2.csv [data1]

before ==#|python|
import random 
import csv

countdown.actions = [
    { "time": 0, "action": autoSubmit }
]
counter = 0

if random.randint(1,2) == 1 :
    filename= "data1"
else:
    filename= "data"

with open(filename, newline='') as file:
    IR = list(csv.DictReader(file, delimiter=','))

good_total = 0
verb_total = 0
validated = []
index_verb  = random.randint(0, len(IR)-1)
verb = IR[index_verb]['V']
preterit = IR[index_verb]['V-ED']
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

    verb = IR[index_verb]['V']
    preterit = IR[index_verb]['V-ED']
    countdown.actions = [ { "time": 0, "action": autoSubmit } ]
==

doc == 
Exo à questions ouvertes. L'élève doit trouver le preterit du verbe irrégulier qui lui est proposé en 15s chronométré. 
Il ne réussira l'exercice qu'après avoir trouvé 20 verbes et la note sera en fonction du nombre d'essaie. 

Ceci est un template. Pour créer un exo plus simplement dans une autre feuille, il suffit juste de modifier le titre 
(balise title), l'énoncé de l'exercice (dans la balise text) et les fichiers à importer sous la forme @ chemin vers le 
fichier pour chaque fichier
==

