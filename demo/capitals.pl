@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

@ country_data.csv [data.csv]

title = Capitales de pays

before ==
import csv
import random as rd

with open('data.csv','r') as csvfile:
    reader = csv.reader(csvfile,delimiter=',')
    row = rd.choice([x for x in reader])
    
country,article,capital = "France","la","Paris"


if article=="le":
    ofcountry = "du " + country
elif article=="l":
    ofcountry = "de l" + country
elif article=="la":
    ofcountry = "de la " + country

==

text ==
{{reader}}
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

