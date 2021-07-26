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

#  Documentation pour utiliser ce template bien moche....
#
#  Objectifs du template : faire un carousel d'au plus 10 questions tirées
#  au hasard dans un sac(un fichier) de questions.
#  Les bonnes et mauvaises réponses sont elles aussi choisi au hasard, 
#  l'utilisateur enseignant peut customiser le nombre min et max d'options.
#  Ce template de 400 lignes est moche et pourra être réécrit proprement
#  en 100 lignes pour avec la V1. C'est un template qui gère l'urgence et
#  adapté aux besoins de la banque de questions pour le Système Unix.
#
#  Les questions doivent être sous la forme suivante :
#  * énoncé de la question   (** autorisé donera le même comportement)
#  + bonne réponse 1
#  + bonne réponse 2
#  - mauvaise réponse
#
#  Pour savoir comment utiliser ce template, allez voir le fichier
#  Yggdrasil/ComputerScience/OperatingSystem/exercises/MCQ/commandes_terminal_MCQ.pl
#
#  Le feedback synthétique est activable/désactivable

@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title==
Fork me please, do not modify me please !
==

#****************************************************************************
# PANNEAU DE CONTROLE ICI
#****************************************************************************
title=Test_Principe_AMC
questions=@ /AAAA/OCE/notion_de_fichier.txt
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

    * and ** are ignored... Everything ic checkboxgroup (even name is radio)
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

# entêtes du manège
text += make_rotation_str(nb_quest)

# créer un dictionnaire de nbQuest CheckboxGroup()
# Chaque CheckboxGroup() est crée à partir de q_mix_item
ListStructQuestion=[]
for nb in range (nb_quest):
    radio = CheckboxGroup()
    q, g, b = q_mix_item[nb]
    radio.items = []
    for i, s in enumerate(g):
        radio.items.append({"id": "g"+str(i), "content": s})
    for i, s in enumerate(b):
        radio.items.append({"id": "b"+str(i), "content": s})
    random.shuffle(radio.items)
    ListStructQuestion.append(radio)

    # Construction des questions
    text += '''<div class="item active">'''
    text += '''<p><b><u>'''
    text += 'Question ' + str(nb+1)
    text += ''': </u></b></p><br>'''
    text += '<div>'+q_mix_item[nb][0]+'</div><br>'
    text += f"""<div><{radio.selector} cid='{radio.cid}'></{radio.selector}></div>"""
    # text += list_questions[indices_questions[0]]["html_form"]
    text += '''</div>'''

######## Ancien
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
text += '<div>'+q_mix_item[0][0]+'</div><br>'
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
    text += '<p><b><u>Question 2 : </u></b></p><br>'
    text += '<div>'+q_mix_item[1][0]+'</div><br>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div><{radio1.selector} cid='{radio1.cid}'></{radio1.selector}></div>"""
    text += '</div>'

# question suivante --> 2
if nb_quest >= 3:
    radio2 = CheckboxGroup()
    q, g, b = q_mix_item[2]
    radio2.items = []
    for i, s in enumerate(g):
        radio2.items.append({"id": "g"+str(i), "content": s})
    for i, s in enumerate(b):
        radio2.items.append({"id": "b"+str(i), "content": s})
    random.shuffle(radio2.items)
    text += '''<div class="item">'''
    text += '<p><b><u>Question 3 : </u></b></p><br>'
    text += '<div>'+q_mix_item[2][0]+'</div><br>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div><{radio2.selector} cid='{radio2.cid}'></{radio2.selector}></div>"""
    text += '</div>'

# question suivante --> 3
if nb_quest >= 4:
    radio3 = CheckboxGroup()
    q, g, b = q_mix_item[3]
    radio3.items = []
    for i, s in enumerate(g):
        radio3.items.append({"id": "g"+str(i), "content": s})
    for i, s in enumerate(b):
        radio3.items.append({"id": "b"+str(i), "content": s})
    random.shuffle(radio3.items)
    text += '''<div class="item">'''
    text += '<p><b><u>Question 4 : </u></b></p><br>'
    text += '<div>'+q_mix_item[3][0]+'</div><br>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div><{radio3.selector} cid='{radio3.cid}'></{radio3.selector}></div>"""
    text += '</div>'

# question suivante --> 4
if nb_quest >= 5:
    radio4 = CheckboxGroup()
    q, g, b = q_mix_item[4]
    radio4.items = []
    for i, s in enumerate(g):
        radio4.items.append({"id": "g"+str(i), "content": s})
    for i, s in enumerate(b):
        radio4.items.append({"id": "b"+str(i), "content": s})
    random.shuffle(radio4.items)
    text += '''<div class="item">'''
    text += '<p><b><u>Question 5 : </u></b></p><br>'
    text += '<div>'+q_mix_item[4][0]+'</div><br>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div><{radio4.selector} cid='{radio4.cid}'></{radio4.selector}></div>"""
    text += '</div>'

# question suivante --> 5
if nb_quest >= 6:
    radio5 = CheckboxGroup()
    q, g, b = q_mix_item[5]
    radio5.items = []
    for i, s in enumerate(g):
        radio5.items.append({"id": "g"+str(i), "content": s})
    for i, s in enumerate(b):
        radio5.items.append({"id": "b"+str(i), "content": s})
    random.shuffle(radio5.items)
    text += '''<div class="item">'''
    text += '<p><b><u>Question 6 : </u></b></p><br>'
    text += '<div>'+q_mix_item[5][0]+'</div><br>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div><{radio5.selector} cid='{radio5.cid}'></{radio5.selector}></div>"""
    text += '</div>'

# question suivante --> 6
if nb_quest >= 7:
    radio6 = CheckboxGroup()
    q, g, b = q_mix_item[6]
    radio6.items = []
    for i, s in enumerate(g):
        radio6.items.append({"id": "g"+str(i), "content": s})
    for i, s in enumerate(b):
        radio6.items.append({"id": "b"+str(i), "content": s})
    random.shuffle(radio6.items)
    text += '''<div class="item">'''
    text += '<p><b><u>Question 7 : </u></b></p><br>'
    text += '<div>'+q_mix_item[6][0]+'</div><br>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div><{radio6.selector} cid='{radio6.cid}'></{radio6.selector}></div>"""
    text += '</div>'

# question suivante --> 7
if nb_quest >= 8:
    radio7 = CheckboxGroup()
    q, g, b = q_mix_item[7]
    radio7.items = []
    for i, s in enumerate(g):
        radio7.items.append({"id": "g"+str(i), "content": s})
    for i, s in enumerate(b):
        radio7.items.append({"id": "b"+str(i), "content": s})
    random.shuffle(radio7.items)
    text += '''<div class="item">'''
    text += '<p><b><u>Question 8 : </u></b></p><br>'
    text += '<div>'+q_mix_item[7][0]+'</div><br>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div><{radio7.selector} cid='{radio7.cid}'></{radio7.selector}></div>"""
    text += '</div>'

# question suivante --> 8
if nb_quest >= 9:
    radio8 = CheckboxGroup()
    q, g, b = q_mix_item[8]
    radio8.items = []
    for i, s in enumerate(g):
        radio8.items.append({"id": "g"+str(i), "content": s})
    for i, s in enumerate(b):
        radio8.items.append({"id": "b"+str(i), "content": s})
    random.shuffle(radio8.items)
    text += '''<div class="item">'''
    text += '<p><b><u>Question 9 : </u></b></p><br>'
    text += '<div>'+q_mix_item[8][0]+'</div><br>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div><{radio8.selector} cid='{radio8.cid}'></{radio8.selector}></div>"""
    text += '</div>'

# question suivante --> 9
if nb_quest >= 10:
    radio9 = CheckboxGroup()
    q, g, b = q_mix_item[9]
    radio9.items = []
    for i, s in enumerate(g):
        radio9.items.append({"id": "g"+str(i), "content": s})
    for i, s in enumerate(b):
        radio9.items.append({"id": "b"+str(i), "content": s})
    random.shuffle(radio9.items)
    text += '''<div class="item">'''
    text += '<p><b><u>Question 10 : </u></b></p><br>'
    text += '<div>'+q_mix_item[9][0]+'</div><br>'
    # text += list_questions[indices_questions[i]]["html_form"]
    text += f"""<div><{radio9.selector} cid='{radio9.cid}'></{radio9.selector}></div>"""
    text += '</div>'

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

text=""
form=""

fb_err = "Voici les erreurs que vous avez faites : <br>"
fb_err += '<span style="color:darkgreen">En vert</span> les bonnes réponses non selectionnées<br>'
fb_err += '<span style="color:darkred"><strike>En rouge barré</strike></span> les mauvaises réponses selectionnées<br><br>'
errors=0
ok=0

L = [radio0]
if nb_quest >= 2:
    L.append(radio1)
if nb_quest >= 3:
    L.append(radio2)
if nb_quest >= 4:
    L.append(radio3)
if nb_quest >= 5:
    L.append(radio4)
if nb_quest >= 6:
    L.append(radio5)
if nb_quest >= 7:
    L.append(radio6)
if nb_quest >= 8:
    L.append(radio7)
if nb_quest >= 9:
    L.append(radio8)
if nb_quest >= 10:
    L.append(radio9)

for i, cb in enumerate(L):
    fb_q = '<span style="color:black">'+q_mix_item[i][0]+'</span><ul>'
    q_ok = True
    for item in cb.items:
        if item['checked']:
            if 'b' in item['id']:
                errors += 1
                q_ok = False
                fb_q += '<li><span style="color:darkred"><strike>'+item['content']+'</strike></span></li>'
            else:
                ok += 1
        else:
            if 'b' in item['id']:
                ok += 1
            else:
                errors += 1
                q_ok = False
                fb_q += '<li><span style="color:darkgreen">'+item['content']+'</span></li>'
    if not q_ok:
        fb_err += fb_q+"</ul>"

# A expliquer le calcul de la note
note_finale = (100 * max([0, ok - errors])) // (ok + errors)

if not feedback:
    grade = (note_finale, "Vous avez obtenu la note de "+str(note_finale)+"%<br>")
else:
    if note_finale == 100:
        grade = (note_finale, "Bravo, vous avez obtenu la note de "+str(note_finale)+"%<br>")
    else:
        grade = (note_finale, "Vous obtenez la note de "+str(note_finale)+"%<br><br>"+fb_err)
==

