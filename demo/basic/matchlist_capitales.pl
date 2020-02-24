extends = /model/basic.pl

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

match.loadpairs([(item['pays'],item['capitale']) for item in sample_rows])
==

text==
Relier chaque pays à sa capitale.
==

matchlist =: MatchList

@ /utils/components/matchlist.py [custommatchlist.py]
matchlist.decorator = CustomMatchList

form ==
{{ matchlist|component }}
==

evaluator ==
grade = radio.eval()
==
