@ /utils/sandboxio.py
@ /utils/components/scoring.py
@ /utils/components/radio.py [customradio.py]
@ /utils/components/checkbox.py [customcheckbox.py]
@ /utils/components/textselect.py [customtextselect.py]


@ /model/AMC2/AMC2.py [AMC.py]
@ /model/AMC2/aleaq.py 

@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

settings.cumulative % false
title=

text==

Prenez bien le temps de répondre aux {{ nb_quest }} questions avant de valider.


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
    margin: auto;
    width: 70%;
  }
  #myCarousel{
    min-height: 300px;
  }
.carousel-indicators li {
    display: inline-block;
    width: 24px;
    height: 24px;
    margin: 5px;
    text-indent: 0;
    cursor: pointer;
    border: none;
    border-radius: 50%;
    background-color: #0000ff;
    box-shadow: inset 1px 1px 1px 1px rgba(0,0,0,0.5);    
}
.carousel-indicators .active {
    width: 24px;
    height: 24px;
    margin: 5px;
    background-color: #ffff99;
}
.item{
    padding-top: 10px;
}
  </style>

==


before==
from customradio import Radio
from customcheckbox import Checkbox
from customtextselect import CustomTextSelect
radio = Radio() 
check = Checkbox()
ztext = CustomTextSelect()
import random
random.seed(42) # DEBUG FIXME
from AMC import parse_AMC_TXT

from aleaq import buildquestion, onefromeachgroup,getmultioption

# Parsing du fichier format AMC
list_questions = parse_AMC_TXT(questions)

# Traitement des options de gestion de l'aléa 
# getmultioption -> possibilité d'utiliser une question plusieurs fois 

l2=[]
for q in list_questions:
    n=getmultioption(q) # default value 1 
    for _ in range(n):
        l2.append(buildquestion(q))
list_questions=l2
# onepergroup -> possibilité de faire une tirage aléatoire dans un groupe de questions


onepergroup = 1

if "onepergroup" in globals() and onepergroup > 0 :
    list_questions=onefromeachgroup(list_questions,onepergroup)
# nbstep réduire la complexité 

# FIXME
nbstep = 4
if 'nbstep' in globals():
    list_questions = random.sample(list_questions, nbstep)




nb_quest = len(list_questions)
random.shuffle(list_questions)

comp = []
import sys # DEBUG
for i, q in enumerate(list_questions):
    if type(q)== list :
        continue
    if q['type'] == "Radio":
        newcomp = Radio()
        
        newcomp.setStatement(q['text'])
        newcomp.setitems(q['items'])
        newcomp.setsol_from_index(q['index'])
        if 'ordered' not in q['options']:
            newcomp.shuffle()
        comp.append(newcomp)
    elif q['type'] == "Checkbox":
        newcomp = Checkbox()
        newcomp.setStatement(q['text'])
        newcomp.setitems(q['items'])
        newcomp.setsol_from_index(q['index'])
        if 'ordered' not in q['options']:
            newcomp.shuffle()
        comp.append(newcomp)
    elif  q['type'] == 'TextSelect':
        newcomp = CustomTextSelect()
        newcomp.setStatement(q['text'])
        newcomp.setdata_from_textDR(q['items'][0])
        comp.append(newcomp)




text += """<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false" >
    <!-- Indicators -->
    <ol class="carousel-indicators" id="debug">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>"""
text += "\n".join(['<li data-target="#myCarousel" data-slide-to="'+str(i)+'"></li>' for i in range(1, len(list_questions))])
text +=   """</ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner">"""

text += f"""
                <div class="item active">
                <p style="margin-left:15%; margin-right:15%;"><b><u>Question 1 : </u></b></p><br>
                <div style="margin-left:15%; margin-right:15%;">{comp[0].statement}</div>
                <div style="margin-left:15%; margin-right:15%;">\n<{comp[0].selector} cid='{comp[0].cid}'></{comp[0].selector}></div>
                <br><br><br><br></div>"""
for indice in range(1,len(comp)):
       text += f"""
                <div class="item ">
                <p style="margin-left:15%; margin-right:15%;"><b><u>Question {indice+1} : </u></b></p><br>
                <div style="margin-left:15%; margin-right:15%;">{comp[indice].statement}</div>
                <div style="margin-left:15%; margin-right:15%;">\n<{comp[indice].selector} cid='{comp[indice].cid}'></{comp[indice].selector}></div>
                <br><br><br><br></div>"""

# footer du manège
text += """
        </div>
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
        </a>
        </div>
"""


if 0<len(comp): xcomp0=comp[0]
if 1<len(comp): xcomp1=comp[1]
if 2<len(comp): xcomp2=comp[2]
if 3<len(comp): xcomp3=comp[3]
if 4<len(comp): xcomp4=comp[4]
if 5<len(comp): xcomp5=comp[5]
if 6<len(comp): xcomp6=comp[6]
if 7<len(comp): xcomp7=comp[7]
if 8<len(comp): xcomp8=comp[8]
if 9<len(comp): xcomp9=comp[9]
if 10<len(comp): xcomp10=comp[10]
if 11<len(comp): xcomp11=comp[11]
if 12<len(comp): xcomp12=comp[12]
if 13<len(comp): xcomp13=comp[13]
if 14<len(comp): xcomp14=comp[14]
if 15<len(comp): xcomp15=comp[15]
if 16<len(comp): xcomp16=comp[16]
if 17<len(comp): xcomp17=comp[17]
if 18<len(comp): xcomp18=comp[18]
if 19<len(comp): xcomp19=comp[19]
if 20<len(comp): xcomp20=comp[20]
if 21<len(comp): xcomp21=comp[21]
if 22<len(comp): xcomp22=comp[22]
if 23<len(comp): xcomp23=comp[23]
if 24<len(comp): xcomp24=comp[24]
if 25<len(comp): xcomp25=comp[25]
if 26<len(comp): xcomp26=comp[26]
if 27<len(comp): xcomp27=comp[27]
if 28<len(comp): xcomp28=comp[28]
if 29<len(comp): xcomp29=comp[29]

==

title= Un peu mieux je crois

end_text==
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
==

form=

@ /grader/evaluatorstep.py
evaluator==#|python|
from evaluatorstep import env



text=""

scores = [xcomp0.eval()]
form =  env.from_string(xcomp0.statement+f" \n <{xcomp0.selector} cid='{xcomp0.cid}'></{xcomp0.selector}> \n ").render(globals())
for x in range(1,len(comp)):
    scores.append(comp[x].eval())
    form +=  env.from_string(comp[x].statement+f" \n <{comp[x].selector} cid='{comp[x].cid}'></{comp[x].selector}> \n ").render(globals())



note_finale = int(sum(scores) / nb_quest)

grade = (note_finale, "Vous avez obtenur la note de "+str(note_finale)+"%<br>")
==




questions=@ /ComputerScience/OperatingSystem/exercises/MCQ/notion_de_fichier.txt









