
extends= /model/qcm/qcm.pl



before==

Xintensite=2
Xfrequence=300
XdecalageS="1/4"
Xdecalage=0.25
signalX=f"$%{Xintensite}cos({Xfrequence}t-{XdecalageS}\pi)%$

Yintensite=1
Yfrequence=300
YdecalageS=""
Ydecalage=0
signalY=f"$%{Yintensite}cos({Yfrequence}t-{YdecalageS}\pi)%$

text="""
Soit les signaux $%x(t)%$ et $y(t)%$ définis par :

$%x(t)={{signalX}}%$ et $y(t)={{signalY}}%$

Quelle est la phase à l'origine du signal, $%x(t)%$.
"""

good="


==


