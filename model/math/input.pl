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

input_embed =

input_prefix = 


linksolution ==
<br><br>
<p>
<a class="text-success" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
  Solution
</a>
</p>

<div class="collapse" id="collapseExample">
{{ solution }}
</div>
== 


form ==
{{ input_prefix }}
{% if input_embed|length > 1 %}
<div id="math-field"> {{ input_embed }}</div>
{% else %}
<div id="math-field" style="min-width: 5em; font-size:14pt;padding: 0.2em;"></div>
{% endif %}
{% if keypad|length > 0 %}

<div class="btn-group">
  <button type="button" class="btn btn-sm btn-outline-primary" style="margin-left: 0.5em" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
<math><msqrt><mi>x</mi></msqrt></math>
  </button>
<div class="dropdown-menu dropdown-menu-right" style="max-width: 100px;">
{% for item in keypad %}
<button class="btn btn-sm btn-outline-secondary" onclick="mathField.{{ item.action }}('{{ item.value }}');mathField.focus()">{{ item.label }}</a>
{% endfor %}
</div>
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
var mathField = MQ.StaticMath(mathFieldSpan);
mathField.innerFields[0].latex("{{ prev_value }}");
{% else %}
var mathField = MQ.MathField(mathFieldSpan);
mathField.latex("{{ prev_value }}");
{% endif %}
$('#math-field').popover({placement: "top"}); 

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


<script>
    function onReadyPL(nodes) {
        const actions = nodes.actions;
        actions.find('.action-save').remove();
        actions.find('.action-reset').remove();
        actions.find('.action-next').remove();
        actions.find('.action-download-env').remove();

        const { origin, pathname }  = document.location;
        const link = origin + pathname;

        const buttons = actions.find('.btn-group');

        {% if "reroll2" in internals.buttons %}
        buttons.append(`
            <a type="button" class="btn btn-warning action-reroll" href="`+link+`?action=reroll">
                <i class="fas fa-dice"></i> Nouveau tirage
            </a>
        `);
        {% endif %}
        {% if not "submit" in internals.buttons %}
        actions.find('.action-submit').remove();
        buttons.append(`<a type="button"  class="btn btn-warning action-reroll" href="`+link+`?action=reroll"><i class="fas fa-dice"></i> Nouveau</a>`);
        {% endif %}
        {% if input_embed|length > 0 %}
        mathField.reflow();
        {% endif %}
        {% if score == -1 %}
        $('#math-field').data('popover').options.content = "{{feedback}}";
        $('#math-field').popover('show');
        {% else %}
          //actions.find('.action-submit').popover({content: "Coucou !", placement: "top"}); 
          //actions.find('.action-submit').popover('show');  
        {% endif %}
        {% if score == -1 %}
        actions.append('<button type="button" id="btn-score" style="float: right;" class="btn btn-outline-secondary">Score : - </button>');
        {% endif %}
        {% if score == 100 %}
        actions.append('<button type="button" id="btn-score" style="float: right;" class="btn btn-outline-secondary success-state animated pulse">Score : {{score}} </button>');
        {% endif %}
        {% if score == 0 %}
        actions.append('<button type="button" id="btn-score" style="float: right;" class="btn btn-outline-secondary error-state animated pulse">Score : {{score}} </button>');
        {% endif %}
   }
</script>
==

style.test ==
<style>

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
</style>
==

settings.maxattempt % 1

extends = messages_math.pl
