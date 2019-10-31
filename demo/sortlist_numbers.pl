extends = /template/basic.pl

title = Plus petit nombre

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
Sélectionner le plus petit nombre de la liste suivante.
==

form ==
{{ sortlist|component }}
==

evaluator ==
grade = sortlist.eval()
sortlist.disabled=True
grade=(100,"")
==

