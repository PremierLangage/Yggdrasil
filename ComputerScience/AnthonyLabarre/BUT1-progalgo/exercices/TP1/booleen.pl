# coding: utf-8
@ /utils/sandboxio.py

# pour importer ses propres modules
@ ../tools.py

grader=@ /grader/evaluator.py

title== #|html|
Op&#233;rations bool&#233;ennes 
==

text== #|html|
Initialisez la variable **booleen** avec la valeur de **a** ET **b** OU **c** (qui existent déjà).
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

lst=[]

def check():
    for a,b,c,booleen in lst :
        if (a and b or c) != booleen :
            return tools.grade_wrong( 'r&#233;ponse incorrecte pour :' + str(a) + ' ET ' + str(b) + ' OU ' + str(c))

    # ajout des éventuelles remarques de syntaxe
    return 100, tools.good('Bonne r&#233;ponse !') + tools.remarks([';', '(', '\n'], code)


# tente d'executer, puis verifie la présence de la variable demandée. si ok, check valeur et syntaxe.
try:
    for a in [True,False]:
        for b in [True,False]:
            for c in [True,False]:
                exec(code)
                if 'booleen' in locals():
                    lst.append((a,b,c,booleen))
except Exception as e:
    msg = tools.wrong("Le code ne compile pas, il provoque l'erreur suivante : " + str(e))
    grade = 0, msg + tools.remarks(['==','<-',':='], code)
else:
    if not 'booleen' in locals():
        grade = tools.grade_wrong("La variable  <strong>booleen</strong> n'existe pas")
    else :
        grade = check()
        del booleen # pour eviter que la variable existe si l'on change le code sans refresh.
==










