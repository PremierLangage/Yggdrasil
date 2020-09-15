
extends = /model/basic/sortlist.pl
@ fichierdedonnee.csv [truc.csv]
column=noms # Choix de la columns 

text==
En utilisant Drag and Drop, rangez les valeurs dans l'ordre.
==

before==
import csv

with open("truc.csv","r") as csvfile:
    reader = csv.DictReader(csvfile)
    # Lecture de la column dans l'ordre du fichier
    lue = [ row[column] for row in reader]

sortedlist= "\n".join(lue)


==


