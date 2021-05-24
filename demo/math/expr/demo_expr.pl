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

mathinputid % ["math", "math2"]

javascript.mathquill1 ==
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1-b/mathquill.min.js" type="text/javascript"></script>
<script>
var MQ = MathQuill.getInterface(2);
MQ.config({charsThatBreakOutOfSupSub: '+-=<>',
  autoCommands: 'pi theta sqrt sum infty infin emptyset alpha textS',
  autoOperatorNames: 'sin cos ln exp lol Hz',
  });


var arrayMathField = []
var preval = [" ", "x"];
var names = ["math", "math2"];
{% for name in mathinputid %}
names.push("{{name}}");
preval.push("{{answers[name]}}"};
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
