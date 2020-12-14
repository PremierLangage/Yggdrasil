extends = /model/basic/dragdrop.pl

title =

filledtext ==
{hhh} bbbb {hhhj}
==

footerbefore ==
from customdragdrop import CustomDragDrop
drops = []
labels = []

import re
from itertools import count

counter = count(0)

lst = re.findall(r'\{(.*?)\}', filledtext)

==


text ==
{{lst}}
==


evaluator ==
n = len(drops)
num_right = 0
num_wrong = 0

for i in range(n):
    if drops[i].content == lstsolutions[i]:
        num_right += 1
        drops[i].css += "success-state"
    else:
        num_wrong +=1
        drops[i].css += "error-state"

if num_wrong > 0 :
    score = 0
else:
    score = 100
==



