extends = /model/math/input.pl

before_scripts = ["mathimport", "init_input", "before", "process"]

templates.inputblock ==
{% for input in inputs %}
<div style="display: block; margin-bottom: 1em;">
{{ prefixes[loop.index0] }} 
{{ input|mathinput }}
</div>
{% endfor %}
==

init_input ==
from mathinput import MathInput
==

process ==
from jinja_env import Env
inputblock = Env.from_string(templates['inputblock']).render(globals())
==

evaluator ==
from jinja_env import Env
from mathinput import MathInput
MathInput.message = message

def average(lst):
    return sum(lst)/len(lst)

for input in inputs:
    input.value = answers[input.id] # HACK
    input.eval()

if -1 in [input.score for input in inputs]:
    score = -1
    for input in inputs:
        if input.score == -1:
            input.display_feedback()
        else:
            input.hide_feedback()
        inputblock = "toto" #Env.from_string(templates['inputblock']).render(globals())
else:
    score = int(average([input.score for input in inputs]))
    for input in inputs:
        input.display_feedback()
        input.disable()
        inputblock = Env.from_string(templates['inputblock']).render(globals())
x = y
==

solution ==
{% for input in inputs %}
<div style="display: block; margin-bottom: 1em;">
{{ prefixes[loop.index0] }} 
$! {{ input.sol|latex }} !$
</div>
{% endfor %}
==