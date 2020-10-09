@ /utils/sandboxio.py
@ /utils/components/scoring.py
@ /utils/components/radio.py [customradio.py]
@ /utils/components/checkbox.py [customcheckbox.py]
@ /utils/components/textselect.py [customtextselect.py]


@ /model/AMC2/AMC2.py [AMC.py]
@ /model/AMC2/aleaq.py 
@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

settings.cumulative % false

questions==

** poutfou

    bande 
    def
    moules

+ oui
- non

*+ klqhsfdjhqsklfsqd
>ljk jj k k {{qdqs}} kkjsjkds

==


title= Muti step a la DR

text = Pas de text 

before==

from customradio import CustomRadio
from customcheckbox import CustomCheckbox
from customtextselect import CustomTextSelect
radio = CustomRadio() 
check = CustomCheckbox()
ztext = CustomTextSelect()
import random
from AMC import parse_AMC_TXT

from aleaq import buildquestion, onefromeachgroup

list_questions = parse_AMC_TXT(questions)

if "onepergroup" in globals() and onepergroup :
    list_questions=onefromeachgroup(list_questions)
elif 'nbstep' in globals():
    list_questions = random.sample(list_questions, nbstep)

nbstep = len(list_questions)
random.shuffle(list_questions)

step= -1 # première étape 
text= f"Ce test à {nbstep} questions. Pas de retour arrière et un seul essai ! "


scores=[]
feedbacks=""
==
intro ==
Ce quiz contient {{nbstep}} questions.
==

XX==

==

evaluator==
from jinja2 import Environment, BaseLoader

def component(l):
    if isinstance(l,dict):
        selector = l["selector"]
        cid = l["cid"]
    else:
        selector = l.selector
        cid = l.cid
    return "<%s cid='%s'></%s>" % (selector, cid, selector)


env = Environment(loader=BaseLoader())
env.globals.update({
    "component":    component
})
env.filters["component"] = component


def compfortyep(q):
    if q['type'] == "Radio":
        return radio
    if q['type'] == "Checkbox":
        return check
    if  q['type'] == 'TextSelect':
        return ztext

currentscore=0
if step> -1:

    # Evaluation de la réponse et stockage pour la suite 
    q=list_questions[step]
    score = compfortyep(q).eval()
    scores.append(score)
    feedbacks += env.from_string(text+" \n "+form+" \n ").render(globals())
    currentscore=sum(scores)//nbstep

step = step+1
if step<nbstep:

    q=list_questions[step]
    if q['type'] == "Radio":
        radio.setitems(q['items'])
        radio.setsol_from_index(q['index'])
        if 'ordered' not in q['options']:
            radio.shuffle()
    elif q['type'] == "Checkbox":
        check.setitems(q['items'])
        check.setsol_from_index(q['index'])
        if 'ordered' not in q['options']:
            check.shuffle()
    elif  q['type'] == 'TextSelect':
        ztext.setdata_from_textDR(q['items'][0])
    text = "Question n°"+str(step+1)+": "+q['text']
    grade=(currentscore, "<br>")

else: # Fin de l'exo 
    text= feedbacks
    grade=(currentscore, "")
==

form==
{% if q['type'] == "radio" %}
    {{ radio | component }}
{% elif q['type'] == "Checkbox" %}
    {{ check | component }}
{% elif q['type'] == "TextSelect" %}
    {{ ztext | component }}
{% endif %}
==

