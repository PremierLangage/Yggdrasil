extends= /Mathematics/Magdalena/mathematiciens/matchlist_mathematiciens.pl

title==
Matching List
==

@ /AAAA/Anna/Irregular_verbs.csv [data]
@ /AAAA/Anna/Irregular_verbs2.csv [data1]

before ==
import random as rd
import csv
if rd.randint(1,2) == 1 :
    filename= "data1"
else:
    filename= "data"

with open(filename, newline='') as file:
    all_rows = list(csv.DictReader(file, delimiter=','))
    
sample_rows = rd.sample(all_rows, 5)

matchlist.setdata_from_matches([(row['V'], row['V-ED']) for row in sample_rows])
==

text ==
Match each verbs to its preterit
==

doc == 
Exos à choix unique où on doit relier chaque élèment de la première case à un élèment de la seconde case. 

Code couleurs : Après validation de la réponse 
-> Flèches vertes = réponses justes
-> Flèches rouges = réponses fausses

Importer le ou les fichiers csv où on doit récupérer les données des champs de gauche et de 
droite par la syntaxe : @ chemin d'accè vers le fichier 

Dans la balise before définir les critères de choix selon le modèle ci-dessus c'est à dire : 
- Si on a plusieurs fichiers csv, on utilise la fonction random pour choisir aléatoirement les données entre les différents
- filename définit le nom du fichier, sample_rows définit les lignes à choisir (le nombre de ligne parmi toutes les lignes)
- row['nom de la colonne'] pour choisir le colonne qui définit les élèments de la case

==
