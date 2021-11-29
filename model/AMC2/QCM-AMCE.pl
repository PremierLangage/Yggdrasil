

# NE MODIFIER PAS CE FICHIER MERCI 
# NE MODIFIER PAS CE FICHIER MERCI 
# NE MODIFIER PAS CE FICHIER MERCI 
# NE MODIFIER PAS CE FICHIER MERCI 
# NE MODIFIER PAS CE FICHIER MERCI 
# NE MODIFIER PAS CE FICHIER MERCI 
# NE MODIFIER PAS CE FICHIER MERCI 

# C'EST COMPRIS !!!!

# FAITES UN EXTENDS DESSUS ET DEFINISER VOTRE BALISE questions
# extends=  /model/AMC2/essaitextselect.pl 

extends = /model/multistep.pl

@ /model/AMC2/AMC2.py [AMC.py]

@ aleaq.py 

settings.cumulative % false


# une seule quetions par groupe de questions 
#text=

onepergroup=true

questions==



=*+ Exo avec click sur un mot ici bonne est le bon mot 
 Vous  pouvez en mettre plusieurs séparer vos mots par des espace 
 si vous souhaiter mettre un espace ajouter des crochet autour des caractères en question   
>j'indique avec des doubles curly brackets la {{bonne}} réponse

=**[nb=13, group=odd] What are the $%odd%$ numbers ? 

+=[x for x in range(3,77) if x%2==1 ]
-=[100,200,300,400,500,600]
-=[x for x in range(2,20) if x%2==0 ]

=**[nbb=2,nbg=2] Indiquer les identifiants correctes
+=["un","deux","ident","prout"]
-=["666","aujourd'hui", "def", "@lt;html@gt;"] 
-=["!autres","truc%","pour ris"]
- for
-=["list","int","dic"]


=**[nbb=2,nbg=2] Indiquer les identifiants correctes
+=["un","deux","ident","prout"]
-=["666","aujourd'hui", "def", "@lt;html@gt;"] 
-=["!autres","truc%","pour ris"]
- for
-=["list","int","dic"]

=**[nb=13, group=odd] What are the odd numbers ? 
+=[x for x in range(3,77) if x%2==1 ]
-=[100,200,300,400,500,600]
-=[x for x in range(2,20) if x%2==0 ]


=*[nb=2,group=odd] What are the odd numbers ? 
+=[x for x in range(3,77) if x%2==1 ]
+ 1
-=[x for x in range(3,77) if x%2==0 ]


=*[nb=6,group=odd] What are the odd numbers ? 
+=[x for x in range(3,77) if x%2==1 ]
-=[x for x in range(3,77) if x%2==0 ]

==


title= Cher enseignant vous n'avez pas changer le "title" 

before == #|python|
import random as rd
from radio import Radio
from checkbox import Checkbox
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
    list_questions=onefromeachgroup(list_questions,1)
elif 'nbstep' in globals():
    list_questions = rd.sample(list_questions, nbstep)

nbstep = len(list_questions)

comp = []
statement  = []
rd.shuffle(list_questions)
for i, q in enumerate(list_questions):
print(q)
    q=buildquestion(q) # Gestion de l'aléa 
    if q['type'] == "Radio":
        comp.append(Radio())
        statement.append(q['text'])
        comp[i].set_items(q['items'])
        comp[i].set_sol(q['index'])
        if 'ordered' not in q['options']:
            comp[i].shuffle()
    elif q['type'] == "Checkbox":
        comp.append(Checkbox())
        statement.append(q['text'])
        comp[i].set_items(q['items'])
        comp[i].set_sol(q['index'])
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












