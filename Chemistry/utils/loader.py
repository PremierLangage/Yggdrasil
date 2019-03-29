import csv
import random 

def get(path, delimiter=';'):
    images = {}
    with open(path,'r') as csvf:
        reader = csv.DictReader(csvf, delimiter=';')
        return random.choice([x for x in reader])


