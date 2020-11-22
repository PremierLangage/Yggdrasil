
extends = /model/checkbox/div3.pl

text= Cochez les réponses positives





before==
import random

if "good" not in globals():
    title = " Il manque une variable good contenant la liste des bonnes reponses"
    text = ""
elif "bad" not in globals():
    text = ""
    title =  " Il manque une variable bad contenant la liste des mauvaises reponses "
else:
    good = good.strip("\n").split("\n")
    bad = bad.strip("\n").split("\n")
    # 5 est le nombre de propositions
    # le randint est le nombre de bonnes propositions 
    checkbox.setdata_from_rw(good, bad, 5, random.randint(1, 4))

==
