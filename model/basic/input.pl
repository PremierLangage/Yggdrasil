extends = /model/basic.pl

headerbefore ==
import random as rd
from io import StringIO
from csv import DictReader

all_rows = None

try:
    with open('data.csv', newline='') as file:
        all_rows = list(DictReader(file, delimiter=delimiter))
except:
    pass

if 'data' in globals():
     all_rows = list(DictReader(StringIO(data), delimiter=delimiter))

if all_rows is not None:  
    row = rd.choice(all_rows)
    for key, value in row.items():
        globals()[key] = value

from jinja2 import Environment, BaseLoader
Env = Environment(loader=BaseLoader())
solution = Env.from_string(solution).render(globals())
==

delimiter % ","

casesensitive % false

input =: Input

form ==
{{ input|component }}
==

settings.feedback = rightwrong

evaluator ==

def levenshteinDistance(str1, str2):
    m = len(str1)
    n = len(str2)
    lensum = float(m + n)
    d = []           
    for i in range(m+1):
        d.append([i])        
    del d[0][0]    
    for j in range(n+1):
        d[0].append(j)       
    for j in range(1,n+1):
        for i in range(1,m+1):
            if str1[i-1] == str2[j-1]:
                d[i].insert(j,d[i-1][j-1])           
            else:
                minimum = min(d[i-1][j]+1, d[i][j-1]+1, d[i-1][j-1]+2)         
                d[i].insert(j, minimum)
    ldist = d[-1][-1]
    ratio = 1-(lensum - ldist)/lensum
    return {'distance':ldist, 'diffratio':ratio}

def samestrings(str1, str2, measure="distance", tolerance=0, casesensitive=False):
    if not casesensitive:
        str1 = str1.casefold()
        str2 = str2.casefold()
    if tolerance == 0:
        return str1 == str2
    else:
        return levenshteinDistance(str1, str2)[measure] <= tolerance

if isinstance(solution, str):
    if '\n' in solution:
        lstsol = solution.splitlines()
    else:
        lstsol = [solution]
elif isinstance(solution, lst):
    lstsol = solution

if any([samestrings(input.value, item, tolerance=tolerance) for item in lstsol]):
    score = 100
else:
    score = 0
    feedback = str(levenshteinDistance(input.value, solution)[measure])
==

