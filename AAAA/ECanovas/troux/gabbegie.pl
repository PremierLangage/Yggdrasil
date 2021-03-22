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
montexte="il était une fois un {=lapin, 2    #avec de grandes oreilles} de \n    pelage {=blanc-vert,bleu,rouge } blabli blablou {=hiver,ete,automne #oh saison} et toc.."
from loadexo import *

enonc,dico = splitenonce(montexte)

# le html input
#for item in dico:
#    text=text+"<br/>"+ r'{item}' +"<br/> Entrée "+item['value']+" et feedback "+ item['feedback']+"<br/>"

monhtml=enonc

it=dico

#monMenu = defhtmlmenu(1,dico)

#menuForm=re.sub("TT",monMenu,enonc)

#form=menuForm

strtemp=gethtmlmenu(enonc,dico)

text=text+"<br/>"+enonc+"<br/> Result= " +str(dico)+"<br/>"
==

