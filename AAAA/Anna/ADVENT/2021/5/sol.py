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
    return [x.strip() for x in filec] 

def Question1(lines): 
    max_x = 0
    max_y = 0
    for line in lines:
        x1, y1, x2, y2 = [int(entry)
                        for entry in re.sub('[^0-9]', ' ', line).split()]
        max_x = max(max_x, x1, x2)
        max_y = max(max_y, y1, y2)

    print('max x', max_x, 'max y', max_y)
    grid = np.zeros((max_y+1, max_x+1), dtype=int)

def Question2(array):
    seats = (v
        .split()
        .replace("B", "1")
        .replace("F", "0")
        .replace("R", "1")
        .replace("L", "0")
        .split("\n") for v in array
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


