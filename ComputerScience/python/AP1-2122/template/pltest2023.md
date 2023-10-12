


# Ceci est un template pour faire des exercices avec la balise de correction pltest

Principe vous fournissez trois variables:
le titre, le texte décrivant le code que vous souhaitez, le doctest python qui permet d'évaluer le code de l'élève.


Exemple: 

    title= Une fonction facile  
    text==
    Ecrire un fonction exp7 qui retourne son paramêtre à la puissance 7.
    ==

Un test simple ou l'utilisateur vois le test explicitement 

    testname0='Nom du groupe de test'
    pltest0==
    >>> exp7(3)
    2187
    >>> exp7(3) == 2187
    True 
    ==

    testname1='Nom du groupe de test par default Groupe test 1'
    pltest1==
    >>> 'exp7' in globals() #
    True 
    >>> exp7(3) # le test précédent apparait qu'en cas d'erreur
    2187
    >>> exp7(3) == 2187#
    True
    ==

    Les variables testname ont des valeurs par défaut.

    VERSION 2022
    testvisX=False
    Les options 
    #PL: H=T/F E='problem erreur %t' F='feedback correct' 




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