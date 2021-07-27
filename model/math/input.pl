extends = /model/math/math.pl
extends = /model/basic/temp.pl

jinja_keys % ["question", "text", "inputblock", "solution", "prefix"]

keypad = []

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

tplpage =@ template.html

evaluator ==
score = 100
feedback = ""
==


embed =

prefix = Réponse :

macros ==
{% macro mathinput(name) -%}
{{ input_prefix }}
{% if embed|length > 1 %}
<div id="{{ name }}"> {{ embed }}</div>
{% else %}
{% if score == -1 %}
<div id="{{ name }}" style="min-width: 5em; font-size:14pt;padding: 0.2em;" data-toggle="popover" data-content="Some content inside the popover"></div>
{% else %}
<div id="{{ name }}" style="min-width: 5em; font-size:14pt;padding: 0.2em;"></div>
{% endif %}
{% endif %}
{% if keypad|length > 0 %}

<button type="button" class="btn btn-outline-secondary" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
<i class="fas fa-keyboard fa-2x"></i>
</button>
<div class="dropdown-menu dropdown-menu-right" style="max-width: 100px;">
{% for item in keypad %}
<button class="btn btn-sm btn-outline-secondary" onclick="mathField.{{ item.action }}('{{ item.value }}');mathField.focus()">{{ item.label|e }}</a>
{% endfor %}
</div>
{% endif %}
<input type="text" id="form_{{name}}" hidden=true>
{%- endmacro %}
==

inputblock ==
{{ mathinput("math") }}
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

.icon-check-after #mathinput::after {
    font-family: "Font Awesome 5 Free";
    color: green;
    margin-left: 0.5em;
    content: "\f00c";
    vertical-align: middle;
    font-weight: 900;
}

.icon-times-after #mathinput::after {
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

mathinputid % ["math"]

javascript.mathquill1 ==
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1-b/mathquill.min.js" type="text/javascript"></script>
<script>
var MQ = MathQuill.getInterface(2);
MQ.config({charsThatBreakOutOfSupSub: '+-=<>',
  autoCommands: 'pi theta sqrt sum infty infin emptyset',
  autoOperatorNames: 'sin cos tan ln exp cup cap',
  });


var arrayMathField = []
var preval = [];
var names = [];
{% for name in mathinputid %}
names.push("{{name}}");
var val =  String.raw`{{ answers[name] }}`;
preval.push(val);
{% endfor %}

for (let i = 0; i < names.length; i++) {
{% if embed|length > 0 %}
var mathField = MQ.StaticMath(document.getElementById(names[i]));
mathField.innerFields[0].latex(preval[i]);
{% else %}
var mathField = MQ.MathField(document.getElementById(names[i]));
mathField.latex(preval[i]);
{% endif %}
arrayMathField.push(mathField);
}
</script>
==

javascript.mathquill2 ==
<script>
function onBeforeSubmitPL() {
  // copie les valeurs des champs MathField dans des éléments input
  arrayMathField.forEach(function(mathField) {
    var mathFieldInput = document.getElementById('form_'+mathField.el().id);
    if (mathField instanceof MQ.MathField) {
      mathFieldInput.value = mathField.latex();
    }
    if (mathField instanceof MQ.StaticMath) {

    mathFieldInput.value = mathField.innerFields[0].latex();

  });
  return true;
}
</script>
==


extends = messages_math.pl
