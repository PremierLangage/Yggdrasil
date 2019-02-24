import csv
import random 

def unescape(input):
    return input.replace('<![CDATA[', '').replace(']]>', '')

def randomline(path, delimiter=';'):
    with open(path,'r') as csvf:
        reader = csv.DictReader(csvf, delimiter=';')
        line = random.choice([x for x in reader])
        line['svg'] = unescape(line['svg'])
        return line

