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
const btn = document.querySelector('.c-hint');
btn.click()
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

def levenshtein(s, t):
    if s == "":
        return len(t)
    if t == "":
        return len(s)
    if s[-1] == t[-1]:
        cost = 0
    else:
        cost = 1
    
    res = min([levenshtein(s[:-1], t)+1,
               levenshtein(s, t[:-1])+1, 
               levenshtein(s[:-1], t[:-1]) + cost])
    return res

remaining = countdown.time
mark = min(25*(remaining // 5), 100)
countdown.hidden = True

if levenshtein(inputbox.value, "globale") <= 5 or levenshtein(inputbox.value, "variable globale") <= 5:
    grade = (mark, "Bien vu !")
else:
    grade = (mark, "Désolé ! On parlait de variable globale.")

countdown.hidden = True

==


