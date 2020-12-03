extends= /Mathematics/Magdalena/mathematiciens/matchlist_mathematiciens.pl

title==
Matching List
==

@ /AAAA/Anna/Irregular_verbs.csv [data]
@ /AAAA/Anna/Irregular_verbs2.csv [data1]

before ==
import random as rd
import csv
if rd.randint(1,2) == 1 :
    filename= "data1"
else:
    filename= "data"

with open(filename, newline='') as file:
    all_rows = list(csv.DictReader(file, delimiter=','))
    
sample_rows = rd.sample(all_rows, 5)

matchlist.setdata_from_matches([(row['V'], row['V-ED']) for row in sample_rows])
==

