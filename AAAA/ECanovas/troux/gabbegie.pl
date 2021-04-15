#extends = /gift/templates/qshortset.pl
extends = /model/math/expr.pl

@loadexo.py

title==
Exercice à troux
==

text==#|markdown|
Compléter les trous du texte suivant

== 

before==
#montexte="il était une fois un {=lapin, 2    #avec de grandes oreilles} de <br/>\n   pelage {=blanc-vert,bleu,rouge } blabli blablou {=hiver,ete,automne #oh saison} et toc.."

montexte="il était une fois une expression latex \
<br/>\n    {:MATHINPUT:=3,5,7} à résoudre et toc.."

from loadexo import *

# du texte vers le dico des réponses/feedbacks et texte
enonc,dico,types = splitenonce(montexte)

# html complet FORM menu 
#menuForm =gethtmlmenu(enonc,dico)
# Mathinput FORM

mathiForm=getFormMathinput(enonc,types)

#form=mathiForm

#m = defhtmlmenu(2,dico)
#text=text+"<br/>"+enonc+"<br/><i> Result= " +str(dico)+"</i><br/>"
text=text+enonc+"<br/><i> Result= " +str(types)+"</i><br/>"+str(mathiForm)
==

