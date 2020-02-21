@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

title = Basic player

before =

text ==
* 1
* 2
* 3
==

form =

evaluator ==
grade=(100,"")
==
form ==
<div class="d-flex justify-content-between">
<div>
<button class="btn btn-primary action-submit" data-toggle="popover" data-placement="top" title="Popover title" data-content="And here's some amazing content. It's very engaging. Right?">
<i class="fas fa-check"></i>
<span class="ion-hide-md-down">Valider</span>
</button>
<span class="badge badge-info">Score : 100 </span>
</div>
<div>
</div>
<div>
</div>
</div>
==
extrajs==
<style>
.btn {
    border-radius: 4px !important;
    margin: 0px 4px !important;
}
</style>


<script>

$(function () {
  $('[data-toggle="popover"]').popover()
})

    function onReadyPL(nodes) {
        const actions = nodes.actions;
        actions.find('.action-save').hide();
        actions.find('.action-reset').hide();
        actions.find('.action-next').hide();
        actions.find('.action-submit').hide();
        actions.find('.action-download-env').hide();

        const { origin, pathname }  = document.location;
        const link = origin + pathname;

        const buttons = nodes.find('.exercise__body');
        buttons.append(`

        `);
        {% if score >-1 %}
        const submit = actions.find('.action-submit');
        submit.hide();
        {% endif %}
    }
</script>
==


