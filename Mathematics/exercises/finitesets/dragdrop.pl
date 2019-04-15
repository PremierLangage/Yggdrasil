extends = /Mathematics/template/mathbasic.pl
@ /input/drop/template.html [drop_template.html]
@ /input/drag/template.html [drag_template.html]
@ /input/dragdrop/head.html [dragdrop_head.html]
@ /input/dragdrop/process.py [dragdrop_process.py]

title = Appartenance et inclusion

text =

before==
inputlist=["input_1","input_2"]
==

form ==
Compléter les propositions suivantes avec les symboles {{ input_1_in | safe }} ou {{ input_1_subset | safe }}.<br>
<ul>
<li> $% 1 %$ {{ input_1_1 |safe }} $%\{1,2,3\}%$ </li>
<li> $% 1 %$ {{ input_1_2|safe }} $%\{1,2,3\}%$ </li>
</li>
==


input.1.type = dragdrop
input.1.drag = {'in':'$$\in$$','subset':'$$\subset$$'}
input.1.drop = ['1','2']
 

evaluator ==
score=100
feedback=answer
==

