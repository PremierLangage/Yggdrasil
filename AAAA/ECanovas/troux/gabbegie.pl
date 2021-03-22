extends = /gift/templates/qshortset.pl

@loadexo.py

title==
Exercice à troux
==

text==#|markdown|
Compléter les trous du texte suivant

{{montexte}}

== 

before==
montexte="il était une fois un {=lapin, 2    #avec de grandes oreilles} de \
<br/>\n    pelage {=blanc-vert,bleu,rouge } blabli blablou {=hiver,ete,automne #oh saison} et toc.."

from loadexo import *

# du texte vers le dico des réponses/feedbacks et texte
enonc,dico = splitenonce(montexte)

# html complet FORM menu 
#menuForm =gethtmlmenu(enonc,dico)

#form=menuForm

m = defhtmlmenu(2,dico)
text=text+"<br/>"+enonc+"<br/><i> Result= "+m +str(dico)+"</i><br/>"
==

