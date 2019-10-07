@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

@ country_data.csv [data.csv]

title = Capitales de pays

before ==
import csv
import random as rd

with open('data.csv','r') as csvfile:
    reader = csv.DictReader(csvfile, delimiter=',')
    line = rd.choice([x for x in reader])


==

text ==
Quelle est la capitale {{ofcountry}} ?
==

input =: Input
input.type = text

form ==
{{ input | component }}
==

evaluator ==
if int(input.value)==capital:
        grade=(100,"Bravo !")
    else:
        grade=(0,"Raté !")
==

