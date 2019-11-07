@ /utils/sandboxio.py
@ /ComputerScience/Games/guess_data.txt
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Réponse
inputbox.appearance = outline


hints % { "cid": "hints", "selector": "c-hint" }
hints.shouldConfirm % false
hints.moreHintTitle % "+ indice supplémentaire"
hints.confirmTitle % "Utiliser un indice?"
hints.confirmNoTitle % "Non"
hints.confirmOkTitle % "Oui"
hints.items %=
[
    { "content": "donnée" },
    { "content": "locale" },
    { "content": "identificateur" },
    { "content": "conteneur" },
    { "content": "globale" }
]
==


before==#|python| 
import random

guess_file = open("guess_data.txt")
guess_file_text = guess_file.read()
text_list = map(lambda x: x, guess_file_text.split("* "))
text += str(text_list)
guess_file.close()

counter = 0
==


title = Devinette

text ==
Nous cherchons une notion informatique secrète. Devinez-la en un minimum d'essais en utilisant un minimum d'indices.
==

form ==
 {{ hints|component }}

 {{ inputbox|component }}
==

evaluator== #|python|

counter += 1
nbhints = 0
for e in hints.items:
    if 'consumed' in e:
        nbhints += 1

def levenshtein(s1, s2):
    if len(s1) < len(s2):
        return levenshtein(s2, s1)

    # len(s1) >= len(s2)
    if len(s2) == 0:
        return len(s1)

    previous_row = range(len(s2) + 1)
    for i, c1 in enumerate(s1):
        current_row = [i + 1]
        for j, c2 in enumerate(s2):
            insertions = previous_row[j + 1] + 1 # j+1 instead of j since previous_row and current_row are one character longer
            deletions = current_row[j] + 1       # than s2
            substitutions = previous_row[j] + (c1 != c2)
            current_row.append(min(insertions, deletions, substitutions))
        previous_row = current_row
    
    return previous_row[-1]

mark = int(100*((0.9)**(nbhints+counter-1)))
# We accept 3 typos at most from the two following strings
if levenshtein(inputbox.value, "variable") <= 3:
    grade = (mark, "Bien vu ! Vous avez deviné en utilisant "+ str(nbhints) +" indice(s) et " + str(counter) + " tentative(s).")
else:
    grade = (-1, "Désolé, ce n'est pas ce qui est attendu...")

==


