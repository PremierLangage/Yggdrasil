
extends=/ComputerScience/python/template/qcm_template.pl

title=Question 1


text=Parmi les conversions suivantes, lesquelles sont licites (autorisées, possible).

nb=4
nbtrues=2
uncrosedfalse=
good==
str(3)
bool(3)
int(3)
float(3)
int('3')
int("3")
float('1')
float('14.3')
==

bad==
int("trois")
int('trois')
float("3,14159")
float("PI")
float(’bonjour’)
bool("False")
==

feedback=show




@ /AAAA/dominique/PLATON/tojson/before.py [builder.py]

before==
==