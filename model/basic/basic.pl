title =

@ /builder/before1.py [builder.py]
@ /grader/evaluator1.py [grader.py]
@ /utils/builderlib.py
@ /utils/plrandom.py
@ /utils/plcsv.py

@ /model/basic/jinja_basic.py [jinja_env.py]
@ /model/basic/json_basic.py [json_encoder.py]

importfunc == #|python|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

form = 
text = 

tplpage ==
{{question}}

{{ inputblock|safe }}
==

settings.maxattempt % 1

style.basic == #|css|
<style>
.icon-check-after p::after {
    font-family: "Font Awesome 5 Free";
    color: #155724;
    margin-left: 1em;
    content: "\f00c";
    vertical-align: middle;
    font-weight: 900;
}

.icon-times-after p::after {
    font-family: "Font Awesome 5 Free";
    color: #721c24;
    margin-left: 1em;
    content: "\f00d";
    vertical-align: middle;
    font-weight: 900;
}

.icon-check-before p::before {
    font-family: "Font Awesome 5 Free";
    color: #155724;
    margin-right: 1em;
    content: "\f00c";
    vertical-align: middle;
    font-weight: 900;
}

.icon-times-before p::before {
    font-family: "Font Awesome 5 Free";
    color: #721c24;
    margin-right: 1em;
    content: "\f00d";
    vertical-align: middle;
    font-weight: 900;
}

.error-text-unit {
    background-color: #f2dede;
    color: #a94442;
    text-decoration: line-through #a94442;
}

.success-text-unit {
    background-color: #dff0d8;
    color: #3c763d;
}

.missed-text-unit {
    color: #3c763d;
    text-decoration: underline wavy #3c763d;
}

.highlight-state {
    color: var(--brand-color-primary);
    background-color: #cce5ff;
}

.row {
  display: flex;
}

.column {
  flex: 50%;
}
</style>
==

javascript.ready ==
<script>
    function onReadyPL(nodes) {
        const actions = nodes.actions;
        const feedback = nodes.feedback;
        actions.find('.action-save').remove();
        actions.find('.action-reset').remove();
        actions.find('.action-next').remove();
        actions.find('.action-download-env').remove();

        const { origin, pathname }  = document.location;
        const link = origin + pathname;

        const buttons = actions.find('.btn-group');

        {% if internals.attempt > settings.maxattempt %}
        actions.find('.action-submit').remove();
        buttons.append(`<a type="button"  class="btn btn-primary action-reroll" href="`+link+`?action=reroll"><i class="fas fa-dice"></i> Nouveau</a>`);
        {% endif %}
        actions.prepend('<hr class="border">');
        actions.find('br').remove();
        {% if score == 100 %}
        actions.append('<button type="button" style="float: right;" class="btn success-state animated pulse">Score : {{score}} </button>');
        {% endif %}
        {% if score == 0 %}
        actions.append('<button type="button" style="float: right;" class="btn error-state animated pulse">Score : {{score}} </button>');
        {% endif %}
   }
</script>
==

style.test ==
<style>
.exercise__title {
   font-size: 20px;
}

.exercise__instructions p {
   font-size: 16px !important;
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

.mq-disabled {
pointer-events: none;
background-color: lightgrey;
}
</style>
==