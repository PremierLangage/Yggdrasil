extends = /Mathematics/template/mathjsxgraph_variant.pl

title = Cercle trigonométrique

lang = fr

before ==
angle=rd.choice([sp.Rational(1,2),1,sp.Rational(3,2),sp.Rational(1,4),sp.Rational(3,4),sp.Rational(5,4)])*sp.pi
valangle=float(angle.evalf())
latexangle=sp.latex(angle)
==

jsxgraph_script ==
JXG.Options.layer['line'] = 0;
var jxg_board = JXG.JSXGraph.initBoard(
    'jxg_container', 
    {
        boundingbox:[-1.25,1.25,1.25,-1.25],
        showCopyright:false,
        showNavigation:false
    }
);

jxg_board.create(
    'axis',
    [[0,0],[1,0]], 
    {
        ticks: {
            scale:0.5,
            minorTicks:0,
            drawLabels:false
        }
    }
);

jxg_board.create(
    'axis',
    [[0,0],[0,1]], 
    {
        ticks: {
            scale:0.5,
            minorTicks:0,
            drawLabels:false
        }
    }
);

var ci= jxg_board.create(
    'circle',
    [[0,0],[0,1]],
    {
        strokeColor:'blue',
        fixed:true,
        highlight:false
    }
);
var O = jxg_board.create(
    'point', 
    [0,0],
    {
        size:1,
        name:'O',
        color:'black',
        showInfobox:false,
        fixed:true,
        highlight:false
    }
);
var A = jxg_board.create(
    'point', 
    [1,0],
    {
        size:1,
        name:'A',
        color:'black',
        showInfobox:false,
        fixed:true,
        highlight:false
    }
);

var M = jxg_board.create(
    'glider',
    [1,1,ci],
    {
        size:2,
        name:'M',
        color:'red',
        showInfobox:false,
        highlight:false
    }
);

jxg_board.create(
    'sector',
    [O,A,M],
    {
        color:'orange',
        highlight:false
    }
);

function M_coords() {return [M.X(),M.Y()]};
==

jsxgraph_capture = ["M_coords"]


text ==
Déplacer le point $% M %$ de sorte que l'angle $% (\overrightarrow{OA},\overrightarrow{OM}) %$ ait une mesure égale à $% \displaystyle {{ latexangle }}. %$
==

form ==
{{ jsxgraph | safe }}
==

evaluator ==
from math import cos, sin

M = answer['jsxgraph_M_coords']
x=M[0]
y=M[1]

if (((x-cos(valangle))**2 + (y - sin(valangle))**2) < 0.01):
     score=100
else:
     score=0

# feedback = 'M: '+ str(x) + '  ' + str(y)
# feedback=fb.msg_analysis(score,"",lang)  
==







