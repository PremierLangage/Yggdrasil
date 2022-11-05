

# Ceci est un template pour faire des exercices avec la balise de correction pltest
# Ce template utilise les componants

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

Pour que les tests s'arrète sur la première erreur
    stopfirsterror=True # Valeur par defaut (True)


TODO: avoir une variable lpltest qui contient une liste de pltest multilignes qui sont joués comme des groupes.


==

@ ./utils/pltest_doc.py
@ ./utils/pltestgrader.py [grader.py]
@ ./utils/feedback2.py
# probleme avec le template @ ./utils/template.html
# d'ou l'utilisation de ce lui la 
@ /ComputerScience/python/template/anothertemplate.html [template.html]

@ /utils/sandboxio.py

@ /builder/before.py [builder.py]
before=

editor.fontsize=14
# une interface standard d'exercice avec un editeur pour la réponse
form=@ /form/text_editor.html

settings.allow_reroll=1








