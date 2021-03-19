extends = /gift/templates/qshortset.pl

@loadexo.py

title==
Exercice à troux
==

text==#|markdown|
Compléter les trous du texte suivant

il était une fois un {=lapin,chien #avec de grandes oreilles} de 
pelage {=blanc,bleu,rouge #une couleur!} blabli blablou..

== 

before==

from loadexo import *

enonc,dico = getenonce(text)

# le html input
for item in dico:
    text=text+"{{item}} Entrée {{item['value']}} et feedback {{item['feedback']}}<br/>"
# r=len(dico)
# for it in list(range(r)):
# que le texte est ?? pour les inserts menu
monhtml=enonc

# {{un['value']}} et feedback {{un['feedback']}}<br/>"
it=dico

menuUn='<select name="pets" id="pet-select"><option value="">--Please choose an option--</option>'
for it in dico:
    menuUn=menuUn+"<option value="">{{it['value']}}</option>"
#menuUn=menuUn+'<option value="">{{dico[0]}}</option>'
#menuUn=menuUn+'<option value="">{{dico[1]}}</option>'
menuUn=menuUn+'</select>'
form=menuUn
text="mon HTML {{menuUn}} pour {{monhtml}} "+string(len(dico))
==

