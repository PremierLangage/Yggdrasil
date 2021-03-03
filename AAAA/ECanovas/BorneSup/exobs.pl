

extends = /model/mathinput.pl

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
<p>{{intituleQuestion}} ?</p>
==
form==
{{ input|component}}
==

evaluator==


if bReponse == input.value:
    nbbr += 1 
    kback = f'<span class="success-state">Good 👏👏👏 </span> <span > {nbbr}/{nbQuestion} </span><p>{intituleQuestion}</p>'
    grade = (100, kback)
else:
    kback =  f'<span class="error-state">$%{input.value}%$ et {input.value}</span><span >{text}<br> la bonne réponse  était : {bReponse} </span>'
    grade = (0,kback)

==
