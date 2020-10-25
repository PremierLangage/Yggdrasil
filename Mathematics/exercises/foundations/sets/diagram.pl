extends = /model/basic/radio.pl
extends = /model/math.pl

title = Représentation des opérations sur un diagramme

lang = fr

diagram =: MathDrawer

before ==
data=[
["A \setminus ( B \cup C)",(0,0,0,0,1,0,0)],
["B \setminus ( A \cup C)",(0,0,0,0,0,1,0)],
["C \setminus ( A \cup B)",(0,0,0,0,0,0,1)],
["A \setminus ( B \cap C)",(0,1,1,0,1,0,0)],
["B \setminus ( A \cap C)",(0,1,0,1,0,1,0)],
["C \setminus ( A \cap B)",(0,0,1,1,0,0,1)],
["(A \cup B) \setminus C",(0,1,0,0,1,1,0)],
["(A \cup C) \setminus B",(0,0,1,0,1,0,1)],
["(B \cup C) \setminus A",(0,0,0,1,0,1,1)],
["(A \cap B) \setminus C",(0,1,0,0,0,0,0)],
["(A \cap C) \setminus B",(0,0,1,0,0,0,0)],
["(B \cap C) \setminus A",(0,0,0,1,0,0,0)]
]

lst=list_randint_norep(5,0,11)

choices = []
for i in range(5):
    s="$! %s !$" % data[lst[i]][0]
    choices.append(s)
numsol = randint(0, 4)
diagram.script = script % data[lst[numsol]][1]
==

script ==
JXG.joinCurves = function(board, parents, attributes) {
var curves = parents, 
    attr = JXG.copyAttributes(attributes, board.options, 'curve'),
    c = board.create('curve', [[0], [0]], attr);

c.updateDataArray = function() {
    var i, le = curves.length;

    // The paths have to be connected
    this.dataX = [];
    this.dataY = [];
    for (i = 0; i < le; i++) {
        if (i < le - 1) {
            this.dataX = this.dataX.concat(curves[i].dataX.slice(0,-1));
            this.dataY = this.dataY.concat(curves[i].dataY.slice(0,-1));
        } else {
            this.dataX = this.dataX.concat(curves[i].dataX);
            this.dataY = this.dataY.concat(curves[i].dataY);
        }
    }

    if (this.dataX.length<4) {
        this.bezierDegree = 1;
    } else {
        this.bezierDegree = curves[0].bezierDegree;
    }
};
c.prepareUpdate().update().updateVisibility().updateRenderer();
return c;
};

var cA = board.create('point',[0,1],{visible:false});
var A = board.create('circle',[cA,2],{strokeColor:"blue"});
var cB = board.create('point',[1,-1],{visible:false});
var B = board.create('circle',[cB,2],{strokeColor:"red"});
var cC = board.create('point',[-1,-1],{visible:false});
var C = board.create('circle',[cC,2],{strokeColor:"green"});
board.create('text',[-1.5,3,"A"],{strokeColor:'blue',fontSize:20});
board.create('text',[2.6,-3,"B"],{strokeColor:'red',fontSize:20});
board.create('text',[-2.8,-3,"C"],{strokeColor:'green',fontSize:20});

var AB1 = board.create('intersection', [A,B,0], {visible:false});
var AB2 = board.create('intersection', [A,B,1], {visible:false});
var BC1 = board.create('intersection', [B,C,0], {visible:false});
var BC2 = board.create('intersection', [B,C,1], {visible:false});
var CA1 = board.create('intersection', [C,A,0], {visible:false});
var CA2 = board.create('intersection', [C,A,1], {visible:false});

var arcA1 = board.create('minorarc', [cA, AB1, CA1], {visible:false});
var arcB1 = board.create('minorarc', [cB, BC1, AB1], {visible:false});
var arcC1 = board.create('minorarc', [cC, CA1, BC1], {visible:false});

var arcA12 = board.create('minorarc', [cA, AB1, CA2], {visible:false});
var arcA21 = board.create('minorarc', [cA, AB2, CA1], {visible:false});
var arcB12 = board.create('minorarc', [cB, BC1, AB2], {visible:false});
var arcB21 = board.create('minorarc', [cB, BC2, AB1], {visible:false});
var arcC12 = board.create('minorarc', [cC, CA1, BC2], {visible:false});
var arcC21 = board.create('minorarc', [cC, CA2, BC1], {visible:false});


var arcA2 = board.create('majorarc', [cA, AB2, CA2], {visible:false});
var arcB2 = board.create('majorarc', [cB, BC2, AB2], {visible:false});
var arcC2 = board.create('majorarc', [cC, CA2, BC2], {visible:false});

// Join the three arcs and fill the area.
// A et B et C
if ( %d ){
JXG.joinCurves(board,[arcA1,arcC1,arcB1],{strokeWidth:0,fillColor:'yellow',fillOpacity:0.2});
}
// A et B et pas C
if ( %d ){
JXG.joinCurves(board,[arcA21,arcC1,arcB12],{strokeWidth:0,fillColor:'yellow',fillOpacity:0.2});
}
// A et C et pas B
if ( %d ){
JXG.joinCurves(board,[arcA12,arcC21,arcB1],{strokeWidth:0,fillColor:'yellow',fillOpacity:0.2});
}
// B et C et pas A
if ( %d ){
JXG.joinCurves(board,[arcB21,arcA1,arcC12],{strokeWidth:0,fillColor:'yellow',fillOpacity:0.2});
}
// seulement A
if ( %d ){
JXG.joinCurves(board,[arcB12,arcA2,arcC21],{strokeWidth:0,fillColor:'yellow',fillOpacity:0.2});
}
// seulement B
if ( %d ){
JXG.joinCurves(board,[arcA21,arcC12,arcB2],{strokeWidth:0,fillColor:'yellow',fillOpacity:0.2});
}
// seulement C
if ( %d ){
JXG.joinCurves(board,[arcA12,arcC2,arcB21],{strokeWidth:0,fillColor:'yellow',fillOpacity:0.2});
}
==

text ==
Quel ensemble est représenté sur le diagramme ci-dessous ?
{{ diagram |component }}
==

extracss==
<style>
.math-drawer-component {
    max-width:300px;
    width:90vw;
    max-height:300px;
    height:90vw;
    margin: 0 auto;
}
</style>
==

diagram.disabled % true

diagram.attributes %=
{
    "boundingbox": [
      -3.5,
      3.5,
      3.5,
      -3.5
    ],
    "showNavigation": false,
    "Axis": false,
    "Grid": false
  }
==



