@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]





@ scoring.py
@ radio.py [radio.py]
@ checkbox.py [checkbox.py]
@ textselect.py [textselect.py]


@ ../0_KK/components.py [xx.py]


@ AMC.py [AMC.py]
@ aleaq.py 

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
<p>Starting form </p>
{% if q['type'] == "Radio" %}
    {{ radio | component }}
{% elif q['type'] == "Checkbox" %}
    {{ check | component }}
{% elif q['type'] == "TextSelect" %}
    {{ ztext | component }}
{% endif %}

<p>ending form </p>
==


form=






