extends = /model/basic/hackpage.pl
extends = /model/basic/utils.pl

before_scripts = ["importfunc", "init", "start"]
eval_scripts = ["control", "final"]

importfunc == #|python|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

init ==
_state_ = "active"
==

title =

form = 

text = 

tplpage =@ /model/quiz/template.html

style.basic =@ /model/css/basic.css.html
style.series =@ /model/tplpage/quiz.css.html


intro ==
Début de la série
==


final ==
scores = []
for ex in sequence:
    scores.append(ex.eval())
    ex.disable()
    ex.display_feedback()
    ex.input.display_feedback()

score = sum(scores) // len(scores)
_state_ = "grade"
==

