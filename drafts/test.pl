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

==

extrajs==

<script>
function onReadyPL(nodes) {
    const submit = nodes.submit;
    submit.click(() => {
        alert('beforevalidate');
    });
}

function onBeforeSubmitPL() {

    return true; // return false to cancel submit
}
</script>
==

evaluator ==
grade=(100,"OKOK")
==



