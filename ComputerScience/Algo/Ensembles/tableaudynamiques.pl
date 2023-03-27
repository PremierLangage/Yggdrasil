

#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

extends=/ComputerScience/C/template/std_progC.pl

extends = ./docodesplit.pl

author=Dominique Revuz
title=Ajout dans un tableau dynamique
tag=allocation|Ensembles

editor.height=300px

text==

On représente un ensemble grace à un tableau dynamique non trié.   
```
    typedef struct {    
        int taille;/* nombre d'éléments présents*/   
        int *tab;   
        int max;/* nombre maximum d'éléments */   
    } ENSEMBLE;    
```


Nous allons dans cet exercice gérer uniquement l'aspect réallocation. Nous suppons que la constante globale BLOC est définie. 

Fournissez une fonction ENSEMBLE *alloueTabDyn(); qui alloue un tableau de taille BLOC. 

Et une fonction int resize(ENSEMBLE *e); qui si taille == max et réalloue le tableau avec BLOC d'élements en plus,
qui si taille + 2*BLOC <max réalloue le tableau avec BLOC éléments en moins.

==

editor.code==#|c|
ENSEMBLE *alloueTabDyn(){}
int resize(ENSEMBLE *e){}

==





checks_args_stdin==#|python|
	[["Arbre feuille","","4"],
	 ["arbre à 3 mots","","12  5 2"],
   ["arbre à N mots","","15 14 13 12 11 10 9 8 7 6 5 4 3 2 1"],
   
     ["Arbre aléatoire II", ""," ".join([ str(randint(1,100)) for i in range(10) ])]
]
==


