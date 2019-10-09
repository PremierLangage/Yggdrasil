# Copyright 2016 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Hello world en C
#
# Exercice simple pour tester PL avec le langage C.


author=Nicolas Borie
title=Programme manipulant des types
tag=type
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Le programme suivant comporte une erreur de type. Tentez de le corriger !

==

editor.code==
float moyenne(int a, int b, int c){
    return (a+b+c) / 3;
}
==

solution==
float moyenne(int a, int b, int c){
    return (a+b+c) / 3.0;
}
==

tests==
[ ["simple éxécution", "1 1 1",""] ]
==

