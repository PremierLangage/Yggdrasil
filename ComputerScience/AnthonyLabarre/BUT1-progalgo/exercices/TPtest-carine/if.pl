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

x = random.randint(41,43)


def check(name, var, val):
    if var != val :
        return tools.grade_wrong("l'affichage n'est pas correct : " + str(var) + " au lieu de " + val)

    # ajout des éventuelles remarques de syntaxe
    return 100, tools.good('Bonne r&#233;ponse !') + tools.remarks([';'], code)


# tente d'executer, puis verifie la présence de la variable demandée. si ok, check valeur et syntaxe.
try:
    exec(code2)
except Exception as e:
    msg = tools.wrong("Le code ne compile pas, il provoque l'erreur suivante : " + str(e))
    grade = 0, msg 
else:
    grade = tools.check(code, '_foo', _foo, 'OK' if x==42 else 'KO')
    del _foo # pour eviter que la variable existe si l'on change le code sans refresh.
==










