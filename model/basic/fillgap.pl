extends = /model/basic/dragdrop.pl

title ==
Chromosomes
==

dropsolutions ==
homologues
hétérologues
spermatozoïde
ovocyte
diploïdes
haploïdes
homologues
==

shuffle % true

text ==
Compléter le texte suivant avec les étiquettes.
==


filledtext ==
On trouve dans une cellule somatique 23 paires de chromosomes: 22 paires de chromosomes {homologues},  et  une  paire  de  chromosomes  {hétérologues}  (les  chromosomes sexuels  X  et  Y). 
Dans  une  paire  de  chromosomes  {homologues}, un des  chromosomes vient  du gamète  paternel  ({spermatozoïde}),  l’autre  du gamète  maternel  ({ovocyte}).  
Les cellules  humaines  somatique  sont  dites {diploïdes} (contiennent  23 paires  de  chromosomes),  alors  que les cellules germinales (les gamètes) sont dites {haploïdes} (23 chromosomes).
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

