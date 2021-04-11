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
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.css">
==

extrajs ==
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.js" type="text/javascript"></script>
<script>
let input;
let mathField;

function onReadyPL(nodes) {

    // HACK pour les boutons
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


    // INIT INPUT
    input = document.querySelector('#form_math');

    // INIT MATHQUILL
    const MQ = MathQuill.getInterface(2);
    const mathFieldSpan = document.getElementById('math-field');
    const latexSpan = document.getElementById('form_math');
    mathField = MQ.MathField(mathFieldSpan, {
        charsThatBreakOutOfSupSub: '+-=<>',
        autoCommands: 'pi theta sqrt sum infty emptyset cup',
        autoOperatorNames: 'sin cos ln exp',
        handlers: {
            edit: function() {latexSpan.value = mathField.latex(); }
        }
    });
    mathField.latex("{{ prev_value }}");
}

function onBeforeSubmitPL() {
    input.value = mathField.latex();
    return true;
}

</script>
==

settings.feedback = rightwrong

settings.maxattempt % 1

extends = messages_math.pl