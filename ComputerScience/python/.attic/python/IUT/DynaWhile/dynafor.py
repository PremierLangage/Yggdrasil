

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
    return dic['seed']

def whilesimple():
    """
   
    >>> whilesimple()
    >>> whilesimple()
    >>> 

    return a pair  text,code
    """
    bas=randint(0,2)
    haut=randint(1,4)*5
    pas=randint(1,3)
    rev=randint(0,1)
    pastext=["","pairs","multiples de 3"]
    haut -= haut % pas
    bas  -=  bas  % pas
    text= "Ecrire une boucle qui affiche les entiers "+pastext[pas-1]+" de "+str(bas)+ " à "+str(haut)


    if rev==1:
        text += " dans l'ordre  décroissant"
        code = "for x in range("+str(haut)+","+str(bas-1)+",-"+str(pas)+"):\n"
    else:
        code = "for x in range("+str(bas)+","+str(haut+1)+","+str(pas)+"):\n"
    code += "    print(x)\n"
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
    l=["Impeccable","Génial","Top","Super","Classe","Cool","Kool","Dobre","Wonderbar"]
    dic["feedback1"]= choice(l)
    return dic 




if __name__=="__main__":
    d=dict()
    d['seed']=randint(1,1000)
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


