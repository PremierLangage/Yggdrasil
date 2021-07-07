extends = /model/basic/input.pl

@ /demo/data/pays_europe.csv

before ==
f = open('pays_europe.csv')
row = csv_choice(f)
capitale = row['capitale']
article = row['article']
sol = row['pays'] 
==

question ==
Quel est la capitale de {{article}} {{sol}}?
==
