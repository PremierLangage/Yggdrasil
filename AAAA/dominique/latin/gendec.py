#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  gendec.py
#  
#  Copyright 2021 Dominique Revuz <dominique.revuz@u-effeil.fr>
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
import csv
import random

CAS=["nominatif","vocatif","accusatif","génitif","datif","ablatif"]

un={"nominatif":(lambda s:s, lambda s:s+'e'),
        "vocatif":(lambda s:s, lambda s:s+'e'),
        "accusatif":(lambda s:s+"m", lambda s:s+'s'),
        "génitif":(lambda s:s+"e", lambda s:s+'rum'),
        "datif":(lambda s:s+"e", lambda s:s[:-1]+'is'),
        "ablatif":(lambda s:s, lambda s:s[:-1]+'is'),
        }

deuxm={"nominatif":(lambda s:s+"us", lambda s:s+'i'),
        "vocatif":(lambda s:s+"e", lambda s:s+'i'),
        "accusatif":(lambda s:s+"um", lambda s:s+'os'),
        "génitif":(lambda s:s+"i", lambda s:s+'orum'),
        "datif":(lambda s:s+"o", lambda s:s+'is'),
        "ablatif":(lambda s:s+"o", lambda s:s+'is'),
        }

deuxn={"nominatif":(lambda s:s+"um", lambda s:s+'a'),
        "vocatif":(lambda s:s+"um", lambda s:s+'a'),
        "accusatif":(lambda s:s+"um", lambda s:s+'a'),
        "génitif":(lambda s:s+"i", lambda s:s+'orum'),
        "datif":(lambda s:s+"o", lambda s:s+'is'),
        "ablatif":(lambda s:s+"o", lambda s:s+'is'),
        }



# mot[:-2] Masculin Féminin 
troismf={"nominatif":(lambda s:s+'us', lambda s:s+'us'),
        "vocatif":(lambda s:s+'us', lambda s:s+'us'),
        "accusatif":(lambda s:s+'um', lambda s:s+'us'),
        "génitif":(lambda s:s+"+'us'", lambda s:s+'uum'),
        "datif":(lambda s:s+"ui", lambda s:s+'ibus'),
        "ablatif":(lambda s:s+"u", lambda s:s+'ibus'),
        }
        
troisn={"nominatif":(lambda s:s+'u', lambda s:s+'ua'),
        "vocatif":(lambda s:s+'u', lambda s:s+'ua'),
        "accusatif":(lambda s:s+'u', lambda s:s+'ua'),
        "génitif":(lambda s:s+"+'us'", lambda s:s+'uum'),
        "datif":(lambda s:s+"ui", lambda s:s+'ibus'),
        "ablatif":(lambda s:s+"u", lambda s:s+'ibus'),
        }


def declinaison1(row,cas,nombre=0):
    """
        cas appartient a  CAS
        nombre =0 singulier =1 pluriel
    """
    return un[cas][nombre](row['nom'])



def declinaison2(row,cas,nombre=0):
    """
        cas appartient a  CAS
        nombre =0 singulier =1 pluriel
    """
    if row['genre']=='n' :
        return deuxn[cas][nombre](row['truc'])
    else: # le féminin c'est comme le masculin 
        return deuxm[cas][nombre](row['truc'])

def declinaison3(row,cas,nombre=0):
    """
        cas appartient a  CAS
        nombre =0 singulier =1 pluriel
    """
    if row['genre']=='n' :
        return troisn[cas][nombre](row['nom'][:-2])
    else: # le féminin c'est comme le masculin 
        return troismf[cas][nombre](row['nom'][:-2])


def tableaudeclinaison(row):
    print(f""" {row['nom']} genre:{row['genre']} **{row['sens']}** 
    | cas  |   singulier |  pluriel |
    |------|-------------|----------|""")
    for cas in CAS:
        if row['descl']=='1':
            print(f"| {cas} | {declinaison1(row,cas,0)}|{declinaison1(row,cas,1)}|")
        elif row['descl']=='2':
            print(f"| {cas} | {declinaison2(row,cas,0)}|{declinaison2(row,cas,1)}|")
        elif row['descl']=='3':
            print(f"| {cas} | {declinaison3(row,cas,0)}|{declinaison2(row,cas,1)}|")

def declinaison(row, cas, nombre):
    fifi = [declinaison1,declinaison2,declinaison3][int(row['descl'])-1]
    return fifi(row,cas,nombre)


def createquestion(row):
    if random.randint(1,2) == 1:
        nombre=0
        nombres="Singulier"
    else:
        nombre=1
        nombres="Pluriel"
    cas= random.choice(CAS)

    tx = f"""Donnez la déclinaison du mot **{row['nom']}**  genitif {row['genitif']} pour le genre : {row['genre']}  qui veut dire __{row['sens']}__  
    pour le *{cas}* au *{nombres}*"""
    
    sol = declinaison(row, cas, nombre)

    return tx,sol 


def question():
    with open("mots.csv","r") as f:
        laliste= list(csv.DictReader(f))

    
    return createquestion(random.choice(laliste))
    
    
    return 0
