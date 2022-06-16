extends= ../template/cginteractive.pl

author=CG
title=Recherche dichotomique

tag=dichotomy # N'oubliez pas de remplir ce champs svp

text==
Le but est d'écrire un programme dans un langage de votre choix qui devine un nombre en un nombre limité d'essais en implémentant une stratégie de recherche dichotomique.

Votre programme recevera d'abord un nombre N donnant l'intervalle sur lequel le nombre peut être tiré (de 0 à N exclu)

Après cela, votre programme doit envoyer un nombre indiquant sa tentative et il recevra une réponse en retour:

* "<" si le nombre à deviner est plus petit

* ">" si le nombre à deviner est plus grand

* "=" si le nombre est correct

<b>Toutes les entrées et sorties doivent se terminer par un retour à la ligne, et se font sur l'entrée et la sortie standard!</b>

(il n'est pas nécessaire de sécuriser les entrées/sorties)
==

languages==
==

evalscript==#|py|
from random import randrange
from math import log, ceil

async def evalscript(student, N, n):
    allowed = ceil(log(N, 2))
    
    await student.send(str(N))

    for _ in range(allowed):
        queryResult = await student.receive()
        if not queryResult.strip().isdigit():
            return False
        attempt = int(queryResult)
        if attempt == n:
            await student.send('=')
            return True
        elif attempt > n:
            await student.send('<')
        else:
            await student.send('>')
    
    return False
==

testcases==
[[(100, randint(0, 24)), "Valeur basse"],
[(100, randint(76, 100)), "Valeur haute"],
[(100, randint(39, 61)), "Valeur au milieu"],
[(1000000000, randint(0, 1000000000)), "N tres grand"]]
==