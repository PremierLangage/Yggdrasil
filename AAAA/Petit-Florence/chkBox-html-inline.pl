extends = /model/checkbox/div3.pl
extends= /AAAA/dominique/simplematchlist.pl

title= HTML Inline
text= Cochez les balises "inline"
before==
import random
good= ['a','good','span','img','input', 'td']
bad= ['p','h1','div','select','table','ul']
# 5 est le nombre de propositions
# le randint est le nombre de bonnes propositions 
checkbox.setdata_from_rw(good, bad, 5, random.randint(1, 4))
==

