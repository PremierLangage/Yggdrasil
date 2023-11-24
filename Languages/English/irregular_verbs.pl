@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title=Irregular verbs

inputbox =: Input
inputbox.type = text
inputbox.appearance = outline

countdown % { "cid": "countdown", "selector": "c-countdown" }
countdown.time % 15
countdown.hidden % false

autoSubmit== #|js|
const btn = document.querySelector('.action-submit');
btn.click()
==

before== #|python|
import random

countdown.actions = [
    { "time": 0, "action": autoSubmit }
]
counter = 0

IR = [ ["begin", "began"], ["break", "broke"], ["bring", "brought"], 
       ["buy", "bought"], ["build", "built"], ["choose", "chose"],
       ["come", "came"], ["cost", "cost"], ["cut", "cut"],
       ["do", "did"], ["draw", "drew"], ["drive", "drove"],
       ["eat", "ate"], ["feel", "felt"], ["find", "found"],
       ["get", "got"], ["give", "gave"], ["go", "went"],
       ["have", "had"], ["hear", "heard"], ["hold", "held"],
       ["keep", "kept"], ["know", "knew"], ["leave", "left"],
       ["lead", "led"], ["let", "let"], ["lie", "lay"], 
       ["lose", "lost"], ["make", "made"], ["mean", "meant"],
       ["meet", "met"], ["pay", "paid"], ["put", "put"],
       ["run", "ran"], ["say", "said"], ["see", "saw"],
       ["sell", "sold"], ["send", "sent"], ["set", "set"], 
       ["sit", "sat"], ["speak", "spoke"], ["spend", "spent"],
       ["stand", "stood"], ["take", "took"], ["teach", "taught"],
       ["tell", "told"], ["think", "thought"], ["understand", "understood"],
       ["wear", "wore"], ["win", "won"], ["write", "wrote"] ]

index_verb  = random.randint(0, len(IR)-1)

good_total = 0
verb_total = 0
validated = []
verb = IR[index_verb][0]
preterit = IR[index_verb][1]
==



form==
{{ countdown|component }}

{{ inputbox |component}}

{{ good_total }} / {{ verb_total }}
==

text== 
You need to validate 20 preterit form to win 

Give the preterite of the verb **to {{ verb }} **
==

evaluator== #|python|
import random

verb_total += 1

if inputbox.value == preterit:
    good_total += 1
    validated.append(index_verb)
    grade = (0, '<span class="success-state">Good answer !</span>')
else:
    grade = (0, '<span class="error-state">No, it is <b>' + preterit + '</b>, Bad answer !</span>')

if good_total == 20:
    countdown.hidden = True
    score = 2000 // verb_total
    grade = (score, '<center><span class="success-state">Your final score '+ str(score) + '%</span></center>')
    form = ""
    text = "You validated 20 different irregular preterite forms !"
    countdown.actions = []
else:
    inputbox.value = ""
    countdown.time = 15

    index_verb  = random.randint(0, len(IR)-1)
    while index_verb in validated:
        index_verb  = random.randint(0, len(IR)-1)

    verb = IR[index_verb][0]
    preterit = IR[index_verb][1]

    countdown.actions = [ { "time": 0, "action": autoSubmit } ]
==




