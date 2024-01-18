
extends = /AAAA/dominique/python/template/pltest2023.pl


title = Des variables 

remarque ==

Le type int (entier)
Le type float (flottant)
Le type str (chaîne de caractères)  
Le type bool (booléen)  
Le type list (liste)  
Le type complex (complexe)  

==




text==

On vous demande de créer les variables **A,B,C,D,E,F** avec des contenus de type différents:

**A** doit être un **int** par exemple: 1   
**B** doit être un **float**  
**C** doit être une **str** une chaine de caractère  
**D** doit être une **list** une liste (vide par exemple)  
**E** doit être de type **NoneType**  
**F** doit être une **fonction** , initialiser C avec le nom d'une fonction écrite avant.

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
>>> def _x_():
...    pass
...
>>> type(F) == type(_x_) # Test type de fonction
True
==


before=
