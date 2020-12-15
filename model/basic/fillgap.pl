extends = /model/basic/dragdrop.pl

shuffle % true

text ==
Compléter le texte suivant avec les étiquettes.
==


footerbefore ==
import re
count = -1
def replace(x):
    global count
    count += 1
    return "{{ drops[" + str(count) + "]|component }}"

from customdragdrop import CustomDragDrop
drops = []
labels = []

lstdropsolutions = re.findall(r'\{(.*?)\}', filledtext)
form = filledtext
form = re.sub(r'\{(.*?)\}', replace , form)

form2 = """
<br>
{% for label in labels %}
{{ label|component }}
{% endfor %}
"""

form = form + form2

for content in lstdropsolutions:
    labels.append(CustomDragDrop.Label(content=content))

nbdrops = len(lstdropsolutions)
for _ in lstdropsolutions:
    drops.append(CustomDragDrop.Drop())
==
