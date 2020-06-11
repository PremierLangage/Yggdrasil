extends = /model/basic.pl

@ /utils/components/sortlist.py [customsortlist.py]

sortlist =: SortList
sortlist.decorator = CustomSortList

form ==
<style>
.sort-item { 
padding: unset;
text-align: left !important;
min-height: unset;
 }
 </style>
{{ sortlist|component }}
==

evaluator ==
grade = sortlist.eval()
sortlist.disabled=True
==

settings.feedback.class = score

