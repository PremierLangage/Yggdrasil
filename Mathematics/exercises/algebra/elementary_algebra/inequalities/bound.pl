extends = /Mathematics/template/mathbasic.pl
@ /input/drop/template.html [drop_template.html]
@ /input/drag/template.html [drag_template.html]
@ /input/dragdrop/head.html [dragdrop_head.html]
@ /input/dragdrop/process.py [dragdrop_process.py]
@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /input/mathexpr/template.html [mathexpr_template.html]
@ /input/mathexpr/head.html [mathexpr_head.html]

before ==

==

text ==
Soit un nombre $x$ tel que $% 0 < x \leq 3 %$. Déterminer l'encadrement le plus précis possible de $% 2 x -1%$.
==

form ==
<div style="align-items: center;display:flex">
  <div> {{ input_m }} </div>
  <div> {{ input_1_0 }} </div>
  <div> $$ 2x-1 $$ </div>
  <div> {{ input_1_1 }} </div>
  <div> {{ input_M }}  </div>
</div>

{{ input_1_leq }}{{ input_1_geq }}
==

input.m.type = mathexpr
input.m.style = min-width:1em
input.M.type = mathexpr
input.M.style = min-width:1em
input.1.type = dragdrop
input.1.drag = {'leq':'$$\leq$$','geq':'$$<$$'}
input.1.drop = {'0':'','1':''}
input.1.cloneable = yes
input.1.style = min-width:2em

evaluator==

==

