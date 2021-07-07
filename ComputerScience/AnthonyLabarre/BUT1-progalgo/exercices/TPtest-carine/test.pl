# coding: utf-8

@ /utils/sandboxio.py

# pour importer ses propres modules en spécifiant le dossier
@ ../display_tools.py

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

#print("debug : " + response['answer'], file=sys.stderr) 

a = random.randint(1,1000)
b = random.randint(1,1000)

try:
    exec(response['answer'])
except Exception as e:
    grade = grade_wrong('Le code ne compile pas, il provoque l\'erreur suivante : ' + str(e))
    exit()

try:
    somme+=0 # permet de lever une erreur si la variable n'existe pas
except Exception as e:
    grade = grade_wrong('la variable  <strong>somme</strong> n\'existe pas')
else :
    if somme == a+b :
        msg = display.good('Bonne r&#233;ponse !')
        if(';' in response['answer']):
            msg += '<span style="color:blue;"></br></br> Remarque : le point-virgule est inutile :)</span>'
        if('(' in response['answer']):
            msg += '<span style="color:blue;"></br></br> Remarque : les parenth&#232;ses sont inutiles :)</span>'
        if('++' in response['answer']):
            msg += '<span style="color:blue;"></br></br> Remarque : un seul + suffit :)</span>'
        grade = (100, msg)
    else:
        if('==' in response['answer']):
            grade = grade_wrong('== ne permet pas de faire une affectation')
        else:
            grade = grade_wrong('la variable <strong>somme</strong> n\'a pas la bonne valeur')
==









