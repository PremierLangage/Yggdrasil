@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title=Irregular verbs

inputbox =: Input
inputbox.type = text
inputbox.appearance = outline

countdown % { "cid": "countdown", "selector": "c-countdown" }
countdown.time % 10
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
       ["sit", "sat"] ]

index_verb  = random.randint(0, len(IR)-1)

good_total = 0
verb_total = 0
verb = IR[index_verb][0]
preterit = IR[index_verb][1]
==



form==
{{ countdown|component }}

{{ inputbox |component}}

{{ good_total }} / {{ verb_total }}
==

text== 
Give the preterite of the verb ** {{ verb }} ** !
==

evaluator== #|python|
import random

verb_total += 1

if inputbox.value == preterit:
    good_total += 1
    grade = (100, '<span class="success-state">Good 👏👏👏</span>')
else:
    grade = (0, '<span class="error-state">Bad answer 👎👎👎</span>')

inputbox.value = ""
countdown.time = 10

index_verb  = random.randint(0, len(IR)-1)

verb = IR[index_verb][0]
preterit = IR[index_verb][1]

==


