


extends = /AAAA/dominique/python/template/pltest2023.pl


title = Des fonctions 



tag= type | variable


remarque ==

Le type int (entier)
Le type float (flottant)
Le type str (chaîne de caractères)  
Le type bool (booléen)  
Le type list (liste)  
Le type complex (complexe)  

==




text==

On vous demande de créer les fonctions **A,B,C,D,E,F** avec des comportement différents:

**A** doit être une fonction qui renvois la liste vide.  
**B** doit être une fonction avec une liste en parametre qui renvois la somme des elements de la liste.
**C** doit être une fonction qui renvois la concatenation de deux listes passées en parametre.  
**D** doit être une fonction qui renvois pour le parametre n la liste [0,...,n-1].  
**E** doit être une fonction qui renvois  pour le parametre n la liste [1,...,n].
**F** doit être une fonction qui renvois  pour les parametres n et p  la liste [1+p,2+p,...,n+p].


==

pltest0==
>>> A()
[]
==

pltest1==
>>> B([1,2,3])
6
>>> B([])
0
>>> B([4,5])
9
==


pltest2==
>>> C([1,2,3],[4,5])
[1, 2, 3, 4, 5]
>>> C([1,2],[4,5])
[1, 2, 4, 5]
==

pltest3==
>>> D(5)
[0, 1, 2, 3, 4]
>>> D(8)
[0, 1, 2, 3, 4, 5, 6, 7]
==


pltest4==
>>> E(8)
[1, 2, 3, 4, 5, 6, 7, 8]
>>> E(11)
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
==


pltest5==
>>> F(11,3)
[4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
>>> F(6,6)
[7, 8, 9, 10, 11, 12]
==


before=
