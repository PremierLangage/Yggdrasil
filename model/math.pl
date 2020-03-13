@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /model/serialization/serialize_sympy.py [serialize.py]
@ /model/namespace/namespace_math.py [namespace.py]
@ /utils/sympy/evalsympy.py
@ /utils/sympy/latex2sympy.py
@ /utils/sympy/sympy2latex.py
@ /utils/sympy/randsympy.py
@ /utils/plrandom.py [plrandom.py]
@ /utils/utilsmath2.py [utilsmath.py]
@ /utils/keyboards.JSON [keyboards.JSON]

title =

settings.feedback = rightwrong

settings.buttons % ["reroll","submit"]
settings.submit % true

maxattempt % 1

text ==

==

input =: MathInput

form ==
{{ input|component}}
==

before =

evaluator =


extrajs ==
<style>
.btn {
    border-radius: 4px !important;
    margin: 0px 4px !important;
}
</style>


<script>
    function onReadyPL(nodes) {
        const actions = nodes.actions;
        actions.find('.action-save').hide();
        actions.find('.action-reset').hide();
        actions.find('.action-next').hide();

        const { origin, pathname }  = document.location;
        const link = origin + pathname;

        const buttons = actions.find('.btn-group');
        buttons.append(`
            <a type="button" class="btn btn-warning action-reroll" href="`+link+`?action=reroll">
                <i class="fas fa-dice"></i> Nouveau tirage
            </a>
        `);
        {% if settings.submit %}
        const submit = actions.find('.action-submit');
        submit.hide();
        {% endif %}
    }
</script>
==

extracss==
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
table {
    margin: auto;
}
th, td {
  padding: 0.5em;
  text-align:center;
}
</style>
==





