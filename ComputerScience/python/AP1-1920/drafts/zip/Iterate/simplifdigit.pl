
# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Simplifie par les chiffres
text== 
L'élève Ducobu doit simplifier la fraction $%\frac{26}{65}%$. Il supprime donc le *6* du numérateur et du dénominateur, écrit fièrement:<br>
$%\frac{26}{65}=\frac{2}{5}%$ et obtient sa première bonne note!<br>
Ecrire une fonction `simplifie_chiffre` qui reçoit un entier n et renvoie le nombre de fractions $%\frac{num}{den}%$ avec$%10 \leq num \lt den \lt n%$, 
 permettant à Ducobu de passer pour un bon élève. Les simplifications du type $%\frac{20}{50}=\frac{2}{5}%$ sont trop exactes pour être comptées!
 >>> simplifie_chiffre(100)<br>
4
==
pltest==
>>> simplifie_chiffre(100)==4
True
==
