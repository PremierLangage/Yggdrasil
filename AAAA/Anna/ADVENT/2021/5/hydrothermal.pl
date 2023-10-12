extends= /AAAA/Gaudet/template/cgbasic.pl

@ennonce1.md
@ennonce2.md
@sol.py [build.py]
@exemple 
lexemple =@exemple

#@/AAAA/dominique/python/AVANT/template/advent.pl [template.html]


title= Hydrothermale

text==

{{lenonce}}

La liste des informations est dans le fichier "data" ci-dessous.

Vous pouvez tester votre fonction avec le fichier "exemple" ci-dessous dont le résultat est 4160394 pour la question 7297
et 21038 pour la question 2.

<details><summary>exemple</summary><blockquote>
  {{lexemple}}
</blockquote></details>

<details><summary>data</summary><blockquote>
  {{donnees}}
</blockquote></details>

==



before==
import build

data = build.builddata()

with open("ennonce1.md","r") as f:
    lenonce= f.read()

with open("exemple","r") as f:
    lexemple= [v.strip('\n') for v in f.readlines()]

l = [ v for v in lexemple]

testcases, donnees = build.buildQ1(l,data)
changeText = False
==

postevaluator==
import build

changeText = True
with open("ennonce2.md","r") as f:
    lenonce = f.read()

testcases, donnees = build.buildQ2(lexemple,data)
==



solution ==
import sys
import re
import numpy as np
from itertools import zip_longest

def ToList(filec):
    return [x for x in filec] 

def enter_line(grid, x1, y1, x2, y2):
    if x1 == x2:
        for y in range(min(y1, y2), max(y1, y2)+1):
            grid[y, x1] += 1
    if y1 == y2:
        for x in range(min(x1, x2), max(x1, x2)+1):
            grid[y1, x] += 1

def Question1(): 
    array = [x for x in sys.stdin.readlines()]
    max_x = 0
    max_y = 0
    for line in array:
        #sys.stdout.write(line)
        x1, y1, x2, y2 = [int(entry)
                        for entry in re.sub('[^0-9]', ' ', line).split()]
        max_x = max(max_x, x1, x2)
        max_y = max(max_y, y1, y2)
    grid = np.zeros((max_y+1, max_x+1), dtype=int)
    for line in array:
        x1, y1, x2, y2 = [int(entry) for entry in re.sub('[^0-9]', ' ', line).split()]
        enter_line(grid, x1, y1, x2, y2)
    return (grid >= 2).sum()
    
if __name__ == '__main__':
    print(Question1())  





import sys
import re
import numpy as np
from itertools import zip_longest

def ToList(filec):
    return [x for x in filec] 

def enter_line_extended(grid, x1, y1, x2, y2):
    if x1 == x2:
        for y in range(min(y1, y2), max(y1, y2)+1):
            grid[y, x1] += 1
        return
    if y1 == y2:
        for x in range(min(x1, x2), max(x1, x2)+1):
            grid[y1, x] += 1
        return
    line_length = abs(x1-x2)+1
    step_x = 1 if x2-x1 > 0 else -1
    step_y = 1 if y2-y1 > 0 else -1
    for i in range(line_length):
        new_x = x1 + i*step_x
        new_y = y1 + i*step_y
        grid[new_y, new_x] += 1

def Question2(): 
    array = [x for x in sys.stdin.readlines()]
    max_x = 0
    max_y = 0
    for line in array:
        #sys.stdout.write(line)
        x1, y1, x2, y2 = [int(entry)
                        for entry in re.sub('[^0-9]', ' ', line).split()]
        max_x = max(max_x, x1, x2)
        max_y = max(max_y, y1, y2)
    grid = np.zeros((max_y+1, max_x+1), dtype=int)
    for line in array:
        x1, y1, x2, y2 = [int(entry) for entry in re.sub('[^0-9]', ' ', line).split()]
        enter_line_extended(grid, x1, y1, x2, y2)
    return (grid >= 2).sum()
    
if __name__ == '__main__':
    print(Question2())  
==