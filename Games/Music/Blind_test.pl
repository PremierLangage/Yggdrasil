#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

countdown % { "cid": "countdown", "selector": "c-countdown" }
countdown.time % 33
countdown.hidden % false

autoSubmit== #|js|
const btn = document.querySelector('.action-submit');
btn.click()
==

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Le nom du groupe 
inputbox.appearance = outline


url_sample =$ Samples/back_in_black.mp3

logOnConsole==#|js|
// you may open the browser console to see the message
console.log('hello world');
==

before== #|python|
countdown.actions = [
    { "time": 0, "action": autoSubmit }
]
==

title=Bind test

text==#|html|
Vous devez trouver **le nom du groupe** interprétant originellement ce morceaux.<br /><br />


<center>
<div>
<audio controls autoplay>
  <source src="{{ url_sample }}" type="audio/mp3">
  Votre navigateur ne supporte pas la lecture du clip audio.
</audio>
</div>
</center>
==



form==#|html|
<br />
<center><b>Temps restant : </b></center>

 {{ countdown|component }}

<br />

 {{ inputbox|component}}
==

evaluator== #|python|
# I did found this relatively efficient Livenshtein distance using Numpy
import numpy as np

def levenshtein(chaine1, chaine2):
    taille_chaine1 = len(chaine1) + 1
    taille_chaine2 = len(chaine2) + 1
    levenshtein_matrix = np.zeros ((taille_chaine1, taille_chaine2))
    for x in range(taille_chaine1):
        levenshtein_matrix [x, 0] = x
    for y in range(taille_chaine2):
        levenshtein_matrix [0, y] = y
    for x in range(1, taille_chaine1):
        for y in range(1, taille_chaine2):
            if chaine1[x-1] == chaine2[y-1]:
                levenshtein_matrix [x,y] = min(
                    levenshtein_matrix[x-1, y] + 1,
                    levenshtein_matrix[x-1, y-1],
                    levenshtein_matrix[x, y-1] + 1
                )
            else:
                levenshtein_matrix [x,y] = min(
                    levenshtein_matrix[x-1,y] + 1,
                    levenshtein_matrix[x-1,y-1] + 1,
                    levenshtein_matrix[x,y-1] + 1
                )
    return (levenshtein_matrix[taille_chaine1 - 1, taille_chaine2 - 1])

if levenshtein("AC/DC", inputbox.value) <= 2:
    mark = 100
    feedback = "Vous avez trouvé la bonne réponse en " + str(33 - countdown.time) + " secondes."
    form = ""
    text = ""
else:
    mark = 0
    feedback = "Non, ce n'est pas la bonne réponse."

remaining = countdown.time
# reset timer
for e in countdown.actions:
    e['consumed'] = False

countdown.time = remaining
grade = (mark, feedback)

==