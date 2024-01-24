

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
**C** doit être une fonction qui renvois la somme de ses deux paramètres.  
**D** doit être une fonction qui renvois le produit de ses trois paramètres.  
**E** doit être une fonction qui renvois la somme et le produit de ces deux paramètres (deux valeurs).
**F** doit être une fonction qui renvois la liste créée avec ses trois paramètres.


==

pltest0==
>>> A()
177
==

pltest1==
>>> B(123)
246
>>> B(0)
0
==


pltest2==
>>> C(3,4)
7
>>> C(100,45)
145
==

pltest3==
>>> D(2,3,5)
30
>>> D(7,11,134) == 7*11*134
True
==


pltest4==
>>> E(3,4) == (7,12)
True
>>> E(11,11) = (22,121)
True
==

pltest5==
>>> F(1,2,3) == [1,2,3]
True
>>> F(2,3,1767) == [2,3,1767]
True
==


before=
