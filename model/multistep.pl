@ /utils/sandboxio.py
@ /utils/components/scoring.py
@ /utils/components/radio.py
@ /utils/components/checkbox.py
@ /utils/components/textselect.py [customtextselect.py]


#extends = temp.pl

@ /utils/sandboxio.py
@ /builder/beforestep.py [builder.py]
@ /grader/evaluatorstep.py [grader.py]

settings.cumulative % false

text =
form =

title = 

intro ==
Ce quiz contient {{nbstep}} questions.
==


