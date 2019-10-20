@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

@ country_data.csv [data.csv]

title = Capitales de pays

before ==
import sys
import random as rd
import csv
essai=1
if "row" not in globals():
    with open('data.csv','r') as file:
        row=rd.choice(list(csv.reader(file,delimiter=',')))
print(row,file=sys.stderr)
country,article,capital=row

if article=="le":
    ofcountry = "du " + country
elif article=="l":
    ofcountry = "de l'" + country
elif article=="la":
    ofcountry = "de la " + country
elif article=="les":
    ofcountry = "des " + country
==

text ==
Quelle est la capitale {{ofcountry}} ?
==

theinput =: Input
theinput.type = text

form ==
{{ theinput | component }}
==

evaluator ==
if "value" in theinput:
    essai+=1

    if theinput.value==capital:
        grade=(100,"Bravo !")
    else:
        if essai >3:
            exec(before)
        grade=(0,"essai="+str(essai)+"<br>Raté !")
grade=(0," saisisez une valeur ") 
==




