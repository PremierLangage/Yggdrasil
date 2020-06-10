extends = /model/basic.pl

@ /utils/components/sortlist.py [customsortlist.py]

sortlist =: SortList
sortlist.decorator = CustomSortList

form ==
{{ sortlist|component }}
==

evaluator ==
grade = sortlist.eval()
sortlist.disabled=True
==

settings.feedback.class = score

