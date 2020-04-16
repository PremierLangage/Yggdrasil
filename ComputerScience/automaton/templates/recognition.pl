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
if 'generate' not in globals():
    raise Exception('You must define a script "generate"')

exec(generate)

if 'viewer' not in globals():
    raise Exception('The script "generate" must define a variable "viewer" which is an automaton')

viewer = Automaton.viewer(viewer)
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

