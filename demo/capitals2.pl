extends = /template/basicinput.pl

@ /demo/country_data.csv [data.csv]

title = Capitales de pays

before ==
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

item=rd.choice(rows)
capital=item['capital']
country=item['country']
choices=[item['country'] for item in rows]

input.autocomplete = choices
==

text ==
Quel pays a pour capitale {{capital}} ?
==

evaluator ==
if input.value==capital:
    grade=(100,"")
else:
    grade=(0,"")
==

