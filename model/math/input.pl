extends = /model/math/math.pl
extends = /model/basic/temp.pl

jinja_keys % ["question", "text", "inputblock", "solution", "input_prefix"]

input_prefix = Réponse :

before ==

==

title = Title

text = 

form = 

tplpage =@ template.html

evaluator ==
score = 100
feedback = "blabla"
==

input_keypad % []

input_embed =

input_prefix = Réponse :

macros ==
{% macro mathinput(name, score=0, feedback='', input_prefix='', input_embed='') -%}
{{ input_prefix }}
{% if input_embed|length > 1 %}
<div id="{{ name }}"> {{ input_embed }}</div>
{% else %}
{% if score == -1 %}
<div id="{{ name }}" style="min-width: 5em; font-size:14pt;padding: 0.2em;" data-toggle="popover" data-content="Some content inside the popover"></div>
{% else %}
<div id="{{ name }}" style="min-width: 5em; font-size:14pt;padding: 0.2em;"></div>
{% endif %}
{% endif %}
{% if input_keypad|length > 0 %}

<button type="button" class="btn btn-circle btn-sm btn-outline-primary" style="margin-left: 0.5em" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
<i class="fas fa-keyboard fa-2x"></i>
</button>
<div class="dropdown-menu dropdown-menu-right" style="max-width: 100px;">
{% for item in input_keypad %}
<button class="btn btn-sm btn-outline-secondary" onclick="mathField.{{ item.action }}('{{ item.value }}');mathField.focus()">{{ item.label }}</a>
{% endfor %}
</div>
{% endif %}
<input type="text" id="form_{{name}}" hidden=true>
{%- endmacro %}
==

inputblock ==
{{ input_prefix }}
{% if input_embed|length > 1 %}
<div id="math"> {{ input_embed }}</div>
{% else %}
{% if score == -1 %}
<div id="math" style="min-width: 5em; font-size:14pt;padding: 0.2em;" data-toggle="popover" data-content="Some content inside the popover"></div>
{% else %}
<div id="math" style="min-width: 5em; font-size:14pt;padding: 0.2em;"></div>
{% endif %}
{% endif %}
{% if input_keypad|length > 0 %}

<button type="button" class="btn btn-circle btn-sm btn-outline-primary" style="margin-left: 0.5em" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
<i class="fas fa-keyboard fa-2x"></i>
</button>
<div class="dropdown-menu dropdown-menu-right" style="max-width: 100px;">
{% for item in input_keypad %}
<button class="btn btn-sm btn-outline-secondary" onclick="mathField.{{ item.action }}('{{ item.value }}');mathField.focus()">{{ item.label }}</a>
{% endfor %}
</div>
{% endif %}
<input type="text" id="form_math" hidden=true>
==


style.mathquill ==#|html|
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.css">
 <style>
        .btn-circle.btn-sm {
            width: 30px;
            height: 30px;
            padding: 6px 0px;
            border-radius: 15px;
            font-size: 8px;
            text-align: center;
        }
.mq-disabled .mq-editable-field {
pointer-events: none;
background-color: #F5F5F5;
}

.icon-check-after p::after {
    font-family: "Font Awesome 5 Free";
    color: #155724;
    margin-left: 1em;
    content: "\f00c";
    vertical-align: middle;
    font-weight: 900;
}
</style>
==

mathinputid % ["math"]

javascript.mathquill1 ==
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1-b/mathquill.min.js" type="text/javascript"></script>
<script>
var MQ = MathQuill.getInterface(2);
MQ.config({charsThatBreakOutOfSupSub: '+-=<>',
  autoCommands: 'pi theta sqrt sum infty infin emptyset alpha textS',
  autoOperatorNames: 'sin cos ln exp lol Hz',
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
{% if input_embed|length > 0 %}
let mathField = MQ.StaticMath(document.getElementById(names[i]));
mathField.innerFields[0].latex(preval[i]);
{% else %}
let mathField = MQ.MathField(document.getElementById(names[i]));
mathField.latex(preval[i]);
{% endif %}
arrayMathField.push(mathField);
}
</script>
<script>
$(document).ready(function(){
  $('[data-toggle="popover"]').popover('show');
});
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
    }
  });
  return true;
}

</script>
==

attic ==
    {% if input_embed|length > 0 %}
    mathField.reflow();
    {% endif %}
==

settings.maxattempt % 1

extends = messages_math.pl
