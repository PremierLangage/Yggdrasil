@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

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

step1.text ==
Enoncé de l'étape 1.
==

step2.text ==
Enoncé de l'étape 2.
==

form== #|html|
{% for i in range(currentstep) %}
<a class="text-success" style="display: block; margin-top: 1em;" data-toggle="collapse" href="#collapse{{ i }}" role="button" aria-controls="collapse{{ i }}">
  Step {{ i + 1 }}
</a>
<div class="collapse" id="collapse{{ i }}">
<p>
{{ steps[i].text}}
</p>
<button class="btn btn-primary btn-sm action-submit">
    <i class="fas fa-check"></i>
    <span class="ion-hide-md-down">Valider</span>
</button>
</div>
{% endfor %}
==



