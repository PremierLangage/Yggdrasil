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
montexte=r"il était une fois un {=lapin, chien    #avec de grandes oreilles} de \n    pelage {=blanc,bleu,rouge } blabli blablou {=hiver,ete,automne #oh saison} et toc.."
from loadexo import *

enonc,dico = splitenonce(montexte)

# le html input
#for item in dico:
#    text=text+"<br/>"+ r'{item}' +"<br/> Entrée "+item['value']+" et feedback "+ item['feedback']+"<br/>"

monhtml=enonc

it=dico

menuUn='<select name="pets" id="pet-select"><option value="">--Please choose an option--</option>'
#for it in dico:
#    menuUn=menuUn+"<option value="">" + it['value'] +"</option>"
menuUn=menuUn+'</select>'
form=menuUn

strtemp=gethtmlmenu(enonc,dico)

text=text+"<br/>"+enonc+"<br/> Result= " +str(dico)+"<br/>"
==

