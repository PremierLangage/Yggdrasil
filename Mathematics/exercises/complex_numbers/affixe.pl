# Author : D. Doyen
# Tags : complex numbers
# 19/8/2020

extends = /model/mathjsxgraph.pl

title = Affixe d'un nombre complexe

before ==
a = randint(-5, 5, [0])
b = randint(-5, 5, [0])
z = a + b*I
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

script_solution ==
board.create('point',[{{a}}, {{b}}],{size:2,name:'',color:'green'});
// board.create('point',[{{x}}, {{y}}],{size:2,name:'',color:'red'});
==
