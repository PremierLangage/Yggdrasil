# author OCE
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]
title = Conversion de température

text==
Écrire une fonction **conv()** qui reçoit deux paramètres, une température **t** et une chaine de caractères indiquant
le type de conversion à effectuer: "CF" ou "FC", et qui retourne la température convertie :<br>
Celsius -> Fahrenheit (deuxième paramètre CF), 
Fahrenheit -> Celsius(deuxième paramètre FC).<br>
Si le deuxième paramètre n'est pas une de ces chaines, la valeur de t est retournée.
Rappel : 
$%
Tf = 32 +1.8 * Tc\\\
%$

Exemple:

    >>> conv(20, "CF")
    68.0
    >>> conv(122, "FC")
    50.0
    >>> conv(122, "z")
    122
==
Zeditor.code==
def conv(t,n):
    """Renvoie la conversion Celsius->Fahrenheit ou inversement suivant<n>."""
    if n=="CF": 
    #Celsius->Fahrenheit
        return(32.0+1.8*t)
    elif n=="FC": 
    #Fahrenheit->Celsius
        return((t-32.0)/1.8)
    else:
    # pas de conversion
        return t
==

editor.code==
==

before==
import random
def conv(t,n):
    """Renvoie la conversion Celsius->Fahrenheit ou inversement suivant<n>."""
    if n=="CF": 
    #Celsius->Fahrenheit
        return(32.0+1.8*t)
    elif n=="FC": 
    #Fahrenheit->Celsius
        return((t-32.0)/1.8)
    else:
    # pas de conversion
        return t

t=random.randint (14,50)
c=random.randint(0,1)
if c==0:
    c="CF"
else:
    c="FC"	
pltest5=""">>> conv({},'{}')\n{}""".format(t,c,conv(t,c))
after=before
==
pltest0==
>>> conv(20,"CF")
68.0
==
pltest1==
>>> conv(20,"FC")
-6.666666666666666
==
pltest2==
>>> conv(50,"CF")
122.0
==
pltest3==
>>> conv(50,"z")
50
==
pltest4==
>>> conv(-58,"FC")
-50.0
==








