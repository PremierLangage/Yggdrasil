extends = /Mathematics/template/mathbasic.pl
drop_template =@ /input/drop/template.html
drop_head =@ /input/drop/head.html
drag_template =@ /input/drag/template.html
drag_head =

title = Appartenance et inclusion

text ==
==

form ==
Compléter les propositions suivantes avec les symboles {{ input_in | safe }} ou {{ input_subset | safe }}.<br>

$% 1 %$ {{ input_1 | safe }} $%\{1,2,3\}%$
<br>
$% \{1\} %$ {{ input_2 | safe }} $%\{1,2,3\}%$
==

input.1.type = drop
input.2.type = drop

input.in.type = drag
input.subset.type = drag
input.in.display = $$\subset$$
input.subset.display = $$\in$$

evaluator ==
score=100
feedback=answer
==



