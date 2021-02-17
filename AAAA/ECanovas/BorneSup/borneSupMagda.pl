
extends=/model/basic.pl

title= Borne Sup

@ bornesup.csv
@ genQuest.py



before ==#|python|

from genQuest import initDonnees, question

uneLigne=initDonnees()

# ENCHAINEMENT Exercice à 3 questions puis reboucle
nbQuestion=3
iQuestion=1
# nombre de bonnes réponses
nbbr=0

intituleQuestion, indicQuestion, bReponse = question(1,uneLigne)

==

text==#|markdown|
<p><strong>Question {{iQuestion}} sur {{nbQuestion}}</strong></p>
<p>{{intituleQuestion}} </p>
==
form==
{{ input|component}}
==

evaluator==

from genQuest import initDonnees,question

if iQuestion <= nbQuestion:

  if bReponse == input.value:
    nbbr += 1 
    grade = (100, f'<span class="success-state">Good 👏👏👏 </span> <span > {nbbr}/{nbQuestion} </span>')
  else:
    grade = (100, f'<span class="error-state">Bad answer</span> <br/><span >{text}<br> la bonne réponse  était : {bReponse} score {nbbr}/{nbQuestion} </span>')
 
  # boucle sur les 3 questions
  iQuestion += 1

  intituleQuestion, indicQuestion, bReponse = question(iQuestion,uneLigne)
  text=f'<p><strong>Question {iQuestion} sur {nbQuestion}</strong></p><p>{intituleQuestion}</p>'
  #form="{{ input|component}}"

else:
  if nbbr == nbQuestion:
    grade = (100, f'<span class="success-state">BRAVO!tout est bon 👏👏👏 </span> <span > {nbbr}/{nbQuestion} </span>')
  else:
    grade = (0, f'<span class="error-state">Quelques bonnes réponses tout de même ?? = {nbbr}/{nbQuestion} </span>')

  # réinitialisation des alea mais aussi des définitions
  from genQuest import initDonnees,question
  uneLigne=initDonnees()
  nbQuestion=3
  iQuestion=1
  intituleQuestion, indicQuestion, bReponse = question(1,uneLigne)
  text=f'<p><strong>Question {iQuestion} pic {nbQuestion}</strong></p><p>{intituleQuestion}</p>'

==
