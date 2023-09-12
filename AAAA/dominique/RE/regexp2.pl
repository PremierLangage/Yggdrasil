


extends=regexp1.pl 

title = La méthode match

text==

# Sachant que 

Dans le module des expressions régulière propose quatre fonctions de recherche :

    Méthode     Objectif     
    match()     Détermine si la RE fait correspond dès le début de la chaîne. 
    search()    Analyse la chaîne à la recherche d'une position où la RE correspond. 
    findall()   Trouve toutes les sous-chaînes qui correspondent à la RE et les renvoie sous la forme d'une liste. 
    finditer()  Trouve toutes les sous-chaînes qui correspondent à la RE et les renvoie sous la forme d'un itérateur. 


Ecrire une fonction **present(motif,texte)** qui retourne si *True* ou *False* le motif est dans le texte.  

Ne pas oublier de faire l'import du module re !

==




pltest==
>>> present("[Tt]oto","toto est la") #  [Tt]oto au début de "toto est la" 
True
>>> present("[Tt]oto","IL est la toto au milieu ") #  [Tt]oto "IL est la toToto"
True
>>> debut("[Tt]oto","Non non pas de confiture.") #  [Tt]oto absent de "Non non pas de confiture."
False
==



