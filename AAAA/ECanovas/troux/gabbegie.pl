extends = /gift/templates/qshortset.pl

title==
Exercice à troux
==

text==#|markdown|
Compléter les trous du texte suivant

il était une fois {=lapin #avec de grandes oreilles} de 
pelage {=blanc,bleu,rouge #une couleur!} blabli blablou..

== 

before==
import re
lines = text.split('\n')
choices = []
pattern = re.compile(r'.*=(?P<value>(?:(?:\\\#)|[^\#])+)(?:\#(?P<feedback>.*))?')
for line in lines:
    match = pattern.match(line)
    if not match:
        continue
    choice = {
        "feedback": match.group('feedback') or '',
        "value": match.group('value').strip()
    }
    choices.append(choice)

text=choices

==
