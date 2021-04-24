extends = /model/basic/dragdrop.pl

shuffle % true

text ==
Compléter le texte suivant avec les étiquettes.
==


footerbefore ==
import re

sol = re.findall(r'\{(.*?)\}', filledtext)

count = -1
def replace(x):
    global count
    count += 1
    return "{{ drops[" + str(count) + "]}}"

form = re.sub(r'\{(.*?)\}', replace , filledtext)

form2 = """

<br><br>

{% for label in labels %}
{{ label|component }}
{% endfor %}
"""

form = form + form2
==
