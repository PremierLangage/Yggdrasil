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
nb_question=2
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

#Création d'une liste de CheckboxGroup()
ListStructQuestion=[]
for check in range(nb_quest):
    ListStructQuestion.append(CheckboxGroup())
    ListStructQuestion[check].items=[]

for radio in ListStructQuestion:
    nb = ListStructQuestion.index(radio)
    q, g, b = q_mix_item[nb]
    for i, s in enumerate(g):
        radio.items.append({"id": "g"+str(i), "content": s})
    for i, s in enumerate(b):
        radio.items.append({"id": "b"+str(i), "content": s})
    random.shuffle(radio.items)

    if(nb==0):# Seule la première question est active
        text += '''<div class="item active">'''
    else:
        text += '''<div class="item">'''
    text += '''<p><b><u>'''
    text += 'Question ' + str(nb+1) + '</u></b></p><br>'''
    text += '<div>'+q_mix_item[nb][0]+'</div><br>'
    #text += '<br>'+ str(radio.cid) + radio.selector+'</br>'
    text += '<div><'+ radio.selector + 'cid='+str(radio.cid)+'></'+ radio.selector + '></div>'
    # text += list_questions[indices_questions[0]]["html_form"]
    text += '''</div>'''
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

form==#|python|

for radio in ListStructQuestion:
    nb = ListStructQuestion.index(radio)
    q, g, b = q_mix_item[nb]
    for i, s in enumerate(g):
        radio.items.append({"id": "g"+str(i), "content": s})
    for i, s in enumerate(b):
        radio.items.append({"id": "b"+str(i), "content": s})
    random.shuffle(radio.items)

    if(nb==0):# Seule la première question est active
        text += '''<div class="item active">'''
    else:
        text += '''<div class="item">'''
    text += '''<p><b><u>'''
    text += 'Question ' + str(nb+1) + '</u></b></p><br>'''
    text += '<div>'+q_mix_item[nb][0]+'</div><br>'
    #text += '<br>'+ str(radio.cid) + radio.selector+'</br>'
    text += '<div><'+ radio.selector + 'cid='+str(radio.cid)+'></'+ radio.selector + '></div>'
    # text += list_questions[indices_questions[0]]["html_form"]
    text += '''</div>'''
    text += '''</div>'''
    text += '<!-- Left and right controls -->
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

for i, cb in enumerate(ListStructQuestion):
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

