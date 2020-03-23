extends = /model/multistep.pl

@ /demo/basic/pays_europe.csv

title = Quiz : Capitales européennes

nbstep % 3
settings.cumulative % false

before == #|python|
from customradio import CustomRadio
from customcheckbox import CustomCheckbox

pending = False
i = -1
comp = []
textstep = []
for line in questions.splitlines()+['']:
    line = line.strip()
    if line.startswith('*'):
        k = 0
        index = []
        items = []
        pending = True
        i += 1
        textstep.append(line[1:].strip())
    if line.startswith(('+','-')):
        items.append(line[1:].strip())
        if line.startswith('+'):
            index.append(k)
        k += 1
    if line == "" and pending:
        comp.append(CustomRadio())
        comp[i].setitems(items)
        comp[i].setsol_from_index(0)
        comp[i].shuffle()
        pending = False

nbstep = i + 1
==

intro ==
Ce quiz contient {{nbstep}} questions.
==

textstep ==
<strong> Question {{ step + 1 }}. </strong> 
Quelle est la capitale {{ du_pays[step] }} ?
==

formstep ==
{{ comp[step]|component }}
==

evaluatorstep ==
score = comp[step].eval()
==

questions ==
* Parmi les données suivantes, lesquels sont en binaire dans un
  ordinateur ?
+ Un fichier audio wav
+ Un fichier audio mp3
+ Une image jpeg
+ Une image png
+ Un entier négatif
+ Un entier positif
+ Le texte intégral de Germinal dans un fichier texte
+ La position du pointeur de la souris

** Parmi les nombres binaires suivants, lesquels sont les multiples de 4 ?
- 10010101
- 10110111
- 110010
- 1
+ 0
+ 100
+ 10100
+ 110100100
+ 10000000
==
