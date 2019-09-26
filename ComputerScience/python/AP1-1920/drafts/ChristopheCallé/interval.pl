extends=../../templates/plsoluce.pl

@ interval.py
@ /builder/before.py [builder.py]

title=Intervales

text==
_____
$%
\infty
\cup
{{ latex }}
%$
_____
{{ code }}
_____
==


before==
import interval

_iterval = interval.makeinterval()
latex = _iterval[0]
code = _iterval[1]

==


