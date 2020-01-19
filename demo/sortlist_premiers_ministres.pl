extends = /template/sortlist.pl

title = Classement : Premiers ministres de la Ve République

@ premiers_ministres.csv [data.csv]

before ==
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

lst=rd.sample(range(len(rows)),5)
lst.sort()
sortlist.loadContent([rows[i]['nom'] for i in lst])
==

text ==
Classer ces premiers ministres de la Ve République du plus ancien au plus récent (selon la date d'entrée en fonction).
==


