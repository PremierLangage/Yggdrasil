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

tolerance % 0

input =: Input

form ==
{{ input|component }}
==

settings.feedback = rightwrong

evaluator ==

tolerance = float(tolerance)

def minimumEditDistance(s1,s2):
    if len(s1) > len(s2):
        s1,s2 = s2,s1
    distances = range(len(s1) + 1)
    for index2,char2 in enumerate(s2):
        newDistances = [index2+1]
        for index1,char1 in enumerate(s1):
            if char1 == char2:
                newDistances.append(distances[index1])
            else:
                newDistances.append(1 + min((distances[index1],
                                             distances[index1+1],
                                             newDistances[-1])))
        distances = newDistances
    return distances[-1]

def samestrings(str1, str2, measure="distance", tolerance=0, casesensitive=False):
    if not casesensitive:
        str1 = str1.casefold()
        str2 = str2.casefold()
    if diffmeasure == "EditRatio":
    tolerance = int(len(solution) * float(tolerance))
    else:
        return minimumEditDistance(str1, str2) <= tolerance
    return minimumEditDistance(str1, str2) <= tolerance

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
==





