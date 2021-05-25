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
   float: left;
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

    actions.prepend('<hr class="border">');
    actions.find('br').remove();
    body.find('br').remove();
    
    {% if score == 100 %}
    actions.append('<button type="button" style="float: right;" class="btn success-state animated pulse">Score : {{score}} </button>');
    {% endif %}
    {% if score >= 0 ans scpre < 100 %}
    actions.append('<button type="button" style="float: right;" class="btn error-state animated pulse">Score : {{score}} </button>');
    {% endif %}
    {% if score >=0 %}
    actions.find('.action-submit').remove();
    buttons.append(`<a type="button" class="btn btn-primary action-reroll" href="`+link+`?action=reroll"> Nouveau</a>`);
    {% endif %}
}
</script>
==