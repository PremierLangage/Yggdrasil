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
<input type="text" id="form_math" hidden="false">
==

extracss==
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.css">
==

extrajs==
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.js" type="text/javascript"></script>

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
}

function onBeforeSubmitPL() {
    input.value = mathField.latex();
    return true;
}
</script>
==

evaluator ==
grade=(100,"Eval: " + response['math'])
==
