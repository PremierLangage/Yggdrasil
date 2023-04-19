
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

author = Dominique Revuz 2023

title = Générateur de grilles critèriées

form=
text=


before==


## une liste de noms de variables 
## pour produire un formulaire de saisie

def make_form(namelist): # type: (List[(str,str)]) -> str
    form = '<table style="border-spacing: 30px; border-collapse: separate;">'
    for name in namelist:
        title =''
        if len(name[1]) != 0:
            title=f'title="{name[1]}"'
        form += f'<tr><td>{name[0]}</td><td> <input required {title} type=text id="form_{name[0]}" /> </td></tr>'
    form += '</table>'
    return form

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


    
form = make_form([('nom',' votre nom'),('sujet',' le titre/description du travail a accomplir')])
text= "** Remplir les champs SVP**" 

==

evaluator==
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

grade=(100,streval(response,[name[0] for name in [('nom',' votre nom'),('sujet',' le titre du travaiil a accomplir')]]))

form=''
text=''

==