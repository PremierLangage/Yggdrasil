# Model for an exercise with a single math input field and a custom evaluation.

extends = /model/math/input0.pl

eval_scripts = ["evalparam", "getinput", "evaluator", "ending"]

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