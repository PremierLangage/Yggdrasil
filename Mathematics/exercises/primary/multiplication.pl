extends = column_operation.pl

title = Multiplication posée 1

before ==
import random as rd
a=rd.randint(11,99)
b=rd.randint(3,9)
sol=a*b
a0=str(a)[1]
a1=str(a)[0]
==

text ==
Effectuer la multiplication posée ci-dessous.
==

form==
<table class='operation'>
    <tr>
      <td></td>
      <td>{{a1}}</td>
      <td>{{a0}}</td>
    </tr>
    <tr class='underline'>
      <td>x</td>
      <td></td>
      <td>{{b}}</td>
    </tr>
    <tr>
      <td><input id='form_2' type='text' maxlength='1'></input></td>
      <td><input id='form_1' type='text' maxlength='1'></input></td>
      <td><input id='form_0' type='text' maxlength='1'></input></td>
    </tr>
</table>
==

evaluator ==
ans=int(answer['0'])+10*int(answer['1'])+100*int(answer['2'])
if ans==sol:
  score=100
  feedback="Bonne réponse"
else:
  score=0
  feedback="Mauvaise réponse"
==



