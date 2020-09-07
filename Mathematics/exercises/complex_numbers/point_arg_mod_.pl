# Author : D. Doyen
# Tags : complex numbers
# 19/8/2020

extends = /model/jsxgraph/clickpoint.pl

title = Module et argument

param.lstarg = [0,pi/4,pi/2,3*pi/4,pi,5*pi/4,3*pi/2,7*pi/4,2*pi]

before ==
modulus = randint(1, 3)
arg = randitem(eval(param['lstarg']))
xsol = (modulus*cos(arg)).evalf()
ysol = (modulus*sin(arg)).evalf()
jxg.setscript(script_init + script_aux)
==

text ==
Placer le point $% M %$ dont l'affixe a pour module $! {{modulus}} !$ et  pour argument $% \displaystyle {{arg|latex}} %$ dans le plan complexe.
==

jxg.attributes % {"showNavigation":false, "boundingbox":[-3.5,3.5,3.5,-3.5]}

script_init ==
JXG.Options.layer['point'] = 1;
board.create('grid',[],{gridX:0.5,gridY:0.5});
board.create('circle',[[0,0],1],{strokeWidth:0.6,fixed:true,strokeColor:'gray'});
board.create('circle',[[0,0],2],{strokeWidth:0.6,fixed:true,strokeColor:'gray'});
board.create('circle',[[0,0],3],{strokeWidth:0.6,fixed:true,strokeColor:'gray'});
board.create('axis',[[0,0],[1,0]],{name:'Re',withLabel:true,label:{position:'urt',offset:[-5,10]},ticks:{visible: false}});
board.create('axis',[[0,0],[0,1]],{name:'Im',withLabel:true,label:{position:'urt',offset:[10,0]},ticks:{visible: false}});
var M = board.create('point',[0,0],{size:2,name:'M',color:'blue'});

==
