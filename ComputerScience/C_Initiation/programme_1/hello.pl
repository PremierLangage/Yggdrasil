# Copyright 2016 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Hello world en C
#
# Exercice simple pour tester PL avec le langage C.
author=
name=Premier programme en C
title=Premier programme en C
tag=program
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Faites votre premier programme C, ce programme devra écrire 
*Hello World!* sur la sortie standard et retourner à la ligne. <br>
Le retour à la ligne est encodé par le caractère '\n' en C (vous ne mettrez pas d'espace avant ni après !).<br>
Pour faire de l'affichage, on utilise la fonction *printf* dont l'existance est déclarée grace à la commande *#include <stdio.h>*.

Un programme C contient toujours une et une seule fonction dont le nom est *main*. Cette fonction sera le point d'entrée
du programme.<br>
Un programme C fait exactement tout se qui se trouve dans sa fonction *main*, ni plus, ni moins. Ici, il
vous faut juste faire de l'affichage. Un bon appel à la fonction *printf* doit suffire.

==

editor.code==
#include <stdio.h>

int main(void){
  /* votre code ici... */
}
==

tests==
[ ["simple éxécution", "","", "Hello World!\n"] ]
==











