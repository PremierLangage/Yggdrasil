extends = /template/matchlist.pl

title==
Correspondances : Pays et Capitales
==

@ pays_europe.csv

before==
import random as rd
import csv

with open('pays_europe.csv',newline='') as file:
    all_rows=list(csv.DictReader(file,delimiter=','))
    
sample_rows=rd.sample(all_rows,4)

source=[item['pays'] for item in sample_rows]
target=[item['capitale'] for item in sample_rows]

match.load_items(source,target)
==

text==
Relier chaque pays à sa capitale.
==



