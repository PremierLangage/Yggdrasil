extends = /model/basic/input.pl

@ /demo/data/pays_europe.csv

before ==
with open('pays_europe.csv', newline='') as f:
    row = csv_row(f)
capitale = row['capitale']
sol = row['pays']
==

question ==
Quel pays a pour capitale {{capitale}} ?
==
