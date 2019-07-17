extends =  /Mathematics/template/mathjsxgraph.pl

title = Repérer l'angle de réfraction

lang = fr

before ==
angle=randitem([Rational(1,2),1,Rational(3,2),Rational(1,4),Rational(3,4),Rational(5,4)])*sp.pi
valangle=float(angle.evalf())
latexangle=latex(angle)
==

text ==
Matérialiser l'angle de réfraction du rayon lumineux tracé ci-dessous.
==

form ==
{{input_1 | safe}}

L'angle de réfraction vaut <input type="number" id="form_angle" step="any" />
==

input.1.type = jsxgraph

input.1.attributes = {boundingbox:[-1.25,1.25,1.25,-1.25],axis:false,grid:false,showNavigation:false}

input.1.script.main ==
var interface = board.create('line',[[1,0],[0,0]],{size:0,visible:false});
ineq = board.create('inequality', [interface],{color:'grey'});
var O = board.create('point',[0,0],{visible:false});
var P1 = board.create('point',[-0.5,-0.25],{visible:false});
var R1 = board.create('line',[O,P1],{size:0.5,color:'blue',straightFirst:false});

var P2 = board.create('point',[0.5,0.4],{visible:false});
board.create('line',[O,P2],{size:0.5,color:'blue',straightFirst:false});
board.create('segment',[P2,P2],{size:0.5,color:'blue',lastArrow:true});

var C = board.create('circle',[O,0.5],{visible:false});

var M1 = board.create('glider',[-0.2,0.3,C],{name:"",size:0.5});
var M2 = board.create('glider',[0.2,0.3,C],{name:"",size:0.5});

var angle = board.create('nonreflexangle',[M1,O,M2],{name:" ",color:'orange'});
JXG.createToolSquare(board,[-0.5,0.5],0.5);

==


evaluator ==
score=100
feedback=answer
==


