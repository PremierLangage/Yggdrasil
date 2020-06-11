extends = /model/basic.pl

@ /utils/components/scramblecode.py [customsortlist.py]


@ codefile.py 


sortlist =: SortList
sortlist.decorator = CustomSortList

form ==
<style>
.sort-item { 
padding: 0px 0px !important;
text-align: left !important;
min-height: 14px !important;
 }
 </style>
{{ sortlist|component }}
==

evaluator ==
grade = sortlist.eval()
sortlist.disabled=True
==

settings.feedback.class = score

title = Scramble code 

# linter:codefile.py

before ==
import random as rd
import csv

with open('codefile.py', newline='') as file:
    l=file.readlines()


sortlist.setdata_from_list([ "<pre>"+x.rstrip()+"</pre>" for x in l if x!= "\n"])

==

text ==
Remettez dans l'ordre pour que la fonction soit conforme à son doc test.
==




evaluator ==
score = sortlist.eval()
==

settings.feedback = lightscore




