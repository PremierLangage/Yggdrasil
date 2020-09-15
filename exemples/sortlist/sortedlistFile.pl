
extends = /model/basic/sortlist.pl
@ fichierdedonnee.csv [data.csv]
column=noms # Choix de la columns 

text==
En utilisnt Drag and Drop, rangez les valeurs dans l'ordre.
==

before==
import csv
delimiter=",;:" if "delimiter" not in globals() else delimiter 
nbsample = 4 if "nbsample" not in globals() else int(nbsample)

with open("data.csv","r") as csvfile:
    dialect = csv.Sniffer().sniff(csvfile.read(1024),delimiters=delimiter)
    csvfile.seek(0)
    reader = csv.Dicreader(csvfile, dialect)
    # Lecture de la column dans l'ordre du fichier
    lue = [ row[column] for row in reader] 
# ordered sample from file 
lr=random.sample(range(len(lue)),nbsample)    
sortlist=[ lue[i] for i in sorted(lr) ]

==

