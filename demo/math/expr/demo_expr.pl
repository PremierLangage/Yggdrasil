extends = /model/math/expr.pl

title = Démonstration math/expr

before ==
var('x')
sol = x+1
==

question ==
Entrer l'expression $! {{ sol|latex}} !$.
==

inputblock ==
{{ mathinput("math") }}
{{ mathinput("math2") }}
==

mathinputid = ["math", "math2"]

javascript.mathquill1 ==
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1-b/mathquill.min.js" type="text/javascript"></script>
<script>
var MQ = MathQuill.getInterface(2);
MQ.config({charsThatBreakOutOfSupSub: '+-=<>',
  autoCommands: 'pi theta sqrt sum infty infin emptyset alpha textS',
  autoOperatorNames: 'sin cos ln exp lol Hz',
  });


var arrayMathField = []
var names = {{ mathinputid }};

for (let name of names) {
{% if input_embed|length > 0 %}
let mathField = MQ.StaticMath(document.getElementById(name));
mathField.innerFields[0].latex(preval.name);
{% else %}
let mathField = MQ.MathField(document.getElementById(name));
mathField.latex(preval.name);
{% endif %}
arrayMathField.push(mathField);
}
</script>
==
