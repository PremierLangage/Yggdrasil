@ /utils/sandboxio.py
@ /utils/components/scoring.py
@ /utils/components/radio.py [radio.py]
@ /utils/components/checkbox.py [checkbox.py]
@ textselect.py [textselect.py]


@ /model/AMC2/AMC2.py [AMC.py]
@ /model/AMC2/aleaq.py 
@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

settings.cumulative % false


questions=@ /AAAA/Justine/justine_questions.txt


title= Quizz

text = Pas de text 

before=@ before.py


intro ==
Ce quiz contient {{nbstep}} questions.
==

XX==

==

evaluator=@evaluator.py




form==
{% if q['type'] == "Radio" %}
    {{ radio | component }}
{% elif q['type'] == "Checkbox" %}
    {{ check | component }}
{% elif q['type'] == "TextSelect" %}
    {{ ztext | component }}
{% endif %}
==









