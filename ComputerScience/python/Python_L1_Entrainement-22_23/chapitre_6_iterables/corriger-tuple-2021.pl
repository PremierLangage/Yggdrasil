# Author: Wenjie Fang

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

author=Wenjie Fang
title=Corriger les tuples saisis

text==
Supposons qu'on a une liste des informations des individus saisies à la main, chaque individu est représenté par un tuple
(par exemple ``('Linux', 16, '2B110', True)``). Cependant, on s'est rendu compte qu'il y a des erreurs dans la saisie,
et il faut les corriger systèmatiquement. Les corrections sont aussi données en une liste de couples (tuples de longueur 2),
avec le premier élément l'erreur, et le second la correction.
Par exemple, ``('Linus', 'Linux')`` veut dire que tous les saisies ``'Linus'`` sont incorrect, et il faut les corriger en ``'Linux'``.

Ecrire une fonction ``corriger(info, correction)`` qui corrige la liste des tuples ``info`` selon les corrections données dans ``correction``.
**La fonction ne retourne rien.** Après l'appel de ``corriger(info, correction)``, la liste ``info`` doit être corrigée. Les tuples dans ``info`` ne sont pas forcément de la même longueur.

Par exemple, si

    info = [('Linus', 32, '2B110', True), ('Windows', 17, '1B170', False), ('Linux', 17, '1B210')]

et

    correction = [('Linus', 'Linux'), (17, 16), ('Windozs', 'Windows')]

alors après ``corriger(info, correction)``, la liste ``info`` doit devenir

    info = [('Linux', 32, '2B110', True), ('Windows', 16, '1B170', False), ('Linux', 16, '1B210')]

Vous pouvez écrire des fonctions auxiliaires pour vous aider.
==

tag=mutable|immutable|ForIn|tuple

samplesol==
def corriger(info, d):
    for i in range(len(info)):
        e = list(info[i])
        for j in range(len(e)):
            for cpl in d:
                w, r = cpl
                if e[j] == w:
                    e[j] = r
        info[i] = tuple(e)
    return
==

before==
from random import randint

def correct(info, d):
    for i in range(len(info)):
        e = list(info[i])
        for j in range(len(e)):
            for w, r in d:
                if e[j] == w:
                    e[j] = r
        info[i] = tuple(e)
    return

l = ['Linux', 'Linus', 'Windows', 'Windozs', '1B110', '1D110', 16, 17, 31, 32, '2B201', '7B201', True, False]
n = len(l)

def gentest():
    info = [tuple([l[randint(0, n-1)] for i in range(randint(2,5))]) for i in range(randint(10, 20))]
    corrpos = [randint(0, (n-2)//2 - 1) for i in range(3)]
    corr = [(l[corrpos[i]*2 + 1], l[corrpos[i]*2]) for i in range(3)]
    test = f">>> info = {info} #\n"
    test += f">>> corr = {corr}\n"
    test += ">>> corriger(info, corr) #\n"
    test += ">>> info\n"
    correct(info, corr)
    test += f"{info}\n"
    return test

pltest4 = gentest()

pltest5 = gentest()

pltest6 = gentest()

pltest7 = gentest()

after = before
==

pltest0==
>>> info = [] #
>>> corr = [] #
>>> corriger(info, corr) #
>>> info
[]
==

pltest1==
>>> info = [('Linus', 32, '2B110', True), ('Windows', 17, '1B170', False), ('Linux', 17, '1B210')] #
>>> corr = [] #
>>> corriger(info, corr) #
>>> info
[('Linus', 32, '2B110', True), ('Windows', 17, '1B170', False), ('Linux', 17, '1B210')]
==

pltest2==
>>> info = [] #
>>> corr = [('Linus', 'Linux'), (17, 16), ('Windozs', 'Windows')] #
>>> corriger(info, corr) #
>>> info
[]
==

pltest3==
>>> info = [('Linus', 32, '2B110', True), ('Windows', 17, '1B170', False), ('Linux', 17, '1B210')] #
>>> corr = [('Linus', 'Linux'), (17, 16), ('Windozs', 'Windows')] #
>>> corriger(info, corr) #
>>> info
[('Linux', 32, '2B110', True), ('Windows', 16, '1B170', False), ('Linux', 16, '1B210')]
==



