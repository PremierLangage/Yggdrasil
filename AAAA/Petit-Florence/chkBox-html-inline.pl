extends = /model/checkbox/div3.pl


title= HTML Inline
text= Cochez les éléments HTML qui sont de type "en ligne" ("inline)
before==
import random
good= ['a','span','img','input', 'td']
bad= ['p','h1','div','select','table','ul']
# 5 est le nombre de propositions totales à afficher
# le randint est le nombre de bonnes propositions à afficher 
checkbox.setdata_from_rw(good, bad, 5, random.randint(1, 4))
==

