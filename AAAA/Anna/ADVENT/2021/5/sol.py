import random
import re
import numpy as np
from itertools import zip_longest

def builddata():
    tab = []
    same = random.randint(0,1)
    for x in range(500):
        literal = ""
        if same == 1: 
            first = random.randint(0,1)
            val1 = random.randint(0,999) 
            val2 = random.randint(0,999) 
            val3 = random.randint(0,999) 
            if first == 1:
                literal += str(val1) + "," + str(val2) + " -> " + str(val1) + "," + str(val3)
            else :
                literal += str(val2) + "," + str(val1) + " -> " + str(val3) + "," + str(val1)
        else : 
            val1 = random.randint(0,999) 
            val2 = random.randint(0,999) 
            val3 = random.randint(0,999) 
            val4 = random.randint(0,999) 
            literal += str(val1) + "," + str(val2) + " -> " + str(val3) + "," + str(val4)
        tab.append(literal)
    return tab

def ToList(filec):
    return [x for x in filec] 

def enter_line(grid, x1, y1, x2, y2):
    if x1 == x2:
        for y in range(min(y1, y2), max(y1, y2)+1):
            grid[y, x1] += 1
    if y1 == y2:
        for x in range(min(x1, x2), max(x1, x2)+1):
            grid[y1, x] += 1

def enter_line_extended(grid, x1, y1, x2, y2):
    if x1 == x2:
        for y in range(min(y1, y2), max(y1, y2)+1):
            grid[y, x1] += 1
        return
    if y1 == y2:
        for x in range(min(x1, x2), max(x1, x2)+1):
            grid[y1, x] += 1
        return
    line_length = abs(x1-x2)+1
    step_x = 1 if x2-x1 > 0 else -1
    step_y = 1 if y2-y1 > 0 else -1
    for i in range(line_length):
        new_x = x1 + i*step_x
        new_y = y1 + i*step_y
        grid[new_y, new_x] += 1

def Question1(lines): 
    max_x = 0
    max_y = 0
    for line in lines:
        x1, y1, x2, y2 = [int(entry)
                        for entry in re.sub('[^0-9]', ' ', line).split()]
        max_x = max(max_x, x1, x2)
        max_y = max(max_y, y1, y2)
    grid = np.zeros((max_y+1, max_x+1), dtype=int)
    for line in lines:
        x1, y1, x2, y2 = [int(entry) for entry in re.sub('[^0-9]', ' ', line).split()]
        enter_line(grid, x1, y1, x2, y2)
    return (grid >= 2).sum()

def Question2(array):
    max_x = 0
    max_y = 0
    for line in lines:
        x1, y1, x2, y2 = [int(entry)
                        for entry in re.sub('[^0-9]', ' ', line).split()]
        max_x = max(max_x, x1, x2)
        max_y = max(max_y, y1, y2)
    grid = np.zeros((max_y+1, max_x+1), dtype=int)
    for line in lines:
        x1, y1, x2, y2 = [int(entry) for entry in re.sub('[^0-9]', ' ', line).split()]
        enter_line_extended(grid, x1, y1, x2, y2)
    return (grid >= 2).sum()

def buildQ1(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'.join([v for v in data])
    return f"""[('''{fichier}''','{Question1(fichier)}','Tst exemple question1'),
     ('''{dataliteral}''','{Question1(data)}','Tst data question1')]""", dataliteral

def buildQ2(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'.join([ v for v in data])
    return f"""[('''{fichier}''','{Question2(fichier)}','Tst exemple question2'),
     ('''{dataliteral}''','{Question2(data)}','Tst data question2')]""", dataliteral


