extends = /Mathematics/template/mathjsxgraph.pl

title = Module et argument

lang = fr

before ==
modulus=randint(1,3)
lstarg=eval(param['lstarg'])
arg=randitem(lstarg)
a=(modulus*cos(arg)).evalf()
b=(modulus*sin(arg)).evalf()
arg_tex=latex(arg)
==

text ==
Placer le point $% M %$ dont l'affixe a pour module $% {{modulus}} %$ et  pour argument $% \displaystyle {{arg_tex}} %$ dans le plan complexe.
==

drawer.attributes %=
{
    "boundingbox": [
      -3.5,
      3.5,
      3.5,
      -3.5
    ],
    "showNavigation": false
  }
==

drawer.script ==
JXG.Options.layer['point'] = 1;
board.create('grid',[],{gridX:0.5,gridY:0.5});
board.create('circle',[[0,0],1],{strokeWidth:0.6,fixed:true,strokeColor:'gray'});
board.create('circle',[[0,0],2],{strokeWidth:0.6,fixed:true,strokeColor:'gray'});
board.create('circle',[[0,0],3],{strokeWidth:0.6,fixed:true,strokeColor:'gray'});
board.create('axis',[[0,0],[1,0]],{name:'Re',withLabel:true,label:{position:'urt',offset:[-5,10]},ticks:{visible: false}});
board.create('axis',[[0,0],[0,1]],{name:'Im',withLabel:true,label:{position:'urt',offset:[10,0]},ticks:{visible: false}});
var M = board.create('point',[0,0],{size:2,name:'M',color:'red'});

function getMouseCoords(e) {
    let cPos = board.getCoordsTopLeftCorner(e);
    let absPos = JXG.getPosition(e);
    let dx = absPos[0]-cPos[0];
    let dy = absPos[1]-cPos[1];
    return new JXG.Coords(JXG.COORDS_BY_SCREEN, [dx, dy], board);
}

function down(e) {
    let coords = getMouseCoords(e);
    M.setPosition(JXG.COORDS_BY_USER,[coords.usrCoords[1], coords.usrCoords[2]]);
}

board.on('down', down)
==

script_solution ==
board.create('point',[%s, %s],{size:2,name:'M',color:'green'});
board.create('point',[%s, %s],{size:2,name:'',color:'red'});
==

evaluator ==
# pas besoin de faire float(drawer.points['M']['x'])
# car une des fonctionnalités des composants et que
# dans un grader le type des propriétes est toujours le type
# spécifié dans la doc (dans ce cas les propriétes x et y d'un point
# sont des flottants c'est possible de le voir en mode debug).


x= drawer.points['M']['x']
y= drawer.points['M']['y']


from math import hypot
if hypot(x-a, y-b)<0.1:
     score=100
     drawer.script = script_solution % (a, b, x, y)
     drawer.points = {}
     drawer.disabled = True
else:
     score=0
     if nbattempt + 1 >= int(maxattempt):
        drawer.script = script_solution % (a, b, x, y)
        drawer.points = {}
        drawer.disabled = True
feedback=""
==


