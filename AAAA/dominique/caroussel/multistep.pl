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
text=
questions=@ /AAAA/Justine/justine_questions.txt

before==
from customradio import CustomRadio
from customcheckbox import CustomCheckbox
from customtextselect import CustomTextSelect
radio = CustomRadio() 
check = CustomCheckbox()
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

title= str(list_questions)


nb_quest = len(list_questions)
random.shuffle(list_questions)

comp = []
import sys # DEBUG
for i, q in enumerate(list_questions):
    if type(q)== list :
        print(" bizarre !!!!!")
        continue
    if q['type'] == "Radio":
        newcomp = CustomRadio()
        
        newcomp.setStatement(q['text'])
        newcomp.setitems(q['items'])
        newcomp.setsol_from_index(q['index'])
        if 'ordered' not in q['options']:
            newcomp.shuffle()
        comp.append(newcomp)
    elif q['type'] == "Checkbox":
        newcomp = CustomCheckbox()
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


# entêtes du mnaège
text +=  """
    <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false" >
    <!-- Indicators -->
    <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>\n"""
text += "\n".join(['      <li data-target="#myCarousel" data-slide-to="'+str(i)+'"></li>' for i in range(1, len(list_questions))])
text +=   """</ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner">"""

for indice in range(len(comp)):
       text += f"""
                <div class="item active">
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

==


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

form==

==

evaluator==#|python|

text=""

scores = [radio0.eval()]
if nb_quest >= 2:
    scores.append(radio1.eval())
if nb_quest >= 3:
    scores.append(radio2.eval())
if nb_quest >= 4:
    scores.append(radio3.eval())
if nb_quest >= 5:
    scores.append(radio4.eval())
if nb_quest >= 6:
    scores.append(radio5.eval())
if nb_quest >= 7:
    scores.append(radio6.eval())
if nb_quest >= 8:
    scores.append(radio7.eval())
if nb_quest >= 9:
    scores.append(radio8.eval())
if nb_quest >= 10:
    scores.append(radio9.eval())

note_finale = int(sum(scores) / nb_quest)

grade = (note_finale, "Vous avez obtenur la note de "+str(note_finale)+"%<br>")
==










