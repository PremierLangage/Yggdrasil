
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

# ENCHAINEMENT Exercice à 3 questions puis reboucle
nbQuestion=3

question1="Quel est le sup de l'ensemble"
indication1=(On écrira +oo si l'ensemble n'est pas majoré et - oo si l'ensemble est vide)
breponse1=uneLigne['C5:sup']

question2="Donner un majorant de l'ensemble C1"
indication1=(On écrira +oo si l'ensemble n'est pas majoré et - oo si l'ensemble est vide)
bonne réponse si a >= sup
breponse2=uneLigne['C5:sup']

question3="L'ensemble C1 a-t-il un plus grand élément ?"
indication3=(On écrira le texte oui ou le texte non)
oui/non
bonne réponse oui si +
if uneLigne['C5:sup'] =='+':
 breponse3=oui
else:
 breponse3=non

inviteSuite="Valider permet de répondre à la question {{nbQuestion-2}}"
==

text==#|markdown|
{{uneLigne}}

<p>Quel est le sup de l'ensemble {{uneLigne['C1:type']}} càd {{uneLigne['C2:Partie de $%R%$']}}</p>

<p>{{inviteSuite}}</p>
==
form==
==
evaluator==
if nbQuestion > 0 :
 # premiere question
 if nbQuestion==3:
  if uneLigne[] == inputbox.value:
    nbbr += 1 
    grade = (100, f'<span class="success-state">Good 👏👏👏 </span> <span > {nbbr}/{nbq} </span>')
  else:
    grade = (0, f'<span class="error-state">Bad answer</span> <br/><span >{text}<br> la bonne réponse  était : {sol}  {nbbr}/{nbq} </span>')
 # seconde question
 text, sol = question()
else:
  # réinitialisation des alea mais aussi des définitions , un impact sur l'exécution ?
  uneLigne=random.choice(listeBornesup)
  nbQuestion = 3
  text=""
  form=""
  if nbbr == nbq :
    grade = (100, f'<span class="success-state">BRAVO!tout est bon 👏👏👏 </span> <span > {nbbr}/{nbq} </span>')
  else:
    grade = (-nbbr/nbq, f'<span class="error-state">Quelques bonnes réponses tout de même? = {nbbr}/{nbq} </span>')
==
