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

def ld(a, b, mx=-1):	
    def result(d): return d if mx < 0 else False if d > mx else True
 
    if a == b: return result(0)
    la, lb = len(a), len(b)
    if mx >= 0 and abs(la - lb) > mx: return result(mx+1)
    if la == 0: return result(lb)
    if lb == 0: return result(la)
    if lb > la: a, b, la, lb = b, a, lb, la
 
    cost = array('i', range(lb + 1))
    for i in range(1, la + 1):
        cost[0] = i; ls = i-1; mn = ls
        for j in range(1, lb + 1):
            ls, act = cost[j], ls + int(a[i-1] != b[j-1])
            cost[j] = min(ls+1, cost[j-1]+1, act)
            if (ls < mn): mn = ls
        if mx >= 0 and mn > mx: return result(mx+1)
    if mx >= 0 and cost[lb] > mx: return result(mx+1)
    return result(cost[lb])

def samestrings(str1, str2, measure="distance", tolerance=0, casesensitive=False):
    if not casesensitive:
        str1 = str1.casefold()
        str2 = str2.casefold()
    return ld(str1, str2, tolerance)

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

