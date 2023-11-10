







@ feedback2023.py [feedback2.py] # utilisé par pltest_doc 
@ plrunner2023.py [pltest_doc.py] # utilisé par grader 
@ /grader/evaluator.py [grader.py]
@ template2023.html [template.html] # utilisé par feedback2
# 

@ /utils/sandboxio.py
@ /builder/before.py [builder.py]


title= test de syntaxe
text=

before ==
from pltest_doc import *
from feedback2 import FeedBack
code='print("Hello World"\nz=3\n'

lfb = FeedBack()
# with open("student.py","w") as ost:
#        ost.write(code)

text = "\n Corriger ce code puis valider."
r,b = PlRunner(code,"\n>>> a=1\n",fb=lfb).runpltest("Compilation",0)

text += b
==

before ==
from pltest_doc import *
from feedback2 import FeedBack


lfb = FeedBack()


text = "\n Corriger ce code puis valider."
r,b = PlRunner(code,"\n>>> a=1\n",fb=lfb).runpltest("Compilation",0)

text += b
==




editor.fontsize=14
# une interface standard d'exercice avec un editeur pour la réponse
# une interface standard d'exercice avec un editeur pour la réponse
form=@ /python/form/editorform.html

settings.allow_reroll=1



