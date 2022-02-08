extends = /model/math/math.pl
extends = /model/basic/temp.pl

jinja_keys = ["inputblock"]

before ==
xA = randint(-5, 5)
yA = randint(-5, 5)
xB = randint(-5, 5)
yB = randint(-5, 5)
sol = sqrt((xA-xB)**2 + (yA-yB)**2)
==

question == 
Dans le plan muni d'un repère orthonormé on considère les points de coordonnées 
$! {{ (xA, yA) }} !$ et $! {{ (xB, yB) }}. !$
<br>
Quelle est la distance entre ces deux points ?
==

keypad = ["+infty", "-infty"]


process ==
embed = embed.replace("#", r"\MathQuillMathField{}")
==

title =

text = 

form = 

tplpage =@ /model/basic/template.html

evaluator ==
input.value = answers[input.id]
input.disabled = True
input.show()
==

before ==
from mathinput import MathInput
input = MathInput()
input.set_keypad(keypad)
input.value = ""
input.prefix = input_prefix
input.keypad = keypad
==

embed =

input_prefix = Réponse :


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


extends = messages_math.pl