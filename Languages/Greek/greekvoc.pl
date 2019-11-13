extends = /template/basicinput.pl

@ grec_voc_1.csv [data.csv]

title = Capitales de pays

before ==
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=';'))

item=rd.choice(rows)
mot=item['mot']
country=item['traductions'].split(",")
choices=[item['traductions'] for item in rows]

input.autocomplete = choices
==

text ==
Que signifie {{mot}} ?
==

evaluator ==
if input.value==country:
    grade=(100,"")
else:
    grade=(0,"")
==

