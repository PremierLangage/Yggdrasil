# Author : D. Doyen
# Tags : complex numbers
# 19/8/2020

extends = /model/jsxgraph/clickpoint.pl

before ==
xsol = randint(-4, 4, [0])
ysol = randint(-4, 4, [0])
z = xsol + ysol*I
jxg.setscript(script_init + script_aux)
==

jxg.attributes % {"showNavigation":false, "boundingbox":[-6,6,6,-6]}


script_init ==
board.create('grid',[],{gridX:1,gridY:1});
board.create('axis',[[0,0],[1,0]],{name:'Re',withLabel:true,label:{position:'urt',offset:[-5,10]},ticks:{visible: false}});
board.create('axis',[[0,0],[0,1]],{name:'Im',withLabel:true,label:{position:'urt',offset:[10,0]},ticks:{visible: false}});
const M = board.create('point',[0, 0],{size:2,name:'M',color:'blue'});
==


text ==
Placer le point $% M %$ d'affixe $%{{ z|latex }}%$ dans le plan ci-dessous.
==
