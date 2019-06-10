extends = /template/basic.pl

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

script ==

function highlight(newbox) {
    currentbox.focus();
    currentbox.style.backgroundColor = '';
    newbox.focus();
    newbox.style.backgroundColor = '#ffff99';
}

document.onkeydown = checkKey;

function checkKey(e) {
  e = e || window.event;
  if (e.keyCode == '38') {
    // up arrow
    newnum = currentnum - 10;
  } else if (e.keyCode == '40') {
    // down arrow
    newnum = currentnum + 10;  
  } else if (e.keyCode == '37') {
    // left arrow
    newnum = currentnum + 1;
  } else if (e.keyCode == '39') {
    // right arrow
    newnum = currentnum - 1;
  } else if (Number(e.keyCode) >= 48 && Number(e.keyCode) <= 57) {
    document.getElementById('form_'+currentnum).value=String.fromCharCode(e.keyCode);
  } else if (Number(e.keyCode) == 46) {
    document.getElementById('form_'+currentnum).value='';
  }
  if (document.getElementById('form_'+newnum)) {
  newbox = document.getElementById('form_'+newnum);
  highlight(newbox);
  currentbox = newbox;
  currentnum = newnum;
  }
}

var currentbox = document.getElementById('form_0');
var currentnum = 0;
var newnum = 0;
highlight(currentbox);

==

style ==
table.operation {
  margin-left:auto; 
  margin-right:auto;
  border-collapse: collapse;
  border: 0px solid black;
}

table.operation  td {
  border: 0px solid black;
  padding-top: 0.2em;
  padding-bottom: 0.2em;
  text-align: center;
  font-size: 2em;
}

table.operation  tr.underline {
  border-bottom:1px solid black
}

input {
width: 1em;
border: none;
color: transparent;
text-shadow: 0 0 0 black;
text-align: center;
padding-left: 0.1em;
padding-right: 0.1em;
border-radius: 0.3em;
display:inline-block;
cursor: pointer;
:focus {outline: none;}
}
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



