extends =  /Mathematics/template/mathjsxgraph.pl
@ /utils/geotool_square.svg [square.svg]
title = Equerre

lang = fr

before ==
angle=randitem([Rational(1,2),1,Rational(3,2),Rational(1,4),Rational(3,4),Rational(5,4)])*sp.pi
valangle=float(angle.evalf())
latexangle=latex(angle)
==

text ==
Amusez-vous avec cette équerre virtuelle
==

form ==
{{input_1 | safe}}

L'angle de réfraction vaut <input type="number" id="form_angle" step="any" />
==

input.1.type = jsxgraph

input.1.attributes = {boundingbox:[-1.25,1.25,1.25,-1.25],axis:false,grid:false,showNavigation:false}

input.1.script.main ==
JXG.createProtractor(board,[0.5,0.5],3);

JXG.createToolSquare(board,[-0.5,0.5],0.5);
var interface = board.create('line',[[1,0],[0,0]],{size:0,visible:false});
ineq = board.create('inequality', [interface],{color:'grey'});

==


evaluator ==
score=100
feedback=answer
==


