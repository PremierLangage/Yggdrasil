@ /utils/sandboxio.py
@ builder.py
@ grader.py

@ utils/test.py
@ utils/mockinput.py
@ utils/ast_analyzer.py
@ utils/recursion_detector.py

@ jinja/testgroup.html
@ jinja/testitem.html

title = <em>(Pas de titre défini)</em>
text = <em>(Pas d'énoncé défini)</em>

# création de l'éditeur de code
editor =: CodeEditor
editor.theme=light
editor.language = python
editor.code ==
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez terminé

==

# le formulaire de l'exercice contient uniquement l'éditeur
form==
{{editor|component}}
==

# définition de la procédure de validation par défaut
grader==
begin_test_group("L'exercice n'a pas défini de procédure de validation.")
==







