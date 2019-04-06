extends = column_operation.pl

title = Addition posée

before ==
import random as rd
a=rd.randint(10,99)
b=rd.randint(10,99)
sol=a+b
a0=str(a)[1]
a1=str(a)[0]
b0=str(b)[1]
b1=str(b)[0]
==

text ==
Effectuer l'addition posée ci-dessous.
==

form==
<table class='operation'>
    <tr>
      <td></td>
      <td>{{a1}}</td>
      <td>{{a0}}</td>
    </tr>
    <tr class='underline'>
      <td>+</td>
      <td>{{b1}}</td>
      <td>{{b0}}</td>
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

