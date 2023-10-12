extends= ../template/cgbasic.pl

author=CG
title=Test

tag=function # N'oubliez pas de remplir ce champs svp

text==
Ecrire un programme qui écrit le successeur de l'entier envoyé en entrée
1
2\n
3
==

languages==
C
python
==

showWanted = False

testcases==
[('1', '2', 'Test 1'),
('2', '3', 'Test 2'),
('-3', '-2', 'Test 3')]
==

pltestcases==
1|2|Test 1
2|3| Test 2
-3|-2|Test 3
==

before==

#pltestcases += "44|45| Un autre test "
# ou
#testcases.append( ('66', '67', 'Autre test'))
==

