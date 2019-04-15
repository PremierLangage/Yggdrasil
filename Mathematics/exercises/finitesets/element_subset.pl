extends = /Mathematics/template/mathbasic.pl
@ /input/drop/template.html [drop_template.html]
@ /input/drop/head.html [drop_head.html]
@ /input/drag/template.html [drag_template.html]


title = Appartenance et inclusion

text ==
==

before==
inputlist=["input_1","input_2"]
==

form ==
Compléter les propositions suivantes avec les symboles {{ input_in | safe }} ou {{ input_subset | safe }}.<br>
<ul>
<li> $% 1 %$ {{ input_1 |safe }} $%\{1,2,3\}%$ </li>
<li> $% 1 %$ {{ input_2|safe }} $%\{1,2,3\}%$ </li>

</li>
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




