@ /utils/sandboxio.py
@ /utils/components/scoring.py
@ /utils/components/radio.py [customradio.py]
@ /utils/components/checkbox.py [customcheckbox.py]
@ /utils/components/textselect.py [customtextselect.py]


extends = temp.pl

@ /utils/sandboxio.py
@ /builder/beforestep.py [builder.py]
@ /grader/evaluatorstep.py [grader.py]

settings.cumulative % false

text =
radio =: RadioGroup
check =: CheckboxGroup
ztext =: Text


intro ==
Ce quiz contient {{nbstep}} questions.
==


evaluator==

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

