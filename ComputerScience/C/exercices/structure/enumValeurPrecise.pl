# Copyright 2017 Elise Hardy <ehardy@etud.u-pem.fr>
# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Déclaration d'une enumaration avec des valeur précises

author=Elise Hardy
title=Enumeration avec des valeurs précises
tag=structure
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Déclarer une enumeration *Note* contenant *Mathieu, Cassandre, Laura, Thomas, 
Aurelie, Adrien* dont les valeurs respectifs sont *8, 9, 13, 15, 16, 19*
Par exemple si on affiche la valeur de Adrien l'affichage sera 19.
==

editor.code==
typedef ...

==

solution==
typedef enum {Mathieu =8, Cassandre, Laura =13, Thomas=15, Aurelie, Adrien=19}Note;
==

codeafter==
 
#include <stdio.h>
#include <stdlib.h>    
#include <string.h>
    

int main(){
  
  printf("note: (Mathieu,%d), (Cassandre,%d), (Laura,%d), (Thomas,%d), (Aurélie,%d), (Adrien,%d)",Mathieu,Cassandre,Laura,Thomas,Aurelie,Adrien);
  return 0;}

==

grader==
from graderC import graderII
 
tests = [["Déclaration et utilisation 1", "",""]] 
graderII(tests)
==

