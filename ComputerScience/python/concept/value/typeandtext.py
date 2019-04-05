#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  afunc.py
#  
#  Copyright 2019 Dominique Revuz <dominiquerevuz@MacBook-Pro-de-Dominique.local>
#  
# Objectif un exercice ou l'on écrit une fonction simple qui retourne ou affiche une valeur d'un type variable 
# Idée comprendre la différence entre renvoyer et afficher 
#      connaitre les valeurs d'initialisation des types de base 
#      int, sr, float, liste, tuple, dict, 
# pour être compatible avec la connaissance  des eleves les types proposé sont 
# pris dans une liste  
# il faut proposer l'énoncé sous forme d'un doctest 
# par exemple :
# Ecrire une fonction qui fait que le doctest suivant passe:
# >>> Bibop()
# (317, 'cnrifkf')
# et celui la aussi 
# >>> Bibop() != None
# True
# Deuxième version 
# on fabrique un texte du genre 
# une variable contenant Un tuple contenant un entier et un float et un tuple contenant un  entier et une chaine  


bases=['bleu','rouge','noire','vert','claire','ici','labas','rien','etc','toto','titi']


import random 

lt=[]

def randomint(n):
    if random.random() < 0.7:
        x= random.randint(1,100)
    else:
        x= random.randint(10,1000)
    return x," un entier :"+str(x)+", " 

def randomfloat(n):
    f=randomint(n)[0]/100
    return f," un float : "+str(f)+", "

def randomtuple(n):
    l=[]
    t=" un tuple contenant dans l'ordre :\n"
    for x in range(random.randint(2,5)):
        v,s = randomvalue(n-1)
        l.append(v)
        t+= "\t"+s+"\n"
    return tuple( x for x in l),t


def randomlist(n):
    l=[]
    t=" une liste contenant dans l'ordre :\n"
    for x in range(random.randint(2,5)):
        v,s = randomvalue(n-1)
        l.append(v)
        t+= "\t"+s+"\n"
    return l,t


def randomvalue(nbt):
    return lt[random.randint(0,nbt-1)](nbt-1)

def rdstr():
    s=''
    for i in range(random.randint(4,8)):
        s+= chr(random.randint(ord('a'),ord('z')))
    return s

def randomstring(n):
    for i in range(5):
        bases.append(rdstr())
    x = random.choice(bases)
    return x," une chaine "+x+" , "


def main(args):
    global lt
    lt=[randomint,randomfloat,randomstring, randomtuple, randomlist]
    for i in range(1200):
        v,s= randomvalue(len(lt))
        print(v)
        print(s)
    return 0

if __name__ == '__main__':
    import sys
    sys.exit(main(sys.argv))
