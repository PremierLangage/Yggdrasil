


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


title = C quoi ça

# LES TRUCS QUE L'ON PEUT CHANGER SONT LA :
nb_quest_voulu = 5
# questions=@ /ComputerScience/C_Initiation/QCM/QCM-1-a-4.txt
# questions=@ /ComputerScience/C/exercices/program/qcm_questions/generalites_C.txt
# questions=@ /ComputerScience/OperatingSystem/exercises/MCQ/donnees_binaire.txt
questions==

* question rafdio 
+ bonne 
- bad
- bda
- really bad

** question mutli
+ bonne 
+ Très bonne
- bad as href
- bda
- bad


=**[nbb=2,nbg=3] Dans un programme, quels sont les noms de variables que vous utiliseriez pour gérer des données liés au temps? 
+=["tmp","cmpt","hours","heures","years","annees","days","jours","mnt","minutes","sec","seconds","period","duree"]
-=["and","if","for","while","variable","variable_3","x","a","toto","chat"]


=**[group=operateurs_jf,nbg=3,nbb=4]Lesquels de ces opérateurs sont des opérateurs de comparaison ?
+=["<","<=","==","!="]
-=["and","or","not","=","+","*"]

=**[group=operateurs_jf,nbg=3,nbb=4]Lesquels de ces opérateurs sont des opérateurs logiques ?
-=["<","<=","==","!=","=","+","*"]
+=["and","or","not"]

=**[group=operateurs_jf,nbg=3,nbb=4]Lesquels de ces opérateurs ne sont ni des opérateurs logiques ni des opérateurs de comparaison?
-=["<","<=","==","!=","and","or","not"]
+=["=","+","*"]
==
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

nb_quest = min([int(nb_quest_voulu), nb_tot_quest, 10])
indices_questions = knuth_mixing( subset_index(nb_tot_quest, nb_quest) )


comp = []

for i, q in enumerate(list_questions):
    q=buildquestion(q) # Gestion de l'aléa 
    if q['type'] == "Radio":
        newcomp = CustomRadio()
        newcomp.text = q['text']
        #newcomp['text']=q['text']
        newcomp.set_items(q['items'])
        #newcomp.setsol_from_index(q['index'])
        if 'ordered' not in q['options']:
            newcomp.shuffle()
        comp.append(newcomp)
    elif q['type'] == "Checkbox":
        newcomp = CustomCheckbox()
        newcomp.text = q['text']
        newcomp.setitems(q['items'])
        #newcomp.setsol_from_index(q['index'])
        if 'ordered' not in q['options']:
            newcomp.shuffle()
        comp.append(newcomp)
    elif  q['type'] == 'TextSelect':
        newcomp = CustomTextSelect()
        newcomp.text = q['text']
        newcomp.setdata_from_textDR(q['items'][0])
        comp.append(newcomp)

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

def makeonglet(comp):
    pass


# entêtes du mnaège
text += make_rotation_str(nb_quest)

radio0 = comp[indices_questions[0]]
# première question
text += '''<div class="item active">'''
text += '''<p style="margin-left:15%; margin-right:15%;"><b><u>Question 1 : </u></b></p><br>'''
text += '<div style="margin-left:15%; margin-right:15%;">'+list_questions[indices_questions[0]]["text"]+'</div>'
text += f"""<div style="margin-left:15%; margin-right:15%;"><{radio0.selector} cid='{radio0.cid}'></{radio0.selector}></div>"""
# text += list_questions[indices_questions[0]]["html_form"]
text += '''<br><br><br><br></div>'''

# question suivante --> 1
if nb_quest >= 2:
    radio1 = comp[indices_questions[1]]
    text += '''<div class="item">'''
    text += '<p style="margin-left:15%; margin-right:15%;"><b><u>Question 2 : </u></b></p><br>'
    text += '<div style="margin-left:15%; margin-right:15%;">'+list_questions[indices_questions[1]]["text"]+'</div>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div style="margin-left:15%; margin-right:15%;"><{radio1.selector} cid='{radio1.cid}'></{radio1.selector}></div>"""
    text += '<br><br><br><br></div>'

# question suivante --> 2
if nb_quest >= 3:
    radio2 = comp[indices_questions[2]]
    text += '''<div class="item">'''
    text += '<p style="margin-left:15%; margin-right:15%;"><b><u>Question 3 : </u></b></p><br>'
    text += '<div style="margin-left:15%; margin-right:15%;">'+list_questions[indices_questions[2]]["text"]+'</div>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div style="margin-left:15%; margin-right:15%;"><{radio2.selector} cid='{radio2.cid}'></{radio2.selector}></div>"""
    text += '<br><br><br><br></div>'

# question suivante --> 3
if nb_quest >= 4:
    radio3 = comp[indices_questions[3]]
    text += '''<div class="item">'''
    text += '<p style="margin-left:15%; margin-right:15%;"><b><u>Question 4 : </u></b></p><br>'
    text += '<div style="margin-left:15%; margin-right:15%;">'+list_questions[indices_questions[3]]["text"]+'</div>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div style="margin-left:15%; margin-right:15%;"><{radio3.selector} cid='{radio3.cid}'></{radio3.selector}></div>"""
    text += '<br><br><br><br></div>'

# question suivante --> 4
if nb_quest >= 5:
    radio4 = comp[indices_questions[4]]
    text += '''<div class="item">'''
    text += '<p style="margin-left:15%; margin-right:15%;"><b><u>Question 5 : </u></b></p><br>'
    text += '<div style="margin-left:15%; margin-right:15%;">'+list_questions[indices_questions[4]]["text"]+'</div>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div style="margin-left:15%; margin-right:15%;"><{radio4.selector} cid='{radio4.cid}'></{radio4.selector}></div>"""
    text += '<br><br><br><br></div>'

# question suivante --> 5
if nb_quest >= 6:
    radio5 = comp[indices_questions[5]]
    text += '''<div class="item">'''
    text += '<p style="margin-left:15%; margin-right:15%;"><b><u>Question 6 : </u></b></p><br>'
    text += '<div style="margin-left:15%; margin-right:15%;">'+list_questions[indices_questions[5]]["text"]+'</div>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div style="margin-left:15%; margin-right:15%;"><{radio5.selector} cid='{radio5.cid}'></{radio5.selector}></div>"""
    text += '<br><br><br><br></div>'

# question suivante --> 6
if nb_quest >= 7:
    radio6 = comp[indices_questions[6]]
    text += '''<div class="item">'''
    text += '<p style="margin-left:15%; margin-right:15%;"><b><u>Question 7 : </u></b></p><br>'
    text += '<div style="margin-left:15%; margin-right:15%;">'+list_questions[indices_questions[6]]["text"]+'</div>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div style="margin-left:15%; margin-right:15%;"><{radio6.selector} cid='{radio6.cid}'></{radio6.selector}></div>"""
    text += '<br><br><br><br></div>'

# question suivante --> 7
if nb_quest >= 8:
    radio7 = comp[indices_questions[7]]
    text += '''<div class="item">'''
    text += '<p style="margin-left:15%; margin-right:15%;"><b><u>Question 8 : </u></b></p><br>'
    text += '<div style="margin-left:15%; margin-right:15%;">'+list_questions[indices_questions[7]]["text"]+'</div>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div style="margin-left:15%; margin-right:15%;"><{radio7.selector} cid='{radio7.cid}'></{radio7.selector}></div>"""
    text += '<br><br><br><br></div>'

# question suivante --> 8
if nb_quest >= 9:
    radio8 = comp[indices_questions[8]]
    text += '''<div class="item">'''
    text += '<p style="margin-left:15%; margin-right:15%;"><b><u>Question 9 : </u></b></p><br>'
    text += '<div style="margin-left:15%; margin-right:15%;">'+list_questions[indices_questions[8]]["text"]+'</div>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div style="margin-left:15%; margin-right:15%;"><{radio8.selector} cid='{radio8.cid}'></{radio8.selector}></div>"""
    text += '<br><br><br><br></div>'

# question suivante --> 9
if nb_quest >= 10:
    radio9 = comp[indices_questions[9]]
    text += '''<div class="item">'''
    text += '<p style="margin-left:15%; margin-right:15%;"><b><u>Question 10 : </u></b></p><br>'
    text += '<div style="margin-left:15%; margin-right:15%;">'+list_questions[indices_questions[9]]["text"]+'</div>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div style="margin-left:15%; margin-right:15%;"><{radio9.selector} cid='{radio9.cid}'></{radio9.selector}></div>"""
    text += '<br><br><br><br></div>'


# footer du manège
text += end_text

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

