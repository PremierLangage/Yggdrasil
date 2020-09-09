#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  sortlist.py
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

__doc__="""

Des fonctions d'aide pour des exercices de type sortlist utilisant un csv.

"""





import csv
import json
import sys
import random
import uuid



def randomize(items):
    answer=[]
    for e in items:
        # generate random id because students can
        # guest the answer if ids like 1, 2, 3 are used
        e["id"] = str(uuid.uuid4())
        answer.append(e["id"])
    random.shuffle(items)
    return answer,items

def builditemsfrompairs(pairs, dosort=False):
    if dosort:
        sort(pairs,key=lambda data: int(data[1])) # tri par le deuxième membre 
    items=[]
    for g,d in pairs:
        items.append({ "id": "", "content": g })

    return items



def selectionofpairs(csvfilename,number, delimiter , columns , predicat=lambda x:True):
    """
    >>> selectionofpairs("testdata.csv")
    [('moyen-age', '11'), ('tempsmoderne', '41'), ('prehistoire', '1'), ('contemporain', '41')]
    """
    l=readpairsfromcsv(csvfilename,delimiter ,columns, predicat)
    return random.sample(l,min(len(l),4))


def readpairsfromcsv(csvfilename, delimiter , columns , predicat):
    """
    return a list of pairs from file data.csv by default columns 0 and 1 
    """
    with open(csvfilename,"r") as csvfile:
        reader=csv.DictReader(csvfile,delimiter=delimiter)
        l=[(x.get(columns[0]),x.get(columns[1])) for x in reader if predicat(x)]

    return l





def builditemsandanswer(csvfilename="data.csv",number=4,columns=["titre1", "titre2"],delimiter=";", predicat=lambda x:True):
    """
    
    """
    x,y =randomize( builditemsfrompairs(selectionofpairs(csvfilename,number, delimiter , columns , predicat)))
    
    return x, y



