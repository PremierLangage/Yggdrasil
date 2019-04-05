

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



### usage 
#with stdoutIO() as s:
#    exec code

# print "out:", s.getvalue()












def createseed(dic):
    if not "seed" in dic:
        import time
        dic['seed']=str(time.time())
    return str(dic['seed'])

def whilesimple():
    """
   
    >>> whilesimple()
    >>> whilesimple()
    >>> 

    return a pair  text,code
    """
    bas=randint(0,2)
    pas=randint(1,3)
    haut=randint(1,2)*5*pas
    rev=randint(0,1)
    pastext=["","pairs","multiples de 3","multiple de 4"]
    haut -= haut % pas
    bas  -=  bas  % pas

    functeurs=[("les ","x"),("le carré des ","x*x"),("le cube des ","x*x*x"),("le reste modulo 7 des ","x%7"),("le double des ","x*2"),("l'opposé des ","-x"),("2 à la puissance de chaque ","2**x"),]
    funct = choice(functeurs)
    text= "Ecrire une fonction qui prende en paramêtre deux entiers bas et haut et retourne une liste "+funct[0]+" entiers "+pastext[pas-1]+" de bas à haut "


    if rev==1:
        text += " parcourus dans l'ordre décroissant"
        code = "for x in range("+str(haut)+","+str(bas-1)+",-"+str(pas)+"):\n"
    else:
        code = "for x in range("+str(bas)+","+str(haut+1)+","+str(pas)+"):\n"
    code += "    print("+funct[1]+")\n"
    return text,code



def build(dic):
    seed(dic['seed'])
    
    noexception=True
    while noexception :
        text,code=whilesimple()
        d=dict()

        try:
            with stdoutIO() as s:
                exec(code)
            expectedoutput=s.getvalue()
            noexception=False
        except Exception as e:
            print("Exception")
            dic['text']=" Le code généré par la seed"+seed+":\n"+code+"\n genere une exception "+str(e)+"\n voire avec le prof"
            dic['type']="description"
            return dic

    dic['expectedoutput']=expectedoutput
    t=jinja2.Template(dic['jinjatext'])
    dic['text']=t.render(text=text)
    #dic['text'] += str(dic['seed'])
    l=["Impeccable","Génial","Top","Super","Classe","Cool","Kool","Dobre","Wonderbar"]
    dic["feedback1"]= choice(l)
    return dic 




if __name__=="__main__":
    d=dict()
    d['jinjatext']="""

# Evaluer une suite d'instructions 

Soit le code python suivant quel est la valeur de la variable **a** après l'exécution des lignes suivantes :


    {{ text }}

"""

    build(d)
    print(d['text'])
    del d['seed']
    build(d)
    print(d['text'])



