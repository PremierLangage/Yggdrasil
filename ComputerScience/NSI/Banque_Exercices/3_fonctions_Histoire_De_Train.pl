#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]


title = Histoire de trains

text==  
Je suis ligoté sur les rails en gare d’Arras.<br> 
Un train parti de la gare de Ouceti se dirige vers Arras. Ce train circule à la vitesse $%v_t%$
 et la gare d'Ouceti est située à une distance $%d_O%$ de celle d’Arras.
.<br>
–Écrire une fonction `temps_mis` qui reçoit la vitesse du train et la distance et qui renvoie le temps mis pour parcourir cette distance;<br>
alerté par les cris, Superman qui trainait à quelques $%d_S% kms de là se dirige à vitesse $%V%$ vers moi. Serai-je sauvé ?<br>
-Écrire une fonction `sauvetage` qui renvoie le booléen True si Superman arrive à temps et False sinon. cette fonction reçoit:
quatre réels $%v_t, d_O,V,d_S%$,
<br>
==

editor.code ==
==

Xeditor.code==

def temps_mis(v,d):
    """retourne le temps en heure mn pour parcourir km à la vitesse v."""
    heure =int(d/v)
    minute= (60 * d//v) % 60
    return heure,minute

def sauvetage(vt,dt,vs,ds):
    ht,mt=temps_mis(vt,dt)
    hs,ms=temps_mis(vs,ds)
    if ht<hs or (ht==hs and mt<ms):
        return False
    else:
        return True
    

==
before==
#pourquoi passerpar les heurs et minutes.
def temps_mis(v,d):
    """retourne le temps en heure mn pour parcourir km à la vitesse v."""
    heure =int(d/v)
    minute= (60 * d//v) % 60
    return heure,minute

def sauvetage(vt,dt,vs,ds):
    ht,mt=temps_mis(vt,dt)
    hs,ms=temps_mis(vs,ds)
    if ht<hs or (ht==hs and mt<ms):
        return False
    else:
        return True
import random
vt=random.randint (14,250)
dt=random.randint(20,300)
vs=random.randint (200,350)
ds=random.randint (100,500)
pltest3=""">>> sauvetage({},{},{},{})\n{}""".format(vt,dt,vs,ds,sauvetage(vt,dt,vs,ds))
after=before
==
pltest0==
>>> sauvetage(2,2,1,1)==False
False
==
pltest1==
>>> sauvetage(100,20,20,100)
False
==



pltest2==
>>> sauvetage(20,100,200,10)
True
==





