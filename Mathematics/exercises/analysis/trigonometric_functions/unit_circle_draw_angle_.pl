extends = /model/jsxgraph/clickpoint.pl

before ==
lstangle = eval(param['lstangle'])
angle = choice(lstangle)
valangle = float(angle.evalf())
xsol = float(cos(valangle))
ysol = float(sin(valangle))
jxg.setscript(script_init)
==

jxg.attributes % {"showNavigation":false, "boundingbox":[-1.25,1.25,1.25,-1.25]}

name = M

script_init ==
board.create('grid', [], {gridX: 0.25, gridY: 0.25});
board.create('axis',[[0,0],[1,0]],{ticks:{visible:false}});
board.create('axis',[[0,0],[0,1]],{ticks:{visible:false}});
var circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
var O = board.create('point', [0,0],{size:1, name: 'O', color: 'black', fixed: true});
var A = board.create('point', [1,0],{size:1, name: 'A', color: 'black', fixed: true});
var M = board.create('glider', [1, 0.5, circle],{name:'M',color:'blue',fixed:false});
board.create('sector', [O, A, M], {color: 'orange'});
==


script_solution ==
board.create('point',[{{xsol}}, {{ysol}}],{name:'', color:'green'});
==


script_init4 ==
var grid = board.create('grid',[],{gridX:0.25,gridY:0.25});
var Ox = board.create('axis',[[0,0],[1,0]],{ticks:{visible:false}});
var Oy = board.create('axis',[[0,0],[0,1]],{ticks:{visible:false}});
var circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
var O = board.create('point',[0,0],{size:1,name:'O',color:'black',fixed:true});
var A = board.create('point',[1,0],{size:1,name:'A',color:'black',fixed:true});
var M = board.create('glider',[1,0.5,circle],{size:2,name:'M',color:'red',fixed:false});
var secOAM = board.create('sector',[O,A,M],{color:'orange'});
==