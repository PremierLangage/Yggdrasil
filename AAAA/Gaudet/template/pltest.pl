

# Ceci est un template pour faire des exercices avec la balise de correction pltest
doc==
pour cela vous utiliser la syntaxe de doctest par exemple pour tester une fonction f 

    pltest==
    >>> f == f # La fonction existe  ?
    True
    >>> f() # f retourne ou affiche  42
    42
    >>> f() == 42 # retourne 42 
    True
    ==

==

@ ./utils/pltest_doc.py
@ ./utils/pltestgrader.py [grader.py]
@ ./utils/feedback2.py
@ ./utils/anothertemplate.html [template.html]
@ ./utils/langhandlers.py
# 

@ /utils/sandboxio.py
@ /builder/none.py [builder.py]

editor.fontsize=14
# une interface standard d'exercice avec un editeur pour la réponse
form=@ /form/text_editor.html

settings.allow_reroll=1


