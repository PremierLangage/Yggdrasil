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
            exec(code.replace('print','_foo_print'))
        except Exception as e:
            msg = tools.wrong("Le code ne compile pas, il provoque l'erreur suivante : " + str(e))
            grade = 0, msg 
        else:
            if _foo.strip(string.whitespace) != "".join(['\n'+str(i) for i in range(50)]):
                grade = tools.grade_wrong('Hum... ce n\'est pas bon, vous affichez les nombres suivants : ' + '-' + _foo + '-')
            else:
                grade= 100, tools.good('Bonne r&#233;ponse !')
==

########### Attention, ne fonctionne pas si les éétudiant utilisent print(..., end=...)








