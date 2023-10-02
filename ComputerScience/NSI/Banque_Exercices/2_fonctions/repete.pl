extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl

title= Repete 

text==
Ecrire une fonction **repete** qui vérifie le doctest suivant :

    La fonction repete(nb, expr) renvoie une chaine de caractère composé de nb fois l'expression expr séparée par un retour à la ligne

    >>> repete(3, "bonjour")
    'bonjour\nbonjour\nbonjour\n'
    >>> print(repete(3, "bonjour"))
    bonjour
    bonjour
    bonjour


==

befor ==
==


editor.code==
==

pltest==
>>> repete(3, "bonjour")
'bonjour\nbonjour\nbonjour\n'
>>> repete(0, "bonjour")
''
>>> repete(3, "")
'\n\n\n'
>>> repete(2, "ca va ? Pas trop dur ?")
'ca va ? Pas trop dur ?\nca va ? Pas trop dur ?\n'
==


