
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

@ make_stuff.py [tools.py]


author = Dominique Revuz 2023

title = Générateur de grilles critèriées

form=
text=


before==
from tools import *



listofnames =[('nom',' votre nom'),('sujet',' le titre/description du travail a accomplir')]
form = make_form(listofnames)
text= "** Remplir les champs SVP**" 

==

evaluator==
from tools import *
def make_evaluator(response, namelist):
    d={}
    for name in namelist:
        d[name] = response.get(name, "")
    return d

def streval(response, namelist):
    d = make_evaluator(response, namelist)
    s=""
    for name in namelist:
        s += f"{name} = {d[name]}<BR> "
    return s


text=streval(response,[name[0] for name in listofnames])
listeofnames = [('truc',''),('prenom',' mettez ce que vous voulez '),('alias',' pas mieux')]
form=make_form(listofnames)
grade=(100,"")


==