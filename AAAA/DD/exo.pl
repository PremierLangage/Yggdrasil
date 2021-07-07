extends = /model/basic/input.pl

@ /demo/data/pays_europe.csv

before ==
f = open('pays_europe.csv')
row = csv_choice(f)
pays = row['pays']
article = row['article']
sol = row['capitale']
==

question ==
Quel est la capitale de { {article }} {{ pays }} ?
==