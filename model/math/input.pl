# Model for a single math input field
# with a custom evaluation

extends = /model/math/input0.pl


eval_scripts = ["evalparam", "getinput", "evaluator", "ending"]

getinput ==
from mathinput import MathInput
MathInput.message = message
input.value = answers[input.id]
if 'sol' in locals():
    input.sol = sol
==

evaluator ==
#
==

ending ==
if 'score' in locals():
    input.score = score
    if 'feedback' in locals():
        input.feedback = feedback
else:
    score = input.eval()
input.display_feedback()
if score >= 0:
  input.disable()
==

solution ==
==