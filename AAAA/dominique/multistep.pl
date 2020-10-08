@ /utils/sandboxio.py
@ /utils/components/scoring.py
@ /utils/components/radio.py [customradio.py]
@ /utils/components/checkbox.py [customcheckbox.py]
@ /utils/components/textselect.py [customtextselect.py]



@ /utils/sandboxio.py
@ /builder/beforestep.py [builder.py]
@ /grader/evaluatorstep.py [grader.py]

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

from AMC import parse_AMC_TXT

from aleaq import buildquestion, onefromeachgroup

list_questions = parse_AMC_TXT(questions)

if "onepergroup" in globals() and onepergroup :
    list_questions=onefromeachgroup(list_questions)
elif 'nbstep' in globals():
    list_questions = rd.sample(list_questions, nbstep)

nbstep = len(list_questions)
rd.shuffle(list_questions)


==
intro ==
Ce quiz contient {{nbstep}} questions.
==


evaluator==

q=question[step]

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

