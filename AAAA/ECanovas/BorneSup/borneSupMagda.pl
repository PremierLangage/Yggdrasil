# 2 modes : Entrainement et Evaluation

# template Tout nouveau malheureusement... feedback pas encore programmé...
# from @magdalena bornesup1.pl
extends=/ComputerScience/C/examples/Stoi_le_caroussel.pl

title= Borne Sup

@ bornesupQ.csv
@ bornesup.csv

before ==
import csv
# import random

# Chargement du dictionnaire des Questions depuis un fichier csv
# with open("bornesupQ.csv",newline='') as csvfileQ:
#     readerBornesupQ = csv.DictReader(csvfileQ)

# Chargement du dictionnaire des données depuis un fichier csv
with open("bornesup.csv", newline='') as csvfile:
     readerBornesup = csv.DictReader(csvfile, delimiter=';')
     for row in readerBornesup:
        print(row['C1:type'])
==

text==#|markdown|

On considère la partie $%I = C2%$ de $%\mathbb{R}%$

==
