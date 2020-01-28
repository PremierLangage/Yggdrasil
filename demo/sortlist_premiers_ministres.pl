extends = /template/sortlist.pl

title = Classement : Premiers ministres

@ premiers_ministres.csv [data.csv]

field= name

nb % 7

before ==
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

lst=rd.sample(range(len(rows)),nb)
lst.sort()
sortlist.load_items([rows[i][field] for i in lst])
==

text ==
Classer ces premiers ministres de la Ve République du plus ancien au plus récent (selon la date d'entrée en fonction).
==




