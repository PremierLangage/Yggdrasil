# coding: utf-8

@ /utils/sandboxio.py

# pour importer ses propres modules
@ ../../display_tools.py

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
import display_tools as display

code = response['answer']
#print("debug : ", code, file=sys.stderr) 

a = random.randint(1,1000)
b = random.randint(1,1000)

# teste si la variable demandée existe (et pas d'erreur de compil, évidement)
def check(somme):
    # bonne valeur ?
    if somme != a+b :
        return display.grade_wrong('la variable <strong>somme</strong> n\'a pas la bonne valeur')

    # ajout des éventuelles remarques de syntaxe
    return 100, display.good('Bonne r&#233;ponse !') + display.remarks([';','('], code)


# tente d'executer, puis verifie la présence de la variable demandée. si ok, check valeur et syntaxe.
try:
    exec(code)
except Exception as e:
    msg = display.wrong("Le code ne compile pas, il provoque l'erreur suivante : " + str(e))
    grade = 0, msg + + display.remarks(['==','<-',':='], code)
else:
    if not 'somme' in locals():
        grade = display.grade_wrong("La variable  <strong>somme</strong> n'existe pas")
    else :
        grade = check(somme)
        del somme # pour eviter que la variable existe si l'on change le code sans refresh.
==









