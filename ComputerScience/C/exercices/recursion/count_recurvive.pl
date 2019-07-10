# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Comptez un nombre d'opéération

author=Nicolas Borie
title=Évaluation d'une fonction récursive
tag=function|recursion|complexity

@ /utils/sandboxio.py
@ count_operation.py

text==
Voici un programme C qui fait un appel à une fonction récursive plus ou moins simple. Cette fonction
est appelée une seule fois dans le programme. Vous devez devinez la valeur qui sera retourner puis 
ensuite affichée par le main durant l'exécution du programme.

Voici le programme :

==

builder==
import sys
import json
import random

from count_operation import CountOperationExercice

if __name__ == "__main__":
    with open(sys.argv[1],'r') as f:
        context = json.load(f)
        

    exo = CountOperationExercice(random.randint(1, 20))
    exo.generate_code()
    # print("Exercice de difficulté voulue : "+str(exo._level))
    # print("Exercice de difficulté réelle : "+str(exo.final_difficulty()))
    context['code_level'] = exo.final_difficulty()
    context['code_src'] = exo.code()
    context['code_stdout'] = exo.stdout()
    context['code_trace'] = exo.trace()
    context['code_value'] = exo.ans_value()

    context['text'] += '\nDifficulté du programme généré : <b>FORCE '+ str(context['code_level']) + '</b><br />'

    context['text'] += '<pre><b>'+context['code_src']+'</b></pre>'

    with open(sys.argv[2], 'w+') as f:
        json.dump(context, f)
    sys.exit(0)
==


form==
<b>La valeur calculée dans le main vaudra :</b><input type="text" id="form_val"/>
==

grader==
import sys
import json
from sandboxio import output

if __name__ == "__main__":
    with open(sys.argv[2]) as f:
        answers = json.load(f)
    f.close()
    with open(sys.argv[1],'r') as f:
        context = json.load(f)
    f.close()
    
    grade = 0
    
    try:
        value = int(answers['val'])
    except ValueError:
        feedback = "Veuillez renseigner un entier dans la zone de saisie !"
        output(-1, feedback)

    if (value == context['code_value']):
        grade = 100
        feedback = "Bravo, vous avez bien déroulé l'exécution"
    else:
        feedback = "Ce n'est pas la bonne valeur, regardez les appels recursifs<br /><br />"
        feedback += '<pre><b>'+context['code_trace']+'\n</b></pre>'
    
    output(grade, feedback)
==

