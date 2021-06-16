extends = /model/basic/dragdrop.pl

shuffle % true

text ==
Compléter le texte suivant avec les étiquettes.
==

before ==
import re

sol = re.findall(r'\{(.*?)\}', filledtext)

count = -1
def replace(x):
    global count
    count += 1
    return "{{ cdrops[" + str(count) + "]}}"

form = re.sub(r'\{(.*?)\}', replace , filledtext)

form2 = """

<br><br>

{% for label in labels %}
{{ label }}
{% endfor %}
"""

form = form + form2
==

