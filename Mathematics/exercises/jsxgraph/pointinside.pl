extends = /Mathematics/template/mathjsxgraph_variant.pl

title = Trois ensembles

lang = fr

before ==
x = rd.uniform(-4,4)
y = rd.uniform(-4,4)
==

jsxgraph_script ==

var jxg_board = JXG.JSXGraph.initBoard(
    'jxg_container', 
    {
        boundingbox:[-5, 5, 5, -5],
        axis:false,
        grid:false,
        showCopyright:false,
        showNavigation:false
    }
);
var P = jxg_board.create(
    'point',
    [{{ x }}, {{ y }}],
    {
        name:'P',
        color:'blue'
    }
);

var A = jxg_board.create(
    'circle',
    [[-2,0],[0,0]],
    {
        name:'A',
        strokeColor:'pink',
        label:{strokeColor:'pink'},
        fixed:true,
        fillColor:'lightpink',
        hasInnerPoints: true,
        highlight: false,
        opacity: 0.5,
        withLabel: true
    }
);


var C = jxg_board.create(
    'polygon',
    [[3,4.5],[3,-2], [-2,-2]],
    {
        name:'C',
        label:{strokeColor:'mediumseagreen'},
        fixed:true,
        fillColor:'lightgreen',
        hasInnerPoints: true,
        vertices: {visible:false},
        highlight: false,
        opacity: 0.5,
        borders:{strokeColor:'mediumseagreen'},
        withLabel: true
    }
);

var B = jxg_board.create(
    'ellipse',
    [[-1,-2],[3,1], [-1,2]],
    {
        name:'B',
        strokeColor:'Burlywood',
        label:{strokeColor:'Burlywood'},
        fixed:true,
        fillColor:'Antiquewhite',
        hasInnerPoints: true,
        highlight: false,
        opacity: 0.5,
        withLabel: true
    }
);


function isInA(){
    var c = new JXG.Coords(JXG.COORDS_BY_USER, [P.X(), P.Y()], jxg_board);
    return A.hasPoint(c.scrCoords[1], c.scrCoords[2]);
}
function isInB(){
    var c = new JXG.Coords(JXG.COORDS_BY_USER, [P.X(), P.Y()], jxg_board);
    return B.hasPoint(c.scrCoords[1], c.scrCoords[2]);
}
function isInC(){
    var c = new JXG.Coords(JXG.COORDS_BY_USER, [P.X(), P.Y()], jxg_board);
    return C.hasPoint(c.scrCoords[1], c.scrCoords[2]);
}
==

jsxgraph_capture = ["isInA", "isInB", "isInC"]


text ==
Dans la figure ci-dessous, déplacez le point $%P%$ dans la région $%(B\cap C)\setminus A%$.
==

form ==
{{ jsxgraph | safe }}
==

evaluator ==
if ((answer['jsxgraph_isInB'] == True) and 
    (answer['jsxgraph_isInC'] == True) and 
    (answer['jsxgraph_isInA'] == False)):
    feedback = 'Bravo mon pote !'
    score = 100
else : 
    feedback = 'Y a un bug, mec !'
    score = 0
#feedback=fb.msg_analysis(score,"",lang)  
==

