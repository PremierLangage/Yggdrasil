extends = /model/basic/input.pl

@ /demo/data/pays_europe.csv

before ==
with open('pays_europe.csv', newline='') as f:
    row = csv_choice(f)
capitale = row['capitale']
sol = row['pays']
==

question ==
{{row}}
Quel pays a pour capitale {{capitale}} ?
==
