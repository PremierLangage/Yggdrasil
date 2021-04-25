extends = /model/basic.pl
@ /utils/pltext.py

casesensitive % false

tolerance % 0

input =: Input

form ==
{{ input|component }}
==

settings.feedback = rightwrong

evaluator ==
from pltext import edit_distance

tolerance = float(tolerance)


def samestrings(str1, str2, diffmeasure="EditDist", tolerance=0, casesensitive=False):
    if not casesensitive:
        str1 = str1.casefold()
        str2 = str2.casefold()
    if diffmeasure == "EditRatio":
        return edit_distance(str1, str2)/len(str2) <= tolerance
    else:
        return edit_distance(str1, str2) <= tolerance

if isinstance(solution, str):
    if '\n' in solution:
        lstsol = solution.splitlines()
    else:
        lstsol = [solution]
elif isinstance(solution, lst):
    lstsol = solution

if any([samestrings(input.value, item, diffmeasure=diffmeasure, tolerance=tolerance) for item in lstsol]):
    score = 100
else:
    score = 0
==