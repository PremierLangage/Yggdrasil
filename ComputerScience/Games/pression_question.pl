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
// find the node c-hint inside the dom
// we use direclty the selector c-hint since
// we know that there is only one element on the page
// with the selector c-hint. For an exercise where
// there is multiple components of the same type example multiple hints.
// the argument of querySelector should be the string '[cid=THE_CID_OF_THE_COMPONENT]'
// in this way the function will search the element on the page with the attribute
// cid = THE_CID_OF_THE_COMPONENT.
// As explained from the doc when you write {{ hint|component }} the framework will
// replace it with <c-hint cid="{{ hint.cid }}"></hint>. If you replace the sugar syntactic version
// by the generated version you will get the same behavior.
const hint = document.querySelector('c-hint');

if (hint.consumedCount < hint.items.length) {
    hint.items.forEach(e => e.css = ''); // disable the animations of all the elements
    const item = hint.items[hint.consumedCount++];
    item.consumed = true;
}
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

remaining = countdown.time
mark = min(25*(remaining // 5), 100)
countdown.hidden = True

# We accept 3 typos at most from the two following strings
if levenshtein(inputbox.value, "globale") <= 3 or levenshtein(inputbox.value, "variable globale") <= 3:
    grade = (mark, "Bien vu ! Vous avez deviné en utilisant "+ str(counter) +" indice(s).")
else:
    grade = (mark, "Désolé ! On parlait de variable globale.")

countdown.hidden = True

==




