# HACK pour modifier l'apparence de la page html de l'exercice

style2.page == #|css|
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

.exercise__feedback {
 display: none;  
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
    actions.find('br').remove();
    body.children('br').remove();

        {% if embed|length > 0 %}
    mathField.reflow();
    {% endif %}

}
</script>
==

@ /builder/before1.py [builder.py]
@ /grader/evaluator1.py [grader.py]
@ /utils/builderlib.py
@ /model/basic/jinja_basic.py [jinja_env.py]
@ /model/basic/json_basic.py [json_encoder.py]

@ /utils/sandboxio.py

title =

keylist % [1, 2]

before ==

==

text ==
{{ keylist }}
==

form ==

==

evaluator ==
def
==

tplpage =@ /model/basic/template.html

style.basic =@ /model/basic/basic.css.html
