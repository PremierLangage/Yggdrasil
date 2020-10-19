@ /utils/sandboxio.py
@ /utils/components/scoring.py
@ /utils/components/radio.py [customradio.py]
@ /utils/components/checkbox.py [customcheckbox.py]
@ /utils/components/textselect.py [customtextselect.py]
@ /utils/components/matchlist.py [custommatchlist.py]


@ /model/AMC2/AMC2.py [AMC.py]
@ /model/AMC2/aleaq.py 
@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

settings.cumulative % false

questions==


==

questions=@ justine_questions.txt


title= Muti step a la DR

text = Pas de text 

before==

from customradio import CustomRadio
from customcheckbox import CustomCheckbox
from customtextselect import CustomTextSelect
from Custommatchlist import CustomMatchList
radio = CustomRadio() 
check = CustomCheckbox()
ztext = CustomTextSelect()
Match = CustomMatchList()
import random
from AMC import parse_AMC_TXT

from aleaq import buildquestion, onefromeachgroup,getmultioption

list_questions = parse_AMC_TXT(questions)

l2=[]
for q in list_questions:
    n=getmultioption(q)
    for _ in range(n):
        l2.append(buildquestion(q))
list_questions=l2

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

def format_feedback_lightscore(score,feedback):
    if score==-1:
        tpl="""<div class="alert {}"><strong>{}</strong> <br> {}</div>"""
        return tpl.format('alert-info',score, feedback)
    tpl="""<div class="alert alert-secondary"><strong>Score : {} / 100 <br> </strong> {}</div>"""
    return tpl.format(score,feedback)


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
    feedbacks += env.from_string(fifi).render(globals())
    currentscore=sum(scores)//nbstep

step = step+1
if step<nbstep:

    q=list_questions[step]
    if q['type'] == "Radio":
        radio.setitems(q['items'])
        radio.setsol_from_index(q['index'])
        radio.disabled = False
        if 'ordered' not in q['options']:
            radio.shuffle()
    elif q['type'] == "Checkbox":
        check.setitems(q['items'])
        check.setsol_from_index(q['index'])
        check.disabled = False
        if 'ordered' not in q['options']:
            check.shuffle()
    elif  q['type'] == 'TextSelect':
        ztext.setdata_from_textDR(q['items'][0])
    elif q['type'] == 'MatchList' :
        Match.setdata_from_matches(q['items'])
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
{% elif q['type'] == 'MatchList' %}
    {{ Match | component }}
{% endif %}
==









