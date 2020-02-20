@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

title = Basic player

before =

text =

form =

evaluator ==
grade=(100,"")
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
        actions.find('.action-save').hide();
        actions.find('.action-reset').hide();
        actions.find('.action-next').hide();
        actions.find('.action-submit').hide();
        actions.find('.action-download-env').hide();

        const { origin, pathname }  = document.location;
        const link = origin + pathname;

        const buttons = nodes.find('#exercise__body');
        buttons.append(`
<div class="d-flex justify-content-between">
<div>
<button class="btn btn-primary action-submit">
<i class="fas fa-check"></i>
<span class="ion-hide-md-down">Valider</span>
</button>
</div>
<div>
</div>
<div>
<span class="badge badge-info">Score : 100 </span>
</div>
</div>
        `);
        {% if score >-1 %}
        const submit = actions.find('.action-submit');
        submit.hide();
        {% endif %}
    }
</script>
==


