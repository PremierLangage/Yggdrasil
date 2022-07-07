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
    bitlen = len(array[0])
    gamma_map = {k: 0 for k in range(bitlen)}
    for elem in array:
        for i, char in enumerate(line):
            bit = int(char)
            gamma_map[bitlen - i - 1] += bit

    gamma = 0
    for pos, val in gamma_map.items():
        bit = (val * 2) // len(file_input)
        gamma += bit << pos

    epsilon = ~gamma & (1 << bitlen) - 1
    print("Power consumption: " + str(gamma * epsilon))

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


