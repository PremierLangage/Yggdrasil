

import random
from re import S
mini = 150
nbsmalest = 0


def fits(size, array, choices, li):
    global nbsmalest, mini
    if size == 0:
        print(choices)
        if len(choices) < mini:

            mini = len(choices)
            nbsmalest = 1
        elif len(choices) == mini:
            nbsmalest += 1

        return 1
    else:
        # if li[size] != 0:
        #     return li[size]
        # else:
        s = 0
        for i in range(len(array)):
            if array[i] <= size:
                s += fits(size-array[i],
                          array[i+1:], choices+[array[i]], li)
        li[size] = s
        if size == 150:
            print(li)
        return s


def getsize(filename):
    with open(filename, "r") as g:
        return [int(x) for x in g.readlines()]


def builddata(filename):
    with open(filename, "w") as g:
        for x in range(random.randint(12, 16)):
            g.write(str(random.randint(x, 50))+"\n")


valeurs = getsize("exemple")
valeurs = sorted(valeurs)


def getQ1Q2():
    SIZE = 150
    builddata("data")
    valeurs = getsize("data")
    mini = SIZE
    nbsmalest = 0
    q1 = fits(SIZE, valeurs, [], [0]*(SIZE+1))
    q2 = nbsmalest
    return q1, q2


def build():
    Q1, Q2 = getQ1Q2()

    plt1 = f"""
    >>> Question1() == {Q1} # Question 1
    True
    """
    plt2 = f"""
    >>> Question2() == {Q2} # Question 2
    True"""
    return plt1, plt2
