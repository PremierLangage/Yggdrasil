


extends= /AAAA/Gaudet/template/cgbasic.pl

author=DR
title=Test avec stdin dans un fichier

tag=function

@ fichier1

text==
Ecrire un programme qui prend une liste d'entiers séparés par des retours
 à la ligne et qui affiche le max.
Le premier nombre envoyé correspondant à la taille de la liste
==

testcases==
[('fichier1', '4000', 'Test 1'),
('fichier1', '89', 'Test 2')]
==

# testcase = [f"('''{exemple}''','{sol}','Tst exemple question1')"]