import random
import re

def builddata():
    tab = []
    val = random.randint(0, 200)
    tab.append(val)
    interval = random.randint(1,10)
    incOrDec = random.randint(0, 1)
    for x in range(1999):
        while (interval == 0) :
            interval = random.randint(1,10)
        if (incOrDec == 0) : 
            val = val + interval
        elif (incOrDec == 1) : 
            if (val - interval < 0) :
                val = val + interval 
            else : 
                val = val - interval 
        if (val != tab[-1]) : 
            tab.append(val)
        interval = random.randint(1,10)
        incOrDec = random.randint(0, 2)
    return tab

def ToList(filec):
    return [int(x) for x in filec.split('\n')] 

def Question1(array):
    isIncreased = 0
    for i in range(1, len(array)):
        if array[i] > array[i-1]:
            isIncreased += 1
    return isIncreased

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
    dataliteral = '\n'.join([ str(v) for v in data])
    return f"""[('''{fichier}''','{Question1(val)}','Tst exemple question1'),
     ('''{dataliteral}''','{Question1(data)}','Tst data question1')]""", dataliteral

def buildQ2(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'.join([ str(v) for v in data])
    return f"""[('''{fichier}''','{Question2(val)}','Tst exemple question2'),
     ('''{dataliteral}''','{Question2(data)}','Tst data question2')]""", dataliteral

