extends = ../templates/base.pl

maxattempt = 3

before== #|py|

from automaton import Automaton
from generator import Generator

automaton = Automaton.rand(4, 3, 3)
viewer = Automaton.viewer(automaton)
checkbox, answers = Generator.multi_choice_question(automaton)
==

evaluator== #|py|

from evaluator import Evaluator

right, total = Evaluator.eval_multi_choice_question(
    checkbox,
    answers,
    withanswer=True
)
checkbox.disabled = True

if right == total:
    grade = (100, '<p class="success-state">Bonne réponse</p>')
else:
    grade = ((right / total) * 100, f"<p class='warning-state'>{right} / {total}</p>")
==

title= Lecture d'automates

text==
Parmi les mots suivants, lesquels sont reconnus par cet automate?
==

form ==
{{ viewer|component }}
{{ checkbox|component }}
==




