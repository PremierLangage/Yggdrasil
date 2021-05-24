extends = /model/math/math.pl

jinja_keys % ["text", "interface", "solution", "input_prefix"]

input_prefix = Réponse :

before =

text ==
==

title = Title

form ==

==

evaluator ==
score = 100
feedback = "blabla"
==

input_keypad % []

input_embed =

input_prefix = 


linksolution ==
<a class="text-success" style="display: block; margin-top: 1em;" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
  Solution
</a>
<div class="collapse" id="collapseExample">
{{ solution }}
</div>
== 

macros ==
{% macro mathinput(name, input_prefix='', input_embed='') -%}
{{ input_prefix }}
{% if input_embed|length > 1 %}
<div id="{{name}}"> {{ input_embed }}</div>
{% else %}
<div id="{{name}}" style="min-width: 5em; font-size:14pt;padding: 0.2em;"></div>
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

interface ==
{{ mathinput("math") }}
==


style.mathquill ==
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
 </style>
==



javascript.mathquill ==
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1-b/mathquill.min.js" type="text/javascript"></script>

<script>
var MQ = MathQuill.getInterface(2);
MQ.config({charsThatBreakOutOfSupSub: '+-=<>',
  autoCommands: 'pi theta sqrt sum infty infin emptyset alpha textS',
  autoOperatorNames: 'sin cos ln exp lol Hz',
  });
var mathFieldSpan = document.getElementById('math');
var latexSpan = document.getElementById('form_math');
{% if input_embed|length > 0 %}
var mathField = MQ.StaticMath(mathFieldSpan);
mathField.innerFields[0].latex("{{ prev_value }}");
{% else %}
var mathField = MQ.MathField(mathFieldSpan);
mathField.latex("{{ prev_value }}");
{% endif %}
var arrayMathField = [mathField]
</script>
<script>

</script>


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

    function onReadyPL(nodes) {
        const actions = nodes.actions;
        const feedback = nodes.feedback;
        actions.find('.action-save').remove();
        actions.find('.action-reset').remove();
        actions.find('.action-next').remove();
        actions.find('.action-download-env').remove();

        const { origin, pathname }  = document.location;
        const link = origin + pathname;

        const buttons = actions.find('.btn-group');

        {% if internals.attempt > settings.maxattempt %}
        actions.find('.action-submit').remove();
        buttons.append(`<a type="button"  class="btn btn-primary action-reroll" href="`+link+`?action=reroll"><i class="fas fa-dice"></i> Nouveau</a>`);
        {% endif %}
        {% if input_embed|length > 0 %}
        mathField.reflow();
        {% endif %}
        actions.prepend('<hr class="border">');
        actions.find('br').remove();
        {% if score == 100 %}
        actions.append('<button type="button" style="float: right;" class="btn success-state animated pulse">Score : {{score}} </button>');
        {% endif %}
        {% if score == 0 %}
        actions.append('<button type="button" style="float: right;" class="btn error-state animated pulse">Score : {{score}} </button>');
        {% endif %}
   }
</script>
==

format_feedback ==
{% if score == -1 %}
<a class="text-info" style="display: block; margin-top: 1em;" data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="true" aria-controls="collapseExample2">
Attention !
{% else %}
<a class="text-danger" style="display: block; margin-top: 1em;" data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="true" aria-controls="collapseExample2">
Erreur
{% endif %}
</a>
<div class="collapse show" id="collapseExample2">
{{ feedback }}
</div>
==

style.test ==
<style>
.exercise__title {
   font-size: 20px;
}

.exercise__instructions p {
   font-size: 16px !important;
}
.exercise__actions .btn-group {
   float: left;
}

.action-save {
   display: none;
}
.action-reset {
   display: none;
}
.action-next {
   display: none;
}
.action-download-env {
   display: none;
}

.mq-disabled {
pointer-events: none;
background-color: lightgrey;
}
</style>
==

settings.maxattempt % 1

extends = messages_math.pl
