@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Addition posée

text ==
Effectuer l'addition posée ci-dessous. {{a0}}
==

before ==
import random as rd
a,b=100,0
while (a+b>99):
    a=rd.randint(10,89)
    b=rd.randint(10,89)
a0=str(a)[0]
a1=str(a)[1]
b0=str(b)[0]
b1=str(b)[1]
c0=str(a+b)[0]
c1=str(a+b)[1]
==

listtags=["1","2","3","4","5","6","7","8","9"]

htmlform ==
<table class="addtable">
  <tr class="numbers">
    <td></td>
    <td>4</td>
    <td>1</td>
  </tr>
  <tr class="numbers">
    <td>+</td>
    <td>3</td>
    <td>2</td>
  </tr>
  <tr style="border-bottom:1px solid black">
    <td colspan="100%"></td>
  </tr>
  <tr class="numbers">
    <td></td>
    <td><span id="answer1" class="dragdrop" ondrop="drop(event)" draggable=true ondragstart="drag(event)" ondragover="allowDrop(event)">&nbsp;</span></td>
    <td><span id="answer2" class="dragdrop" ondrop="drop(event)" draggable=true ondragstart="drag(event)" ondragover="allowDrop(event)">&nbsp;</span></td>
  </tr>
</table>
<style type="text/css">
.addtable tr.numbers{font-size:1em;padding:1.5em;padding-left: 0.5em;text-align:center;}
</style>
==

form =@ form_dragndrop1.html


evaluator ==
grade=(0,"Mauvaise réponse")
==


