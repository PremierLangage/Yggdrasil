

extends=/ComputerScience/python/AP1-2122/template/pltest2023.pl

@ /builder/before.py [builder.py]

title = La méthode match


tag= re|match

doc==
# Sachant que 

Le module des expressions régulière propose quatre fonctions de recherche :

    Méthode     Objectif     
    match()     Détermine si la RE fait correspond dès le début de la chaîne. 
    search()    Analyse la chaîne à la recherche d'une position où la RE correspond. 
    findall()   Trouve toutes les sous-chaînes qui correspondent à la RE et les renvoie sous la forme d'une liste. 
    finditer()  Trouve toutes les sous-chaînes qui correspondent à la RE et les renvoie sous la forme d'un itérateur. 



Utilisables soit sur une expression compilé, exp.match(texte),
 soit en fournissant le motif en premier paramètre match(motif,texte).  



Ne pas oublier de faire l'import du module re !



==

text==
Ecrire une fonction **debut(motif,text)** qui retourne si *True* ou *False* le motif est présent 
au début du texte.  
==

before==

text = doc + text

==

pltest==
>>> debut("[Tt]oto","toto est la") #  [Tt]oto au début de "toto est la" 
True
>>> debut("[Tt]oto","Non toto n'est pas la") #  [Tt]oto au début de "Non toto n'est pas la"
False
==

