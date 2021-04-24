extends = /model/basic.pl

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

def samestrings(str1, str2, diffmeasure="EditDist", tolerance=0, casesensitive=False):
    if not casesensitive:
        str1 = str1.casefold()
        str2 = str2.casefold()
    if diffmeasure == "EditRatio":
        return minimumEditDistance(str1, str2)/len(str2) <= tolerance
    else:
        return minimumEditDistance(str1, str2) <= tolerance

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