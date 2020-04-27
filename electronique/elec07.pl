
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

