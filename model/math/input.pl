extends = /model/math/math.pl

title =

before ==

==

text =

jinja_keys % ["text", "solution", "input_prefix"]

input_prefix = Réponse :

form ==
<p> {{input_prefix}} <span id="math-field" style="font-size:14pt;padding: 0.2em;"></span></p>
<input type="text" id="form_math" hidden="true">
==

extracss ==
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.css">
==

extrajs ==
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<script>
let input;
let mathField;

function onReadyPL(nodes) {
    // INIT INPUT
    input = document.querySelector('#form_math');

    // INIT MATHQUILL
    const MQ = MathQuill.getInterface(2);
    const mathFieldSpan = document.getElementById('math-field');
    const latexSpan = document.getElementById('form_math');
    mathField = MQ.MathField(mathFieldSpan, {
        charsThatBreakOutOfSupSub: '+-=<>',
        autoCommands: 'pi theta sqrt sum infty emptyset',
        autoOperatorNames: 'sin cos ln exp',
        handlers: {
            edit: function() {latexSpan.value = mathField.latex(); }
        }
    });
    // mathField.latex("{{ prev_value }}");
}

function onBeforeSubmitPL() {
    input.value = mathField.latex();
    return true;
}
</script>
==


form3 ==
<p> <span id="math-field" style="font-size:14pt;padding: 0.2em;"></span></p>

<input type="text" id="form_math" hidden=true>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1-b/mathquill.min.js" type="text/javascript"></script>
<script>
var MQ = MathQuill.getInterface(2);
var mathFieldSpan = document.getElementById('math-field');
var latexSpan = document.getElementById('form_math');
var mathField = MQ.MathField(mathFieldSpan, {
  charsThatBreakOutOfSupSub: '+-=<>',
  autoCommands: 'pi theta sqrt sum infty emptyset',
  autoOperatorNames: 'sin cos ln exp',
  handlers: {
    edit: function() {latexSpan.value = mathField.latex(); }
  }
});
</script>
==

settings.feedback = rightwrong

settings.maxattempt % 1

extends = messages_math.pl