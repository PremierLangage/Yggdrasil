

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

Si vous voulez plusieurs groupes de test vous notez pltest1 puis pltest2 etc 

    pltest1==
    Le test suivant sera affiché telquel à l'étudiant 
    >>> f != f
    True 
    ET sera biensur toujour faux
    le test suivant ne sera affiché que si il cause une erreur et seulement l'erreur sera affiché
    >>> f==f #
    True

    le test suivant affichera le text qui suit le #
    >> f == f # Bande de moules 
    True
    ==
  #@ template.md [template.html]
        

Si vous souhaitez faire des tests sur le code de l'élève la variable __student__ est accessible dans le pltest

    pltest2==
    >>> student.count("if")>1 # Trop de tests IF 
    False
    ==

==

@ pltest_doc.py
@ /ComputerScience/python/1NSI-2122/DM/pltestgrader_before.py [grader.py]
@ feedback2.py
@ /ComputerScience/python/template/anothertemplate.html [template.html]
# 

@ /utils/sandboxio.py
@ /builder/none.py [builder.py]

editor.fontsize=14
# une interface standard d'exercice avec un editeur pour la réponse
form=@ /form/text_editor.html

settings.allow_reroll=1
