import random
import re

def builddata():
    tab = []
    val = random.randint(0, 20)
    for x in range(1000):
        strnb = []
        for y in range(val):
            strnb.append(str(random.randint(0, 1)))
        tab.append(''.join([v for v in strnb]))
    return tab

def ToList(filec):
    return [int(x) for x in filec.split('\n')] 

def Question1(array):
    gamma = ""
    countOnes: int
    for i in range(len(str(array[0]))):
        countOnes = 0
        for num in array:
            if num[i] == '1':
                countOnes += 1
        if countOnes >= len(array) % 2:
            gamma += '1'
        else:
            gamma += '0'
    intgamma = int(gamma, 2)
    epsilon = 2^len(array[0]) - intgamma
    return intgamma * epsilon

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
    dataliteral = '\n'.join([ str(v) for v in data])
    return f"""[('''{fichier}''','{Question1(val)}','Tst exemple question1'),
     ('''{dataliteral}''','{Question1(data)}','Tst data question1')]""", dataliteral

def buildQ2(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'.join([ str(v) for v in data])
    return f"""[('''{fichier}''','{Question2(val)}','Tst exemple question2'),
     ('''{dataliteral}''','{Question2(data)}','Tst data question2')]""", dataliteral


