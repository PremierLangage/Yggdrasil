# coding: utf-8
@ /utils/sandboxio.py

# pour importer ses propres modules
@ ../tools.py

grader=@ /grader/evaluator.py

title== #|html|
Test et affichage
==

text== #|html|
Affichez 'OK' si la variable **x** (qui existe déjà) vaut 42, ou 'KO' dans tous les autres cas.
==

#un éditeur simple, fond blanc, pas de chois de langage
form=@ /form/text_editor.html 

# Script d'évaluation 
evaluator== #|python|
import random
import sys 
import re
import tools # fonctions auxiliaires

code = response['answer']
print("debug : ", code, file=sys.stderr) 

code2 = re.sub("print *\(", "_foo=(", code)

print("debug : ", code2, file=sys.stderr) 
x = random.randint(41,43)

# tente d'executer, puis verifie la présence de la variable demandée. si ok, check valeur et syntaxe.
try:
    exec(code2)
except Exception as e:
    msg = tools.wrong("Le code ne compile pas, il provoque l'erreur suivante : " + str(e))
    grade = 0, msg #+ tools.remarks(['==','<-',':='], code)
else:
    grade = tools.check(code, '_foo', _foo, 'OK' if x==42 else 'KO')
    del _foo # pour eviter que la variable existe si l'on change le code sans refresh.
==










