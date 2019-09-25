# DR 25/09/2019 OK
#  Author: DR

#extends=../../templates/pltest.pl

@ /grader/evaluator.py [grader.py]

title== #|html|
Bascule
==

before== #|python|
import random
lval1=[True,False,1,0,67]
lval2=[False,True,0,2,0]
lexp=["not var","not var","1 - var","2-var","67-var"]
N=random.randint(0,4)
val1=lval1[N]
val2=lval2[N]
exp=lexp[N]
soluce="var = "+exp


==

text== #|cpp|


==


form==
   var = {{ component|component}}
==





