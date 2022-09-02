import random
import math
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
    return grid

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

def Question1(grid):
    result = 0
  
    for j in range(0, len(grid)):
        for i in range(0, len(grid[0])):
            if grid[j][i] < min(get_adjacents(i, j)):
                result += 1 + grid[j][i]
    return result

def Question2(grid):
    groups = []
    def count_groups(i, j):
        if j < 0 or j >= len(grid) or i < 0 or i >= len(grid[0]) or grid[j][i] == 9 or grid[j][i] == -1:
            return
        grid[j][i] = -1
        groups[len(groups)-1] += 1
        count_groups(i+1, j)
        count_groups(i-1, j)
        count_groups(i, j+1)
        count_groups(i, j-1)

    for i in range(0, len(grid)):
        for j in range(0, len(grid[0])):
            groups.append(0)
            count_groups(j, i)

    return math.prod(sorted(groups, reverse=True)[:3])

def buildQ1(fichier,data):
    va1 = create_grid(fichier)
    val2 = create_grid(data)
    dataliteral = '\n'.join([v for v in data])
    return f"""[('''{fichier}''','{Question1(val)}','Tst exemple question1'),
     ('''{dataliteral}''','{Question1(data)}','Tst data question1')]""", dataliteral

def buildQ2(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'.join([ v for v in data])
    return f"""[('''{fichier}''','{Question2(val)}','Tst exemple question2'),
     ('''{dataliteral}''','{Question2(data)}','Tst data question2')]""", dataliteral


