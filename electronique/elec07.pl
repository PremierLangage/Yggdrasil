
extends= /model/qcm/qcm.pl

title = Un peu d'aléa.
text=

before==
import random
Xintensite=2
Xfrequence=300
l = [("",0,"0°"),("-\pi",-3.14,"X°"),("\pi",3.14,"X°"),("-\pi/2",3.14/2,"X°"),("-\pi/4",3.14/4,"X°")]
triple=random.choice(l)
XdecalageS,Xdecalage,rep = triple
signalX=f"$%{Xintensite}cos({Xfrequence}t{XdecalageS})%$"


text="""
Soit les signaux $%x(t)%$ et $y(t)%$ définis par :

$%x(t)={{signalX}}%$ et $y(t)={{signalY}}%$

Quelle est la phase à l'origine du signal, $%x(t)%$.
"""
good=rep
bad = "\n".join([z for x,y,z in l if z != rep])
==

attic==
Yintensite=1
Yfrequence=300
YdecalageS=""
Ydecalage=0
signalY=f"$%{Yintensite}cos({Yfrequence}t-{YdecalageS}\pi)%$"
==
