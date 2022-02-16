@ /builder/before1.py [builder.py]
@ /grader/evaluator1.py [grader.py]
@ /utils/builderlib.py

@ /model/math/jinja_math.py [jinja_env.py]
@ /model/math/json_math.py [json_encoder.py]
@ /utils/components/mathinput/mathinput.py
@ /utils/components/mathinput/mathinput.html
@ /utils/sympy/evalsympy.py
@ /utils/sympy/latex2sympy.py
@ /utils/sympy/sympy2latex.py
@ /utils/sympy/randsympy.py
@ /utils/graphics/plmpl.py
@ /utils/plrandom.py

before_scripts % ["mathimport", "headerbefore", "before", "footerbefore", "process"]
text =
form = 
latexsettings.ln_notation = True
latexsettings.inv_trig_style = full

mathimport ==
from sympy import E, I, pi, oo
from sympy import sqrt, Abs, sin, cos, tan, exp, ln
from sympy import Symbol, symbols, var
from sympy import sympify, simplify, Lambda
from sympy import Integer, Rational, Poly, FiniteSet, Tuple, Interval
from sympy import integrate
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from sympy2latex import latex
from latex2sympy import latex2sympy
==

style.basic =@ /model/basic/basic.css.html

style.mathquill =@ /utils/components/mathinput/mathinput.css.html

javascript.mathinput ==
<script>
// Active les popovers.
$(function () {
  $('[data-toggle="popover"]').popover()
})

// Fonction appelée quand l'exercice est soumis (bouton valider).
function onBeforeSubmitPL() {
  // Copie les valeurs des champs MathField dans des éléments input.
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

