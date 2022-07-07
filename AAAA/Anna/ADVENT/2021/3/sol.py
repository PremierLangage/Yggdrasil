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
    return [x for x in filec.split('\n')] 

def polarity(array):
    polarity = []
    for string in array:
        polarity = [
            s + (1 if x == '1' else -1)
            for s, x in zip_longest(polarity, string, fillvalue=0)
        ]
    return polarity

def Question1(array): 
    pol = polarity(array)
    gamma = sum([2**i for i, x in enumerate(reversed(pol)) if x > 0])
    epsilon = sum([2**i for i, x in enumerate(reversed(pol)) if x < 0])
    return gamma * epsilon

def rate(condition, array):
    i = 0
    while True:
        polarity = []
        for string in array[i]:
            polarity = [
                s + (1 if x == '1' else -1)
                for s, x in zip_longest(polarity, string, fillvalue=0)
            ]
        v = condition(polarity[i])
        j = len(array) - 1
        for value in reversed(array):
            if value[i] != v: array.pop(j)
            if len(array) == 1: return int(v[0], 2)
            j -= 1
        i += 1

def Question2(array):
    oxygen= rate(lambda c: '1' if c >= 0 else '0', array.copy())
    co2 = rate(lambda c: '0' if c >= 0 else '1', array.copy())
    return oxygen * co2

def buildQ1(fichier,data):
    val = ToList(fichier)
    print(Question1(val))
    dataliteral = '\n'.join([str(v) for v in data])
    return f"""[('''{fichier}''','{Question1(val)}','Tst exemple question1'),
     ('''{dataliteral}''','{Question1(data)}','Tst data question1')]""", dataliteral

def buildQ2(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'.join([ str(v) for v in data])
    return f"""[('''{fichier}''','{Question2(val)}','Tst exemple question2'),
     ('''{dataliteral}''','{Question2(data)}','Tst data question2')]""", dataliteral


