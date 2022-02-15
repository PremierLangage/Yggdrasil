extends = input2.pl

inputblock ==
{% for input in inputs %}
<div style="display: block; margin-bottom: 1em;">
{{ prefixes[loop.index0] }} 
{{ input|mathinput }}
</div>
{% endfor %}
==

evaluator ==
from mathinput import MathInput
MathInput.message = message

def average(lst):
    return sum(lst)/len(lst)

for input in inputs:
    input.value = answers[input.id]
    input.eval()

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
==