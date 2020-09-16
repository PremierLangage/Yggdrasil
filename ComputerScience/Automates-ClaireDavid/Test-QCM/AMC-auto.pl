
#fichier type pour faire un exo qui affiche un automate et pose des questions de type AMC

extends = /model/multistep.pl

@ /utils/format/AMC.py
@ tomate.py

settings.cumulative % false
#Q Déjà dans exo-auto.pl à virer?
#mk_auto == #|python|
#viewer.automaton+="s0:a>s2"
#==

before == #|python|
import random as rd
from customradio import CustomRadio
from customcheckbox import CustomCheckbox
from AMC import parse_AMC_TXT

#pour récupérer la fonction de création d'automate
from tomate import createauto

# si on veut un truc aléatoire il faut produire l'automate ici
viewer.automaton = createauto()
#Q à garder ici ou mettre dans exo-auto.pl?
exec(mk_auto)

list_questions = parse_AMC_TXT(questions)

if 'nbstep' in globals():
    list_questions = rd.sample(list_questions, nbstep)
else:
    nbstep = len(list_questions)

comp = []
statement  = []

for i, q in enumerate(list_questions):
    if q['type'] == "Radio":
        comp.append(CustomRadio())
    elif q['type'] == "Checkbox":
        comp.append(CustomCheckbox())
    statement.append(q['text'])
    comp[i].setitems(q['items'])
    comp[i].setsol_from_index(q['index'])
    if 'ordered' not in q['options']:
        comp[i].shuffle()
==

title = Automaton exo test

intro ==
Ce quiz contient {{nbstep}} questions.
==

textstep ==
<strong> Question {{ step + 1 }}. </strong> 
{{ statement[step] }}
==

formstep ==
{{ viewer|component }}
{{ comp[step]|component }}
==

evaluatorstep ==
score = comp[step].eval()
==

viewer =: AutomatonDrawer


