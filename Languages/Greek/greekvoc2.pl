@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
input =: Input

form ==
{{ input | component }}
==
settings.feedback.class = raw

@ grec_voc_1.csv [data.csv]

title = Vocabulaire grec

before ==
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=';'))

choices=[item['traductions'] for item in rows]
input.autocomplete = choices

selection=rd.sample(rows,5)
lst_mots=[item['article']+" "+item['mot'] for item in selection]
lst_trad=[item['traductions'] for item in selection]

mot=lst_mots[0]
nbsuccess=0
step=1
progress=20
==

bar ==
Que signifie le mot suivant ?

<div class="progress">
  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50"
  aria-valuemin="0" aria-valuemax="100" style="width:{{progress}}%">
    {{step}} / 5
  </div>
</div>
==

text ==
<div class="container">
  <ul class="step-menu">
    <li role="button" class="complete">Step 1</li>
    <li role="button" class="current">Step 2</li>
    <li role="button">Step 3</li>
    <li role="button">Step 4</li>
    <li role="button">Step 5</li>
    <li role="button">Step 6</li>
  </ul>
</div>

Que signifie le mot suivant ?

<link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/gfs-porson" type="text/css"/> 
<div style="text-align:center;font-size: x-large;font-family:'GFSPorsonRegular';">
{{mot}}
</div>
==

evaluator ==
if input.value==lst_trad[step]:
    nbsuccess += 1
    grade=(100," ")
else:
    grade=(0," ")

if step<5:
    progress+=20
    step += 1
    mot=lst_mots[step]
    input.value = ""
else:
    form=""
==

extracss==
<style>
body {
  padding: 50px;
  background-color: #fff;
}
.step-menu {
  list-style-type:none;
  width:725px;
  margin:0 auto;
  }
  .step-menu li {
    box-sizing: border-box; 
    float: left;
    background: #ddd;
    height: 50px;
    text-align: center;
    padding: 15px 15px 15px 50px;
    position: relative;
    margin-left: 10px
    }
    .step-menu li:before {
      content: '';
      position: absolute;
      border: 25px solid transparent;
      border-left-color: #fff;
      top:0px;
      right: -60px;
    }
    .step-menu li:after {
      content: '';
      position: absolute;
      border: 25px solid transparent;
      border-left-color: #ddd;
      top:0px;
      right: -50px;
    }
    .step-menu li:nth-child(1) {
      z-index:600;
      margin-left: 0;
      padding-left: 30px
    }
    .step-menu li:nth-child(2) {
      z-index:500;
    }
    .step-menu li:nth-child(3) {
      z-index:400;
    }
    .step-menu li:nth-child(4) {
      z-index:300;
    }
    .step-menu li:nth-child(5) {
      z-index:200;      
    }
    .step-menu li:nth-child(6) {
      z-index:100;
      padding-right:30px
    }
    .step-menu li:nth-child(6):after,
    .step-menu li:nth-child(6):before {
      border: none
    }
.step-menu li.current {
  background: rgba(51,122,183, 0.75);
  color: white;
}
.step-menu li.current:after {
  border-left-color: rgba(51,122,183, 0.75);
}
.step-menu li.complete {
  background: rgba(51,122,183, 0.4);
  color: white;
}
.step-menu li.complete:after {
  border-left-color: rgba(51,122,183, 0.4);
}
</style>
==
