
extends=/model/mathinput.pl

title= Borne Sup

@ bornesup.csv
@ genQuest.py



before ==#|python|

from genQuest import question,initDonnees

#import csv
#import random

# Chargement du dictionnaire des données depuis un fichier csv
#with open("bornesup.csv", newline='') as csvfile:
#     listeBornesup=list(csv.DictReader(csvfile, delimiter=';'))

#uneLigne=random.choice(listeBornesup)

uneLigne=initDonnees()

# ENCHAINEMENT Exercice à 3 questions puis reboucle
nbQuestion=3
iQuestion=1
# nombre de bonnes réponses
nbbr=0

#question1="Quel est le sup de l'ensemble {{uneLigne['C1:type']}}"
#indication1="(On écrira +oo si l'ensemble n'est pas majoré et - oo si l'ensemble est vide)"
#bReponse1=uneLigne['C5:sup']

#question2="Donner un majorant de l'ensemble {{uneLigne['C1:type']}}"
#indication2="(On écrira +oo si l'ensemble n'est pas majoré et - oo si l'ensemble est vide)"
#bReponse2=uneLigne['C5:sup']

#question3="L'ensemble {{uneLigne['C1:type']}} a-t-il un plus grand élément ?"
#indication3="(On écrira le texte oui ou le texte non)"
#if uneLigne['C5:sup'] ==' +':
# bReponse3="oui"
#else:
# bReponse3="non"
intituleQuestion, indicQuestion, bReponse = question(1,uneLigne)
==

text==#|markdown|
<p><strong>Question {{iQuestion}}</strong></p>
<p>Quel est le sup de l'ensemble {{uneLigne['C1:type']}} càd {{uneLigne['C2:Partie de $%R%$']}}</p>
<p>{{intituleQuestion}} </p>
==

evaluator==#|python|
if nbQuestion > 0:

  if bReponse == input.value:
    nbbr += 1 
    grade = (100, f'<span class="success-state">Good 👏👏👏 </span> <span > {nbbr}/{nbq} </span>')
  else:
    grade = (0, f'<span class="error-state">Bad answer</span> <br/><span >{text}<br> la bonne réponse  était : {bReponse} score {nbbr}/{nbQuestion} </span>')
 
 # boucle sur les 3 questions
  nbQuestion -= 1
  iQuestion += 1
  #form="{{ input|component}}"
  
  intituleQuestion, indicQuestion, bReponse = question(2,uneLigne)
  text=intituleQuestion
else:
  if nbbr == nbQuestion :
    grade = (100, f'<span class="success-state">BRAVO!tout est bon 👏👏👏 </span> <span > {nbbr}/{nbQuestion} </span>')
  else:
    grade = (nbbr/nbq, f'<span class="error-state">Quelques bonnes réponses tout de même ?? = {nbbr}/{nbQuestion} </span>')

  # réinitialisation des alea mais aussi des définitions
  from genQuest import initDonnees,question
  uneLigne=initDonnees()
  nbQuestion = 3
  iQuestion = 1
  #text="<p><strong>Question {{iQuestion}}</strong></p><p>{{question1}} càd {{uneLigne['C2:Partie de $%R%$']}}</p>"
  intituleQuestion, indicQuestion, bReponse = question(3,uneLigne)
  text=intituleQuestion
==
