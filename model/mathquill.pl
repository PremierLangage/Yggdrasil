extends = /model/math/math.pl
@ /utils/components/mathinput.py [custommathinput.py]

input =: MathInput
input.decorator = CustomMathInput

input.virtualKeyboards = elementary

title = 

text = 

form ==
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.js" type="text/javascript"></script>
<p>Réponse : <span id="math-field" style="font-size:

14pt;padding: 0.2em;"></span></p>
<input type="text" id="form_math" name="form_math" hidden=true><br>

<script>
var MQ = MathQuill.getInterface(2);
var mathFieldSpan = document.getElementById('math-field');
var latexSpan = document.getElementById('form_math');
var oldvalue = latexSpan.value;
var MQ = MathQuill.getInterface(2); // for backcompat
var mathField = MQ.MathField(mathFieldSpan, {
  spaceBehavesLikeTab: true, // configurable
  leftRightIntoCmdGoes: 'up',
  restrictMismatchedBrackets: true,
  sumStartsWithNEquals: true,
  supSubsRequireOperand: true,
  charsThatBreakOutOfSupSub: '+-=<>',
  autoSubscriptNumerals: true,
  autoCommands: 'pi theta sqrt sum',
  autoOperatorNames: 'sin cos ln exp',
  maxDepth: 10,
  handlers: {
    edit: function() { // useful event handlers
      latexSpan.value = mathField.latex(); // simple API
    }
  }
});
mathField.latex({{answer.math}});

{% if "math" in answer %}
{% endif %}

</script>
==

settings.feedback = rightwrong

settings.maxattempt % 1

evaluator ==
score, error = eval_expr(answer['math'], sol)
feedback = message[error]
==

