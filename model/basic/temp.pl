# HACK pour modifier l'apparence de la page html de l'exercice

style.page == #|css|
<style>

.exercise__header{
  padding-top: 0.5em;
  padding-bottom: 0.5em;
}

.exercise__instructions{
  display: none;
}

.exercise__body{
  padding-top: 0.5em;
  padding-bottom: 0.5em;
}

.exercise__title {
   font-size: 20px;
}

.exercise__actions .btn-group {

   display: none;
}

.action-save {
   display: none;
}
.action-reset {
   display: none;
}
.action-next {
   display: none;
}
.action-download-env {
   display: none;
}

.neutral-state {
  border: 1px solid transparent;
  border-radius: 0.25rem;
  color: #6c757d !important;
  border-color: #6c757d !important;
}
</style>
==

javascript.onreadypl == #|js|
<script>
function onReadyPL(nodes) {
    const actions = nodes.actions;
    const body = nodes.body;
    const buttons = actions.find('.btn-group');
    const { origin, pathname }  = document.location;
    const link = origin + pathname;

    actions.find('.action-save').remove();
    actions.find('.action-reset').remove();
    actions.find('.action-next').remove();
    actions.find('.action-download-env').remove();
    actions.find('.action-submit').remove();

    actions.prepend('<hr class="border">');
    actions.find('br').remove();
    body.children('br').remove();

    {% if score >=0 %}
    actions.append(`<a type="button" class="btn btn-primary action-reroll" href="`+link+`?action=reroll"> Nouveau</a>`);
    {% else %}
    buttons.append('<button class="btn btn-primary action-submit"><span class="ion-hide-md-down">Valider</span></button>');
    {% endif %}    
    {% if score == 100 %}
    actions.append('<button type="button" style="float: right;" class="btn success-state animated pulse">Score : {{score}} </button>');
    {% endif %}
    {% if score >= 0 and score < 100 %}
    actions.append('<button type="button" style="float: right;" class="btn neutral-state animated pulse">Score : {{score}} </button>');
    {% endif %}
}
</script>
==