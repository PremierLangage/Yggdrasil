extends=../../templates/plsoluce.pl

@ interval.py
@ /builder/before.py [builder.py]

title=Intervales

text==
{{ inter }}
==


before==
import interval

inter = interval.makeinterval()
==


