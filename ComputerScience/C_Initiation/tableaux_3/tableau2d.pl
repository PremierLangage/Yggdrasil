
title=Tableau 2d de caractères
tag=tableau 2d
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Ecrire une fonction de protopype `void remplit(char t[][MAX],int li,int col);` 
ses dimensions effectives et remplit la partie effective aec les lettres minuscules conssécutives.<br>
Après la lettre $%\tt{z}%$ on repart de la lettre $%\tt{a}%$ <br>
Exemples (avec MAX 50)<br>
remplit(t,3,4) transforme les 3 premières lignes et 4 premières colonnes en<br>
abcd<br>
efgh<br>
ijkl<br>
remplit(t,4,10) transforme les 4 premières lignes et 10 premières colonnes en<br>
abcdefghij<br>
klmnopqrst<br>
uvwxyzabcd<br>
efghijklmn<br>
==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

editor.code==
==
