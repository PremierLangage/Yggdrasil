@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Basic player

buttons % ["submit"]

before =

text =

form =

evaluator ==
score=-1
==

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
        {% if "save" is in buttons %}
        actions.find('.action-save').hide();
        actions.find('.action-reset').hide();
        actions.find('.action-next').hide();
        {% endif %}

        const { origin, pathname }  = document.location;
        const link = origin + pathname;

        const buttons = actions.find('.btn-group');
        {% if "save" is in buttons %}
        buttons.append(`
            <a type="button" class="btn btn-warning action-reroll" href="`+link+`?action=reroll">
                <i class="fas fa-dice"></i> Nouveau tirage
            </a>
        `);
        {% endif %}

        {% if "submit" in buttons %}
        {% if score >-1 %}
        const submit = actions.find('.action-submit');
        submit.hide();
        {% endif %}
        {% endif %}
    }
</script>
==

