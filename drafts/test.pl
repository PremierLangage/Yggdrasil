@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = TITLE

before==
==

text ==
Instruction
==

form ==
<p> Réponse : <span id="math-field" style="font-size:14pt;padding: 0.2em;"></span></p>

<input type="text" id="form_math" hidden=true>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.js" type="text/javascript"></script>

<script>

function onReadyPL(nodes) {
    console.log('ready');
    const submit = document.querySelector('.action-submit');
    console.log(submit);
    submit.addEventListener('click', () => {
        alert('click');
    });
}
</script>

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
==

evaluator ==
grade=(100,"OKOK")
==



