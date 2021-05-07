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

form ==
{{ input_prefix }}
{% if input_embed|length > 1 %}
<span id="math-field"> {{ input_embed }}</span>
{% else %}
<span id="math-field" style="min-width: 5em; font-size:14pt;padding: 0.2em;"></span>
{% endif %}
{% if keypad|length > 0 %}
<div class="btn-group">
  <button type="button" class="btn btn-sm btn-outline-primary" style="margin-left: 0.5em" data-bs-toggle="dropdown" aria-expanded="false">
<math><msqrt><mi>x</mi></msqrt></math>
  </button>
  <div class="dropdown-menu dropdown-menu-end" style="max-width: 100px;">
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
==

javascript.mathquill ==
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>

<script>
MathJax = {
  tex: {
    inlineMath: [['$', '$'], ['$!', '!$']]
  },
};
</script>
<script type="text/javascript" id="MathJax-script" async  src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js">
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
        actions.find('.action-save').hide();
        actions.find('.action-reset').hide();
        actions.find('.action-next').hide();

        const { origin, pathname }  = document.location;
        const link = origin + pathname;

        const buttons = actions.find('.btn-group');

        {% if "reroll" in internals.buttons %}
        buttons.append(`
            <a type="button" class="btn btn-warning action-reroll" href="`+link+`?action=reroll">
                <i class="fas fa-dice"></i> Nouveau tirage
            </a>
        `);
        {% endif %}
        
        {% if not "submit" in internals.buttons %}
        actions.find('.action-submit').hide();
        {% endif %}
        mathField.reflow();
    }
</script>
==

settings.feedback = rightwrong

settings.maxattempt % 1

extends = messages_math.pl
