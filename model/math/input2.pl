
extends = /model/math/math.pl
extends = /model/basic/temp.pl

jinja_keys = ["text", "inputblock", "solution", "prefix"]

keypad = []


question ==
{{ score }}
==

process ==

embed = embed.replace("#", r"\MathQuillMathField{}")

predefined_keypad = {
    "emptyset": {"label": "$! \\varnothing !$", "action": "cmd", "value": "\\empty"},
    "cup": {"label": "$! \\cup !$", "action": "cmd", "value": "\\cup"},
    "sqrt": {"label": "$! \\sqrt{\\phantom{x}} !$", "action": "cmd", "value": "\\sqrt"},
    "infty": {"label": "$! \\infty !$", "action": "cmd", "value": "\\infty"},
    "+infty": {"label": "$! +\\infty !$", "action": "write", "value": "+\\infty"},
    "-infty": {"label": "$! -\\infty !$", "action": "write", "value": "-\\infty"}
}

for i, val in enumerate(keypad):
  if isinstance(val, str):
    keypad[i] = predefined_keypad[val]
==

title =

text = 

form = 

tplpage =@ /model/basic/template.html

evaluator ==
#comp.value = answers[comp.id]
#comp2.value = answers[comp2.id]
for obj in MathInput.instances:
  obj.value = answers[obj.id]
comp.disabled = True
comp.visual(True)
#comp.value = "4x"
score = -1
feedback = "toto"
==

before ==
from mathinput import MathInput
comp = MathInput()
comp.keypad = [{"label": "$! \\sqrt{\\phantom{x}} !$", "action": "cmd", "value": "\\sqrt"}, {"label": "$! \\infty !$", "action": "cmd", "value": "\\infty"}]
#comp.id = "toto"
comp2 = MathInput()
==

embed =

prefix = Réponse :


inputblock ==
{{ comp|mathinput|safe }}

{{ comp2|mathinput }}
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