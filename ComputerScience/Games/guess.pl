@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Réponse
inputbox.appearance = outline


hints % { "cid": "hints", "selector": "c-hint" }
hints.shouldConfirm % false
hints.items %=
[
    { "content": "donnée" },
    { "content": "locale" },
    { "content": "identificateur" },
    { "content": "conteneur" },
    { "content": "globale" }
]
==


title = Devinette

text ==
Nous cherchons une notion informatique secrète. 
==

form ==
 {{ hints|component }}

 {{ inputbox|component }}
==

evaluator== #|python|

countdown.actions = []

counter = 0
for e in hints.items:
    if 'consumed' in e:
        counter += 1

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

mark = min(25*(remaining // 5), 100)

# We accept 3 typos at most from the two following strings
if levenshtein(inputbox.value, "variable") <= 3:
    grade = (mark, "Bien vu ! Vous avez deviné en utilisant "+ str(counter) +" indice(s).")
else:
    grade = (0, "Désolé ! On parlait de variable globale.")

==


