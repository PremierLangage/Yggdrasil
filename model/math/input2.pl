
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

score = -1
feedback = "toto"
==

before ==
from mathinput import MathInput
comp = MathInput()
comp.id = "math"
comp.keypad = [{"label": "$! \\sqrt{\\phantom{x}} !$", "action": "cmd", "value": "\\sqrt"}, {"label": "$! \\infty !$", "action": "cmd", "value": "\\infty"}]

comp2 = MathInput()
comp2.id = "math2"
comp2.value = "x"
==

embed =

prefix = Réponse :


inputblock ==
{{ comp|mathinput|safe }}

{{ comp2|mathinput|safe }}
==


style.mathquill ==#|html|
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.css">
 <style>

        .btn-xs {
            font-size: 8px;
            text-align: center;
        }

.mq-disabled .mq-editable-field {
pointer-events: none;
background-color: #F5F5F5;
}

.icon-check-after .mathinput::after {
    font-family: "Font Awesome 5 Free";
    color: green;
    margin-left: 0.5em;
    content: "\f00c";
    vertical-align: middle;
    font-weight: 900;
}

.icon-times-after .mathinput::after {
    font-family: "Font Awesome 5 Free";
    color: red;
    margin-left: 0.5em;
    content: "\f00d";
    vertical-align: middle;
    font-weight: 900;
}

#math {
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
}

#btn-keypad {
  padding: 0.3em;
  border-left: none;
  outline: none !important;
  box-shadow: none;
}

.keypad {
    min-width: unset;
    padding: 0 0;
    margin: .125rem 0 0;
    font-size: 1rem;
    color: #212529;
    text-align: left;
    list-style: none;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid rgba(0,0,0,.15);
}

.default {
  min-width: 5em; 
  font-size:14pt;
  padding: 0.2em;
}

.right-border {
  border-top-right-radius: 0px !important;
  border-bottom-right-radius: 0px !important;
}

</style>
==


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