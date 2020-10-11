
title= Tableau à 3 dimensions

tag=

extends=/ComputerScience/C/template/stdsandboxC.pl

author= 

text==  
 
Ecrire une fonction **raun()** qui : 

reçoit en paramètre un tableau à trois dimensions et retourne un int.

remplie le tableau à trois dimensions avec des valeurs incrémentée de 1 en 1 (on démarre à 1 et le dernier emplacement aura pour valeur N)

affiche le tableau de la manière suivante : 

Ligne Z || Colonne X {valeur} | Colonne Y {valeur} |

Exemple pour un tableau tab[2][3][5] on aura : 

Ligne 1 || Colonne 1 {1,2,3,4,5} | Colonne 2 {6,7,8,9,10} | Colonne 3 {11,12,13,14,15} |<br>
Ligne 2 || Colonne 1 {16,17,18,19,20} | Colonne 2 {21,22,23,24,25} | Colonne 3 {26,27,28,29,30} |

==

editor.code==
int raun(........, int tab[][COL][N])

==

