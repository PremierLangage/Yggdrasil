

title= Booleans
tag=python

extends=/model/AMC_TXT.pl

questions==
** Booleens Sept V3
Le code suivant détermine si un rectangle dont les cotés
sont parallèles aux axes du repère de l'écran est un rectangle vertical :  
```
SE_x = int(input("Donnez moi un entier : "). 
SE_y = int(input("Donnez moi un entier : "). 
NW_x = int(input("Donnez moi un entier : "). 
NW_y = int(input("Donnez moi un entier : "). 
lc_1 = abs(NW_x - SE_x). 
lc_2 = abs(NW_y - SE_y). 
x = lc_1 < lc_2. 
if x:  
     print("C'est un rectangle vertical")
else:
     print("Ce n'est pas un rectangle vertical)
```
On rappelle que  abs(x) permet de calculer la valeur absolue de  x.
Quelles sont les variables booléennes de ce programme ?
+  x
-  SE_x
-  SE_y
-  NW_x
-  NW_y
-  lc_1
-  lc_2
==

