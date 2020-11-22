
extends = /model/checkbox/div3.pl
before==
good= ['yes','good','ok','da','Ney','dac','ouais']
bad= ['non','no','όχι','bad','worst','niet']
# 5 est le nombre de propositions
# le randint est le nombre de bonnes propositions 
checkbox.setdata_from_rw(good, bad, 5, randint(1, 4))
==
