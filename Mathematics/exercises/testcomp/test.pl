@ /grader/evaluator_v1.py [grader.py]
@ /builder/before_v1.py [builder.py]
@ /utils/builderlib.py

settings.maxattempt % 100

before== #|python|
_currentstep_ = 0
==

title == #|html|
Exercice à étapes
==

text =

before ==
currentstep = 1
steps = [step1, step2]
stepscore = []
==

input1 =: Input
input2 =: Input

# Step 1

step1.text ==
Calculer le discriminant de cette équation.
==

step1.form ==
{{ input1|component }}
==

step1.evaluator ==
if input1.value == "toto":
  score = 100
else:
  score = 0
==

step2.evaluator ==
if input2.value == "toto":
  score = 100
else:
  score = 0
==

step2.text ==
Enoncé de l'étape 2.
==
step2.form ==
{{ input2|component }}
==

jinja_keys % []

form == #|html|
{% for i in range(currentstep) %}
<a class="text-dark" style="display: block; margin-top: 1em;" data-toggle="collapse" href="#collapse{{ i }}" role="button" aria-expanded="true" aria-controls="collapse{{ i }}">
▶ Question {{ i + 1 }}
</a>
<div class="collapse show" id="collapse{{ i }}">
<p>
{{ steps[i].text }}
</p>
{{ steps[i].form |safe }}

{% if stepscore[i] == -1 %}
<a class="text-info" style="display: block; margin-top: 1em;" data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="true" aria-controls="collapseExample2">
Attention !
{% elif stepscore[i] >= 0 and stepscore[i] < 100 %}
<a class="text-danger" style="display: block; margin-top: 1em;" data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="true" aria-controls="collapseExample2">
Erreur
{% endif %}
</a>
<div class="collapse show" id="collapseExample2">
{{ feedback }}
</div>

{% if i == currentstep -1 %}
<button class="btn btn-primary btn-xs action-submit">
   <span class="ion-hide-md-down">Valider</span>
</button>
{% endif %}

</div>
{% endfor %}


==

extracss ==
<style>
.btn-group-xs > .btn, .btn-xs {
  padding: .25rem .4rem;
  font-size: .875rem;
  line-height: .5;
  border-radius: .2rem;
}

.exercise__actions .action-submit {
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


