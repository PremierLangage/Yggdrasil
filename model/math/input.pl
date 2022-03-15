# Model for a single math input field
# with a custom evaluation

extends = /model/math/input0.pl


eval_scripts = ["evalparam", "getinput", "evaluator", "ending"]

getinput ==
from mathinput import MathInput
MathInput.message = message
input.value = answers[input.id]
==

evaluator ==
#
==

ending ==
input.score = score
input.feedback = feedback
input.display_feedback()
if score >= 0:
  input.disable()
==

solution ==
==