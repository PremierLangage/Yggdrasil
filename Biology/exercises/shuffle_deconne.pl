
extends = /model/basic.pl

title = Shuffle déconne

before==#|python|
from random import shuffle
from collections import OrderedDict
a = {1:1,2:2,3:3,4:4,5:5,13:88}
b = list(a.items())
shuffle(b)
z=OrderedDict()
for x in b:
    z.add(x,a[x])
a=z
s = str(a)
==

text ==
{{s}} bien shufflé
<br>
{% for items in a.items() %}
{{items}}
{{str(a)}}
{% endfor %}
pas bien 
<br>

==

form ==
Form
<br>
{% for key, value in a.items() %}
{{key}}:{{value}}
{% endfor %}
</br>
==

settings.feedback = lightscore

evaluator==#|python|
grade = (100,'')
==







