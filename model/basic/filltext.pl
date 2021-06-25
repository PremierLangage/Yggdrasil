extends = /model/basic/dragdrop.pl

shuffle = True

question ==
Compléter le texte suivant avec les étiquettes.
==

before_scripts = ["importfunc", "before", "process", "process2"]

process2 ==
import re

sol = re.findall(r'\{(.*?)\}', filledtext)

count = -1
def replace(x):
    global count
    count += 1
    return "{{ cdrops[" + str(count) + "]}}"

part1 = re.sub(r'\{(.*?)\}', replace , filledtext)

part2 = "&nbsp;".join(clabels)

inputblock = part1 + "\n" + part2
==

