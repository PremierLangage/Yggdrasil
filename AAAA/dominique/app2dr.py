
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
#  app2.py
#  
#  Copyright 2020 Dominique Revuz <dominique.revuz@u-effeil.fr>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  

import random
import sys

DEPART=12
PROMPT="$ "
INCONNUE="Commande Inconnue"

def inputstring(l=["graine","lancer","consulter","quitte","double","terminer","v1","v2","version"]):
    s=""
    s=input(PROMPT)
    while s not in l:
        print(INCONNUE)
        print("Autorisées:"+" ".join(l))
        s=input(PROMPT)    
    return s


def bsum(a,b,c):
    """
    >>> bsum(4,3,2)
    7
    >>> bsum(3,3,3)
    6
    >>> bsum(1,2,4)
    6
    >>> bsum(1,4,1)
    5
    """
    if a>=b :
        if b >c :
            return a+b
        else:
            return a+c
    else:
        if a>= c:
            return b+a
        else:
            return b+c


def boucleprincipale():
    """
    >>> with open("X","w") as f:
    ...    print("graine",file=f)
    ...    print(42,file=f)
    ...    print("terminer",file=f)
    >>> sys.stdin=open("X","r")
    >>> boucleprincipale()
     
    """
    version="v2"
    jmoney=DEPART
    jd1=None
    jd2=None
    bd1=None
    bd2=None
    bd3=None
    
    while True:
        s=inputstring()
        if s=="v2":
            version=s
            continue
        if s=="v1":
            version=s
            continue
        if s=="version" :
            print(version)
            continue
        if s=="graine":
            seed=None 
            while seed == None:
                try:
                    seed=int(input("seed "))
                except :
                    seed=None
            random.seed(seed)
            continue

        if s=="lancer":
            jd2=random.randint(1,6)
            bd2=random.randint(1,6)
            bd3=random.randint(1,6)
            s="start"
            while s != "quitte" :
                jd1=random.randint(1,6)
                bd1=random.randint(1,6)

                print("Vous avez tiré un",jd1)
                print("La banque a tiré un",bd1)
                if version=="v1" or s!="double":
                    mise=None
                    while mise==None:
                        print("Votre mise ?")
                        try:
                            mise=int(input("€ "))
                            if mise not in [1,2,4]:
                                mise=None
                                print("Vous ne pouvez miser que 1 2 ou 4€")
                        except Exception as e:
                            print(" Je n'ai pas compris !")
                            mise=None
                    jmoney -= mise
                    print("Vous avez maintenant tiré un",jd2)
                    print("La banque a aussi tiré un ",bd2,"et un",bd3)                    
                else: # in case of double 
                    jmoney -= mise 
                    mise *=2
                rj=jd1+jd2
                print("Votre somme :",rj)
                rb=bsum(bd1,bd2,bd3)
                print("Celle de la banque :",rb)
                if rj > rb:
                    print("Gagné !")
                    s="quitte"
                    jmoney += mise*2
                else:
                    if jd1>jd2:
                        jd2,jd1=jd1,jd2
                    if bd3 < bd2:
                        bd2,bd3= bd3,bd2
                    if bd2< bd1:
                        bd1,bd2=bd2,bd1
                    if jmoney < mise or version=="v1":
                        if rj != rb:
                            print("Perdu !")
                        s="quitte"
                    else:
                        print("Perdu ")
                        print("Quitte ou Double ?")
                        s=inputstring(["quitte","double"])
        if jmoney==0:
            print("Désolé vous n'avez pas doublé votre mise initiale !")
            sys.exit()
        if s=="consulter":
            print("Vous avez :",str(jmoney)+"€")            
            continue
        if s=="terminer":
            if jmoney >= DEPART*2 :
                print("Bravo, vous avez doublé votre mise initiale !")
            else:
                print("Désolé vous n'avez pas doublé votre mise initiale !")
            sys.exit()
        
def main(args):
    boucleprincipale()
    return 0

if __name__ == '__main__':
    import sys
    sys.exit(main(sys.argv))





