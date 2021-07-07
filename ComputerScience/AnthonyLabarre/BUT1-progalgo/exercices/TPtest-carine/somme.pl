# coding: utf-8
@ /utils/sandboxio.py

# pour importer ses propres modules
@ ../tools.py

grader=@ /grader/evaluator.py

title== #|html|
Somme de variables
==

text== #|html|
Initialisez la variable **somme** avec la somme des variables **a** et **b** (qui existent déjà).
==

#un éditeur simple, fond blanc, pas de chois de langage
form=@ /form/text_editor.html 

# Script d'évaluation 
evaluator== #|python|
import random
import sys 
import tools # fonctions auxiliaires

code = response['answer']
#print("debug : ", code, file=sys.stderr) 

a = random.randint(1,1000)
b = random.randint(1,1000)


def check(name, var, val):
    if var != val :
        return tools.grade_wrong('la variable <strong>' + name + '</strong> n\'a pas la bonne valeur')

    # ajout des éventuelles remarques de syntaxe
    return 100, tools.good('Bonne r&#233;ponse !') + remarks([';', '(', '++', '\n'], code)


# tente d'executer, puis verifie la présence de la variable demandée. si ok, check valeur et syntaxe.
try:
    exec(code)
except Exception as e:
    msg = tools.wrong("Le code ne compile pas, il provoque l'erreur suivante : " + str(e))
    grade = 0, msg + tools.remarks(['==','<-',':='], code)
else:
    if not 'somme' in locals():
        grade = tools.grade_wrong("La variable  <strong>somme</strong> n'existe pas")
    else :
        grade = check('somme', somme, a+b)
        del somme # pour eviter que la variable existe si l'on change le code sans refresh.
==









