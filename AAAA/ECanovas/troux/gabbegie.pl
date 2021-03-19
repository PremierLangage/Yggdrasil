extends = /gift/templates/qshortset.pl

title==
Exercice à troux
==

text==#|markdown|
Compléter les trous du texte suivant

il était une fois un {=lapin,chien #avec de grandes oreilles} de 
pelage {=blanc,bleu,rouge #une couleur!} blabli blablou..

== 

before==
import re
lines = text.split('\n')
choices = []
pattern = re.compile(r'.*{(?:=(?P<value>(?:(?:\\\#)|[^\#])+)(?:\#(?P<feedback>.*))?)}')
for line in lines:
    match = pattern.match(line)
    if not match:
        continue
    choice = {
        "feedback": match.group('feedback') or '',
        "value": match.group('value').strip()
    }
    choices.append(choice)

#choices=re.findall(pattern,text)
st1=re.sub(r'{.*}', '??', text)
st2=choices
text=st1+" et {{st2}}<br/>"

# le html input
#for item in choices:
#    text=text+"{{item}} Entrée {{item['value']}} et feedback {{item['feedback']}}<br/>"
# r=len(choices)
# for it in list(range(2)):

un=choices[0]
deux=choices[1]
# que le texte est ?? pour les inserts menu
monhtml=re.sub(r'{.*}', '??', text)

# {{un['value']}} et feedback {{un['feedback']}}<br/>"
it1=un['value']
it2=un['value'][1]
menuUn='<select name="pets" id="pet-select"><option value="">--Please choose an option--</option>'
#for it in un['value']:
#    menuUn=menuUn+'<option value="">{{it}}</option>'
menuUn=menuUn+'<option value="">{{it1}}</option>'
menuUn=menuUn+'<option value="">{{it2}}</option>'
menuUn=menuUn+'</select>'
form=menuUn
text=text+"mon HTML {{menuUn}}"
==

