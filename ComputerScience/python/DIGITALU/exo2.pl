

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

**A** doit être une fonction qui renvois 177.  
**B** doit être une fonction avec un parametre qui renvois le double du paramètre.  
**C** doit être une fonction qui renvois la somme des ces deux paramètres.  
**D** doit être une fonction qui renvois le produit de ces trois paramètres.  
**E** doit être une fonction qui renvois la somme et le produit de ces deux paramètres.
**F** doit être une fonction qui renvois la liste créée avec ses trois paramètres.


==

pltest0==
>>> type(A) == type(1)
True
==

pltest1==
>>> type(B) == type(0.78)
True
==


pltest2==
>>> type(C) == type("une chaine")
True
==

pltest3==
>>> type(D) == type([])
True
==


pltest4==
>>> type(E) == type(None)
True
==

pltest5==
>>> def _x_():#
...    pass#
...
>>> type(F) == type(_x_) # Test type de fonction
True
==


before=
