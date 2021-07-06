# coding: utf-8

@ /utils/sandboxio.py
grader=@ /grader/evaluator.py

title== #|html|
Somme de variables
==

text== #|html|
Initialisez la variable **somme** avec la somme des variables **a** et **b**.
==

#un éditeur simple, fond blanc, pas de chois de langage
form=@ /form/text_editor.html 


# Script d'évaluation 
evaluator== #|python|
import random
random.seed(seed)


a = random.randint(1,1000)
b = random.randint(1,1000)

try:
    exec(response['answer'])
except Exception as e:
    grade=(0,'<span class="error-state">Le code ne compile pas, il provoque l\'erreur suivante : ' + str(e) + '</span>')
else:
    try:
        somme = somme+0
    except Exception as e:
        grade=(0,'<span class="error-state">la variable  <strong>somme</strong> n\'existe pas</span>')
    else :
        if somme == a+b :
            grade = (100,u'<span class="success-state"> Bonne r&#233;ponse ! </span>')
        else:
            grade = (0,'<span class="error-state">la variable <strong>somme</strong> n\'a pas la bonne valeur</span>')
==









