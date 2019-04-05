

import jinja2

from random import randint,seed,choice

import sys
import io
import contextlib


@contextlib.contextmanager
def stdoutIO(stdout=None):
    old = sys.stdout
    if stdout is None:
        stdout = io.StringIO()
    sys.stdout = stdout
    yield stdout
    sys.stdout = old




def createseed(dic):
    if not "seed" in dic:
        import time
        dic['seed']=str(time.time())
    return dic['seed']


filtres = [("lambda x: x>0", "strictement positifs"),
("lambda x: x>=0", "positifs "),
("lambda x: (x>=0) and (x%2==0) ", "positifs et pairs"),
("lambda x: (x>0) and (x%2==0) ", "strictement positifs et pairs"),
("lambda x: (x>=0) and (x%3==0) ", "positifs et multiples de trois"),
("lambda x: (x>=0) and (x%7==0) ", "positifs et multiples de sept"),
("lambda x: x<=0", "negatifs"),
("lambda x: x<0", "strictement negatifs"),
("lambda x: x<0", "strictement negatifs et pairs"),
("lambda x: x%2==0", "pairs"),
("lambda x: x%3==0", "multiples de trois"),
("lambda x: True", ""),]
transforms= [("lambda x: x ", " "),
("lambda x:x*x","des carrés "),
("lambda x:x*x*x","des cubes "),
("lambda x:x*2","des doubles "),
("lambda x:x//2","de la moitiée (entière) "),
("lambda x:-x","des opposés "),
]

functeurs=[
 ("lambda x,y:x+y","la somme"),
 ("lambda x,y:x*y","le produit"),
 ("lambda x,y:min(x,y)","le min"),
 ("lambda x,y:max(x,y)","le max"),
]


def testresult(f):
    if f != None :
        return str(f)+"\n"
    else:
        return ""


def randomfunc():
    """
    function aléatoire qui prend une liste d'entiers en paramêtre
    action: affiche ou retourne
    functeur: le min, le max, la somme ,la moyenne,
    transformateur: identité, carre , cube, double, n**2
    filtreur : de tout les nombres, de ceux qui sont positifs, ceux qui sont négatifs, de ceux qui sont pairs, pairs et positifs, 

    """

    text= "Ecrire une fonction f qui prend en paramêtre une liste d'entiers."

    code = "from functools import reduce\ndef f(l):\n"

    aff=0
    functeur= choice(functeurs)
    transform= choice(transforms)
    filtre=choice(filtres)
    text += "\n\n\tla fonction"
    if aff :
        text+= " affiche "
    else:
        text += " retourne "
    text += functeur[1]+" "+transform[1]+"des entiers "+filtre[1]+ " de la liste.\n"

    code += "\tif not list(filter("+filtre[0]+",l)):"
    code += "\n\t\treturn(None)"
    
    code += "\n"
    if aff :
        code += "\tprint("
    else:
        code += "\treturn ("
    text += "\n \n"

    text += "\tSi la liste ne contient aucun entiers "+filtre[1]+" la fonction retourne None."


    code += " reduce("+functeur[0]+",map("+transform[0]+",filter("+filtre[0]+",l)))"
    code += ")\n\n"

    # Ok let's build some tests 
    # to do this we must load the code
    # choose a random (or not) intervals v1,v2 and compute the resulting figure
    # then build the pltest
    # >>> f(v1,v2)
    # result
    # if debug : text += "\n" + code + "\n"
    try:
        with stdoutIO() as s:
            exec(code,globals())
            l =[ randint(-100,100) for x in range(randint(1,10))]
            pltest = ">>> l="+str(l)+"\n"
            pltest += ">>> f(l)\n"
            pltest += testresult(f(l))
            pltest += ">>> f([x for x in range(-10,0)])\n"
            pltest += testresult(f([x for x in range(-10,0)]))
            l =[ randint(-100,100) for x in range(randint(1,10))]
            pltest += ">>> l="+str(l)+"\n"
            pltest += ">>> f(l)\n"
            pltest += testresult(f(l))
            l =[ randint(-10,10)*2 for x in range(randint(1,10))]
            pltest += ">>> l="+str(l)+"\n"
            pltest += ">>> f(l)\n"
            pltest += testresult(f(l))
            l =[ randint(-10,10)*3 for x in range(randint(15,30))]
            pltest += ">>> l="+str(l)+"\n"
            pltest += ">>> f(l)\n"
            pltest += testresult(f(l))
            
            pltest += ">>> f([])\n"
            pltest += testresult(f([]))
            pltest += ">>> f([2])\n"
            pltest += testresult(f([2]))
            
    except Exception as e:
        raise e

    #text += "\n"
    #text +=  pltest

    return text,code,pltest




def build(dic):
    seed(dic['seed'])
    
    noexception=True
    while noexception :
        d=dict()
        
        try:
            text,code,pltest=randomfunc()
            print(code)
            with stdoutIO() as s:
                exec(code)
            
            expectedoutput=s.getvalue()
            noexception=False
        except Exception as e:
            print("Exception")
            dic['text']=" Le code généré par la seed"+seed+":\n"+code+"\n genere une exception "+str(e)+"\n voire avec le prof"
            dic['type']="description"
            return dic

    dic['pltest']=pltest
    t=jinja2.Template(dic['jinjatext'])
    dic['text']=t.render(text=text)
    l=["Impeccable","Génial","Top","Super","Classe","Cool","Kool","Dobre","Wonderbar"]
    dic["feedback1"]= choice(l)

    #dic['text'] += dic['pltest']
    
    return dic 




if __name__=="__main__":
    d=dict()
    d['jinjatext']="""

# Ecrire une fonction


    {{ text }}

"""
    d['seed']=33
    build(d)

    print(d)



