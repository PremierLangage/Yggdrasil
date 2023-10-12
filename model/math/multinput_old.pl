extends = /model/math/math.pl
extends = /model/basic/temp.pl

jinja_keys = ["inputblock", "question", "solution"]


headerbefore ==
from mathinput import MathInput
==

title =

text = 

form = 

tplpage =@ /model/basic/template2.html


embed =

input_prefix = Réponse :


inputblock ==
{% for input in inputs %}
<div style="display: block; margin-bottom: 1em;">
{{ prefixes[loop.index0] }} 
{{ input|mathinput }}
</div>
{% endfor %}
==

evaluator ==
from functools import partial
def add_custom_eval(obj, func):
    'Bind a function and store it in an object'
    setattr(obj, "custom_eval", partial(func, obj))

from mathinput import MathInput
MathInput.message = message

def average(lst):
    return sum(lst)/len(lst)

from sympy import sympify
from evalsympy import eval_expr

def myeval(self):
    score0, error0 = eval_expr(self.value, self.sol, checkratsimp=checkratsimp, equality=equality, unauthorized_func=unauthorized_func, modulo=modulo, local_dict=sympify(symbol_dict))
    self.score = score0
    self.feedback = message[error0]

for input in inputs:
    input.value = answers[input.id]
    # add_custom_eval(input, myeval)
    input.eval()
    input.display_feedback()

if -1 in [input.score for input in inputs]:
    score = -1
    for input in inputs:
        if input.score == -1:
            input.display_feedback()
        else:
            input.hide_feedback()
else:
    score = int(average([input.score for input in inputs]))
    for input in inputs:
        input.display_feedback()
        input.disable()
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

  // Cache les popovers avant que les éléments correspondants soient détruits du DOM.
  $(function () {
    $('[data-toggle="popover"]').popover('hide')
  });

  return true;
}
</script>
==

javascript.popover ==
<script>
var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-toggle="popover"]'))
var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
})
</script>
==

extends = messages_math.pl
