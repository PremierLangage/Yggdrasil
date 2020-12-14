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

form ==
On trouve dans une cellule somatique 23 paires de chromosomes: 22 paires de chromosomes {{ drops[0]|component }},  et  une  paire  de  chromosomes  {{ drops[1]|component }}  (les  chromosomes sexuels  X  et  Y). 
Dans  une  paire  de  chromosomes  {{ drops[6]|component }}, un des  chromosomes vient  du gamète  paternel  ({{ drops[2]|component }}),  l’autre  du gamète  maternel  ({{ drops[3]|component }}).  
Les cellules  humaines  somatique  sont  dites {{ drops[4]|component }} (contiennent  23 paires  de  chromosomes),  alors  que les cellules germinales (les gamètes) sont dites {{ drops[5]|component }} (23 chromosomes).

<br>
{% for label in labels %}
{{ label|component }}
{% endfor %}
==


filledtext ==
On trouve dans une cellule somatique 23 paires de chromosomes: 22 paires de chromosomes {homologues},  et  une  paire  de  chromosomes  {hétérologues}  (les  chromosomes sexuels  X  et  Y). 
Dans  une  paire  de  chromosomes  {homologues}, un des  chromosomes vient  du gamète  paternel  ({spermatozoïde}),  l’autre  du gamète  maternel  ({ovocyte}).  
Les cellules  humaines  somatique  sont  dites {diploïdes} (contiennent  23 paires  de  chromosomes),  alors  que les cellules germinales (les gamètes) sont dites {haploïdes} (23 chromosomes).
==



footerbefore ==
import re
count = 0
def replace(x):
    global count
    count += 1
    return "{{ drops[" + str(i) + "]|component }}"

from customdragdrop import CustomDragDrop
drops = []
labels = []

lstdropsolutions = re.findall(r'\{(.*?)\}', filledtext)
form = filledtext
form = re.sub(r'\{(.*?)\}', replace , form)


for content in lstdropsolutions:
    labels.append(CustomDragDrop.Label(content=content))

nbdrops = len(lstdropsolutions)
for _ in lstdropsolutions:
    drops.append(CustomDragDrop.Drop())
==

