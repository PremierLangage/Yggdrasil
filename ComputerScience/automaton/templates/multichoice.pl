extends = base.pl

#* Maximum number of attempts before showing the right answer.
maxattempt = 3

#* feedback shown after a good answer.
feedback_match = 
#* feedback shown after a bad answer.
feedback_nomatch = <p class="error-state">L\'automate que vous avez construit ne correspond pas à une réponse attendue.</p>
#* feedback shown after a timeout.
feedback_timeout = <p class="warning-state">Voici la bonne réponse.</p>
#* feedback shown for a syntax error.
feedback_syntax_error = <p class="warning-state">{0}</p>


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
    withanswer=attempt >= maxattempt
)

if attempt >= maxattempt: # timeout
    checkbox.disabled = True
    grade = (score, feedback_timeout)
else:
    attempt += 1

    if score == max_score:
        grade = (100, '<p class="success-state">Bonne réponse</p>')
    else:
        grade = ((score / max_score) * 100, f"<p class='warning-state'>{score} / {max_score}</p>")
==



