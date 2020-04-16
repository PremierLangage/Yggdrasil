extends = base.pl

#* Maximum number of attempts before showing the right answer.
maxattempt = 3

#* feedback shown after a good answer.
feedback_match = Bonne réponse 
#* feedback shown after a bad answer.
feedback_nomatch = <p class="error-state">Vous avez trouvé {0} réponse(s) / {1}.</p>
#* feedback shown after a timeout.
feedback_timeout = <p class="warning-state">Voici la bonne réponse.</p>


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

viewer = Automaton.viewer(viewer)
checkbox, answers = Generator.multi_choice_question(viewer)
==

evaluator== #|py|
from evaluator import Evaluator

attempt += 1
timout = attempt >= maxattempt
score, max_score = Evaluator.eval_multi_choice_question(
    checkbox,
    answers,
    withanswer=timeout
)

if timeout and score != max_score: # timeout
    checkbox.disabled = True
    grade = (score, feedback_timeout)
else:
    if score == max_score:
        checkbox.disabled = True
        grade = (100, feedback_match)
    else:
        grade = ((score / max_score) * 100, feedback_nomatch.format(score, max_score))
==





