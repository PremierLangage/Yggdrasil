extends = /template/sortlist.pl

title = Premiers ministres de la Ve République

@ premiers_ministres.csv [data.csv]

before ==
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

lst=[1,3,5,7,8]
sortlist.loadContent([rows[i]['nom'] for i in lst])
==

text ==
Classer ces premiers ministres de la Ve République du plus ancien au plus récent (selon la date d'entrée en fonction).
==


