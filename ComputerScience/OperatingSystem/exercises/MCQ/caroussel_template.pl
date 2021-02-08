#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title==
Fork me please, do not modify me please !
==

#****************************************************************************
# PANNEAU DE CONTROLE ICI
#****************************************************************************
questions=@ /ComputerScience/OperatingSystem/exercises/MCQ/notion_de_fichier.txt
nb_question=5
feedback=True
min_options=4
max_options=8
#****************************************************************************
# FIN DU PANNEAU DE CONTROLE : NE PLUS RIEN TOUCHER APRES
#****************************************************************************

before==#|python|
import random
from components import CheckboxGroup

# mettre au moins une question sinon le Caroussel est vide
nb_volets=max([1, int(nb_question)])

def ParseQuestion(big_str):
    """
    Parse a Python open file of formated questions in AMC style and return a 
    list of parsed questions together with theirs answers.
    """
    text = None
    goods = []
    bads = []
    last = 0
    MCQ_lst = []
    for line in big_str.split('\n')+['* ']:
        if len(line) == 0:
            continue
        if line[0] == '*':
            last = 0
            # first, register the last parsed question if relevant
            if text is not None:
                MCQ_lst.append([text, goods, bads])
                text = None
                goods = []
                bads = []

            if line[1] == '*':
                text = line[2:]
            else:
                text = line[1:]
        elif line[0] == '+':
            goods.append(line[1:])
            last = 1
        elif line[0] == '-':
            bads.append(line[1:])
            last = 2
        else:
            if last == 0:
                text += line
            elif last == 1:
                goods[-1] += line
            else:
                bads[-1] += line

    return MCQ_lst

MSQ_lst = ParseQuestion(questions)

nb_volets = min([nb_volets, len(MSQ_lst), 10])
nb_quest = nb_volets
q_lst = random.sample(MSQ_lst, nb_volets)

q_mix_item = []
for q, g, b in q_lst:
    nb_options = random.randint(int(min_options), int(max_options))
    nb_options = min([nb_options, len(g)+len(b)])
    nb_good = random.randint(max([nb_options-len(b), 0]), min([nb_options, len(g)]))
    nb_bad = nb_options - nb_good
    q_mix_item.append([q, random.sample(g, nb_good), random.sample(b, nb_bad)])


compo = []
for q, g, b in q_mix_item:
    CG = CheckboxGroup()
    CG.items = []
    for i, s in enumerate(g):
        CG.items.append({"id": "g"+str(i), "content": s})
    for i, s in enumerate(b):
        CG.items.append({"id": "b"+str(i), "content": s})
    random.shuffle(CG.items)
    compo.append(CG)

#***************************************

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

radio0 = CheckboxGroup()
q, g, b = q_mix_item[0]
radio0.items = []
for i, s in enumerate(g):
    radio0.items.append({"id": "g"+str(i), "content": s})
for i, s in enumerate(b):
    radio0.items.append({"id": "b"+str(i), "content": s})
random.shuffle(radio0.items)

# première question
text += '''<div class="item active">'''
text += '''<p><b><u>Question 1 : </u></b></p><br>'''
text += '<div>'+q_mix_item[0][0]+'</div>'
text += f"""<div><{radio0.selector} cid='{radio0.cid}'></{radio0.selector}></div>"""
# text += list_questions[indices_questions[0]]["html_form"]
text += '''</div>'''

# question suivante --> 1
if nb_quest >= 2:
    radio1 = CheckboxGroup()
    q, g, b = q_mix_item[1]
    radio1.items = []
    for i, s in enumerate(g):
        radio1.items.append({"id": "g"+str(i), "content": s})
    for i, s in enumerate(b):
        radio1.items.append({"id": "b"+str(i), "content": s})
    random.shuffle(radio1.items)
    text += '''<div class="item">'''
    text += '<p style="margin-left:15%; margin-right:15%;"><b><u>Question 2 : </u></b></p><br>'
    text += '<div style="margin-left:15%; margin-right:15%;">'+q_mix_item[1][0]+'</div>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div style="margin-left:15%; margin-right:15%;"><{radio1.selector} cid='{radio1.cid}'></{radio1.selector}></div>"""
    text += '<br><br><br><br></div>'


==


text==#|markdown|

<meta name="viewport" content="width=device-width, initial-scale=1">
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
    padding-left: 15%;
    padding-right: 15%;
    padding-bottom: 70px;
}
</style>

<p>
Prenez bien le temps de répondre aux {{ nb_quest }} questions avant de valider.
</p>

<br>
==

form==#|markdown|
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

form2==#|markdown|

<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    {% for q in q_mix_item %}
      {% if loop.index0 == 0 %}
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      {% else %}
        <li data-target="#myCarousel" data-slide-to="{{ loop.index0 }}"></li>
      {% endif %}
    {% endfor %}
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">

    {% for q in q_mix_item %}
      {% if loop.index0 == 0 %}
        <div class="item active">
      {% else %}
        <div class="item">
      {% endif %}
      {{ q[0] }}

      <br>

      {{ compo[loop.index0]|component }}

        </div>
    {% endfor %}
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

evaluator==#|python|

note_finale = 100

grade = (note_finale, "Vous avez obtenur la note de "+str(note_finale)+"%<br>")
==

