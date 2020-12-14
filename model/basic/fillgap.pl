extends = /model/basic/dragdrop.pl

title =

footerbefore ==
from customdragdrop import CustomDragDrop
drops = []
labels = []

import re

#dropsolutions = re.findall(r'\{(.*?)\}', filledtext)
#form = re.sub(r'\{(.*?)\}', lambda x: "{{ drops[" + str(next(counter)) + "]|component }}", filledtext)

dropsolutions = ["gg"]
nbdrops = len(dropsolutions)
for _ in dropsolutions:
    drops.append(CustomDragDrop.Drop())

for content in ["ggg"]:
    labels.append(CustomDragDrop.Label(content=content))

==

filledtext ==
On trouve dans une cellule somatique 23 paires de chromosomes: 22 paires de chromosomes {homologues},  et  une  paire  de  chromosomes  {hétérologues}  (les  chromosomes sexuels  X  et  Y). 
Dans  une  paire  de  chromosomes  {homologues}, un des  chromosomes vient  du gamète  paternel  ({spermatozoïde}),  l’autre  du gamète  maternel  ({ovocyte}).  
Les cellules  humaines  somatique  sont  dites {diploïdes} (contiennent  23 paires  de  chromosomes),  alors  que les cellules germinales (les gamètes) sont dites {haploïdes} (23 chromosomes).
==


text ==

==


evaluator ==
n = len(drops)
num_right = 0
num_wrong = 0

for i in range(n):
    if drops[i].content == lstsolutions[i]:
        num_right += 1
        drops[i].css += "success-state"
    else:
        num_wrong +=1
        drops[i].css += "error-state"

if num_wrong > 0 :
    score = 0
else:
    score = 100
==



