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
if isinstance(solution, str):
    if '\n' in solution:
        lstsol = solution.splitlines()
    else:
        lstsol = [solution]
elif isinstance(solution, lst):
    lstsol = solution

score = 0
if casesensitive:
    if any([input.value == item for item in lstsol]):
        score = 100
else:
    if any([input.value.casefold() == item.casefold() for item in lstsol]):
        score = 100
==

