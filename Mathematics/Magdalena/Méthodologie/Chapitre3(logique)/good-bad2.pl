extends = /model/checkbox/div3.pl

text= Cochez les réponses positives
before==
import random
good= ['yes','good','ok','da','Ney','dac','ouais']
bad= ['non','no','όχι','bad','worst','niet']
# 5 est le nombre de propositions
# le randint est le nombre de bonnes propositions 
checkbox.setdata_from_rw(good, bad, 5, random.randint(1, 4))
==
