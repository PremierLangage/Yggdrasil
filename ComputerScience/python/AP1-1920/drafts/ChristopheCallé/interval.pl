extends=../../templates/plsoluce.pl

@ interval.py

title=Intervales

text==
{{ inter }}
==

mybuild==
import interval

inter = interval.makeinterval()
print(inter)
==
