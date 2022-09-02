import random
import re
import numpy as np
from itertools import zip_longest

def builddata():
    tab = []
    for x in range(100): 
        literal = ""
        for y in range(100):
            val = random.randint(0, 10)
            if len(literal) < 100:
                literal += str(val)
        tab.append(literal)
    return tab

def ToList(filec):
    return [x.strip() for x in filec.split('\n')] 

def create_grid(tab):
    grid = []
    for input in tab:
        grid.append(list(map(int, input)))

def get_adjacents(i, j):
    adjacents = []
    if i+1 < len(grid[0]):
        adjacents.append(grid[j][i+1])
    if i-1 >= 0:
        adjacents.append(grid[j][i-1])
    if j+1 < len(grid):
        adjacents.append(grid[j+1][i])
    if j-1 >= 0:
        adjacents.append(grid[j-1][i])
    return adjacents

def Question1(tab):
    result = 0
    grid = create_grid(tab)
    for j in range(0, len(grid)):
        for i in range(0, len(grid[0])):
            if grid[j][i] < min(get_adjacents(i, j)):
                result += 1 + grid[j][i]
    print(result)

def buildQ1(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'.join([v for v in data])
    return f"""[('''{fichier}''','{Question1(val)}','Tst exemple question1'),
     ('''{dataliteral}''','{Question1(data)}','Tst data question1')]""", dataliteral

def buildQ2(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'.join([ v for v in data])
    return f"""[('''{fichier}''','{Question2(val)}','Tst exemple question2'),
     ('''{dataliteral}''','{Question2(data)}','Tst data question2')]""", dataliteral


