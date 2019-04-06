extends = column_operation.pl

title = Multiplication posée 2

before ==
import random as rd
a,b=10000,1
while (a*b>=10000):
    a=rd.randint(11,89)
    b=rd.randint(11,89)
a0=str(a)[1]
a1=str(a)[0]
b0=str(b)[1]
b1=str(b)[0]
sol=a*b
==

text ==
Effectuer la multiplication posée ci-dessous.
==

form==
<table class='operation'>
    <tr>
      <td></td>
      <td></td>
      <td>{{a1}}</td>
      <td>{{a0}}</td>
    </tr>
    <tr class='underline'>
      <td>x</td>
      <td></td>
      <td>{{b1}}</td>
      <td>{{b0}}</td>
    </tr>
    <tr>
      <td><input id='form_3' type='text' maxlength='1'></input></td>
      <td><input id='form_2' type='text' maxlength='1'></input></td>
      <td><input id='form_1' type='text' maxlength='1'></input></td>
      <td><input id='form_0' type='text' maxlength='1'></input></td>
    </tr>
    <tr class='underline'>
      <td><input id='form_13' type='text' maxlength='1'></input></td>
      <td><input id='form_12' type='text' maxlength='1'></input></td>
      <td><input id='form_11' type='text' maxlength='1'></input></td>
      <td><input id='form_10' type='text' maxlength='1'></input></td>
    </tr>
    <tr>
      <td><input id='form_23' type='text' maxlength='1'></input></td>
      <td><input id='form_22' type='text' maxlength='1'></input></td>
      <td><input id='form_21' type='text' maxlength='1'></input></td>
      <td><input id='form_20' type='text' maxlength='1'></input></td>
    </tr>
</table>
==

evaluator ==
ans=int(answer['20'])+10*int(answer['21'])+100*int(answer['22'])+1000*int(answer['23'])
if ans==sol:
  score=100
  feedback="Bonne réponse"
else:
  score=0
  feedback="Mauvaise réponse"
==
