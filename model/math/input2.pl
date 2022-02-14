extends = /model/math/math.pl
extends = /model/basic/temp.pl

jinja_keys = ["inputblock", "question", "solution"]

before_scripts = ["mathimport", "init_input", "before"]
eval_scripts = ["auto_eval", "evaluator"]

input_prefix = Réponse :
keypad = ["+infty", "-infty"]
embed =

init_input ==
from mathinput import MathInput
input = MathInput()
input.set_keypad(keypad)
input.value = ""
input.prefix = input_prefix
input.keypad = keypad
embed = embed.replace("#", r"\MathQuillMathField{}")
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