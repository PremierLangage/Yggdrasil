extends = /model/basic/input.pl

@ /demo/data/pays_europe.csv

before ==
f = open('pays_europe.csv', newline='')
row = csv_choice(f)
capitale = row['capitale']
sol = row['pays']
==

question ==
{{row}}
Quel pays a pour capitale {{capitale}} ?
==
