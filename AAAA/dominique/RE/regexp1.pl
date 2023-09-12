

extends=/ComputerScience/python/AP1-2122/template/pltest2023.pl


title = la Méthode match du module re

text==

# Sachant que 



    Méthode     Objectif     
    match()     Détermine si la RE fait correspond dès le début de la chaîne. 
    search()    Analyse la chaîne à la recherche d'une position où la RE correspond. 
    findall()   Trouve toutes les sous-chaînes qui correspondent à la RE et les renvoie sous la forme d'une liste. 
    finditer()  Trouve toutes les sous-chaînes qui correspondent à la RE et les renvoie sous la forme d'un itérateur. 


Ecrire une fonction **debut(motif,text)** qui retourne si oui ou non le motif est présent au debut du text.  

Ne pas oublier de faire l'import du module re !

==


pltest==
>>> debut("[Tt]oto","toto est la") #  [Tt]oto au début de "toto est la" 
True
>>> debut("[Tt]oto","Non toto n'est pas la") #  [Tt]oto au début de "Non toto n'est pas la"
False
==

