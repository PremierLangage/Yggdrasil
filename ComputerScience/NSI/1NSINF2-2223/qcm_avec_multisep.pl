
@ /utils/sandboxio.py
@ /utils/components/scoring.py
@ /utils/components/radio.py [radio.py]
# @ /utils/components/checkbox.py [checkbox.py]
@ /utils/components/textselect.py [textselect.py]


@ /model/AMC2/AMC2.py [AMC.py]
@ /model/AMC2/aleaq.py 
@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

settings.cumulative % false

questions==


==

check =: CheckboxGroup
ztext =: Text
radio =: RadioGroup

title= QCM PL AP1 

@ questions.txt [question1.txt]

text = Pas de text 

before==

# from radio import Radio
# from checkbox import CustomCheckbox
# from textselect import CustomTextSelect
# radio = Radio() 

# ztext = CustomTextSelect()
import random
from AMC import parse_AMC_TXT

from aleaq import buildquestion, onefromeachgroup,getmultioption

for i in range(10):
    try:
        filename=f"question{i}.txt"
        with open(filename,"r") as f:
            questions += f.read()
    except Exception as e:
        pass


list_questions = parse_AMC_TXT(questions)

l2=[]
for q in list_questions:
    n=getmultioption(q)
    for _ in range(n):
        l2.append(buildquestion(q))
list_questions=l2

onepergroup=True

if "onepergroup" in globals() and onepergroup :
    list_questions=onefromeachgroup(list_questions)
elif 'nbstep' in globals():
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

XX==

==

evaluator==


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









