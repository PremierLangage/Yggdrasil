@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

@ country_data.csv [data.csv]

title = Capitales de pays

before ==
import random as rd
import csv
with open('data.csv','r') as file:
    #row=rd.choice(file.readlines())
    row=rd.choice(list(csv.reader(file,delimiter=',')))
country,article,capital=row.split(',')

if article=="le":
    ofcountry = "du " + country
elif article=="l":
    ofcountry = "de l" + country
elif article=="la":
    ofcountry = "de la " + country

==

text ==
{{s}}
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

