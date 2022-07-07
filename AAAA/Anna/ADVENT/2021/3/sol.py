import random
import re
from itertools import zip_longest

def builddata():
    tab = []
    val = random.randint(0, 20)
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
    polarity = []
    for string in array:
        polarity = [
            s + (1 if x == '1' else -1)
            for s, x in zip_longest(polarity, string, fillvalue=0)
        ]
    gamma = sum([2**i for i, x in enumerate(reversed(polarity)) if x > 0])
    epsilon = sum([2**i for i, x in enumerate(reversed(polarity)) if x < 0])
    return gamma * epsilon

def Question2(array):
    isIncreased = 0
    for i in range(3, len(array)):
        a = array[i - 3] + array[i - 2] + array[i - 1]
        b = array[i - 2] + array[i - 1] + array[i]
        if a < b:
            isIncreased += 1
    return isIncreased

def buildQ1(fichier,data):
    val = ToList(fichier)
    print(Question1(val))
    dataliteral = '\n'.join([v for v in data])
    return f"""[('''{fichier}''','{Question1(val)}','Tst exemple question1'),
     ('''{dataliteral}''','{Question1(data)}','Tst data question1')]""", dataliteral

def buildQ2(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'.join([ str(v) for v in data])
    return f"""[('''{fichier}''','{Question2(val)}','Tst exemple question2'),
     ('''{dataliteral}''','{Question2(data)}','Tst data question2')]""", dataliteral


