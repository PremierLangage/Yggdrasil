#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

author=Nicolas Borie

title=Différence symmétrique en une seule passe!
tag=array|tableau|fonction|difficile|algorithme|linéaire|optimal|ensembles|trié

editor.height=350px

text==#|markdown|
L'objectif est ici de concevoir une fonction performante pour
visualiser la différence symmétrique entre deux ensembles. On peut
facilement représenter un ensemble d'entiers avec des tableaux triés
(strictement d'ailleurs car il ne peut pas y avoir de répétitions). 
Par exemple, un ensemble  $% \\lbrace 12, 5, 7, 14, 2 \\rbrace %$ peut
être encodé de manière canonique par le tableau C de taille 5 : 
`[2, 5, 7, 12, 14]`.


La différence symmétrique $% A \bigtriangleup B %$ entre deux ensembles $% A %$ et $% B %$ est par 
définition 

$$ A \bigtriangleup B := \lbrace x \in A | x \notin B \rbrace \cup \lbrace x \in B | x \notin A \rbrace = (A \smallsetminus B) \cup (B \smallsetminus A) = (A \cup B) \smallsetminus (A \cap B)$$

En francais, les éléments de $% A \bigtriangleup B %$ sont seulement dans $% A %$ ou
seulement dans $% B %$. Maintenant, si $% A %$ et $% B %$ sont deux tableaux triés
de manière strictement croissante, vous devrez coder une fonction dont le
prototype sera : 

`void print_diff_sym(int* A, int s1, int* B, int s2)` 

Cette dernière devra afficher le contenu de la différence symmétrique toujours de manière
triée. Il est possible de la faire efficacement, en seule passe, avec
double têtes de lecture. Les têtes de lecture pointent toujours sur les
minimums respectifs de $A$ et de $B$. Si ces derniers sont différents,
on affiche le plus petit des deux et on avance la tête de lecture
associée. Si les deux têtes pointent vers le même élément, on affiche
rien (car l'élément est dans les deux ensembles en même temps) et on
avance les deux têtes de lecture d'un cran.

Voici des exemples d'éxécution avec des tableaux de taille 10 aléatoires.


    A : 1 3 5 6 7 9 13 14 16 18   
    B : 2 3 7 10 13 14 16 18 22 25   
    A diff B : 1 2 5 6 9 10 22 25   
    
    A : 1 4 6 7 8 12 15 16 18 20   
    B : 2 6 8 9 10 13 17 21 22 26   
    A diff B : 1 2 4 7 9 10 12 13 15 16 17 18 20 21 22 26   

==

code_before==

==

code_after==#|c|

==

editor.code==

==

solution==#|c|

==

checks_args_stdin==#|python|
[ ["Exécution simple", ["1", "2", "3", "4"], ""], ]
==




