# coding: utf-8

@ /utils/sandboxio.py

# pour importer ses propres modules
@ ../display_tools.py

grader=@ /grader/evaluator.py


#un éditeur simple, fond blanc, pas de chois de langage
form=@ /form/text_editor.html 
editor.value = "the new text here"

title== #|html|
Somme de variables
<script>
    editor.setOption("maxLines", 1);
    form.editor.setTheme("dark");
</script>
==

text== #|html|
Initialisez la variable **somme** avec la somme des variables **a** et **b** (qui existent déjà).
<script>
    editor.setOption("maxLines", 1);
        form.editor.setTheme("dark");

</script>

==

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
    grade = display.grade_wrong('Le code ne compile pas, il provoque l\'erreur suivante : ' + str(e))
    quit()
else:
    try:
        somme+=0 # permet de lever une erreur si la variable n'existe pas
    except Exception as e:
        grade = display.grade_wrong('la variable  <strong>somme</strong> n\'existe pas')
    else :
        if somme == a+b :
            msg = display.good('Bonne r&#233;ponse !')
            if(';' in response['answer']):
                msg += display.rmk('le point-virgule est inutile')
            if('(' in response['answer']):
                msg += display.rmk('les parenth&#232;ses sont inutiles')
            if('++' in response['answer']):
                msg += display.rmk('un seul + suffit')
            grade = (100, msg)
        else:
            if('==' in response['answer']):
                grade = display.grade_wrong('== ne permet pas de faire une affectation')
            else:
                grade = display.grade_wrong('la variable <strong>somme</strong> n\'a pas la bonne valeur')
==

