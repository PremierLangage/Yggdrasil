@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

title = Basic player

before =

text ==
* 1
* 2
* 3
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
    </div>
  </div>
</div>
==

form =

evaluator ==
grade=(100,"")
==
form ==
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<a tabindex="0" class="btn btn-outline-success my-2 my-sm-0" role="button" data-toggle="popover" data-trigger="focus" title="Mauvaise réponse !" data-content="La réponse est 17.">Valider</a>
     <span class="navbar-text">
    Score : - 
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


