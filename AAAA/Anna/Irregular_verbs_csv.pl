extends= /Languages/English/irregular_verbs.pl

title=Irregular verbs

text== 
You need to validate 20 preterit form to win 

Give the preterite of the verb **to {{ verb }} **
==

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


    
sample_rows = rd.sample(all_rows, 5)

matchlist.setdata_from_matches([(row['V'], row['V-ED']) for row in sample_rows])
==
