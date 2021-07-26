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
import string
import tools # fonctions auxiliaires

_foo = ''

def _foo_print(*objects, sep=' ', end='\n', file=sys.stdout, flush=False):
    global _foo
    _foo += sep.join(map(str,objects)) + end

code = response['answer']

# tente d'executer, puis verifie la présence de la variable demandée. si ok, check valeur et syntaxe.
if not 'print' in code :
    grade = tools.grade_wrong("Hum... quelle fonction utilisez-vous pour l'affichage ?")    
else: 
    if not '(' in code :
        grade = tools.grade_wrong("La fonction print s'utilise avec des parenthèès en python 3 !")    
    else: 
        try:
            x=42
            exec(code.replace('print','_foo_print'))
            print(_foo, file=sys.stderr) 
        except Exception as e:
            msg = tools.wrong("Le code ne compile pas, il provoque l'erreur suivante : " + str(e))
            grade = 0, msg 
        else:
            if '_foo' == '':
                grade = tools.grade_wrong("Il manque probablement un cas")    
            else:
                if _foo != 'OK':
                    grade = tools.grade_wrong('Hum... vous affichez ' + _foo + ' pour la valeur x = ' + str(x))
                else:
                    del _foo
                    x=random.choice([-10,-2,0,1,32,4,2,41,43,100,4222222])
                    print(_foo, file=sys.stderr) 
                    exec(code2)
                    if '_foo' == '':
                        grade = tools.grade_wrong("Il manque probablement un cas") 
                    else:
                        if _foo != 'KO':
                            grade = tools.grade_wrong('Hum... vous affichez ' + _foo + ' pour la valeur x = ' + str(x))
                        else:
                            grade= 100, tools.good('Bonne r&#233;ponse !')
==










