



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
[('4\n4000\n1\n2\n3', '4001', 'Test 1'),
('4\n89\n1\n2\n31', '89', 'Test 2')]
==

# testcase1 = [f"('''{exemple}''','{exemplesol}','Tst exemple question1')",f"  data sol ]

editor.code==
if __name__ == '__main__':
    x=int(input())
    m=int(input())
    for i in range(x-2):
        r= int(input())
        if m <r:
            m=r
    print(m)
    
==