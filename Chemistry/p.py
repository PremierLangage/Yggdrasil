import csv
import random 

def getrandomdic():
    with open('Tableau-alcene-exo-PL.csv','r') as csvf:
        reader = csv.DictReader(csvf, delimiter=';')
        return random.choice([x for x in reader])

print(getrandomdic())

