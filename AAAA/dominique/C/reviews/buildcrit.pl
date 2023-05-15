
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

@ makestuff.py [tools.py]


author = Dominique Revuz 2023

title = Générateur de grilles critèriées

form=
text=


before==
from tools import *

ledico={}

listofnames =[('titre',' Titre de l\'évaluation'),('description','Ceci décrit l\'objectif de l\'evaluation et les critères de façon générale')]
form = make_form(listofnames)
text= "** Remplir les champs SVP**<br>" 





step=0

==

evaluator==
from tools import *

listeofevals=[('titre','Titre du critère'),('description','description du critère'),('echec', 'décrire ce que (ne) contient (pas) la réponse de l\'élève qui implique un échec sur ce critère '),('passable','Décrire ce qui pour cet exercice est une copie passable'),('bien','décrire les élements de qualité attendu pour valoriser la copie sur ce critère'), ('très bien','décrire les élements de qualité qui rendent la copie remarquable')]


feedback=str(make_dict(response,[name[0] for name in listofnames]))

if step != "fin" :
    if step == 0:
        ledico =make_dict(response,[name[0] for name in listofnames])
        listofnames = listeofevals
        step=1
        response={}
        text= str(ledico)
        form=f"Ceci est votre critère numéro {step} "+ make_form(listofnames)
    else:
        feedback = listeofevals[0][0] +":"+response[listeofevals[0][0]]+"!"
        if len(response[listeofevals[0][0]])==0 or response[listeofevals[0][0]]=="fin" :
            # fin de critères 
            # wrapit up
            step = "fin"
            text= str(ledico)
            form=""
            grade=(100,"")
        else:
            ledico['platon_crit'+str(step)]= make_dict(response,[name[0] for name in listofnames])
            response={}
            form=f"Ceci est votre critère numéro {step} "+make_form(listofnames)

grade=(0,feedback)

==