extends = /Mathematics/template/mathbasic.pl
drop_template =@ /input/drop/template.html
drop_head =@ /input/drop/head.html
drag_template =@ /input/drag/template.html
drag_head =

title = Appartenance et inclusion

text ==
Compléter les propositions suivantes avec les bons symboles.
==

form ==
$% 1 %$ {{ input_1 | safe }} $%\{1,2,3\}%$
<br>
$% \{1\} %$ {{ input_2 | safe }} $%\{1,2,3\}%$

<br>
<br>
Symboles : {{ input_in | safe }} {{ input_subset | safe }}
==

input.1.type = drop
input.2.type = drop
input.1.style = width: 3em; height: 2em
input.2.style = width: 3em; height: 2em
input.1.display =
input.2.display =

input.in.type = drag
input.subset.type = drag
input.in.style = width: 3em; height: 2em
input.subset.style = width: 3em; height: 2em
input.in.display = $$\in$$
input.subset.display = $$\subset$$

evaluator ==
score=100
feedback=answer
==

