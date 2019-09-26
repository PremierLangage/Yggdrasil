extends=../../templates/plsoluce.pl

@ interval.py
@ /builder/before.py [builder.py]

title=Intervales

text==
-----
$%
{{ latex }}
%$
-----
{{ code }}
-----
{{ i }}
-----
==


before==
import interval

i = interval.makeinterval()
latex = i[0]
code = i[1]

==


