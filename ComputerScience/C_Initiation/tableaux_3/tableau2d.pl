
title=Tableau 2d de caractères
tag=tableau 2d
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Ecrire une fonction de protopype `void remplit(char t[][MAX],int li,int col);` 
ses dimensions effectives et remplit la partie effective aec les lettres minuscules conssécutives.<br>
Après la lettre $%\tt{z}%$ on repart de la lettre $%\tt{a}%$ 
exemple (avec MAX 50
remplit(t,3,4) transforme les 3 premières lignes et 4 premières colonnes en<br>
abcd<br>
efgh<br>


==

codebefore==

#include <stdio.h>
#include <stdlib.h>

==

editor.code==
==
