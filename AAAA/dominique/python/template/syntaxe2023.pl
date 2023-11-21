


title= Erreurs de syntaxe

@ builderror.py


@ feedback2023.py [feedback2.py] # utilisé par pltest_doc 
@ plrunner2023.py [pltest_doc.py] # utilisé par grader 
@ /grader/evaluator.py [grader.py]
@ template2023.html [template.html] # utilisé par feedback2
# 

@ /utils/sandboxio.py
@ /builder/before.py [builder.py]


title= Erreurs de compilation
text=

before ==
from pltest_doc import *
from feedback2 import FeedBack
from builderror import builderror



code, letest, hint = builderror(num)

lfb = FeedBack()
# with open("student.py","w") as ost:
#        ost.write(code)

text = "\n Corriger ce code puis valider."
r,b = PlRunner(code,letest,fb=lfb).runpltest("Compilation",0)



text += b
==

evaluator ==
from pltest_doc import *
from feedback2 import FeedBack
lfb = FeedBack()


text = "\n Corriger ce code puis valider." + hint


code = str(response['answer'])
r,b = PlRunner(code,letest,fb=lfb).runpltest("Compilation",0)

if r:
    grade= (100,b)
else:
    grade= (0,b)
==




editor.fontsize=14
# une interface standard d'exercice avec un editeur pour la réponse
# une interface standard d'exercice avec un editeur pour la réponse
form=@ /python/form/editorform.html

settings.allow_reroll=1



