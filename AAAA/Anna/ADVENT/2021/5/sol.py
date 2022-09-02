import random
import re
from itertools import zip_longest

def builddata():
    tab = []
    val = random.randint(8, 14)
    for x in range(1000):
        strnb = []
        for y in range(val):
            strnb.append(str(random.randint(0, 1)))
        myst = ''.join([v for v in strnb])
        tab.append(myst)
    return tab

def ToList(filec):
    return [x for x in filec] 

def Question1(array): 
    seats = (array
        .strip()
        .replace("B", "1")
        .replace("F", "0")
        .replace("R", "1")
        .replace("L", "0")
        .split("\n")
    )
    return max([int(s, 2) for s in seats])

def Question2(array):
    seats = (array
        .strip()
        .replace("B", "1")
        .replace("F", "0")
        .replace("R", "1")
        .replace("L", "0")
        .split("\n")
    )
    allseats = set(range(128 * 8))
    openseats = allseats - claimed
    myseat = [
        seat
        for seat in openseats
        if seat + 1 not in openseats and seat - 1 not in openseats
    ]
    return myseat[0]

def buildQ1(fichier,data):
    val = ToList(fichier)
    print(Question1(val))
    dataliteral = '\n'.join([v for v in data])
    return f"""[('''{fichier}''','{Question1(val)}','Tst exemple question1'),
     ('''{dataliteral}''','{Question1(data)}','Tst data question1')]""", dataliteral

def buildQ2(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'.join([ v for v in data])
    return f"""[('''{fichier}''','{Question2(val)}','Tst exemple question2'),
     ('''{dataliteral}''','{Question2(data)}','Tst data question2')]""", dataliteral


