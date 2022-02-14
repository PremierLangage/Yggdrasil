extends = /model/math/math.pl
extends = /model/basic/temp.pl

jinja_keys = ["inputblock", "question", "solution"]

before_scripts = ["mathimport", "init_input", "before"]
eval_scripts = ["evaluator"]

input_prefix = Réponse :
keypad = []
embed =

title = Title

init_input ==
from mathinput import MathInput
input = MathInput()
input.set_keypad(keypad)
input.value = ""
input.prefix = input_prefix
input.keypad = keypad
input.type = input_type
# embed = embed.replace("#", r"\MathQuillMathField{}")
==

before ==
sol = 0
==

solution ==
<div style="display: block">
{{ input_prefix }} 
$! {{ sol|latex }} !$
</div>
==

evaluator ==
from mathinput import MathInput
MathInput.message = message
==

auto_eval ==
input.value = answers[input.id]
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
  return true;
}
</script>
==

javascript.popover ==
<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
</script>
==

extends = messages_math.pl