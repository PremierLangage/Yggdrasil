@ /grader/evaluator2.py [grader.py]
@ /builder/before_v1.py [builder.py]
@ /utils/builderlib.py

settings.maxattempt % 100

before== #|python|
==

evaluator== #|python|
currentstep += 1
grade = (100, ' ')
==



title == #|html|
Exercice à étapes
==

text== #|html|
==

before ==
currentstep = 1
steps = [step1, step2]
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

step2.text ==
Enoncé de l'étape 2.
==
step2.form ==
{{ input2|component }}
==

jinja_keys % []

form == #|html|
{% for i in range(currentstep-1) %}
<a class="text-success" style="display: block; margin-top: 1em;" data-toggle="collapse" href="#collapse{{ i }}" role="button" aria-expanded="true" aria-controls="collapse{{ i }}">
  Step {{ i + 1 }}
</a>
<div class="collapse show" id="collapse{{ i }}">
<p>
{{ steps[i].text }}
</p>
{{ steps[i].form |safe }}
<button class="btn btn-secondary btn-xs disabled" aria-disabled="true" tabindex="-1">
 <span class="ion-hide-md-down">Valider</span>
</button>
</div>
{% endfor %}
<a class="text-success" style="display: block; margin-top: 1em;" data-toggle="collapse" href="#collapse{{ i }}" role="button" aria-expanded="true" aria-controls="collapse{{ i }}">
  Step {{ currentstep }}
</a>
<div class="collapse show" id="collapse{{ currentstep }}">
<p>
{{ steps[currentstep-1].text }}
</p>
{{ steps[currentstep-1].form |safe }}
<button class="btn btn-primary btn-xs action-submit">
 <span class="ion-hide-md-down">Valider</span>
</button>
</div>

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


