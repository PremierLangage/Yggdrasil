# coding: utf-8
@ /utils/sandboxio.py

# pour importer ses propres modules
@ ../tools.py

grader=@ /grader/evaluator.py

title== #|html|
Test et affichage
==

text== #|html|
Affichez 'positif' si la variable **x** (qui existe déjà) est strictement positive.
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
    x=random.randint(1,100)
    exec(code2)
except Exception as e:
    msg = tools.wrong("Le code ne compile pas, il provoque l'erreur suivante : " + str(e))
    grade = 0, msg 
else:
    if not '_foo' in locals():
         grade = tools.grade_wrong("Hum... quelle fonction utilisez-vous pour l'affichage ?")    
    else:
        if _foo != 'positif':
            grade = tools.grade_wrong('Hum... vous affichez ' + _foo + ' pour la valeur x = ' + str(x))
        else:
            del _foo
            x=0
            exec(code2)
            if '_foo' in locals():
                grade = tools.grade_wrong('Vous affichez ' + _foo + ' pour la valeur x = ' + str(x) + ', alors que vous ne devriez rien afficher.')
            else:
                x=-random.randint(1,100)
                exec(code2)
                if '_foo' in locals():
                    grade = tools.grade_wrong('Vous affichez ' + _foo + ' pour la valeur x = ' + str(x) + ', alors que vous ne devriez rien afficher.')
                else:
                    rmk=""
                    if 'else' in code :
                        rmk=tools.rmk("Il y a plus simple, sans utliser <strong>else<strong>")
                    grade= 100, tools.good('Bonne r&#233;ponse !') + rmk
==










