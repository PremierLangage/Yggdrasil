extends = /template/sortlist.pl

title = Scramble code 


@ codefile.py

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




