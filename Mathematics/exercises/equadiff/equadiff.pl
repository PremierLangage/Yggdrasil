
title = équation différentielle ??

text==

Dit si l'equation suivante est une équation différentielle :

{{equation}}

==

form==

<input type="checkbox" id="form_langage" value="Oui"> Oui
<input type="checkbox" id="form_langage" value="Non"> Non
==




@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
before==

essai=0

rep= True 
# random.choice([True,False])
import random,sys
a=random.randint(1,3)
b=random.randint(1,3)
c=random.randint(1,3)

if rep :
    eq= random.choice(difs.split("\n"))
else:
    eq= random.choice(notdifs.split("\n"))
print(eq,file=sys.stderr)
equation = eq.format(a,b,c)


==
@ /grader/evaluator.py [grader.py]



difs==
y'= {0}y + {1}
y'+ {0}y = {1}
y'' + {0}y' + y {1} = {2}
y'' = {0}y' + y {1} + {2}
y'= {0}y - {1}
y'- {0}y = {1}
y'' - {0}y' + y {1} = {2}
y'' = {0}y' - y {1} + {2}
==

notdifs==
y^2 = {0}y + {1}
y = {0}y + {1}
y^2 + x^2 = 1
y^2 - x^2 = 1
==

name=damir



evaluator==




ans=response['langage']
if  ans=={} :
    grade=(-1," Choisissez une valeur oui ou non. " + str(response ))
elif ( "oui" in ans  and rep ) or ( "Non" in ans and not rep):

    grade=(100, " bravo" )
else: # elif  not  ( "oui" in ans or "Non" in ans)  :
    grade=(0," Raté " )

if grade[0] != -1 :
    essai = essai + 1  
    rep= True 
    # random.choice([True,False])
    import random,sys
    a=random.randint(1,3)
    b=random.randint(1,3)
    c=random.randint(1,3)

    if rep :
        eq= random.choice(difs.split("\n"))
    else:
        eq= random.choice(notdifs.split("\n"))
    print(eq,file=sys.stderr)
    equation = eq.format(a,b,c)




==


