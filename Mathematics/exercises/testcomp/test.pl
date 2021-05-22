@ /grader/evaluator2.py [grader.py]
@ /builder/before2.py [builder.py]

before== #|python|
==

evaluator== #|python|
currentstep += 1
grade = (100, ' ')
==



title== #|html|
==

text== #|html|
==

before ==
currentstep = 1
steps = [step1, step2]
==

input1 =: Input
input2 =: Input

step1.text ==
Enoncé de l'étape 1.
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

form== #|html|
{% for i in range(currentstep) %}
<a class="text-success" style="display: block; margin-top: 1em;" data-toggle="collapse" href="#collapse{{ i }}" role="button" aria-expanded="true" aria-controls="collapse{{ i }}">
  Step {{ i + 1 }}
</a>
<div class="collapse show" id="collapse{{ i }}">
<p>
{{ steps[i].text}}
</p>
{{ steps[i].form}}
<button class="btn btn-primary btn-xs action-submit">
    <i class="fas fa-check"></i>
    <span class="ion-hide-md-down">Valider</span>
</button>
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
</style>
==


