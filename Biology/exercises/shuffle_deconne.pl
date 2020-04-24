
extends = /model/basic.pl

title = Shuffle déconne

before==#|python|
from random import shuffle

a = {1:1,2:2,3:3,4:4,5:5,13:88}
b = list(a.items())
shuffle(b)
a = dict(b)
s = str(a)
==

text ==
{{str(b)}}
{{s}}
<br>
{% for items in a.items() %}
{{items}}
{% endfor %}
<br>

==

form ==
Form
<br>
for key, value in a.items()
{{key}}:{{value}}
{% endfor %}
</br>
==

settings.feedback = lightscore

evaluator==#|python|
grade = (100,'')
==






