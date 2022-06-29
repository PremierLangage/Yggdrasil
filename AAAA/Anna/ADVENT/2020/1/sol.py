import random
import re

def builddata():
    tab = []
    val = random.randint(0, 2020)
    tab.append(val)
    tab.append(2020 - val)
    val = random.randint(0, 2020)
    while (val == 0) :
        val = random.randint(0, 2020)
    if (val != 0) :
        tab.append(val)
        val1 = random.randint(0, val)
        tab.append(val1)
        tab.append(2020 - (val + val1))
    for x in range (195):
        val = random.randint(0, 2020)
        while (2020 - val in tab) : 
            val = random.randint(0, 2020)
        for i in range(len(tab)):
            while 2020 - (val + tab[i]) in tab : 
                val = random.randint(0, 2020)
        tab.append(val) 
    random.shuffle(tab)
    return tab

def buildfile(filename):
    tab = builddata()
    with open(filename, "w") as file:
        for x in range(200):
            file.write(str(tab[x])+"\n")

def fromFileToList(filename):
    with open(filename, "r") as file:
        return [int(x[:-1]) for x in file.readlines()]

def Question1(array):
    for i in range(len(array)):
        for j in range(i+1,len(array)):
            if array[i] + array[j] == 2020:
                return array[i] * array[j]

def Question2(array):
    for i in range( 0,len(array)-2): 
        for j in range(i + 1, len(array)-1): 
            for k in range(j + 1, len(array)):
                if array[i] + array[j] + array[k] == 2020:
                    return array[i] * array[j] * array[k]

def getQ1Q2():
    buildfile("data")
    valeurs = fromFileToList("data")
    val = fromFileToList("exemple")
    #q1 =  Question1(valeurs)
    q1 =  Question1(val)
    q2 =  Question2(valeurs)
    return q1, q2


testcases==
[('4\n4000\n1\n2\n3', '4001', 'anna 1'),
('4\n89\n1\n2\n31', '89', 'Test 2')]
==

# testcase1 =[f"('''{exemple}''','{exemplesol}','Tst exemple question1')",f"  data sol ]


def build():
    Q1, Q2 = getQ1Q2()
    return f"[('''{lexemple}''','{Q1}','Tst exemple question1')",f"  data sol ]



