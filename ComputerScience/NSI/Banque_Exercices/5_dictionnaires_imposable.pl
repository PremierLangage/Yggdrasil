#author = WFang

extends = /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Lister les imposables

text==
Toute personne qui réside en France doit payer l'impôt. Pourtant tous les français n'habitent pas en France. 

La Finance Publique a alors besoin de savoir qui réside encore en France. Elle possède une base de données qui enregistre l'âge et le pays de résidence de chaque français.

On a converti cette base de données sous forme de dictionnaire, avec les noms des personnes comme clés, la valeur étant un couple formé de l'âge (un entier) et du pays de résidence (une chaîne de caractères).

Ecrire une fonction `liste_imposable` qui donne la liste des imposables, sachant qu'on n'est imposable qu'à partir de 18 ans.

Voici un exemple d'exécution :

``>>> liste_imposable({'Abdul Kampfter': (14, "Autriche"), 'Tiancheng Wu': (43, "France"), 'Xavier Zagier': (12, "France"), 'Jean-Marie Leroy': (53, "France")})``

``['Tiancheng Wu', 'Jean-Marie Leroy']``
==

editor.code==
==

before==
import random
accu = []
pays = ['France', 'Etranger']
dict_str = ''
for i in range(100):
    data = (random.randint(10, 26), pays[random.randint(0, 1)])
    if data[0] >= 18 and data[1] == 'France':
        accu.append(str(i))
    if i > 0:
        dict_str += ', '
    dict_str += "'{}': ({}, '{}')".format(i, data[0], data[1])
dict_str = '{' + dict_str + '}'
pltest3 = '>>> liste_imposable({}) # Aléatoire\n{}\n'.format(dict_str, accu)
after = before
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
>>> liste_imposable({'a': (14, "Autriche"), 'b': (24, "Jamaica"), 'c': (12, "France"), 'd': (84, "France")}) # Booléen*Booléen
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
