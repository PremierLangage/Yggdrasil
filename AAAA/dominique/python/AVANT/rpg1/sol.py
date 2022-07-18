
import random
import json


armes = {"Poignard": [8, 4, 0],
         "Épée courte": [10, 5, 0],
         "Marteau de guerre": [25, 6, 0],
         "Épée longue": [40, 7, 0],
         "Grande hache": [74, 8, 0],
         }


Armure = {
    "Armure de Cuir": [13, 0, 1],
    "Cotte de mailles": [31, 0, 2],
    "Cotte renforcée": [53, 0, 3],
    "Armure de Bandes": [75, 0, 4],
    "Armure de Plates": [102, 0, 5],
}

anneaux = {
    "Dégâts +1": [25, 1, 0],
    "Dégâts +2": [50, 2, 0],
    "Dégâts +3": [100, 3, 0],
    "Défense +1": [20, 0, 1],
    "Défense +2": [40, 0, 2],
    "Défense +3": [80, 0, 3],
}


def hitoround(hpp, hpboss, degatsp, degasboss, armurep, armureboss):
    hpboss = hpboss - max((degatsp - armureboss), 1)
    if hpboss <= 0:
        return (hpboss, hpp)
    hpp = hpp - max((degasboss - armurep), 1)
    return (hpboss, hpp)


def fight(hpp, hpboss, degatsp, degasboss, armurep, armureboss):
    while hpp > 0 and hpboss > 0:

        hpboss, hpp = hitoround(hpp, hpboss, degatsp,
                                degasboss, armurep, armureboss)

    return hpp > 0


def testequipement(hpp, hpboss, degaboss, armureboss):
    costs = []
    bcost = []
    mincout = 10000
    mancout = 0
    for arme in armes:
        for armure in Armure:
            for anneau in anneaux:
                for anneau2 in anneaux:
                    if anneau != anneau2 or anneau == "pas d'anneaux":
                        degasp = armes[arme][1] + \
                            anneaux[anneau][1] + anneaux[anneau2][1]
                        armurep = Armure[armure][2] + \
                            anneaux[anneau][2] + anneaux[anneau2][2]
                        cout = armes[arme][0] + Armure[armure][0] + \
                            anneaux[anneau][0] + anneaux[anneau2][0]

                        if fight(hpp, hpboss, degasp,
                                 degaboss, armurep, armureboss):
                            costs.append(cout)
                        else:

                            bcost.append(cout)
    return min(costs), max(bcost)


def createboss():
    boss = {'Points de vie': 95 +
            random.randint(1, 30), 'Dommage': 6+random.randint(1, 4), 'Armure': random.randint(1, 4)}
    json.dump(boss, open("boss.json", "w"))
    return boss


def build():
    boss = createboss()

    Q1, Q2 = testequipement(
        100, boss['Points de vie'], boss['Dommage'], boss['Armure'])

    plt1 = f"""
    >>> Question1() == {Q1} # Question 1
    True
    """
    plt2 = f"""
    >>> Question2() == {Q2} # Question 2
    True"""

    return plt1, plt2


if __name__ == "__main__":
    print(build())
