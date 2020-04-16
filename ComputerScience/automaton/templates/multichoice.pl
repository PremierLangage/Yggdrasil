extends = base.pl

#* Maximum number of attempts before showing the right answer.
maxattempt = 3



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

score = -1
attempt = 0
maxattempt = int(maxattempt)
automaton = Automaton.parse(viewer) 
viewer = Automaton.viewer(automaton)
checkbox, answers = Generator.multi_choice_question(automaton)
==

evaluator== #|py|

from evaluator import Evaluator

score, max_score = Evaluator.eval_multi_choice_question(
    checkbox,
    answers,
    withanswer=True
)
checkbox.disabled = True

if score == max_score:
    grade = (100, '<p class="success-state">Bonne réponse</p>')
else:
    grade = ((score / max_score) * 100, f"<p class='warning-state'>{score} / {max_score}</p>")
==



