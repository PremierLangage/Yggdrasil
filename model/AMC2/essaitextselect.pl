
extends = /model/multistep.pl

@ AMC2.py [AMC.py]

@ aleaq.py 

settings.cumulative % false

# NE MODIFIER PAS CE FICHIER MERCI 
# FAITES UN EXTENDS DESSUS ET DEFINISER VOTRE BALISE questions
# extends=  /model/AMC2/essaitextselect.pl 
questions==

*+ Choix select simple du mot 
>j'indique avec des curly brackets la {bonne} réponse


*+ Choisir les mots qui ne sont pas des mots clefs de python
>for and or {then} else if with as {double} 



=**[nbb=2,nbg=2] Indiquer les identifiants correctes
+=["un","deux","ident","prout"]
-=["666","aujourd'hui", "def", "@lt;html@gt;"] 
-=["!autres","truc%","pour ris"]
- for
- in
- and
- or
-=["list","int","dic"]

=**[nb=13] What are the odd numbers ? 
+=[x for x in range(3,77) if x%2==1 ]
-=[100,200,300,400,500,600]
-=[x for x in range(2,20) if x%2==0 ]


=*[nb=2] What are the odd numbers ? 
+=[x for x in range(3,77) if x%2==1 ]
+ 1
-=[x for x in range(3,77) if x%2==0 ]


=*[nb=6] What are the odd numbers ? 
+=[x for x in range(3,77) if x%2==1 ]
-=[x for x in range(3,77) if x%2==0 ]



==

berk==
=** What are the odd numbers ? 
+=[x for x in range(3,77) if x%2==1 ]
-=[x for x in range(3,77) if x%2==0 ]


=*+ Choose the corrects variables names 
>+["fixe","liste","of","good","names"]
>-["6fixe","-liste","!of","$bad","variables-names"]

==

title= QCM de python 
before == #|python|
import random as rd
from customradio import CustomRadio
from customcheckbox import CustomCheckbox
from customtextselect import CustomTextSelect
from AMC import parse_AMC_TXT

from aleaq import buildquestion

list_questions = parse_AMC_TXT(questions)

if 'nbstep' in globals():
    list_questions = rd.sample(list_questions, nbstep)
else:
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
        cst.setdata_from_text(q['items'][0])
        comp.append(cst)

==

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





