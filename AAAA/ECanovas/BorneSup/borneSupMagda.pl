# 2 modes : Entrainement et Evaluation

# template Tout nouveau malheureusement... feedback pas encore programmé...
# from @magdalena bornesup1.pl
# extends=/ComputerScience/C/examples/Stoi_le_caroussel.pl
extends=/model/mathinput.pl

title= Borne Sup

@ bornesup.csv

before ==
import csv
import random

# Chargement du dictionnaire des Questions depuis un fichier csv
# with open("bornesupQ.csv",newline='') as csvfileQ:
#     readerBornesupQ = csv.DictReader(csvfileQ)

# Chargement du dictionnaire des données depuis un fichier csv
with open("bornesup.csv", newline='') as csvfile:
     #listeBornesup = csv.DictReader(csvfile, delimiter=';')
     listeBornesup=list(csv.DictReader(csvfile, delimiter=';'))

uneLigne=random.choice(listeBornesup)
==

text==#|markdown|
{{uneLigne}}

Quel est le sup de l'ensemble {{uneLigne['C1:type']}} càd {{uneLigne['C2:Partie de $%R%$ ']}}
==
form==
==
