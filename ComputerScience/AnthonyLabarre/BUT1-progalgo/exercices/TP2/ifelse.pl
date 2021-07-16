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
code2 = re.sub("print *\(", "_foo=(", code)

# tente d'executer, puis verifie la présence de la variable demandée. si ok, check valeur et syntaxe.
try:
    x=42
    exec(code2)
except Exception as e:
    msg = tools.wrong("Le code ne compile pas, il provoque l'erreur suivante : " + str(e))
    grade = 0, msg 
else:
    if not '_foo' in locals():
         grade = tools.grade_wrong("il manque au moins un cas")    
    else:
        if _foo != 'OK':
            grade = tools.grade_wrong('Hum... vous affichez ' + _foo + ' pour la valeur x = ' + str(x))
        else:
            del _foo
            x=random.choice([-10,-2,0,1,32,4,2,41,43,100,4222222])
            exec(code2)
            if not '_foo' in locals():
                grade = tools.grade_wrong("il manque au moins un cas")    
            else:
                if _foo != 'KO':
                    grade = tools.grade_wrong('Hum... vous affichez ' + _foo + ' pour la valeur x = ' + str(x))
                else:
                    grade= 100, tools.good('Bonne r&#233;ponse !')
==










