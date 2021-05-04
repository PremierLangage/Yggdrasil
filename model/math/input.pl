extends = /model/math/math.pl

jinja_keys % ["text", "solution", "input_prefix"]

input_prefix = Réponse :

before =

text =

title =

form ==

==

evaluator ==
score = 100
feedback = "blabla"
==

keypad % []


input_embed = \ln \left(\MathQuillMathField{ }\right)

form ==
{{input_prefix}}
{% if input_embed|length > 0 %}
<span id="math-field"> {{ input_embed }}</span>
{% else %}
<span id="math-field" style="min-width: 5em;font-size:14pt;padding: 0.2em;">\sum_{i=\MathQuillMathField{?}}^{\MathQuillMathField{?}}</span>
mathField.latex("{{ prev_value }}");
{% endif %}
{% if keypad|length > 0 %}
  <button type="button" class="btn btn-sm btn-outline-primary" style="margin-left: 0.5em" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
<math><msqrt><mi>x</mi></msqrt></math>
  </button>
  <div class="dropdown-menu">
{% for item in keypad %}
<button class="dropdown-item" onclick="mathField.{{ item.action }}('{{ item.value }}');mathField.focus()">{{ item.label }}</a>
{% endfor %}
  </div>
{% endif %}
<input type="text" id="form_math" hidden=true>
==

style.mathquill ==
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.css">
==

javascript.mathquill ==
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1-b/mathquill.min.js" type="text/javascript"></script>
<script>
var MQ = MathQuill.getInterface(2);
MQ.config({charsThatBreakOutOfSupSub: '+-=<>',
  autoCommands: 'pi theta sqrt sum infty infin emptyset alpha textS',
  autoOperatorNames: 'sin cos ln exp lol Hz',
  });
var mathFieldSpan = document.getElementById('math-field');
var latexSpan = document.getElementById('form_math');
{% if input_embed|length > 0 %}
var mathField = MQ.StaticMath(mathFieldSpan)
{% else %}
var mathField = MQ.MathField(mathFieldSpan)
mathField.latex("{{ prev_value }}");
{% endif %}
</script>
<script>
function onBeforeSubmitPL() {
{% if input_embed|length > 0 %}
latexSpan.value = mathField.innerFields[0].latex();
{% else %}
latexSpan.value = mathField.latex();
{% endif %}
return true;
}
</script>
==

settings.feedback = rightwrong

settings.maxattempt % 1

extends = messages_math.pl
