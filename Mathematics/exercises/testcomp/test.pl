@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

before== #|python|
==

evaluator== #|python|
form = form+step2
grade = (100, 'OK')
==



title== #|html|
==

text== #|html|
==

form== #|html|
<a class="text-success" style="display: block; margin-top: 1em;" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
  Step 1
</a>
<div class="collapse" id="collapseExample">
Text 1
<button class="btn btn-primary btn-sm action-submit">
    <i class="fas fa-check"></i>
    <span class="ion-hide-md-down">Valider</span>
</button>
</div>
==

step2 ==
<a class="text-success" style="display: block; margin-top: 1em;" data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample">
  Step 2
</a>
<div class="collapse" id="collapseExample2">
Text 2
<button class="btn btn-primary btn-sm action-submit">
    <i class="fas fa-check"></i>
    <span class="ion-hide-md-down">Valider</span>
</button>
</div>
==


