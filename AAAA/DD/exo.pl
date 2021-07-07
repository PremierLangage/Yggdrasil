extends = /model/basic/input.pl

@ /demo/data/pays_europe.csv

before ==
f = open('pays_europe.csv')
row = csv_choice(f)
pays = row['pays']
sol = row['capitale']
==

question ==
Quel est la capitale de {{ pays }} ?
==