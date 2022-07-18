extends = /model/basic.pl

title = premiers ministres (SortList)

@ premiers_ministres.csv

before ==
import random as rd
import csv

with open('premiers_ministres.csv', newline='') as file:
    rows = list(csv.DictReader(file, delimiter=','))

lst = rd.sample(range(len(rows)), 5)
lst.sort()
sortlist.setdata_from_list([rows[i]["nom"] for i in lst])
==

text ==
Classer ces premiers ministres de la Ve République du plus ancien au plus récent (selon la date d'entrée en fonction).
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




