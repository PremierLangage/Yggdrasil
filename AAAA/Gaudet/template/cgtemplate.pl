# Ceci est un template pour faire des exercices avec la balise de correction pltest
doc==
pour cela vous utiliser la syntaxe de doctest par exemple pour tester une fonction f 

    cgtest==
    >>> f == f # La fonction existe  ?
    True
    >>> f() # f retourne ou affiche  42
    42
    >>> f() == 42 # retourne 42 
    True
    ==

==

@ ./utils/cgtest.py
@ ./utils/cgtestgrader.py [grader.py]
@ ./utils/feedback2.py
@ ./utils/anothertemplate.html [template.html]
@ ./utils/langhandlers.py
# 

@ /utils/sandboxio.py
@ /builder/none.py [builder.py]

# création de l'éditeur de code
editor =: CodeEditor
editor.language = python
#editor.cid = py_editor_0
editor.code ==
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez termin
==


# une interface standard d'exercice avec un editeur pour la réponse
form==
{{editor|component}}
==

settings.allow_reroll=1


