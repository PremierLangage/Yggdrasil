@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Réponse
inputbox.appearance = outline


countdown % { "cid": "countdown", "selector": "c-countdown" }
countdown.time % 25
countdown.hidden % false

autoSubmit== #|js|
const btn = document.querySelector('.action-submit');
btn.click()
==

autoHint==#|js|
// This should click on hint 
const hint = document.querySelector('c-hint');
hint.consume();
==


hints % { "cid": "hints", "selector": "c-hint" }
hints.shouldConfirm % false
hints.items %=
[
    { "content": "Présente dans de nombreux langage de programmation, cette classe de stokage qualifie souvent des variables." },
    { "content": "Non thread-safe, cette classe de stockage est rarement employée à bon eiscient."  },
    { "content": "Rendant les entités visibles par tous, les programmes perdent en robustesse."},
    { "content": "Qualifiées de dégueulasses, un bon code fait tout ce qu'il peut pour les éviter."}
]
==


before== #|python|
countdown.actions = [
    { "time": 20, "action": autoHint },
    { "time": 15, "action": autoHint },
    { "time": 10, "action": autoHint },
    { "time": 5, "action": autoHint },
    { "time": 0, "action": autoSubmit }
]

==

title = Question sous pression
text ==
Nous cherchons une classe de stockage.
==

form ==
 {{ hints|component }}

 {{ countdown|component }}

 {{ inputbox|component }}
==

evaluator== #|python|


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

remaining = countdown.time
mark = min(25*(remaining // 5), 100)
countdown.hidden = True

# We accept 3 typos at most from the two following strings
if levenshtein(inputbox.value, "globale") <= 3 or levenshtein(inputbox.value, "variable globale") <= 3:
    grade = (mark, "Bien vu !")
else:
    grade = (mark, "Désolé ! On parlait de variable globale.")

countdown.hidden = True

==



