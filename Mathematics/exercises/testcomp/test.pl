@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

before== #|python|
==

evaluator== #|python|
grade = (100, 'OK')
==



title== #|html|
==

text== #|html|
==

form== #|html|
<button class="btn btn-primary btn-sm action-submit">
    <i class="fas fa-check"></i>
    <span class="ion-hide-md-down">Valider</span>
</button>

<a class="text-success" style="display: block; margin-top: 1em;" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
  Solution
</a>
<div class="collapse" id="collapseExample">
{{ solution }}
<button class="btn btn-primary btn-xs action-submit">
    <i class="fas fa-check"></i>
    <span class="ion-hide-md-down">Valider</span>
</button>
</div>

==


