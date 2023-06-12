


# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Filtrage
text==  


<br><br>

Ecrire une fonction *f(liste)* qui recoit une liste de nombres entiers $%n%$ et renvoie la liste  
de ces nombres qui sont {{prop}}.

==
before==

prop, pred = random.choice([("pairs","lambda x:x%2==0"),
("impairs","lambda x:x%2==1"),
("strictement positifs","lambda x:x>0"),
("strictement négatifs","lambda x:x<0"),
("non nuls", "lambda x: x!= 0")]




==



pltest0==
>>> fibo(2)==[0, 1]
True
==
pltest1==
>>> fibo(-9)
[]
==
pltest2==
>>> fibo(11)
[0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
==









