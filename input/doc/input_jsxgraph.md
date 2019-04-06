# Champ de réponse `jsxgraph`

## Résumé

Modifier des objets géométriques dans un panneau JSXGraph.

## Insertion

~~~
form ==
{{input_name | safe}}
==

input.name.type = jsxgraph
~~~

## Configuration

`style`

Chaîne définissant le style de l'élément contenant le champ de réponse.

`boardname`

Nom du panneau JSXGraph attaché au champ de réponse.

`attributes`

Paramètres du panneau JSXGraph attaché au champ de réponse.

`script.main`

Script JavaScript définissant des objets et des évènements sur le panneau JSXGraph attaché au champ de réponse.

## Exemples

#### Droite à déplacer avec deux points de contrôle

~~~
form ==
{{input_1 | safe}}
==

input.1.type = jsxgraph

input.1.style = width:400px; height:400px; margin: 0 auto;

input.1.boardname = board

input.1.attributes = {boundingbox:[-6,6,6,-6],axis:true,grid:true,showNavigation:true}

input.1.script.main ==
var A = board.create('point',[1,1],{size:2,name:'A',color:'red',withLabel:false});
var B = board.create('point',[-1,-1],{size:2,name:'B',color:'red',withLabel:false});
var line = board.create('line',[A,B]);
==
~~~

#### Point à déplacer sur le cercle unité

~~~
form ==
{{input_1 | safe}}
==

input.1.type = jsxgraph

input.1.style = width:400px; height:400px; margin: 0 auto;

input.1.boardname = board

input.1.attributes = {boundingbox:[-1.25,1.25,1.25,-1.25],axis:false,grid:false,showNavigation:false}

input.1.script.main ==
var grid = board.create('grid',[],{gridX:0.25,gridY:0.25});
var Ox = board.create('axis',[[0,0],[1,0]],{ticks:{visible:false}});
var Oy = board.create('axis',[[0,0],[0,1]],{ticks:{visible:false}});
var circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
var O = board.create('point',[0,0],{size:1,name:'O',color:'black',fixed:true});
var A = board.create('point',[1,0],{size:1,name:'A',color:'black',fixed:true});
var M = board.create('glider',[1,1,circle],{size:2,name:'M',color:'red'});
var secOAM = board.create('sector',[O,A,M],{color:'orange'});
==
~~~


#### Point à placer en cliquant

~~~
form ==
{{input_1 | safe}}
==

input.1.type = jsxgraph

input.1.style = width:400px; height:400px; margin: 0 auto;

input.1.boardname = board

input.1.attributes = {boundingbox:[-6,6,6,-6],axis:false,grid:false,showNavigation:false}

input.1.script.main ==
var grid = board.create('grid',[],{gridX:1,gridY:1});
var Ox = board.create('axis',[[0,0],[1,0]],{ticks: {visible: false}});
var Oy = board.create('axis',[[0,0],[0,1]],{ticks: {visible: false}});
var M = board.create('point',[1,1],{size:2,name:'M',color:'red'});

var getMouseCoords = function(e) {
        var cPos = board.getCoordsTopLeftCorner(e);
        var absPos = JXG.getPosition(e);
        var dx = absPos[0]-cPos[0];
        var dy = absPos[1]-cPos[1];
        return new JXG.Coords(JXG.COORDS_BY_SCREEN, [dx, dy], board);
    }

function down(e) {
    coords = getMouseCoords(e);
    M.setPosition(JXG.COORDS_BY_USER,[coords.usrCoords[1], coords.usrCoords[2]]);
}

board.on('down',down)
==
~~~
