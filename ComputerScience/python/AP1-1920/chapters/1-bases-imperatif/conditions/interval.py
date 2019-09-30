#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  interval.py
#  
#  Copyright 2019 Dominique Revuz <dominiquerevuz@u-pem.fr
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  

doc="""

build latex intervals and python test "d'appartenance"


plusieurs possibilités 



principe 

formula OPENLEFT A , B CLOSERIGHT ]A,B]
expression  (A < x <= B) 

INLEFT , A CLOSERIGHT    ] -\infinite , A ]
expression (x <=A) 

"""

# Intervals et conditionnelles 


OPENLEFT="]"
OPENRIGHT="["
CLOSELEFT="["
CLOSERIGHT="]"

INFLEFT="] -\infty"
INRIGHT="+\infty ["

UNION="\\cup"

import random 

def seriestrictementdecroissante(start, length):
    l=[str(start)]
    for x in range(length+1):
        start -=  random.randint(2,5)
        l.append(str(start))
    return l

def setRight(b):
    if b :
        return  OPENRIGHT
    else: 
        return CLOSERIGHT

def setLeft(b):
    if b :
        return  OPENLEFT
    else: 
        return CLOSELEFT

def getExp(s1,s2,sa,sb):
    """
    >>> getExp(True,True,"3","4")
    '(3 < x < 4)'
    >>> getExp(False,True,"3","4")
    '(3 <= x < 4)'
    >>> getExp(True,False,"3","4")
    '(3 < x <= 4)'
    >>> getExp(False,False,"3","4")
    '(3 <= x <= 4)'
        
    """
    if s1 and s2:
        return "(%s < x < %s)" % (sa,sb)
    elif s1 and not s2:
        return "(%s < x <= %s)" % (sa,sb)
 
    elif not s1 and s2:
        return "(%s <= x < %s)" % (sa,sb)
    else:
        return "(%s <= x <= %s)" % (sa,sb)



def makeinterval(difficulte=2):
    """
    produit un interval/(ensemble de définition),  en notation mathématique et une expression booléen étant vraie pour les x appartenant à l'interval
    >>> makeinterval() # par défaut le niveau est 2 ce qui est bien on peu monter jusqu'a 6-7 
    ('] -\\infinite ,13] \\union [ 15 , 17 [', '(x <= 13) or (15 <= x < 17)')
    
    
    Différents usage de la fonction 
    
    soit écrire l'expression booleen d'appartenance de la varaiable x à l'interval.
    Soit écrire un script python contenant des tests avec des if/else  qui verifie que x=str(input()) appartient à l'ensemble et affiche Oui ou Non 
    Soit écrire une fonction qui prend en paramêtre x et qui retourne un booleen qui indique si x appartient ou non à l'interval
    Ecrire un script qui lit des entierd ur stdin et affiche pour chaqu'un si il appartient on pas a l'interval
    """
    l= seriestrictementdecroissante(random.randint(30,50),difficulte*4)
    values=l[:]
    s=""
    exp=""
    if random.randint(1,10) < 9:
        a = l.pop()
        difficulte -= 1
        s += INFLEFT + ", " + a
        strict = random.randint(1,2)==1
        s+= setRight(strict)
        if strict :  
            exp+="(x < "+a+")"
        else:
            exp+="(x <= "+a+")"
    for r in range(random.randint(difficulte//2,difficulte)):
        a=l.pop()
        b=l.pop()
        difficulte -= 1
        if s != ""  :
            s+= " "+UNION+" "
            exp += " or "
        if  random.randint(1,10) < 7: 
            s += " \\\{"+a+"\\\} " # FIXME Can see the braces in mathml
            exp += " x== "+a+" " 
        else:
            strict1=random.randint(1,2)==1
            strict2=random.randint(1,2)==1
            s+= setLeft(strict1)
            s+= " "+a+", "+ b + " "
            s+= setRight(strict2)
            exp += getExp(strict1,strict2,a,b)  

    if difficulte>0 :
        if s != ""  :
            s+= " "+UNION+" "
            exp += " or "
        strict = random.randint(1,2)==1
        s+= setLeft(strict)
        a = l.pop()
        s += a + ", "  + INRIGHT
        if strict :  
            exp+="(x>"+a+")"
        else:
            exp+="(x>="+a+")"

    return s,exp,values

if __name__ == '__main__':
    import sys
    while input() != "" :
        for i in range(6):
           print(i+1,":", makeinterval(i+1)),values




