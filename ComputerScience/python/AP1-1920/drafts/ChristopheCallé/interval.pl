extends=../../templates/plsoluce.pl

@ interval.py
@ /builder/before.py [builder.py]

title=Intervales

text==
$%
{{ latex }}
%$
code
==


before==
import interval

i = interval.makeinterval()[0]
latex = i[0]
code = i[1]

==


