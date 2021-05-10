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

modal ==
{% macro modaltext(score) -%}
    {% if score == 100 %}
        Bonne réponse !
    {% else %}
        Mauvaise réponse !
    {% endif %}    
{%- endmacro %}
{% macro modalclass(score) -%}
    {% if score == 100 %}
        alert-success
    {% else %}
        alert-danger
    {% endif %}  
{%- endmacro %}

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">{{ modaltext(score) }}</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    </div>
  </div>
</div>
==

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
<script>
function onAfterSubmitPL(nodes) {
$('#btn-score').innerHTML = "Score : {{score}";
{% if score >= 0 %}
//var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {backdrop: false});
//myModal.show();
{% endif %} 
}
</script>

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
                buttons.append(`
            <a type="button" class="btn btn-warning action-reroll" href="`+link+`?action=reroll">
                <i class="fas fa-dice"></i> Nouveau
            </a>
        `);
        {% endif %}
        {% if input_embed|length > 0 %}
        mathField.reflow();
        {% endif %}
        {% if score == -1 %}
          $('#math-field').popover({content: "{{ feedback }}"}); 
          $('#math-field').popover('show');
        {% else %}
          //actions.find('.action-submit').popover({content: "Coucou !", placement: "top"}); 
          //actions.find('.action-submit').popover('show');  
        {% endif %}
        actions[0].insertAdjacentHTML('beforeend', '<button type="button" id="btn-score" style="float: right;" class="btn btn-outline-secondary">Score : - </button>');

        {% if score2 == 100 %}
          actions[0].insertAdjacentHTML('beforeend', '<button type="button" style="float: right;" class="btn btn-outline-secondary success-state animated pulse">Score : {{score}}</button>');
        {% endif %}
        {% if score2 == 0 %}
          actions[0].insertAdjacentHTML('beforeend', '<button type="button" style="float: right;" class="btn btn-outline-secondary error-state animated pulse">Score : {{score}}</button>');
        {% endif %}
        {% if score2 == -1 %}
          actions[0].insertAdjacentHTML('beforeend', '<button type="button" style="float: right;" class="btn btn-outline-secondary">Score : {{score}}</button>');
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
</style>
==

settings.maxattempt % 1

extends = messages_math.pl
