
extends = /model/checkbox/div3.pl

title = Choix Multiple 
text= Cochez les réponses positives


nbtrue % 1
nb % 2

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
    if "nbtrue" not in globals() or nbtrue > len(good):
        nbtrue= random.randint(1, len(good))
    if "nb" not in globals() or int(nb) > len(bad)+nbtrue :
        nb = len(bad)+nbtrue
    checkbox.setdata_from_rw(good, bad, nb , nbtrue)

==
