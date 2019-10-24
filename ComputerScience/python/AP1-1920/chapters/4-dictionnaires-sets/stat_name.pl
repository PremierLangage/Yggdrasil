#author = WFang

extends = /ComputerScience/python/AP1-1920/templates/pltest.pl

title = Compter les imposables

text==
Toute personne qui réside en France doit payer l'impôt. Pourtant pas tous les français s'habite en France. 

La Finance Publique a alors besoin de savoir qui réside encore en France. Elle possède d'une base de donnée qui enregistre l'âge et le pays de résidence de chaque français.

On a converti cette base de donné sous forme de dictionnaire, avec le nombre de personne comme clé, et la valeur est une couple d'âge (un entier) et du pays de résidence (un string)

Ecrire une fonction `liste_imposable` qui donne la liste des imposables. On n'est pas imposable qu'à partir de 18 ans.

Voici un exemple d'exécution :

{{pltest}}
==

pltest==
>>> liste_imposable({'Abdul Kampfter': (14, "Autriche"), 'Tiancheng Wu': (43, "France"), 'Xavier Zagier': (12, "France"), 'Jean-Marie Leroy': (53, "France")}) # Exemple
['Tiancheng Wu', 'Jean-Marie Leroy']
==

pltest1==
>>> liste_imposable({}) # Test vide
[]
==

pltest2==
>>> liste_imposable({'a': (14, "Autriche"), 'b': (24, "Jamaica"), 'c': (12, "France"), 'd': (84, "France")} # Booléen*Booléen
['d']
==

cache==
def liste_imposable(d):
    accu = []
    for name in d:
        age, pays = d[name]
        if age >= 18 and pays == 'France':
            accu.append(name)
    return accu
==
