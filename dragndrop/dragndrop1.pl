@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ lib:/grader/evaluator.py [grader.py]

title = Appartenance et inclusion

text ==
Compléter les propositions suivantes avec les bons symboles.
==

before ==
==

listtags=["∊","⊂"," "]

listtags=["1","2","3","4","5","6","7","8","9","  "]


htmldrop ==
<ul>
<li>1 <span id="answer1" class="dragdrop" ondrop="drop(event)" draggable=true ondragstart="drag(event)" ondragover="allowDrop(event)">&nbsp;</span> {1,2,3}</li><br>
<li>{1} <span id="answer2" class="dragdrop" ondrop="drop(event)" draggable=true ondragstart="drag(event)" ondragover="allowDrop(event)">&nbsp;</span> {1,2}</li>
</ul>
==

form =@ form_dragndrop1.html


evaluator ==
ans1=response['answer1']
ans2=response['answer2']
if ans1=="∊" and ans2=="⊂":
    grade=(100,"Bonne réponse")
else:
    grade=(0,"Mauvaise réponse")
==





