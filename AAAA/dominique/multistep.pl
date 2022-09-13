@ /utils/sandboxio.py
@ /utils/components/scoring.py
@ /utils/components/radio.py [radio.py]
@ /utils/components/checkbox.py [customcheckbox.py]
@ /utils/components/checkbox.py [checkbox.py]
@ /utils/components/textselect.py [customtextselect.py]


@ /model/AMC2/AMC2.py [AMC.py]
@ /model/AMC2/aleaq.py 
@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

settings.cumulative % false


questions==
*   Lorsque vous disposez d'un bloc constitué de plus d'une ligne dans un if, comment indiquez vous la fin du bloc ?
+On diminue l'indentation à la ligne suivant le bloc, pour revenir à une indentation identique à celle de la ligne possédant l'instruction if
-On utilise une accolade } après la dernière ligne du bloc if
-On ne met pas le caractère : à la dernière ligne du bloc if
-On met une majuscule à la première lettre de la ligne suivant la fin du bloc if


==

title= Quizz

text = Pas de text 

before==

from radio import Radio
from customcheckbox import CustomCheckbox
from customtextselect import CustomTextSelect
radio = Radio() 
check = CustomCheckbox()
ztext = CustomTextSelect()
import random
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
if 'nbstep' in globals():
    list_questions = random.sample(list_questions, nbstep)



nbstep = len(list_questions)
random.shuffle(list_questions)

step= -1 # première étape 
text= f"Ce test contient {nbstep} questions. Pas de retour arrière et un seul essai ! "


scores=[]
feedbacks=""
==
intro ==
Ce quiz contient {{nbstep}} questions.
==

@ /AAAA/dominique/01_MULTISTEP/jinjafilter.py

evaluator==
from jinjafilter import setFilter

env = setFilter()


def format_feedback_lightscore(score,feedback):
    if score==-1:
        return f"""<div class="alert alert-info "><strong>{score}</strong> <br> {feedback}</div>"""
    return  f"""<div class="alert alert-secondary"><strong>Score : {score} / 100 <br> </strong> {feedback}</div>"""


def evaluate(q):
    if q['type'] == "Radio":
        return radio.eval()
    if q['type'] == "Checkbox":
        return check.eval()
    if  q['type'] == 'TextSelect':
        return ztext.eval()

def strfromcomp(q):
    if q['type'] == "Radio":
        return "{{ radio | component }}"
    if q['type'] == "Checkbox":
        return "{{ check | component }}"
    if  q['type'] == 'TextSelect':
        return "{{ ztext | component }}"

currentscore=0
if step> -1:
    pass
    # Evaluation de la réponse et stockage pour la suite 
    q=list_questions[step]
    score = evaluate(q)
    scores.append(score)
    fifi = text + " \n " + strfromcomp(q)
    feedbacks += str(env.from_string(fifi).render(globals()))
    currentscore=sum(scores)//nbstep

step = step+1



if step<nbstep:

    q=list_questions[step]
    title = str(step)+str(q)
    if q['type'] == "Radio":
        radio = Radio() 
        radio.setitems(q['items'])
        radio.setsol_from_index(q['index'])
        if 'ordered' not in q['options']:
            radio.shuffle()
    elif q['type'] == "Checkbox":
        check=CustomCheckbox()
        check.setitems(q['items'])
        check.setsol_from_index(q['index'])
        if 'ordered' not in q['options']:
            check.shuffle()
    elif  q['type'] == 'TextSelect':
        ztext.setdata_from_textDR(q['items'][0])
    statement = q['text']
    grade=(currentscore, "<br>")
    text="""Question {{ step + 1 }}.
    {{ statement | safe }}"""
else: # Fin de l'exo 
    text  = format_feedback_lightscore(currentscore, "") + feedbacks
    form= ""
    grade=(currentscore, "Merci et à Bientot.")

==



form==
{% if q['type'] == "Radio" %}
    {{ radio | component }}
{% elif q['type'] == "Checkbox" %}
    {{ check | component }}
{% elif q['type'] == "TextSelect" %}
    {{ ztext | component }}
{% endif %}
==









