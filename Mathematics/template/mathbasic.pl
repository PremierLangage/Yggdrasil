@ /utils/sandboxio.py
@ /utils/plrandom.py [plrandom.py]
@ /utils/utilsmath2.py [utilsmath.py]
@ /utils/keyboards.JSON [keyboards.JSON]
@ /builder/mathbefore.py [builder.py]
@ /grader/mathevaluator.py [grader.py]

title = Title

maxattempt=1

text =
form =
before =
evaluator =


extrajs==
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
        {% if score >-1 %}
        const submit = actions.find('.action-submit');
        submit.hide();
        {% endif %}
    }
</script>
==
