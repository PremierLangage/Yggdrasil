@ /grader/evaluator1.py [grader.py]
@ /builder/before1.py [builder.py]
@ /utils/builderlib.py

@ /model/math/jinja_math.py [jinja_env.py]
@ /model/math/json_math.py [json_encoder.py]
@ /utils/sympy/evalsympy.py
@ /utils/sympy/latex2sympy.py
@ /utils/sympy/sympy2latex.py
@ /utils/sympy/randsympy.py
@ /utils/sympy/mplsympy.py
@ /utils/plrandom.py

title == #|html|
Exercice à étapes
==
text =
form =

tplpage =@ template.html

before ==
comp = {}
comp['id'] = "math"
comp["prefix"] = "Answer"

comp2 = {}
comp2['id'] = "math2"
comp2["prefix"] = "Answer"

from sympy import var
var('x')
expr = x**2-3*x+2
currentstep = 0
steps = [step1, step2]
stepscore = []
input1.value = "test"
radio2.set_items(["Une", "Deux", "Aucune"])
radio2.set_sol(1)
feedback = "test"
==

input1 =: Input
radio2 =: RadioGroup
@ /utils/components/scoring.py
@ /utils/components/radio.py
radio2.decorator = Radio

# Step 1
intro ==
On considère l'équation
$${{ expr|latex }}$$
==

step1.question ==
Calculer le discriminant de cette équation.
==

step1.inputblock ==
{{ comp|mathinput|safe }}
==

step1.evaluator ==
if input1.value == "toto":
  score = 100
else:
  score = 0
input1.disabled = True
==

step2.evaluator ==
radio2.eval()
radio2.disabled = True
==

step2.question ==
Combien de solutions réelles possède cette équation ?
==

step2.inputblock ==
{{ radio2|component }}
==

jinja_keys % ["intro"]

style.test ==
<style>
.btn-group-xs > .btn, .btn-xs {
  padding: .25rem .4rem;
  font-size: .875rem;
  line-height: .5;
  border-radius: .2rem;
}

.exercise__actions .action-submit {
   display: none;
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
