@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

@ /model/AMC2/AMC2.py [AMC.py]
@ /ComputerScience/OperatingSystem/templates/utils.py
@ /model/AMC2/aleaq.py

@ /utils/components/scoring.py
@ /utils/components/radio.py [customradio.py]
@ /utils/components/checkbox.py [customcheckbox.py]
@ /utils/components/textselect.py [customtextselect.py]

# LES TRUCS QUE L'ON PEUT CHANGER SONT LA :
nb_quest_voulu = 5


before==#|python|
# Le même parseur que AMC2 sinon ça va encore chialer grave !!!
from AMC import parse_AMC_TXT

from random import *
from customradio import CustomRadio
from customcheckbox import CustomCheckbox
from customtextselect import CustomTextSelect
from aleaq import buildquestion, onefromeachgroup

# Pour les tirages aléatoires sans remise...
from utils import *

list_questions = parse_AMC_TXT(questions)
nb_tot_quest = len(list_questions)

nb_quest = min([int(nb_quest_voulu), nb_tot_quest])
indices_questions = knuth_mixing( subset_index(nb_tot_quest, nb_quest) )

def make_html_answer(question):
    question["html_form"] = '''<br><div style="margin-left:15%; margin-right:15%;">'''
    for it in question["items"]:
        it_rep = it.replace("'", "_").replace('"', '_')
        question["html_form"] += '<input type="checkbox" id="'+it_rep+'" name="'+it_rep+'" value="'+it_rep+'"> '
        question["html_form"] += ' <label for="'+it_rep+'"> '+it+' </label><br>'
    question["html_form"] += '</div>'

comp = []
statement  = []
for i, q in enumerate(list_questions):
    q=buildquestion(q) # Gestion de l'aléa 
    if q['type'] == "Radio":
        comp.append(CustomRadio())
        statement.append(q['text'])
        comp[i].setitems(q['items'])
        comp[i].setsol_from_index(q['index'])
        if 'ordered' not in q['options']:
            comp[i].shuffle()
    elif q['type'] == "Checkbox":
        comp.append(CustomCheckbox())
        statement.append(q['text'])
        comp[i].setitems(q['items'])
        comp[i].setsol_from_index(q['index'])
        if 'ordered' not in q['options']:
            comp[i].shuffle()
    elif  q['type'] == 'TextSelect':
        cst = CustomTextSelect()
        statement.append(q['text'])
        cst.setdata_from_textDR(q['items'][0])
        comp.append(cst)


for i in indices_questions:
    make_html_answer(list_questions[i])

def make_rotation_str(nb_quest):
    ans = '''<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false" >'''
    ans += '''<!-- Indicators -->'''
    ans += '''<ol class="carousel-indicators">'''
    ans += '''<li data-target="#myCarousel" data-slide-to="0" class="active"></li>'''
    for i in range(1, nb_quest):
        ans += '<li data-target="#myCarousel" data-slide-to="'+str(i)+'"></li>'
    ans +=  '''</ol>'''
    ans +=  '''<!-- Wrapper for slides -->'''
    ans +=  '''<div class="carousel-inner">'''
    return ans

# entêtes du mnaège
text += make_rotation_str(nb_quest)

radio = comp[indices_questions[0]]
# première question
text += '''<div class="item active">'''
text += '''<p style="margin-left:15%; margin-right:15%;"><b><u>Question 1 : </u></b></p><br>'''
text += '''<div style="margin-left:15%; margin-right:15%;">{{ list_questions[indices_questions[0]]["text"] }}</div>'''
text += f"""<div style="margin-left:15%; margin-right:15%;"><{radio.selector} cid='{radio.cid}'></{radio.selector}></div>"""
# text += list_questions[indices_questions[0]]["html_form"]
text += '''</div>'''

# question suivante
for i in range(1, nb_quest):
    radio = comp[indices_questions[i]]
    text += '''<div class="item">'''
    text += '<p style="margin-left:15%; margin-right:15%;"><b><u>Question '+str(i+1)+' : </u></b></p><br>'
    text += '<div style="margin-left:15%; margin-right:15%;">'+list_questions[indices_questions[i]]["text"]+'</div>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div style="margin-left:15%; margin-right:15%;"><{radio.selector} cid='{radio.cid}'></{radio.selector}></div>"""
    text += '</div>'

# footer du manège
text += end_text

==

questions=@ /ComputerScience/C/exercices/program/qcm_questions/generalites_C.txt

title==
Stoi le caroussel !
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
grade = (100, "Wesh t'a bon !")
==

