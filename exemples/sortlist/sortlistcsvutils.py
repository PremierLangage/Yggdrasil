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



def randomize(answer, items):
    for e in items:
        # generate random id because students can
        # guest the answer if ids like 1, 2, 3 are used
        e["id"] = uuid.uuid4()
        answer.append(e["id"])
    random.shuffle(items)
    return items

def builditemsfrompairs(pairs, dosort=False):
    if dosort:
        sort(pairs,key=lambda data: int(data[1])) # tri par le deuxième membre 
    items=[]
    for g,d in pairs:
        items.append({ "id": "", "content": g })

    return items



def selectionofpairs(csvfilename="data.csv",number=4,columns=["titre1", "titre2"],delimiter=";", predicat=lambda x:True):
    """
    >>> selectionofpairs("testdata.csv")
    [('moyen-age', '11'), ('tempsmoderne', '41'), ('prehistoire', '1'), ('contemporain', '41')]
    """
    l=readpairsfromcsv(csvfilename,columns,delimiter , predicat)
    return random.sample(l,min(len(l),4))


def readpairsfromcsv(csvfilename="data.csv",columns=["titre1", "titre2"],delimiter=";", predicat=lambda x:True):
    """
    return a list of pairs from file data.csv by default columns 0 and 1 
    """
    with open(csvfilename,"r") as csvfile:
        reader=csv.DictReader(csvfile,delimiter=delimiter)
        l=[(x.get(columns[0]),x.get(columns[1])) for x in reader if predicat(x)]

    return l


def selectionfromcsv(filename, number=4, delimiter=";", predicat=lambda x:True):
    """
    >>> with open("testdata.csv","w") as f:
    ...     print("titre1;titre2;titre3", file=f)
    ...     print("prehistoire;1;2", file=f)
    ...     print("moyen-age;11;12", file=f)
    ...     print("tempsmoderne;41;42", file=f)
    ...     print("contemporain;41;42", file=f)
    >>> random.seed(42)
    >>> selectionfromcsv("testdata.csv")
    [OrderedDict([('titre1', 'prehistoire'), ('titre2', '1'), ('titre3', '2')]), OrderedDict([('titre1', 'contemporain'), ('titre2', '41'), ('titre3', '42')]), OrderedDict([('titre1', 'moyen-age'), ('titre2', '11'), ('titre3', '12')]), OrderedDict([('titre1', 'tempsmoderne'), ('titre2', '41'), ('titre3', '42')])]
    >>> selectionfromcsv("testdata.csv",  predicat=lambda x:x['titre1']=='contemporain')    
    [OrderedDict([('titre1', 'contemporain'), ('titre2', '41'), ('titre3', '42')])]

    return number elements of the file or all the file if the lenght is less than number
    """
    
    with open(filename,"r") as csvfile:
        reader=csv.DictReader(csvfile,delimiter=delimiter)
        l=[x for x in reader if predicat(x)]

        return random.sample(l,min(len(l),4))






def builditemsandanswer(cvsfilename, delimiter=";" ):
    """
    
    """
    answer =[]
    items =  randomize(answer, builditemsfrompairs(selectionofpairs(csvfilename=cvsfilename,delimiter=delimiter)))
    return answer,items



