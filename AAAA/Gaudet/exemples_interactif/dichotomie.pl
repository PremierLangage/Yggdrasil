extends= ../template/cginteractive.pl

author=CG
title=Recherche dichotomique

tag=dichotomie # N'oubliez pas de remplir ce champs svp

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
    allowed = ceil(log(N, 2)) + 1
    
    await student.send(N)

    for i in range(allowed):
        queryResult = await student.receive()
        if not queryResult.strip().isdigit():
            return False, f"{queryResult} qui n'est pas un nombre", f'{n} en {allowed} coups max'
        attempt = int(queryResult)
        if attempt == n:
            await student.send('=')
            return True, f'{n} en {i} coups', f'{n} en {allowed} coups max'
        elif attempt > n:
            await student.send('<')
        else:
            await student.send('>')
    
    return False, f'{allowed} coups dépassés', f'{n} en {allowed} coups max'
==

testcases==
[[(100, randint(0, 24)), "Valeur basse 0-99"],
[(100, randint(76, 100)), "Valeur haute 0-99"],
[(100, randint(39, 61)), "Valeur au milieu 0-99"],
[(1000000000, randint(0, 1000000000)), "N tres grand"]]
==


solutionpourtests==

#include <stdio.h>

int main() {
    int N;
    scanf("%d", &N);

    int top = N - 1;
    int bottom = 0;
    int essai;

    while (1) {
        essai = bottom + (top - bottom) / 2;
        printf("%d\n", essai);

        char r;
        scanf(" %c", &r);

        if (r == '<') {
            top = essai - 1;
        } else if (r == '>') {
            bottom = essai + 1;
        } else {
            break;
        }
    }

    return 0;
}

==

