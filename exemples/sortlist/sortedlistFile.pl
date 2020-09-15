
extends = /model/basic/sortlist.pl
@ fichierdedonnee.csv [data.csv]
column=noms # Choix de la columns 

text==
En utilisant Drag and Drop, rangez les valeurs dans l'ordre.
==

before==
import csv
import random
delimiter=",;:" if "delimiter" not in globals() else delimiter 
nbsample = 4 if "nbsample" not in globals() else int(nbsample)

with open("data.csv","r") as csvfile:
    reader = csv.DictReader(csvfile)
    # Lecture de la column dans l'ordre du fichier
    lue = [ row[column] for row in reader] 
    # ordered sample from file 
    lr=random.sample(range(len(lue)),nbsample)    
    sortedlist=[ lue[i]  for i in sorted(lr) ]

==

