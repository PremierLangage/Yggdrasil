

extends = /model/multistep.pl

@ /model/AMC2/AMC2.py [AMC.py]

@ aleaq.py 

settings.cumulative % false

# une seule quetions par groupe de questions 
#onepergroup % true

# NE MODIFIER PAS CE FICHIER MERCI 
# FAITES UN EXTENDS DESSUS ET DEFINISER VOTRE BALISE questions
# extends=  /model/AMC2/essaitextselect.pl 






title= Cher enseignant vous n'avez pas changer le "title" 

@ exe.txt [question7.txt]
@ exe.txt [question3.txt]


before == #|python|
import random as rd
from customradio import CustomRadio
from customcheckbox import CustomCheckbox
from customtextselect import CustomTextSelect
from AMC import parse_AMC_TXT

from aleaq import buildquestion, onefromeachgroup
######


for i in range(10):
    try:
        filename=f"question{i}.txt"
        with open(filename,"r") as f:
            questions += f.read()
    except Exception as e:
        pass


######
list_questions = parse_AMC_TXT(questions)

if "onepergroup" in globals() and onepergroup :
    list_questions=onefromeachgroup(list_questions)
elif 'nbstep' in globals():
    list_questions = rd.sample(list_questions, nbstep)

nbstep = len(list_questions)

comp = []
statement  = []
rd.shuffle(list_questions)
for i, q in enumerate(list_questions):
    q=buildquestion(q) # Gestion de l'aléa 
    if q['type'] == "Radio":
        comp.append(CustomRadio())
        statement.append(q['text'])
        comp[i].setitems(q['items'])
        comp[i].setsol_from_index(q['index'])
        if 'ordered' not in q['options']:
            comp[i].shuffle()
    elif q['type'] == "Checkbox":
        comp.append(CustomCheckbox())
        statement.append(q['text'])
        comp[i].setitems(q['items'])
        comp[i].setsol_from_index(q['index'])
        if 'ordered' not in q['options']:
            comp[i].shuffle()
    elif  q['type'] == 'TextSelect':
        cst = CustomTextSelect()
        statement.append(q['text'])
        cst.setdata_from_textDR(q['items'][0])
        comp.append(cst)

==

display=

intro ==
Ce quiz contient {{nbstep}} questions.
==

textstep ==
<strong> Question {{ step + 1 }}. </strong> 
{{ statement[step] }}
==

formstep ==
{{ comp[step]|component }}
==

evaluatorstep ==
score = comp[step].eval()
==











