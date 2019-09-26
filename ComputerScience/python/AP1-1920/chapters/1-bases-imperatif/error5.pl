


extends= ../../templates/pyeditor.pl

author=Dominique Revuz

clog=error|quoting|print

v1=Bonjour je m'appelle Jules et je suis heureux de vous acceuillir ici !
v2=Bonjour je m'appelle Emilie et je suis heureuse de vous acceuillir ici !
v3=Bonjour je m'appelle Anne et je suis heureuse de vous acceuillir ici !
v4=Bonjour je m'appelle Julie et je suis heureuse de vous acceuillir ici !
v5=Bonjour je m'appelle Lamia et je suis heureuse de vous acceuillir ici !
v6=Bonjour je m'appelle Sharleen et je suis heureuse de vous acceuillir ici !
v7=Bonjour je m'appelle Mina et je suis heureuse de vous acceuillir ici !
v8=Bonjour je m'appelle Dominique et je suis heureux de vous acceuillir ici !
v9=Bonjour je m'appelle Nadime et je suis heureux de vous acceuillir ici !

title= Corrige Moi !


@/builder/before.py [builder.py]
@/grader/evaluator.py [grader.py]
text==

Le programme python si dessous contient une erreur corrigez la pour passer à l'exercice suivant.  
Texte attendu :

==

before==
import random
var = random.choice([v1,v2,v3,v4,v5,v6,v7,v8,v9])
editor.code = "print('"+var+"')"
expectedoutput=var
text += "\n\t"+ var
==


compilehelp==
Dans cet exemple nous cherchons a écrire un texte pour cela nous avons placé le texte entre des caractères ' apostrophe.
Malheureusement pour nous c'est un mauvais choix car nous souhaitons avoir un apostrophe dans notre texte.
D'ou l'erreur.

Deux possibilités pour corriger soit placer votre texte ente guillemets ".
soit placer un anti-slash avant l'apostrophe \' .
==





