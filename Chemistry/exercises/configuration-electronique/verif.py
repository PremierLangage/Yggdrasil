

orbitales=["1s","2s","2p","3s","3p","4s","3d","4p","5s","4d","5p"]
maximum=[2,2,6,2,6,2,10,6,2,10,6]


def strfromz(Z):
    """
    >>> strfromz(10)
    '1s2 2s2 2p6'
    """
    """
    #s est la configuration electronique
    #s est contruit en ajoutant au début de la chaine la prochaine orbitale et l'indice maximum si le reste est plus grand que l'indice maximum
    #ou bien le reste (qui est mis dans la variable Z)
    """

    if Z==24:
        s="1s2 2s2 2p6 3s2 3p6 4s1 3d5"
    elif Z==29:
        s="1s2 2s2 2p6 3s2 3p6 4s1 3d10"
    else:
        s=""
        indice=0
        while Z>0:
            if Z>maximum[indice]:
                s=s+orbitales[indice]+str(maximum[indice])+" "
                Z -= maximum[indice]
            else:
                s=s+orbitales[indice]+str(Z)
                Z=0
            indice+=1    
    return s

import sys
def latexfromstr(s):
    l=s.split(" ")
    l2=list()
    for x in l:
        l2.append(x[:2]+"^{"+x[2:]+"}")
        print(x,file=sys.stderr)
    return "$%"+l2.join(" ")+"%$"

def latexfromz(Z):
    """
    >>> strfromz(10)
    '1s2 2s2 2p6'
    """
    
    if Z==24:
        s="$% 1s^2 2s^2 2p^6 3s^2 3p^6 4s^1 3d^5 "
    elif Z==29:
        s="$% 1s^2 2s^2 2p^6 3s^2 3p^6 4s^1 3d^{10} "
    else:
        s="$%"
        indice=0
        while Z>0:
            if Z>maximum[indice]:
                s=s+orbitales[indice]+"^{"+str(maximum[indice])+"} "
                Z -= maximum[indice]
            else:
                s=s+orbitales[indice]+"^{"+str(Z)+"} "
                Z=0
            indice+=1    
    return s+"%$"

def checkformat(s):
    """
        return a list of triplets (a,l,i)  if of the form ([1-9][sp][1-9][0]?\w)+ 
    """
    l=s.split(s)
    for m in l:
        if m=="":
            #double espace
            pass
        


def latexfromstr(s):
    l=s.split(" ")


import sys
def verif(s,Z):
    while s.startswith(" "):
        print("eats white",file=sys.stderr)
        s=s[1:]
    while s.endswith(" "):
        s=s[:-1]
        print("eats end white",file=sys.stderr)

    return s==strfromz(Z)
        
    





