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

<script>

function onReadyPL(nodes) {
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

    console.log('ready');
    const submit = document.querySelector('.action-submit');
    console.log(submit);
    submit.addEventListener('click', () => {
        alert('click');
    });
}
</script>
==

evaluator ==
grade=(100,"OKOK")
==



