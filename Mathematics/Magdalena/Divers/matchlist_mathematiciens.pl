extends = /model/basic.pl

title==
Mathématiciens (MatchList)
==

@ mathematiciens.csv

before ==
import random as rd
import csv

with open('mathematiciens.csv', newline='') as file:
    all_rows = list(csv.DictReader(file, delimiter=','))
    
sample_rows = rd.sample(all_rows, 4)

matchlist.setdata_from_matches([(row['nom'], row['dates']) for row in sample_rows])
==

text ==
Relier chaque mmathématiciens à ses dates de naissances et de mort.
==

matchlist =: MatchList

@ /utils/components/matchlist.py [custommatchlist.py]
matchlist.decorator = CustomMatchList

form ==
{{ matchlist|component }}
==

evaluator ==
score = matchlist.eval()
==

settings.feedback = lightscore



