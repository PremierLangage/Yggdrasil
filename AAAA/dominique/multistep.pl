@ /utils/sandboxio.py
@ /utils/components/scoring.py
@ /utils/components/radio.py [customradio.py]
@ /utils/components/checkbox.py [customcheckbox.py]
@ /utils/components/textselect.py [customtextselect.py]



@ /utils/sandboxio.py
@ /builder/beforestep.py [builder.py]
@ /grader/evaluatorstep.py [grader.py]

settings.cumulative % false




text =
radio =: CustomRadio 
check =: CustomCheckbox
ztext =: CustomTextSelect


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
    {{ radio | components }}
{% elif q['type'] == "Checkbox" %}
{{ check | components }}
{% elif q['type'] == "TextSelect" %}
    {{ ztext | components }}
{% endif %}
==

