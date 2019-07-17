author=Dominique Revuz

tag=error
title= Corrige Moi !

extends=/ComputerScience/python/template/coding.pl
text==

Le programme python si dessous contient une erreur corrigez la pour passer à l'exercice suivant.

==

code==
a=Pomme
print('je mange une ',a)
==

expectedoutput=je mange une Pomme

compilehelp==
C'est une erreur fréquente quand un identifiant est mal orthographié.  <br/>
Ici Pomme ne devrai pas être interprété comme un identifant mais comme une chaine.  <br/>
donc le bon code est :  <br/>
a="Pomme" . . <br/>
  <br/>
Avec les identifiants contenant des Majuscules ou des pluriels il est facile de ce tromper.  <br/>
Entre :  <br/>
listeVide listesVide listesvide etc.  <br/>
soyez vigilant et mais attendez vous a ce type d'erreur. <br/>
==


