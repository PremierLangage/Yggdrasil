extends = /model/math/math.pl
extends = /model/basic/temp.pl
extends = messages_math.pl
extends = aux_mathinput.html

jinja_keys = ["prefix", "question", "solution", "inputblock"]
before_scripts = ["mathimport", "init_input", "before"]
eval_scripts = ["evalparam", "evaluator"]

prefix = Réponse :
keypad = []
embed =

title = Title

init_input ==
from mathinput import MathInput
input = MathInput()
input.set_keypad(keypad)
input.value = ""
input.type = input_type
# embed = embed.replace("#", r"\MathQuillMathField{}")
==

before ==
sol = 0
==

solution ==
<div style="display: block">
{{ prefix }} 
$! {{ sol|latex }} !$
</div>
==

evalparam ==

==

evaluator ==
from mathinput import MathInput
MathInput.message = message

input.value = answers[input.id]
input.sol = sol
input.eval()
score = input.score
input.display_feedback()
if score >= 0:
  input.disable()
==

tplpage =@ /model/basic/template2.html


inputblock ==
<div style="display: block; margin-top: 1em;">
{{ prefix }}
{{ input|mathinput }}
</div>
==