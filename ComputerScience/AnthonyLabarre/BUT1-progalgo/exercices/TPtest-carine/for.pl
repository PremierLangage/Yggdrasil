# coding: utf-8
@ /utils/sandboxio.py

# pour importer ses propres modules
@ ../tools.py

grader=@ /grader/evaluator.py

title== #|html|
Test et affichage
==

text== #|html|
Affichez les entiers de 0 a 49, un par ligne.
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
code2 = '_foo=""\n' + re.sub("print *\(", "_foo+=' '+str(", code)

# tente d'executer, puis verifie la présence de la variable demandée. si ok, check valeur et syntaxe.
try:
    exec(code2)
except Exception as e:
    msg = tools.wrong("Le code ne compile pas, il provoque l'erreur suivante : " + str(e))
    grade = 0, msg 
else:
    if not '_foo' in locals():
         grade = tools.grade_wrong("Hum... quelle fonction utilisez-vous pour l'affichage ?")    
    else:
        if _foo != "".join(['\n'+str(i) for i in range(50)]):
            grade = tools.grade_wrong('Hum... ce n\'est pas bon, vous affichez ' + _foo)
        else:
            grade= 100, tools.good('Bonne r&#233;ponse !')
==










