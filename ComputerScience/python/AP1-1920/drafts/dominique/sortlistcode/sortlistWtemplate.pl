extends = /template/sortlist.pl

title = Premiers ministres (SortList)

@ codefile.py

before ==
import random as rd
import csv

with open('codefile.py', newline='') as file:
    rows = list(csv.DictReader(file, delimiter=','))

lst = rd.sample(range(len(rows)), 5)
lst.sort()
sortlist.setdata_from_list([rows[i]["nom"] for i in lst])
==

text ==
Classer ces premiers ministres de la Ve République du plus ancien au plus récent (selon la date d'entrée en fonction).
==

@ /utils/components/sortlist.py [customsortlist.py]


evaluator ==
score = sortlist.eval()
==

settings.feedback = lightscore

