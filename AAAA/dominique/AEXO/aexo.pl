extends = /model/basic/input.pl

@ /demo/data/pays_europe.csv

before ==
f = open('pays_europe.csv')
row = csv_choice(f)
sol  = row['capitale']
capitale = row['pays']
arti = row['article']
==

question ==
Quelle est la capitale de {{ arti }} {{ pays }} ?
==

