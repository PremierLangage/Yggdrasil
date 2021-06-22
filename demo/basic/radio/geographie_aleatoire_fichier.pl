extends = /model/basic/radio.pl

@ /demo/data/pays_europe.csv

before ==
with open('pays_europe.csv', newline='') as f:
    datasample = csv_sample(f, 4)
capitale = datasample[0]['capitale']
items = [row['pays'] for row in datasample]
==

question ==
Quel pays a pour capitale {{capitale}} ?
==