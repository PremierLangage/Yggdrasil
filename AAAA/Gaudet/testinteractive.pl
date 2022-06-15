extends= template/cginteractive.pl

author=CG
title=Test

tag=function # N'oubliez pas de remplir ce champs svp

text==
Recherche dichotomique
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
(100, 0) # Valeur basse
(100, 99) # Valeur haute
(100, 49) # Valeur au milieu
(1000000000, 43257) # N tres grand
==