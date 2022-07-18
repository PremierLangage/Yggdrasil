extends = /model/math/input0.pl

before_scripts = ["mathimport", "init_input", "before", "process"]
jinja_keys = ["prefix", "question", "solution", "inputblock"]
eval_scripts = ["getinput", "evaluator", "ending"]

inputblock ==
{% for input in inputs %}
<div style="display: block; margin-bottom: 1em;">
{{ prefixes[loop.index0] }} 
{{ input|html }}
</div>
{% endfor %}
==

init_input ==
from mathinput import MathInput
==

process ==
_tpl_ = {'inputblock': inputblock}
==

getinput ==#|py|
from jinja_env import Env
from mathinput import MathInput
MathInput.message = message

def average(lst):
    return sum(lst)/len(lst)
==

evaluator ==#|py|
for input in inputs:
    input.value = answers[input.id] # HACK
    input.eval()
==

ending ==#|py|
if -1 in [input.score for input in inputs]:
    score = -1
    for input in inputs:
        if input.score == -1:
            input.display_feedback()
        else:
            input.hide_feedback()
else:
    score = int(average([input.score for input in inputs]))
    for input in inputs:
        input.display_feedback()
        input.disable()

from jinja_env import Env
inputblock = Env.from_string(_tpl_['inputblock']).render(globals())
==

solution ==
{% for input in inputs %}
<div style="display: block; margin-bottom: 0.5em;margin-top: 0.5em;">
{{ prefixes[loop.index0] }} 
$! \displaystyle {{ input.sol|latex }} !$
</div>
{% endfor %}
==

latexsettings.ln_notation = True