
@ /utils/sandboxio.py
@ /ComputerScience/python/AP1-1920/templates/generic/builder.py


title = <em>(Pas de titre défini)</em>
text = <em>(Pas d'énoncé défini)</em>

# création de l'éditeur de code
editor1 =: CodeEditor
editor1.language = python
editor1.cid = py_editor_1
editor1.code ==
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez terminé

==
editor1.theme = "light"

editor2 =: CodeEditor
editor2.language = python
editor2.cid = py_editor_2
editor2.code ==
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez terminé

==


# le formulaire de l'exercice contient uniquement l'éditeur
form==
Entrez votre classe 
{{editor1|component}}
et vos fonctions 
{{editor2|component}}
==





