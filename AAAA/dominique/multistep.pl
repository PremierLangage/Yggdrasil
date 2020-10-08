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

** poufpu
+ oui
- non
==


title=

text =

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


==
intro ==
Ce quiz contient {{nbstep}} questions.
==


evaluator==

q=questions[step]

if q['type'] == "Radio":
    radio.setitems(q['items'])
    radio.setsol_from_index(q['index'])
    if 'ordered' not in q['options']:
        radio.shuffle()
elif q['type'] == "Checkbox":
    check.append(CustomCheckbox())
    check.setitems(q['items'])
    check.setsol_from_index(q['index'])
    if 'ordered' not in q['options']:
        check.shuffle()
elif  q['type'] == 'TextSelect':
    statement.append(q['text'])
    ztext.setdata_from_textDR(q['items'][0])


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

