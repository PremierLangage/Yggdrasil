



extends=/ComputerScience/python/AP1-2122/template/pltest2023.pl


title = La méthode match

text==

# Sachant que 

Dans le module des expressions régulière les expressions ont quatre fonction de recherche :

    Méthode     Objectif     
    match()     Détermine si la RE fait correspond dès le début de la chaîne. 
    search()    Analyse la chaîne à la recherche d'une position où la RE correspond. 
    findall()   Trouve toutes les sous-chaînes qui correspondent à la RE et les renvoie sous la forme d'une liste. 
    finditer()  Trouve toutes les sous-chaînes qui correspondent à la RE et les renvoie sous la forme d'un itérateur. 


Ecrire une fonction **number(motif,texte)** qui retourne le nombre d'occurrence du motif est dans le texte.  

Ne pas oublier de faire l'import du module re !

==




pltest==
>>> number("[Tt]oto","toto est la") #  [Tt]oto au début de "toto est la" 
1
>>> number("[Tt]oto","toto au debut puis Toto au milieu et à la fin toto")
3
>>> number("[Tt]oto","Non non pas de confiture.") #  [Tt]oto absent
0
==



