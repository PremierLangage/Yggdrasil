extends = /model/basic.pl
@ /utils/pltext.py

casesensitive % false

diffmeasure = EditDist

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
        return edit_distance(str1, str2)/len(str2) <= tol
    else:
        return edit_distance(str1, str2) <= tol

if isinstance(sol, str):
    _sol_ = sol.splitlines()
elif isinstance(sol, lst):
    _sol_ = sol

if any([samestrings(input.value, item, diffmeasure=diffmeasure, tolerance=tolerance) for item in _sol_]):
    score = 100
else:
    score = 0
==