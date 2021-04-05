extends = /model/math/math.pl

@ /model/namespace/namespace_void.py [namespace.py]



jinja_keys % ["text", "solution"]

title = 

text = 

input_prefix = Réponse :

form ==

<p>{{input_prefix}} <span id="math-field" style="font-size:14pt;padding: 0.2em;"></span></p>
<input type="text" id="form_math" hidden=true><br>
</script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.js" type="text/javascript"></script>

<script>
var MQ = MathQuill.getInterface(2);
var mathFieldSpan = document.getElementById('math-field');
var latexSpan = document.getElementById('form_math');
var mathField = MQ.MathField(mathFieldSpan, {
  spaceBehavesLikeTab: true, // configurable
  leftRightIntoCmdGoes: 'up',
  restrictMismatchedBrackets: true,
  sumStartsWithNEquals: true,
  supSubsRequireOperand: true,
  charsThatBreakOutOfSupSub: '+-=<>',
  autoSubscriptNumerals: true,
  autoCommands: 'pi theta sqrt sum infty emptyset',
  autoOperatorNames: 'sin cos ln exp',
  maxDepth: 10,
  handlers: {
    edit: function() { // useful event handlers
      latexSpan.value = mathField.latex(); // simple API
    }
  }
});
mathField.latex(" {{ prev_value }} ");
</script>
==

settings.feedback = rightwrong

settings.maxattempt % 1

evaluator ==
score, error = eval_expr(answers['math'], sol)
feedback = message[error]
==

headerbefore ==
import random as rd
from random import choice, sample
from plrandom import randint
from randsympy import randint_complex, randint_poly

from sympy import var, symbols, Symbol
from sympy import E, I, pi
from sympy import sqrt, sin, cos, tan, exp, ln
from sympy import FiniteSet, Intersection, ProductSet
from sympy import Integer, Rational
==

