# OCE 10/09/2019 : KO

    """ difficulté 4 """
    fbRk = randint(70, 100)
    text41 = "Écrire une boucle affichant la suite de fibonacci jusqu'au rang " + str(fbRk) + " inclus."
    code41 = "a = 0\nu0 = 0\nu1 = 1\nwhile a < " + str(fbRk+1) + ":\n"
    code41 += "    if x == 0 or x == 1: print(x)\n"
    code41 += "    else:\n        u2 = u0 + u1\n        print(u2)\n"
    code41 += "        u0 = u1\n        u1 = u2\n        a += 1"

    start = randint(1, 55)
    text42 = "Écrire une boucle affichant la suite de Syracuse à partir de " + str(start) + " jusqu'à 1."
    code42 = "deb = " + str(start) + "\nwhile deb != 1:\n"
    code42 += "    print(deb)\n    if deb % 2 == 0: deb = deb//2\n"
    code42 += "    else: deb = 3*deb+1\nprint(deb)"

    enonces4 = [(text41, code41), (text42, code42)]
    roulette = randint(0, 1)

    text.append(enonces4[roulette][0])
    code.append(enonces4[roulette][1])



    """ difficulté 4 """
    fbRk = randint(70, 100)
    text41 = "Écrire une boucle affichant la suite de fibonacci jusqu'au rang " + str(fbRk) + " inclus."
    code41 = "u0 = 0\nu1 = 1\nfor x in range(0, " + str(fbRk+1) + "):\n"
    code41 += "    if x == 0 or x == 1: print(x)\n"
    code41 += "    else:\n        u2 = u0 + u1\n        print(u2)\n"
    code41 += "        u0 = u1\n        u1 = u2\n"

    start = randint(1, 55)
    rank = randint(20, 80)
    text42 = "Écrire une boucle affichant les " + str(rank) + " premiers termes de la suite de Syracuse à partir de " + str(start) + "."
    code42 = "deb = " + str(start) + "\nfor i in range(0, " + str(rank) + "):\n"
    code42 += "    print(deb)\n    if deb % 2 == 0: deb = deb//2\n"
    code42 += "    else: deb = 3*deb+1"

    enonces4 = [(text41, code41), (text42, code42)]
    roulette = randint(0, 1)

    text.append(enonces4[roulette][0])
    code.append(enonces4[roulette][1])

