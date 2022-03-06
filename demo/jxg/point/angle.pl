extends = /model/jxg/pointmath.pl

before ==
angle=randitem([pi/4,pi/2,3*pi/4,pi,3*pi/2])
angle_float = angle.evalf()
xsol = cos(angle_float)
ysol = sin(angle_float)
==

jxscriptt ==
var circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
var O = board.create('point',[0,0],{size:1,name:'O',color:'black',fixed:true});
var A = board.create('point',[1,0],{size:1,name:'A',color:'black',fixed:true});
var psol = board.create('glider',[1,0.5,circle],{size:2,name:'M',color:'blue',fixed:false});
var secOAM = board.create('sector',[O,A,M],{color:'orange'});
==

question ==
Placer le point M de sorte que l'angle $% (\overrightarrow{OA},\overrightarrow{OM}) %$ ait une mesure égale à $% \displaystyle {{angle.latex}} %$. 
==