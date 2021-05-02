extends = /model/math/expr.pl

title = Déterminer la limite d'une fraction rationnelle

before ==
from randsympy import randint_poly
from sympy import Limit

var('x')

deg = randint(1, 3)
f = randint_poly(deg, randint(2, deg + 1), 5, "x")
deg = randint(1, 3)
g = randint_poly(deg, randint(2, deg + 1), 5, "x")

lim = Limit(f/g, x, oo)
sol = lim.doit()
==

text ==
Déterminer la limite suivante.
==

input_prefix = $! \displaystyle {{ lim|latex }} = !$


form ==
{{input_prefix}}
<span id="math-field" style="font-size:14pt;padding: 0.2em;"></span>
  <button class="btn btn-sm btn-outline-dark" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   <i class="fas fa-square-root-alt"></i>
  </button>
  <div class="dropdown-menu">
    <a class="dropdown-item" onclick="mathField.cmd('\\infty');mathField.focus()">$! \infty !$</a>
  </div>

<input type="text" id="form_math" hidden=true>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.css">
<button type="button" class="btn btn-light btn-sm"></button>

==


# HACK : Ce script JS permet de modifier la liste des boutons de contrôle.
extrajs ==
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1-b/mathquill.min.js" type="text/javascript"></script>
<script>
var MQ = MathQuill.getInterface(2);
var mathFieldSpan = document.getElementById('math-field');
var latexSpan = document.getElementById('form_math');
var mathField = MQ.MathField(mathFieldSpan, {
  charsThatBreakOutOfSupSub: '+-=<>',
  autoCommands: 'pi theta sqrt sum infty infin emptyset alpha',
  autoOperatorNames: 'sin cos ln exp',
  handlers: {
    edit: function() { // useful event handlers
      latexSpan.value = mathField.latex(); // simple API
    }
  }
});
mathField.latex("{{ prev_value }}");
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
    }

    function onBeforeSubmitPL() {
    latexSpan.value = mathField.latex();
    return true;
}
</script>
==
