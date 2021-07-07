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
print("debug : ", code ,'==' in code, file=sys.stderr) 

a = random.randint(1,1000)
b = random.randint(1,1000)

def check(somme):
    # if('==' in code):
    #     return display.grade_wrong('== ne permet pas de faire une affectation')
    
    if somme != a+b :
        return display.grade_wrong('la variable <strong>somme</strong> n\'a pas la bonne valeur')

    msg = display.good('Bonne r&#233;ponse !')
    if(';' in code):
        msg += display.rmk('le point-virgule est inutile')
    if('(' in code):
        msg += display.rmk('les parenth&#232;ses sont inutiles')
    if('++' in code):
        msg += display.rmk('un seul + suffit')
    return (100, msg)


# tente d'executer, puis verifie la présence de la variable demandée. si ok, check valeur et syntaxe.
try:
    exec(code)
except Exception as e:
    grade = display.grade_wrong('Le code ne compile pas, il provoque l\'erreur suivante : ' + str(e))
else:
    if not 'somme' in locals():
        msg = display.wrong('la variable  <strong>somme</strong> n\'existe pas')
        if '==' in code:
            msg += display.rmk('== ne permet pas de faire une affectation')
        grade = 0, msg
    else :
        grade = check(somme)
        del somme # pour eviter que la variable existe si l'on change le code sans refresh.
==









