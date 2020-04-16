extends = ../templates/base.pl

title= 
text= 
form ==
{{ viewer|component }}
{{ checkbox|component }}
==


before== #|py|

from automaton import Automaton
from generator import Generator

automaton = Automaton.rand(4, 3, 3)
viewer = Automaton.viewer(automaton)
checkbox, answers = Generator.multi_choice_question(automaton)
==

evaluator== #|py|

from evaluator import Evaluator

nb_ok, total = Evaluator.eval_multi_choice_question(
    checkbox,
    answers,
    withanswer=True
)
checkbox.disabled = True

if nb_ok == total:
    grade = (100, '<p class="success-state">Bonne réponse</p>')
else:
    grade = ((right / total) * 100, f"<p class='warning-state'>{right} / {total}</p>")
==

