extends = /model/basic/dragdrop.pl

title ==
Exemple 1
==


dropsolutions ==
homologues
hétérologues
spermatozoïde
ovocyte
diploïdes
haploïdes
==


form ==
On trouve dans une cellule somatique 23 paires de chromosomes: 22 paires de chromosomes {{ drops[0]|component }},  et  une  paire  de  chromosomes  {{ drops[1]|component }}  (les  chromosomes sexuels  X  et  Y). 
Dans  une  paire  de  chromosomes  homologues  (numérotés  de  1  à  22),  un des  chromosomes vient  du gamète  paternel  ({{ drops[2]|component }}),  l’autre  du gamète  maternel  ({{ drops[3]|component }}).  
Les cellules  humaines  somatique  sont  dites {{ drops[4]|component }} (contiennent  23 paires  de  chromosomes),  alors  que les cellules germinales (les gamètes) sont dites {{ drops[5]|component }} (23 chromosomes).

<br>
{% for label in labels %}
{{ label|component }}
{% endfor %}
==
