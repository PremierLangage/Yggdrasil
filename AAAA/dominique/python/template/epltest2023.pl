


title= Pltest avec evaluator
text= Changer ce text

@ feedback2023.py [feedback2.py] # utilisé par pltest_doc 
@ plrunner2023.py [pltest_doc.py] # utilisé par grader 
@ /grader/evaluator.py [grader.py]
@ template2023.html [template.html] # utilisé par feedback2
# 

@ /utils/sandboxio.py
@ /builder/before.py [builder.py]

before ==

text += "\n# vous n'avez pas défini de before"

== 

testname0= "&ccedil;a Compile ok !"

pltest0==
>>> True
True
==

pltest1==
>>> a==9999
False
==

demo= HH


stop=1

evaluator==#|python|

from pltest_doc import PlRunner
from feedback2 import FeedBack


listoftests=[]
i=0
while "pltest"+str(i) in globals() :
    listoftests.append("pltest"+str(i))
    i = i+1

student =  response['answer']
a= True # Tout c'est bien passé jusque la ;)
outstr="" # pas de feedback pour le moment 
lfb = None # une structure feedback differente pour chaque test
nbgt = len(listoftests) 
nbpts=0
for i,pltest in enumerate(listoftests):
    lfb = FeedBack()
    tname='testname'+str(i)
    testname =  globals()[tname] if tname in globals() else "Groupe de test "+str(i+1)
    
    runner = PlRunner(student,globals()[pltest],fb=lfb)
    r, b = runner.runpltest(testname,i+1)
    outstr +=  b # Ajout au feedbakc final 
    nbpts += r
    a = a and r == 100 # si au moins un test a échoué r != 100

    if stop and r <100: # si sortir au premier groupe de tests échoué 
        break
    if "demo" in globals():
        b += "<div>"+lfb.toJson()+"</div>"
    
if "feedback" in globals(): # FIXME feedback devrai être un dictionnaire.
    outstr +=  feedback +" valeur de stop :"+ str(stop)

if a:
    grade= 100,oustr
else:
    grade= nbpts/nbgt, "Pif et "+ outstr+" Pifou"



==



editor.fontsize=14
# une interface standard d'exercice avec un editeur pour la réponse
form=@ /form/text_editor.html

settings.allow_reroll=1



