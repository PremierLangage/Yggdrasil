# HACK pour modifier l'apparence de la page html de l'exercice

title = ""
text = ""
form = ""

style.hackpage == #|html|
<style>
.exercise__header{
  display: none;
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

.exercise__feedback {
  margin-bottom: 0px !important;
}

.exercise__actions {
  display: none;  
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
    actions.find('br').remove();
    body.children('br').remove();

    // Active les popovers.
    $(function () {
        $('[data-toggle="popover"]').popover()
    })


}
</script>
==


javascript.onbeforesubmit == #|js|
<script>
// Fonction appelée quand l'exercice est soumis (bouton valider).
function onBeforeSubmitPL() {

  // Cache les popovers avant que les éléments correspondants soient détruits du DOM.
  $(function () {
    $('[data-toggle="popover"]').popover('hide')
  });

  return true;
}
</script>
==

javascript.mathjax ==
<script type="text/x-mathjax-config">
    MathJax.Hub.Config({
        tex2jax: {
            inlineMath: [['$','$'], ['$!', '!$']],
            skipTags: ["script", "noscript", "style"],
        }
    });
</script>
==