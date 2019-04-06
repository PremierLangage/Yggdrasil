@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ data_conjugaison.txt [data.txt]

text= dummy
title = Conjugaison d'un verbe

before ==
import json
import random
p=random.choice(['1s','2s','3s','1p','2p','3p'])
dicpersonne={'1s':'1ère personne du singulier',
'2s':'2e personne du singulier',
'3s':'3e personne du singulier',
'1p':'1ère personne du plurielr',
'2p':'2e personne du pluriel',
'3p':'3e personne du pluriel'}
personne=dicpersonne[p]

with open('data.txt') as json_file:  
    data = json.load(json_file)
    verbe=random.choice(list(data["verbe"].keys()))
    t=data["verbe"][verbe]['terminaison']
    sol=data["verbe"][verbe]['base']+data["terminaison"][t][p]
    
text="""Conjuguer le verbe {} à la {}.""".format(verbe,personne)
==

form==
<div class="input-group">
<input id="form_answer" type="text" class="form-control" value="{{ answers__.answer }}" required/>
</div>
==

evaluator ==
feedback=""
if set(sol)==set(ans):
    grade=(100,"Bonne réponse")
else:
    if len(set(sol)-set(ans))>0 :
        feedback += "Tu en a oublié !"
    if len(set(ans)-set(sol))> 0 :
        feedback += "Tu en a mise en trop !"
    grade=(0,feedback)
==





