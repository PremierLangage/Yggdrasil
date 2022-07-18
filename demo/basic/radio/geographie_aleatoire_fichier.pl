extends = /model/basic/radio.pl

@ /demo/data/pays_europe.csv

before ==
f = open('pays_europe.csv')
datasample = csv_sample(f, 4)
capitale = datasample[0]['capitale']
items = [row['pays'] for row in datasample]
==

question ==
Quel pays a pour capitale {{capitale}} ?
==