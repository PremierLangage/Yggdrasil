@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

title = Exercice

before =

text ==
* 
* 
* 
==

form =

evaluator ==
grade=(100,"")
==

form ==
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<a tabindex="0" class="btn btn-outline-success my-2 my-sm-0" role="button" data-toggle="popover" data-trigger="focus" title="Mauvaise réponse !" data-content="La réponse est 17.">Valider</a>
     <span class="navbar-text">
    &nbsp; Score : 50
  </span>
   
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav ml-auto">
      <a class="nav-item nav-link" href="#">Feedback</a>
      <a class="nav-item nav-link" href="#">Nouveau tirage</a>
      <a class="nav-item nav-link" href="#">Aide</a>
      <a class="nav-item nav-link" href="#">A propos</a>
    </div>
  </div>
</nav>

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
$('.popover-dismiss').popover({
  trigger: 'focus'
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



