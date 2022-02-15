extends = /model/math/math.pl
extends = /model/basic/temp.pl

jinja_keys % ["inputblock", "question", "solution", "prefix"]

before_scripts = ["mathimport", "init_input", "before"]
eval_scripts = ["evalparam", "evaluator"]

prefix = Réponse :
keypad = []
embed =

title = Title

init_input ==
from mathinput import MathInput
from jinja_env import Env
input = MathInput()
input.set_keypad(keypad)
input.value = ""
input.prefix = prefix
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
{{ input|mathinput }}
==


style.mathquill =@ /utils/components/mathinput/mathinput.css.html

javascript.mathquill2 ==
<script>
function onBeforeSubmitPL() {
  // copie les valeurs des champs MathField dans des éléments input
  Object.values(setOfMathFields).forEach(function(mathField) {
    var mathFieldInput = document.getElementById('form_'+mathField.el().id);
      mathFieldInput.value = mathField.latex();

    if (mathField instanceof MQ.StaticMath) {
      if (mathField.innerFields.length == 1) {
      mathFieldInput.value = mathField.innerFields[0].latex();
    } else {
      mathFieldInput.value = [mathField.innerFields[0].latex(),mathField.innerFields[1].latex()];
    }
    };
  });

  // Cache les popovers avant que les éléments correspondants soient détruits du DOM.
  $(function () {
    $('[data-toggle="popover"]').popover('hide')
  });

  return true;
}
</script>
==

javascript.popover ==
<script>
$(function () {
  $('[data-toggle="popover"]').popover()
})
</script>
==

extends = messages_math.pl