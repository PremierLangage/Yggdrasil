
extends=/model/mathinput.pl

title= Borne Sup

@ bornesup.csv

before ==#|python|
import csv
import random

# Chargement du dictionnaire des données depuis un fichier csv
with open("bornesup.csv", newline='') as csvfile:
     listeBornesup=list(csv.DictReader(csvfile, delimiter=';'))

uneLigne=random.choice(listeBornesup)

# ENCHAINEMENT Exercice à 3 questions puis reboucle
nbQuestion=3
iQuestion=1
# nombre de bonnes réponses
nbbr=0

question1="Quel est le sup de l'ensemble {{uneLigne['C1:type']}}"
indication1="(On écrira +oo si l'ensemble n'est pas majoré et - oo si l'ensemble est vide)"
breponse1=uneLigne['C5:sup']

question2="Donner un majorant de l'ensemble {{uneLigne['C1:type']}}"
indication1="(On écrira +oo si l'ensemble n'est pas majoré et - oo si l'ensemble est vide)"
breponse2=uneLigne['C5:sup']

question3="L'ensemble {{uneLigne['C1:type']}} a-t-il un plus grand élément ?"
indication3="(On écrira le texte oui ou le texte non)"
if uneLigne['C5:sup'] ==' +':
 breponse3="oui"
else:
 breponse3="non"

inviteSuite="Valider permet de répondre à la question {{iQuestion}}"
==

text==#|markdown|

<p><strong>Question {{iQuestion}}</strong></p>
<p>Quel est le sup de l'ensemble {{uneLigne['C1:type']}} càd {{uneLigne['C2:Partie de $%R%$']}}</p>

<p>{{inviteSuite}}</p>
==
form==
{{mathinput|component}}
==
evaluator==#|python|
if nbQuestion > 0 :
 # premiere question
 if nbQuestion==3:
   if bReponse3 == inputbox.value:
    nbbr += 1 
    grade = (100, f'<span class="success-state">Good 👏👏👏 </span> <span > {nbbr}/{nbQuestion} </span>')
   else:
    grade = (0, f'<span class="error-state">Bad answer</span> <br/><span >{text}<br> la bonne réponse  était : {bReponse3}  {nbbr}/{nbQuestion} </span>')
   text="<p><strong>Question {{iQuestion}}</strong></p> \
    <p>{{question2}} càd {{uneLigne['C2:Partie de $%R%$']}}</p> \
    <p>{{inviteSuite}}</p>question2"
 in
 # seconde question
 if nbQuestion==2:
   if bReponse2 == inputbox.value:
    nbbr += 1 
    grade = (100, f'<span class="success-state">Good 👏👏👏 </span> <span > {nbbr}/{nbq} </span>')
   else:
    grade = (0, f'<span class="error-state">Bad answer</span> <br/><span >{text}<br> la bonne réponse  était : {bReponse2}  {nbbr}/{nbQuestion} </span>')
   text="<p><strong>Question {{iQuestion}}</strong></p> \
    <p>{{question3}} càd {{uneLigne['C2:Partie de $%R%$']}}</p>"

 # premiere question
 if nbQuestion==1:
   if bReponse1 == inputbox.value:
    nbbr += 1 
    grade = (100, f'<span class="success-state">Good 👏👏👏 </span> <span > {nbbr}/{nbq} </span>')
   else:
    grade = (0, f'<span class="error-state">Bad answer</span> <br/><span >{text}<br> la bonne réponse  était : {bReponse1}  {nbbr}/{nbQuestion} </span>')
   text="<p><strong>Question {{iQuestion}}</strong></p> \
    <p>{{question1}} càd {{uneLigne['C2:Partie de $%R%$']}}</p>"
 # boucle sur les 3 questions
 nbQuestion -= 1
 iQuestion += 1
 #text, sol = question()
else:
  if nbbr == nbQuestion :
    grade = (100, f'<span class="success-state">BRAVO!tout est bon 👏👏👏 </span> <span > {nbbr}/{nbQuestion} </span>')
  else:
    grade = (-nbbr/nbq, f'<span class="error-state">Quelques bonnes réponses tout de même ?? = {nbbr}/{nbQuestion} </span>')

  # réinitialisation des alea mais aussi des définitions
  uneLigne=random.choice(listeBornesup)
  nbQuestion = 3
  iQuestion = 1
  text=""
  form=""
==
