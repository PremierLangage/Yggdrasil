import random
import re
import numpy as np
from itertools import zip_longest

def builddata():
    tab = []
    for x in range(100): 
        tab1 = []
        for y in range(100):
            val = random.randint(0, 10)
            tab1.append(val)
        tab.append(tab1)
    return tab

def ToList(filec):
    return [x.strip() for x in filec.split('\n')] 

def create_grid(lines):
    grid = np.zeros((len(lines), len(lines[0])), dtype=int)
    for index, line in enumerate(lines):
        entries = [int(entry) for entry in list(line)]
        grid[index] = entries
    return grid

def get_neighbors(x, y, grid):
    neighbors = []
    if x+1 < grid.shape[0]:
        neighbors.append(grid[x+1, y])
    if x-1 >= 0:
        neighbors.append(grid[x-1, y])
    if y+1 < grid.shape[1]:
        neighbors.append(grid[x, y+1])
    if y-1 >= 0:
        neighbors.append(grid[x, y-1])
    return neighbors

def is_low_point(x, y, grid):
    neighbors = get_neighbors(x, y, grid)
    return all([grid[x, y] < neighbor for neighbor in neighbors])
        
def get_score(x, y, grid):
    return grid[x, y] + 1

def Question1(lines):
    score = 0
    grid = create_grid(lines)
    for x in range(grid.shape[0]):
        for y in range(grid.shape[1]):
            if is_low_point(x, y, grid):
                score += get_score(x, y, grid)
    return score

def count_basin_neighbors(x, y, grid, visited):
    # print('x', x, 'y', y)
    visited[x, y] = 1
    count = 0
    if x+1 < grid.shape[0]:
        if grid[x+1, y] < 9:
            if not visited[x+1, y]:
                count += 1 + count_basin_neighbors(x+1, y, grid, visited)
    if x-1 >= 0:
        if grid[x-1, y] < 9:
            if not visited[x-1, y]:
                count += 1 + count_basin_neighbors(x-1, y, grid, visited)
    if y+1 < grid.shape[1]:
        if grid[x, y+1] < 9:
            if not visited[x, y+1]:
                count += 1 + count_basin_neighbors(x, y+1, grid, visited)
    if y-1 >= 0:
        if grid[x, y-1] < 9:
            if not visited[x, y-1]:
                count += 1 + count_basin_neighbors(x, y-1, grid, visited)
    return count

def get_basin_size(x, y, grid):
    visited = np.zeros(grid.shape, dtype=int)
    size = count_basin_neighbors(x, y, grid, visited) + 1
    return size

def Question2(lines):
    basin_sizes = []
    grid = create_grid(lines)
    for x in range(grid.shape[0]):
        for y in range(grid.shape[1]):
            if is_low_point(x, y, grid):
                basin_sizes.append(get_basin_size(x, y, grid))
    basin_sizes.sort(reverse=True)
    return basin_sizes[0]*basin_sizes[1]*basin_sizes[2]

def buildQ1(fichier,data):
    val = ToList(fichier)
    print(Question1(val))
    #dataliteral = '\n'.join([v for v in data])
    return f"""[('''{fichier}''','{Question1(val)}','Tst exemple question1'),
     ('''{data}''','{Question1(data)}','Tst data question1')]""", data

def buildQ2(fichier,data):
    val = ToList(fichier)
    #dataliteral = '\n'.join([ v for v in data])
    return f"""[('''{fichier}''','{Question2(val)}','Tst exemple question2'),
     ('''{data}''','{Question2(data)}','Tst data question2')]""", data


