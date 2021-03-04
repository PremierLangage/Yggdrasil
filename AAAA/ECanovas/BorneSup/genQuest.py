#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  genQuest.py
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


def initDonnees():
    with open("bornesup.csv","r") as csvfile:
        listeBornesup=list(csv.DictReader(csvfile, delimiter=';'))
    return random.choice(listeBornesup)

def functype2(a,b):
  return a==b

def functype3(a,b=True):
  if (a.lower()=="oui" or a[0].lower()=="o") and b:
    return True
  if (a.lower()=="non" or a[0].lower()=="n" ) and not b:
    return True
  return False



lafonction=functype2


def question(numero,uneLigne):
  bReponse=uneLigne['C5:sup']
  if numero == 1:
    intiQuestion="Quelle est la borne supérieure de l'ensemble {{uneLigne['C2:Partie de $%R%$']}} "
    indication="(On écrira +oo si l'ensemble n'est pas majoré et -oo si l'ensemble est vide)"
    if uneLigne['C5:sup'] =='+':
     bReponse="+\infty"
    if uneLigne['C5:sup'] =='-':
     bReponse="-\infty"
  if numero == 2:
    intiQuestion="Donner un majorant de l'ensemble {{uneLigne['C2:Partie de $%R%$']}}"
    indication="(On écrira +oo si l'ensemble n'est pas majoré et - oo si l'ensemble est vide)"
    if uneLigne['C5:sup'] =='+':
     bReponse="+\infty"
    if uneLigne['C5:sup'] =='-':
     bReponse="-\infty"

  if numero == 3:
    lafonction=functype3
    intiQuestion="L'ensemble {{uneLigne['C2:Partie de $%R%$']}} a-t-il un plus grand élément ?"
    indication="(On écrira le texte oui ou le texte non)"
    if uneLigne['C5:sup'] =='+':
     bReponse="oui"
    else:
     bReponse="non"

  return intiQuestion,indication,bReponse

