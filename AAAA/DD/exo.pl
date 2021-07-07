extends = /model/basic/input.pl

@ /demo/data/pays_europe.csv

before ==
f = open('pays_europe.csv')
row = csv_choice(f)
pays = row['pays']
article = row['article']
if article == "l":
    partitif = "de l'"
elif article == "les":
    partitif = "des "
elif article == "le":
    partitif = "du "
else:
    partitif = "de la "
sol = row['capitale']
==

question ==
Quel est la capitale de {{ partitif }}{{ pays }} ?
==