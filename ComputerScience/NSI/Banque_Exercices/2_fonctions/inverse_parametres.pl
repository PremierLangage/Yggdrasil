extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl

title= inverse_parametres 

text==


Ecrire une fonction **inverse_parametres** qui vérifie le doctest suivant :

    La fonction inverse_parametres(param1, param2) renvoie ces paramètres 
    dans l'ordre inverse.

    >>> inverse_parametres("bonjour", "au revoir")
    ('au revoir', 'bonjour')
    >>> inverse_parametres(1, 2)
    (2, 1)

On peut créer des fonctions qui renvoient plusieurs paramètres, il suffit de les séparer par une virgule (exemple: `return res1, res2`)

Quant à l'utilisation, pour récupérer les deux renvoies de cette fonction il suffirait de faire `var1, var2 = ma_fonction_qui_renvoie_deux_valeurs()`
==

befor ==
==


editor.code==
==

pltest==
>>> inverse_parametres("bonjour", "au revoir")
('au revoir', 'bonjour')
>>> inverse_parametres(1, 2)
(2, 1)
==


