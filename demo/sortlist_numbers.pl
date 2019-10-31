extends = /template/basic.pl

title = Plus petit nombre

@ /utils/sortlist.py [customsortlist.py]

sortlist =: SortList
sortlist.decorator = CustomSortList

before ==
import random as rd
content=rd.sample(list(range(50)),5)
sort(content)
sortlist.loadContent([str(item) for item in content])
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
==

