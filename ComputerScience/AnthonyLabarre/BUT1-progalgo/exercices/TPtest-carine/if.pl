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
         grade = tools.grade_wrong("il manque un cas")    
    else:
        if _foo != 'OK':
            grade = tools.grade_wrong('ne fonctionne pas pour x = ' + str(x))
        else:
            x=43
            exec(code2)
            if _foo != 'KO':
                grade = tools.grade_wrong("ne fonctionne pas pour x = " + str(x) )
            else:
                grade= 100, tools.good('Bonne r&#233;ponse !')
==










