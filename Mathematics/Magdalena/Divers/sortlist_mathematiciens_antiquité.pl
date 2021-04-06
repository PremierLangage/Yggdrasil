extends = /model/basic.pl

title = Mathematiciens (SortList)

@ mathematiciens.csv

before ==
import random as rd
import csv

with open('mathematiciens.csv', newline='') as file:
    rows = list(csv.DictReader(file, delimiter=','))

lst = rd.sample(range(len(rows)), 7)
lst.sort()
sortlist.setdata_from_list([rows[i]["nom"] for i in lst])
==

text ==
Classer ces mathématiciens du plus ancien au plus récent (selon la date de naissance).
==

sortlist =: SortList

@ /utils/components/sortlist.py [customsortlist.py]
sortlist.decorator = CustomSortList

form ==
{{ sortlist|component }}
==

evaluator ==
score = sortlist.eval()
==

settings.feedback = lightscore





