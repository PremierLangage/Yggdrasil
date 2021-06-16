extends = /model/basic/dragdrop.pl

shuffle % true

question ==
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

part1 = re.sub(r'\{(.*?)\}', replace , filledtext)

part2 = """

<br><br>

{% for clabel in clabels %}
{{ clabel }}
{% endfor %}
"""

inputblock = part1 + part2
==

