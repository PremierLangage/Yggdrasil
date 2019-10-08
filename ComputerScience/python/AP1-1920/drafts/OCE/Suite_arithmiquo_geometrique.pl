# author=OCE
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/template/loopsoluce.pl
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl

title = Suite arithmético-géométrique

text==  
En utilisant une boucle "for in range", écrire un programme permettant d'afficher le Nème entier de la suite arithmético géométrique croissante suivante : 

$%
\begin{cases}
a & > 1\\\
b & > 0\\\
u_0 & > a\\\
u_{n+1} & = a\times u_n + b
\end{cases}
%$

Un+1 = aUn + b
avec Uo > 0,
a>1,
b>0

Vous utiliserez impérativement les variables a, b, N et Uo
pour a et b vous prendrez les valeurs : 2 et 3
Pour N la valeur 100 et pour Uo la valeur 1
==

code== #|python|
# insérez votre code ici

# compléter les ??
print("le résultat est :",??)
==

taboo=while
needed=for

soluce== #|python|
# rien dedans mais si non présent plantage
==

pltest==#|python|
>>> a,b,N,Uo=2,3,100,1
1288443801830028327591152824414053181755268805001
>>> a,b,N,Uo=3,2,100,1
2678230073764983792569936820568604337537004989637988058835626
>>> a,b,N,Uo=1,2,100,3
6338253001141147007483516026878
==





