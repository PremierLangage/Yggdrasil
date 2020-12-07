# Author: Wenjie Fang

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
builder=/builder/before.py

author=Wenjie Fang
title=Trouver tous les occurrences

text==
Un mot peut apparaître plusieures fois dans une phrase, et on veut repérer tous ses occurrences.

Ecrire une fonction ``occurrences(phrase, mot)`` qui retourne une liste des indices où ``mot`` apparaît tel quel
dans ``phrase``. La liste retournée doit être en ordre croissant. Si ``mot`` est vide, alors on retourne une liste vide.

Par exemple, avec ``phrase = 'Le chat et le chien mangent le cadeau.'`` et ``mot = 'le'``, l'appel ``occurrences(phrase, mot)``
doit retourner la liste ``[11, 28]``. Même si ``phrase`` commence par le mot "Le", ce n'est pas de la bonne casse.

**Hint** : Vous pouvez utiliser la méthode ``find`` des chaînes de caractères.
==

tag=find|algo

samplesol==
def occurrences(p, m):
    if m == '':
        return []
    l = []
    ind = p.find(m)
    while ind >= 0:
        l.append(ind)
        ind = p.find(m, ind + 1)
    return l
==

before==
==

pltest0==
>>> occurrences('Le chat et le chien mangent le cadeau.', 'le') # L'exemple
[11, 28]
>>> occurrences('', '') # Vide 0
[]
>>> occurrences('', 'Zidane') # Vide 1
[]
>>> occurrences('Zidane', '') # Vide 2
[]
>>> occurrences('abracadabra', 'abd') # Vide 3
[]
>>> occurrences('abracadabra', 'abr') # Magique
[0, 7]
>>> occurrences('ananananana', 'anana') # Répétition
[0, 2, 4, 6]
==


