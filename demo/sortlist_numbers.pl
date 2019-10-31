extends = /template/basic.pl

title = Ordonner des nombres

@ /utils/sortlist.py [customsortlist.py]

sortlist =: SortList
sortlist.decorator = CustomSortList

before ==
import random as rd
numbers=rd.sample(list(range(50)),5)
sorted(numbers)
sortlist.loadContent([str(n) for n in numbers])
==

text ==
Ordonner les nombres suivants du plus petit au plus grand.
==

form ==
{{ sortlist|component }}
==

evaluator ==
grade = sortlist.eval()
sortlist.disabled=True
==

