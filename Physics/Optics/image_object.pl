extends =  /Mathematics/template/mathjsxgraph.pl

title = Point objet et point image en optique géométrique

lang = fr

before ==
import random
from sympy import *
import sympy as sp
from random import randint
angle=random.choice([Rational(1,2),1,Rational(3,2),Rational(1,4),Rational(3,4),Rational(5,4)])*sp.pi

valangle=float(angle.evalf())
latexangle=latex(angle)
d0,d1,d2,d3=-5,-2,2,5


locobj=randint(1,3)
if locobj==1:
    xobj=randint(-17,-12)/2
    y0=[1,0.5,0,-0.5,-1]
if locobj>1:
    xobj=randint(-2,17)/2
    y0=[2,1,0,-1,-2]

locim=randint(1,3)
if locim==1:
    xim=randint(12,17)/2
    y2=[2,1,0,-1,-2]
if locim>1:
    xim=randint(-17,2)/2
    y2=[1,0.5,0,-0.5,-1]

y1=[]
for y in y0:
    z=y*(d1-d0)/(d0-xobj)+y
    y1.append(z)

y3=[]
for y in y2:
    z=y*(d3-d2)/(d2-xim)+y
    y3.append(z)
==

text ==
La figure suivante montre un faisceau de rayons lumineux incidents sur un système optique, et le faisceau de rayons lumineux qui émergent du système. En prolongeant les rayons lumineux, placer l'objet et l'image à leur position correcte sur le schéma.
==

input.1.attributes = {boundingbox:[-9,4.5,9,-4.5],axis:false,grid:false,showNavigation:false}

input.1.script.main ==
var grid = board.create('grid',[],{gridX:0.5,gridY:0.5});
var Ox = board.create('axis',[[0,0],[1,0]],{ticks:{visible:false}});
var Oy = board.create('axis',[[0,0],[0,1]],{ticks:{visible:false}});
y0={{y0}}
y1={{y1}}
y2={{y2}}
y3={{y3}}

var p1 = board.create('point',[{{d1}},-4.],{visible:false});
var p2 = board.create('point',[{{d2}},-4.],{visible:false});
var p3 = board.create('point',[{{d2}},4.],{visible:false});
var p4 = board.create('point',[{{d1}},4.],{visible:false});
board.create('polygon', [p1, p2, p3, p4]);

for(i = 0; i < 5; i++) {

    var l = board.create('line',[[{{d0}},y0[i]],[{{d1}},y1[i]]],{visible:false});
    var M1 = board.create('glider',[({{d0}}+{{d1}})/2,(y0[i]+y1[i])/2,l],{visible:false});
    var M2 = board.create('glider',[({{d0}}+{{d1}})/2,(y0[i]+y1[i])/2,l],{name:'',size:1,color:'gray'});
    board.create('segment',[M1,M2],{color:'gray'});
    board.create('segment',[[{{d0}},y0[i]],[{{d1}},y1[i]]],{size:0.5,color:'blue',fixed:true});

    var l = board.create('line',[[{{d2}},y2[i]],[{{d3}},y3[i]]],{visible:false});
    var M1 = board.create('glider',[({{d2}}+{{d3}})/2,(y2[i]+y3[i])/2,l],{visible:false});
    var M2 = board.create('glider',[({{d2}}+{{d3}})/2,(y2[i]+y3[i])/2,l],{name:'',size:1,color:'gray'});
    board.create('segment',[M1,M2],{color:'gray'});
    board.create('segment',[[{{d2}},y2[i]],[{{d3}},y3[i]]],{size:0.5,color:'blue',fixed:true});


}
var object = board.create('glider',[-7,0,Ox],{name:"Objet",color:'red'});
var image = board.create('glider',[7,0,Ox],{name:"Image",color:'green'});
==

input.1.style = width: 600px; height: 300px; margin: 0 auto;


evaluator ==
Ox=float(answer['Objet_x'])
Ix=float(answer['Image_x'])
if abs(Ox-xobj)<0.25:
    feedback="Le point objet est bien placé."
    score=50
else:
    feedback="Le point objet est mal placé."
    score=0
if abs(Ix-xim)<0.25:
    feedback+="Le point image est bien placé."
    score+=50
else:
    feedback+="Le point image est mal placé."
==

